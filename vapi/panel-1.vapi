/* libpanel-1.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Panel", gir_namespace = "Panel", gir_version = "1", lower_case_cprefix = "panel_")]
namespace Panel {
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_dock_get_type ()")]
	public class Dock : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Dock ();
		public void foreach_frame (Panel.FrameCallback callback);
		public bool get_can_reveal_area (Panel.Area area);
		public bool get_can_reveal_bottom ();
		public bool get_can_reveal_end ();
		public bool get_can_reveal_start ();
		public bool get_can_reveal_top ();
		public bool get_reveal_area (Panel.Area area);
		public bool get_reveal_bottom ();
		public bool get_reveal_end ();
		public bool get_reveal_start ();
		public bool get_reveal_top ();
		public void remove (Gtk.Widget child);
		public void set_bottom_height (int height);
		public void set_end_width (int width);
		public void set_reveal_area (Panel.Area area, bool reveal);
		public void set_reveal_bottom (bool reveal_bottom);
		public void set_reveal_end (bool reveal_end);
		public void set_reveal_start (bool reveal_start);
		public void set_reveal_top (bool reveal_top);
		public void set_start_width (int width);
		public void set_top_height (int height);
		[NoAccessorMethod]
		public int bottom_height { get; set; }
		public bool can_reveal_bottom { get; }
		public bool can_reveal_end { get; }
		public bool can_reveal_start { get; }
		public bool can_reveal_top { get; }
		[NoAccessorMethod]
		public int end_width { get; set; }
		public bool reveal_bottom { get; set; }
		public bool reveal_end { get; set; }
		public bool reveal_start { get; set; }
		public bool reveal_top { get; set; }
		[NoAccessorMethod]
		public int start_width { get; set; }
		[NoAccessorMethod]
		public int top_height { get; set; }
		[Version (since = "1.2")]
		public signal bool adopt_widget (Panel.Widget widget);
		public virtual signal void panel_drag_begin (Panel.Widget widget);
		public virtual signal void panel_drag_end (Panel.Widget widget);
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_frame_get_type ()")]
	public class Frame : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget, Gtk.Orientable {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Frame ();
		public void add (Panel.Widget panel);
		public void add_before (Panel.Widget panel, Panel.Widget sibling);
		public bool get_closeable ();
		public bool get_empty ();
		public unowned Panel.FrameHeader? get_header ();
		public uint get_n_pages ();
		public unowned Panel.Widget? get_page (uint n);
		public Gtk.SelectionModel get_pages ();
		public unowned Gtk.Widget? get_placeholder ();
		public Panel.Position get_position ();
		public int get_requested_size ();
		public unowned Panel.Widget? get_visible_child ();
		public void remove (Panel.Widget panel);
		[Version (since = "1.2")]
		public void set_child_pinned (Panel.Widget child, bool pinned);
		public void set_header (Panel.FrameHeader? header);
		public void set_placeholder (Gtk.Widget? placeholder);
		public void set_requested_size (int requested_size);
		public void set_visible_child (Panel.Widget widget);
		public bool closeable { get; }
		public bool empty { get; }
		public Gtk.Widget placeholder { get; set; }
		public Panel.Widget visible_child { get; set; }
		[Version (since = "1.2")]
		public virtual signal bool adopt_widget (Panel.Widget widget);
		[Version (since = "1.2")]
		public virtual signal void page_closed (Panel.Widget widget);
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_frame_header_bar_get_type ()")]
	public class FrameHeaderBar : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget, Panel.FrameHeader {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public FrameHeaderBar ();
		public unowned Gtk.PopoverMenu get_menu_popover ();
		public bool get_show_icon ();
		public void set_show_icon (bool show_icon);
		public bool show_icon { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_frame_switcher_get_type ()")]
	public class FrameSwitcher : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget, Gtk.Orientable, Panel.FrameHeader {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public FrameSwitcher ();
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_frame_tab_bar_get_type ()")]
	public class FrameTabBar : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget, Panel.FrameHeader {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public FrameTabBar ();
		public bool get_autohide ();
		public bool get_expand_tabs ();
		public bool get_inverted ();
		public void set_autohide (bool autohide);
		public void set_expand_tabs (bool expand_tabs);
		public void set_inverted (bool inverted);
		public bool autohide { get; set; }
		public bool expand_tabs { get; set; }
		public bool inverted { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_grid_get_type ()")]
	public class Grid : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Grid ();
		public void add (Panel.Widget widget);
		public async bool agree_to_close_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public void foreach_frame (Panel.FrameCallback callback);
		public unowned Panel.GridColumn get_column (uint column);
		public unowned Panel.GridColumn get_most_recent_column ();
		public unowned Panel.Frame get_most_recent_frame ();
		public uint get_n_columns ();
		public void insert_column (uint position);
		public signal Panel.Frame create_frame ();
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_grid_column_get_type ()")]
	public class GridColumn : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public GridColumn ();
		public void foreach_frame (Panel.FrameCallback callback);
		public bool get_empty ();
		public unowned Panel.Frame get_most_recent_frame ();
		public uint get_n_rows ();
		public unowned Panel.Frame get_row (uint row);
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_omni_bar_get_type ()")]
	public class OmniBar : Gtk.Widget, Gtk.Accessible, Gtk.Actionable, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public OmniBar ();
		public void add_prefix (int priority, Gtk.Widget widget);
		public void add_suffix (int priority, Gtk.Widget widget);
		public unowned Gtk.Popover? get_popover ();
		public double get_progress ();
		public void remove (Gtk.Widget widget);
		public void set_popover (Gtk.Popover popover);
		public void set_progress (double progress);
		public void start_pulsing ();
		public void stop_pulsing ();
		[NoAccessorMethod]
		public string action_tooltip { owned get; set; }
		[NoAccessorMethod]
		public string icon_name { owned get; set; }
		[NoAccessorMethod]
		public GLib.MenuModel menu_model { owned get; set; }
		public Gtk.Popover popover { get; set; }
		public double progress { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_paned_get_type ()")]
	public class Paned : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget, Gtk.Orientable {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Paned ();
		public void append (Gtk.Widget child);
		public uint get_n_children ();
		public unowned Gtk.Widget? get_nth_child (uint nth);
		public void insert (int position, Gtk.Widget child);
		public void insert_after (Gtk.Widget child, Gtk.Widget sibling);
		public void prepend (Gtk.Widget child);
		public void remove (Gtk.Widget child);
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_position_get_type ()")]
	public sealed class Position : GLib.Object {
		[CCode (has_construct_function = false)]
		public Position ();
		public bool equal (Panel.Position b);
		[CCode (has_construct_function = false)]
		public Position.from_variant (GLib.Variant variant);
		public Panel.Area get_area ();
		public bool get_area_set ();
		public uint get_column ();
		public bool get_column_set ();
		public uint get_depth ();
		public bool get_depth_set ();
		public uint get_row ();
		public bool get_row_set ();
		public bool is_indeterminate ();
		public void set_area (Panel.Area area);
		public void set_area_set (bool area_set);
		public void set_column (uint column);
		public void set_column_set (bool column_set);
		public void set_depth (uint depth);
		public void set_depth_set (bool depth_set);
		public void set_row (uint row);
		public void set_row_set (bool row_set);
		public GLib.Variant to_variant ();
		public Panel.Area area { get; set; }
		public bool area_set { get; set; }
		public uint column { get; set; }
		public bool column_set { get; set; }
		public uint depth { get; set; }
		public bool depth_set { get; set; }
		public uint row { get; set; }
		public bool row_set { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_save_delegate_get_type ()")]
	public class SaveDelegate : GLib.Object {
		[CCode (has_construct_function = false)]
		public SaveDelegate ();
		public unowned GLib.Icon? get_icon ();
		public unowned string? get_icon_name ();
		public bool get_is_draft ();
		public double get_progress ();
		public unowned string? get_subtitle ();
		public unowned string? get_title ();
		public virtual async bool save_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public void set_icon (GLib.Icon? icon);
		public void set_icon_name (string? icon);
		public void set_is_draft (bool is_draft);
		public void set_progress (double progress);
		public void set_subtitle (string? subtitle);
		public void set_title (string? title);
		public GLib.Icon icon { get; set; }
		public string icon_name { get; set; }
		public bool is_draft { get; set; }
		public double progress { get; set; }
		public string subtitle { get; set; }
		public string title { get; set; }
		[HasEmitter]
		public virtual signal void close ();
		[HasEmitter]
		public virtual signal void discard ();
		public virtual signal bool save (GLib.Task task);
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_save_dialog_get_type ()")]
	public sealed class SaveDialog : Adw.MessageDialog, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget, Gtk.Native, Gtk.Root, Gtk.ShortcutManager {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public SaveDialog ();
		public void add_delegate (Panel.SaveDelegate @delegate);
		public bool get_close_after_save ();
		public async bool run_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public void set_close_after_save (bool close_after_save);
		public bool close_after_save { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_statusbar_get_type ()")]
	public class Statusbar : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Statusbar ();
		public void add_prefix (int priority, Gtk.Widget widget);
		public void add_suffix (int priority, Gtk.Widget widget);
		public void remove (Gtk.Widget widget);
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_theme_selector_get_type ()")]
	public class ThemeSelector : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public ThemeSelector ();
		public unowned string get_action_name ();
		public void set_action_name (string action_name);
		public string action_name { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_toggle_button_get_type ()")]
	public class ToggleButton : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public ToggleButton (Panel.Dock dock, Panel.Area area);
		[NoAccessorMethod]
		public Panel.Area area { get; construct; }
		[NoAccessorMethod]
		public Panel.Dock dock { owned get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", type_id = "panel_widget_get_type ()")]
	public class Widget : Gtk.Widget, Gtk.Accessible, Gtk.Buildable, Gtk.ConstraintTarget {
		[CCode (has_construct_function = false, type = "GtkWidget*")]
		public Widget ();
		public void action_set_enabled (string action_name, bool enabled);
		public void close ();
		public bool focus_default ();
		public void force_close ();
		public bool get_busy ();
		public bool get_can_maximize ();
		public unowned Gtk.Widget? get_child ();
		public unowned GLib.Icon? get_icon ();
		public unowned string? get_icon_name ();
		public unowned string get_kind ();
		public unowned GLib.MenuModel? get_menu_model ();
		public bool get_modified ();
		public bool get_needs_attention ();
		public Panel.Position? get_position ();
		public bool get_reorderable ();
		public unowned Panel.SaveDelegate? get_save_delegate ();
		public unowned string? get_title ();
		public unowned string? get_tooltip ();
		public void insert_action_group (string prefix, GLib.ActionGroup group);
		[CCode (cname = "panel_widget_class_install_action")]
		public class void install_action (string action_name, string? parameter_type, Gtk.WidgetActionActivateFunc activate);
		[CCode (cname = "panel_widget_class_install_property_action")]
		public class void install_property_action (string action_name, string property_name);
		public void mark_busy ();
		public void maximize ();
		public void raise ();
		public void set_can_maximize (bool can_maximize);
		public void set_child (Gtk.Widget? child);
		public void set_icon (GLib.Icon? icon);
		public void set_icon_name (string? icon_name);
		public void set_kind (string? kind);
		public void set_menu_model (GLib.MenuModel? menu_model);
		public void set_modified (bool modified);
		public void set_needs_attention (bool needs_attention);
		public void set_reorderable (bool reorderable);
		public void set_save_delegate (Panel.SaveDelegate? save_delegate);
		public void set_title (string? title);
		public void set_tooltip (string? tooltip);
		public void unmark_busy ();
		public void unmaximize ();
		public bool busy { get; }
		public bool can_maximize { get; set; }
		public Gtk.Widget child { get; set; }
		public GLib.Icon icon { get; set; }
		public string icon_name { get; set; }
		public string id { get; set; }
		public string kind { get; set; }
		public GLib.MenuModel menu_model { get; set; }
		public bool modified { get; set; }
		public bool needs_attention { get; set; }
		public bool reorderable { get; set; }
		public Panel.SaveDelegate save_delegate { get; set; }
		public string title { get; set; }
		[Version (since = "1.2")]
		public string tooltip { get; set; }
		[HasEmitter]
		public virtual signal unowned Gtk.Widget? get_default_focus ();
		public virtual signal void presented ();
	}
	[CCode (cheader_filename = "libpanel.h", type_cname = "PanelFrameHeaderInterface", type_id = "panel_frame_header_get_type ()")]
	public interface FrameHeader : Gtk.Widget {
		public abstract void add_prefix (int priority, Gtk.Widget child);
		public abstract void add_suffix (int priority, Gtk.Widget child);
		public abstract bool can_drop (Panel.Widget widget);
		public unowned Panel.Frame? get_frame ();
		public abstract void page_changed (Panel.Widget? widget);
		public void set_frame (Panel.Frame? frame);
		[ConcreteAccessor]
		public abstract Panel.Frame frame { get; set; }
	}
	[CCode (cheader_filename = "libpanel.h", cprefix = "PANEL_AREA_", type_id = "panel_area_get_type ()")]
	public enum Area {
		START,
		END,
		TOP,
		BOTTOM,
		CENTER
	}
	[CCode (cheader_filename = "libpanel.h", instance_pos = 1.9)]
	public delegate void FrameCallback (Panel.Frame frame);
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_MAJOR_VERSION")]
	public const int MAJOR_VERSION;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_MICRO_VERSION")]
	public const int MICRO_VERSION;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_MINOR_VERSION")]
	public const int MINOR_VERSION;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_VERSION_S")]
	public const string VERSION_S;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_WIDGET_KIND_ANY")]
	public const string WIDGET_KIND_ANY;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_WIDGET_KIND_DOCUMENT")]
	public const string WIDGET_KIND_DOCUMENT;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_WIDGET_KIND_UNKNOWN")]
	public const string WIDGET_KIND_UNKNOWN;
	[CCode (cheader_filename = "libpanel.h", cname = "PANEL_WIDGET_KIND_UTILITY")]
	public const string WIDGET_KIND_UTILITY;
	[CCode (cheader_filename = "libpanel.h")]
	public static bool check_version (uint major, uint minor, uint micro);
	[CCode (cheader_filename = "libpanel.h")]
	public static void finalize ();
	[CCode (cheader_filename = "libpanel.h")]
	public static uint get_major_version ();
	[CCode (cheader_filename = "libpanel.h")]
	public static uint get_micro_version ();
	[CCode (cheader_filename = "libpanel.h")]
	public static uint get_minor_version ();
	[CCode (cheader_filename = "libpanel.h")]
	public static GLib.Resource get_resource ();
	[CCode (cheader_filename = "libpanel.h")]
	public static void init ();
}
