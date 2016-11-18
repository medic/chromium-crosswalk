# Crosswalk Fork for Medic Mobile

## What have we changed

By default, Chrome, Chromium and Crosswalk limit the maximum space that IndexedDB can use to 10% of available disk space.  Our fork of Crosswalk aims to remove this restriction.

To deactivate the storage limit, use the `--unlimited-storage` command-line flag.  On android, this can be activated by adding the flag to `src/main/assets/xwalk-command-line`.  E.g.:

	xwalk --unlimited-storage --enable-logging --v=1 --enable-logging=stderr --show-fps-panel

## What do we build?

	xwalk_core_library.aar

## How do we use it?

To include this custom `.aar` file in our projects, we use the following gradle configuration:

	repositories {
		maven { url 'https://medic.github.io/chromium-crosswalk/maven/' }
	}

	dependencies {
		compile 'org.medicmobile.crosswalk:xwalk_core_library:x.y.z'
	}

## How do we build it?

For details of building this code, see the repo at https://github.com/medic/crosswalk-build.

## How do we deploy it?

We serve a simple maven repository from the github-pages URL of this repository.  The repo address is https://medic.github.io/crosswalk-chromium/maven.  To upload your build to this repo:

	git checkout gh-pages
	make TARGET_VERSION=x.y.z
	git add maven/org/medicmobile/crosswalk/xwalk_core_library/x.y.z
	git commit -m "Release: x.y.z"
	git tag medic-x.y.z
	git push origin gh-pages
	git push --tags
