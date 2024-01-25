/* MIT License
 *
 * Copyright (c) 2024 Szymon Bretner
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * SPDX-License-Identifier: MIT
 */

private string? findDprintConfig(string fmtFilePath) {
    var dir = Path.get_dirname(fmtFilePath);
    while (dir != "/") {
        var configPath = Path.build_path(
            Path.DIR_SEPARATOR_S, dir, "dprint.json");
        if (File.new_for_path(configPath).query_exists()) {
            return configPath;
        }
        dir = Path.get_dirname(dir);
    }
    return null;
}

/**
* Sets the text of the buffer while preserving the cursor position.
*/
private void set_buffer_text(Ide.Buffer buffer, string text) {
    Ide.Location location = buffer.get_insert_location();
    int offset = location.get_offset();
    buffer.set_text(text, text.length);
    Gtk.TextIter iter;
    buffer.get_iter_at_offset(out iter, offset);
    buffer.place_cursor(iter);
}

public class DrpintFmt : Ide.Object, Ide.Formatter {
        public async bool format_range_async(
            Ide.Buffer buffer,
            Ide.FormatterOptions options,
            Gtk.TextIter begin,
            Gtk.TextIter end,
            GLib.Cancellable? cancellable
        ) {
		    return false;
	    }

	    public void load() {
	    }

	    public async bool format_async(
	        Ide.Buffer buffer,
	        Ide.FormatterOptions options,
	        GLib.Cancellable? cancellable
	    ) throws Error {
            var fmtFilePath = buffer.get_file()?.get_path();
            if(fmtFilePath == null) {
                return false;
            }

            var configPath = findDprintConfig(fmtFilePath);
            if (configPath == null) {
                return false;
            }

            string pstdout;
            string pstderr;
            string[] spawn_args = {
                "dprint", "fmt",
                "--stdin", fmtFilePath,
                "--config", configPath,
                null
            };
            var proc = new Subprocess.newv(spawn_args,
                   SubprocessFlags.STDIN_PIPE
                   | SubprocessFlags.STDOUT_PIPE
                   | SubprocessFlags.STDERR_PIPE);
            var ok = proc.communicate_utf8(
                buffer.text, null, out pstdout, out pstderr);
            if (!ok) {
                return false;
            }
            ok = proc.wait(null);
            if (!ok) {
                return false;
            }
            if (proc.get_status() != 0) {
                return false;
            }
            set_buffer_text(buffer, pstdout);
            return true;
	    }
}

public void peas_register_types(TypeModule module) {
	var obj = (Peas.ObjectModule) module;
	obj.register_extension_type(typeof (Ide.Formatter), typeof (DrpintFmt));
}

