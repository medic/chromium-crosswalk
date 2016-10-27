# Crosswalk Fork for Medic Mobile

## What have we changed

By default, Chrome, Chromium and Crosswalk limit the maximum space that IndexedDB can use to 10% of available disk space.  Our fork of Crosswalk aims to remove this restriction.

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

	cd out/Default && ninja -t clean && ninja xwalk_core_library__aar

This build can take several hours, so when running on a remote server, it's advisable to use nohup, e.g.:

	cd out/Default && ninja -t clean && nohup ninja xwalk_core_library__aar & tail -F nohup.out

## How do we deploy it?

We serve a simple maven repository from the github-pages URL of this repository.  The repo address is https://medic.github.io/crosswalk-chromium/maven.  To upload your build to this repo:

	git checkout gh-pages
	make TARGET_VERSION=x.y.z
	git add maven/org/medicmobile/crosswalk/xwalk_core_library/x.y.z
	git commit -m "Release: x.y.z"
	git tag medic-x.y.z
	git push origin gh-pages
	git push --tags
