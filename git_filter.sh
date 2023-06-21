#!/bin/bash
#
# Cleans up dotfiles, reducing the amount of noise and unintended changes.
#
# Inspired by https://github.com/denilsonsa/small_scripts/blob/master/git_version_smudge_or_clean.sh


if [ "$1" = 'clean' ] ; then
	sed '
		# Removing useless Qt ByteArray data.
		# Well, not useless in normal desktop usage, but these binary blobs
		# have no reason to be saved in dotfiles.
		/^geometry *= *@ByteArray(.*/d
		/^state *= *@ByteArray(.*/d

		# Removing VLC dimensions and binary state.
		# Can potentially apply to any Qt application. Be careful.
		/^pos *= *@Point([-0-9 ]\+)/d
		/^screen *= *@Rect([-0-9 ]\+)/d
		/^size *= *@Size([-0-9 ]\+)/d
		/^bgSize *= *@Size([-0-9 ]\+)/d
		/^playlistSize *= *@Size([-0-9 ]\+)/d
		/^headerStateV2 *= *@ByteArray.*/d
		/^leftSplitterGeometry *= *@ByteArray.*/d
		/^splitterSizes *= *@ByteArray.*/d
		/^Header-State *= *@ByteArray.*/d

		# Removing more VLC options that change all the time and are not
		# relevant.
		/^\[General\]$/,/^$/ {
			/^last-playlist-ext *=/d
		}
		/^\[MainWindow\]$/,/^$/ {
			/^pl-dock-status *=/d
			/^playlist-visible *=/d
		}

		# Removing qpdfview entries that change all the time.
		/^\[mainWindow\]$/,/^$/ {
			/^openPath *=/d
		}

		# Removing arbitrary ids from kglobalshortcutsrc
		/^switch-to-activity-[-0-9a-fA-F]\{36\}=.*,.*,.*/d
		/^activate widget [0-9]\+=.*,.*,.*/d
	'
elif [ "$1" = 'smudge' ] ; then
	# Do nothing.
	cat
else
	>&2 echo 'Error: Must pass either "clean" or "smudge".'
	exit 1
fi
