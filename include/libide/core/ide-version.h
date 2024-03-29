/* ide-version.h.in
 *
 * Copyright (C) 2017 Christian Hergert <chergert@redhat.com>
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

#ifndef IDE_VERSION_H
#define IDE_VERSION_H

#if !defined(IDE_CORE_INSIDE) && !defined(IDE_CORE_COMPILATION)
# error "Only <libide-core.h> can be included directly."
#endif

/**
 * SECTION:ide-version
 * @title: Version Checking
 * @short_description: Conditionally include code based on Builder version
 *
 * This module provides various macros that may be used to build code based
 * on the version of Builder at build time.
 */

/**
 * IDE_BUILD_TYPE:
 *
 * The build type of the installed build.
 */
#define IDE_BUILD_TYPE "debugoptimized"

/**
 * IDE_BUILD_CHANNEL:
 *
 * The release channel of Builder. This should be a string such as
 * "other", "flatpak-stable", or "flatpak-nightly".
 */
#define IDE_BUILD_CHANNEL "flatpak-nightly"

/**
 * IDE_MAJOR_VERSION:
 *
 * libide major version component (e.g. 43 if %IDE_VERSION is 43.1)
 */
#define IDE_MAJOR_VERSION 45

/**
 * IDE_MINOR_VERSION:
 *
 * libide minor version component (e.g. 1 if %IDE_VERSION is 43.1)
 */
#define IDE_MINOR_VERSION 0

/**
 * IDE_VERSION
 *
 * libide version.
 */
#define IDE_VERSION 45.alpha

/**
 * IDE_VERSION_S:
 *
 * libide version, encoded as a string, useful for printing and
 * concatenation.
 */
#define IDE_VERSION_S "45.alpha"

#define IDE_ENCODE_VERSION(major,minor,micro) \
        ((major) << 24 | (minor) << 16 | (micro) << 8)

/**
 * IDE_VERSION_HEX:
 *
 * libide version, encoded as an hexadecimal number, useful for
 * integer comparisons.
 */
#define IDE_VERSION_HEX \
        (IDE_ENCODE_VERSION (IDE_MAJOR_VERSION, IDE_MINOR_VERSION, 0))

/**
 * IDE_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to %TRUE if the version
 * of libide is greater than the required one.
 *
 * Micro is no longer used.
 */
#define IDE_CHECK_VERSION(major,minor,micro)   \
        (IDE_MAJOR_VERSION > (major) || \
         (IDE_MAJOR_VERSION == (major) && IDE_MINOR_VERSION > (minor)) || \
         (IDE_MAJOR_VERSION == (major) && IDE_MINOR_VERSION == (minor) && \
          0 >= (micro)))

#endif /* IDE_VERSION_H */
