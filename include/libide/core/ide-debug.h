/* ide-debug.h.in
 *
 * Copyright (C) 2015 Christian Hergert <christian@hergert.me>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef IDE_DEBUG_H
#define IDE_DEBUG_H

#ifndef IDE_ENABLE_TRACE
# define IDE_ENABLE_TRACE 1
#endif
#if IDE_ENABLE_TRACE != 1
# undef IDE_ENABLE_TRACE
#endif

#ifdef IDE_ENABLE_TRACE
#include <execinfo.h>
#endif
#include <glib.h>

#include "ide-version-macros.h"

G_BEGIN_DECLS

/**
 * SECTION:ide-debug
 * @title: Debug logging and tracing
 * @short_description: tracing and debug facilities for Builder and plugins
 *
 * The debug macros such as %IDE_ENTRY, %IDE_EXIT, and %IDE_RETURN provide
 * helpers for tracing Builder and plugins at runtime.
 *
 * These tracing macros will compile out when Builder is configured for a
 * release build. Otherwise, running Builder with the "-vvvv" command line
 * argument will show tracing output.
 */

/**
 * IDE_ENTRY: (skip)
 *
 * Traces the entry into a function. Place this at the beginning of your
 * function above pre-condition checks.
 */

/**
 * IDE_EXIT: (skip)
 *
 * Traces the exit from a function. Use this instead of "return" to return
 * and log the function exiting.
 */

/**
 * IDE_RETURN: (skip)
 *
 * Similar to %IDE_EXIT but allows providing a return value.
 */

/**
 * IDE_GOTO: (skip)
 * @_l: the label to jump to
 *
 * Appends to the jump to label to the tracing log and then jumps
 * to the label @_l.
 */

/**
 * IDE_TODO: (skip)
 * @_msg: the message to append to the trace log
 *
 * Appends to the tracing log that unsupported code has been
 * reached.
 */

/**
 * IDE_PROBE: (skip)
 *
 * Appends to the tracing log that a line of code was reached.
 */

/**
 * IDE_TRACE_MSG: (skip)
 *
 * Similar to %IDE_PROBE but allows specifying a log message.
 */

/**
 * IDE_LOG_LEVEL_TRACE: (skip)
 */
#ifndef IDE_LOG_LEVEL_TRACE
# define IDE_LOG_LEVEL_TRACE ((GLogLevelFlags)(1 << G_LOG_LEVEL_USER_SHIFT))
#endif

#ifdef IDE_ENABLE_TRACE
_IDE_EXTERN
void ide_trace_function (const gchar *strfunc,
                         gint64       begin_time_usec,
                         gint64       end_time_usec);
# define IDE_TRACE_MSG(fmt, ...)                                         \
   g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, "  MSG: %s():%d: " fmt,      \
         G_STRFUNC, __LINE__, ##__VA_ARGS__)
# define IDE_PROBE                                                       \
   g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, "PROBE: %s():%d",            \
         G_STRFUNC, __LINE__)
# define IDE_TODO(_msg)                                                  \
   g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, " TODO: %s():%d: %s",        \
         G_STRFUNC, __LINE__, _msg)
# define IDE_ENTRY                                                       \
   gint64 __trace_begin_time = g_get_monotonic_time ();                  \
   g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, "ENTRY: %s():%d",            \
           G_STRFUNC, __LINE__)
# define IDE_EXIT                                                        \
   G_STMT_START {                                                        \
      ide_trace_function (G_STRFUNC,                                     \
                          __trace_begin_time,                            \
                          g_get_monotonic_time ());                      \
      g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, " EXIT: %s():%d",         \
            G_STRFUNC, __LINE__);                                        \
      return;                                                            \
   } G_STMT_END
# define IDE_GOTO(_l)                                                    \
   G_STMT_START {                                                        \
      g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, " GOTO: %s():%d ("#_l")", \
            G_STRFUNC, __LINE__);                                        \
      goto _l;                                                           \
   } G_STMT_END
# define IDE_RETURN(_r)                                                  \
   G_STMT_START {                                                        \
      ide_trace_function (G_STRFUNC,                                     \
                          __trace_begin_time,                            \
                          g_get_monotonic_time ());                      \
      g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, " EXIT: %s():%d ",        \
            G_STRFUNC, __LINE__);                                        \
      return _r;                                                         \
   } G_STMT_END
