/*
 * Copyright © 2008 Christian Persch
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)
#error "Only <vte/vte.h> can be included directly."
#endif

#include <glib.h>

#include "vtemacros.h"

G_BEGIN_DECLS

/**
 * SECTION:vte-version
 * @short_description: Library version checks
 *
 * These macros enable compile time checks of the library version.
 */

/**
 * VTE_MAJOR_VERSION:
 *
 * The major version number of the VTE library
 * (e.g. in version 3.1.4 this is 3).
 */
#define VTE_MAJOR_VERSION (0)

/**
 * VTE_MINOR_VERSION:
 *
 * The minor version number of the VTE library
 * (e.g. in version 3.1.4 this is 1).
 */
#define VTE_MINOR_VERSION (73)

/**
 * VTE_MICRO_VERSION:
 *
 * The micro version number of the VTE library
 * (e.g. in version 3.1.4 this is 4).
 */
#define VTE_MICRO_VERSION (0)

/**
 * VTE_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Macro to check the library version at compile time.
 * It returns <literal>1</literal> if the version of VTE is greater or
 * equal to the required one, and <literal>0</literal> otherwise.
 */
#define VTE_CHECK_VERSION(major,minor,micro) \
  (VTE_MAJOR_VERSION > (major) || \
   (VTE_MAJOR_VERSION == (major) && VTE_MINOR_VERSION > (minor)) || \
   (VTE_MAJOR_VERSION == (major) && VTE_MINOR_VERSION == (minor) && VTE_MICRO_VERSION >= (micro)))

_VTE_PUBLIC
guint vte_get_major_version (void) _VTE_CXX_NOEXCEPT G_GNUC_CONST;

_VTE_PUBLIC
guint vte_get_minor_version (void) _VTE_CXX_NOEXCEPT G_GNUC_CONST;

_VTE_PUBLIC
guint vte_get_micro_version (void) _VTE_CXX_NOEXCEPT G_GNUC_CONST;

G_END_DECLS