# define IDE_BACKTRACE                                                   \
  G_STMT_START {                                                         \
    gpointer btbuf[64];                                                  \
    int btbuflen = backtrace (btbuf, G_N_ELEMENTS (btbuf));              \
    char **symnames = backtrace_symbols (btbuf, btbuflen);               \
    for (guint _i = 0; _i < btbuflen; _i++) {                            \
      g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE, "TRACE: [%-2d]: %s",      \
            _i, symnames[_i]);                                           \
    }                                                                    \
    free (symnames);                                                     \
  } G_STMT_END
#define IDE_DUMP_BYTES(_n, _b, _l)                                       \
  G_STMT_START {                                                         \
    GString *str, *astr;                                                 \
    gsize _i;                                                            \
    g_log(G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE,                             \
          "         %s = %p [%d]", #_n, _b, (gint)_l);                   \
    str = g_string_sized_new (80);                                       \
    astr = g_string_sized_new (16);                                      \
    for (_i = 0; _i < _l; _i++)                                          \
      {                                                                  \
        if ((_i % 16) == 0)                                              \
          g_string_append_printf (str, "%06x: ", (guint)_i);             \
        g_string_append_printf (str, " %02x", _b[_i]);                   \
                                                                         \
        if (g_ascii_isprint(_b[_i]))                                     \
          g_string_append_printf (astr, " %c", _b[_i]);                  \
        else                                                             \
          g_string_append (astr, " .");                                  \
                                                                         \
        if ((_i % 16) == 15)                                             \
          {                                                              \
            g_log (G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE,                    \
                   "%s  %s", str->str, astr->str);                       \
            str->str[0] = str->len = 0;                                  \
            astr->str[0] = astr->len = 0;                                \
          }                                                              \
        else if ((_i % 16) == 7)                                         \
          {                                                              \
            g_string_append (str, " ");                                  \
            g_string_append (astr, " ");                                 \
          }                                                              \
      }                                                                  \
                                                                         \
    if (_i != 16)                                                        \
      g_log (G_LOG_DOMAIN, IDE_LOG_LEVEL_TRACE,                          \
             "%-56s  %s", str->str, astr->str);                          \
                                                                         \
    g_string_free (str, TRUE);                                           \
    g_string_free (astr, TRUE);                                          \
  } G_STMT_END
#else
# define IDE_TODO(_msg)             G_STMT_START {            } G_STMT_END
# define IDE_PROBE                  G_STMT_START {            } G_STMT_END
# define IDE_TRACE_MSG(fmt, ...)    G_STMT_START {            } G_STMT_END
# define IDE_ENTRY                  G_STMT_START {            } G_STMT_END
# define IDE_GOTO(_l)               G_STMT_START { goto _l;   } G_STMT_END
# define IDE_EXIT                   G_STMT_START { return;    } G_STMT_END
# define IDE_RETURN(_r)             G_STMT_START { return _r; } G_STMT_END
# define IDE_BACKTRACE              G_STMT_START {            } G_STMT_END
# define IDE_DUMP_BYTES(_n, _b, _l) G_STMT_START {            } G_STMT_END
#endif

#define _IDE_BUG(Component, Description, File, Line, Func, ...)                         \
  G_STMT_START {                                                                        \
    g_printerr ("-----------------------------------------------------------------\n"); \
    g_printerr ("You've found a bug in Builder or one of its dependent libraries.\n");  \
    g_printerr ("Please help us help you by filing a bug report at:\n");                \
    g_printerr ("\n");                                                                  \
    g_printerr ("https://gitlab.gnome.org/GNOME/gnome-builder/issues&component=%s\n", Component);                           \
    g_printerr ("\n");                                                                  \
    g_printerr ("%s:%d in function %s()\n", File, Line, Func);                          \
    g_printerr ("\n");                                                                  \
    g_printerr (Description"\n", ##__VA_ARGS__);                                        \
    g_printerr ("-----------------------------------------------------------------\n"); \
  } G_STMT_END
#define IDE_BUG(Component, Description, ...) \
  _IDE_BUG(Component, Description, __FILE__, __LINE__, G_STRFUNC, ##__VA_ARGS__)

G_END_DECLS

#endif /* IDE_DEBUG_H */
