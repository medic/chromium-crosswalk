.PHONY: default create-maven-dir patch-pom deploy-local

XWALK_VERSION = 21.51.546.7
TARGET_VERSION = SNAPSHOT
MAVEN_DIR = maven/org/medicmobile/xwalk_core_library/${TARGET_VERSION}

default: patch-pom deploy-local

create-maven-dir:
	mkdir -p ${MAVEN_DIR} || true

patch-pom: create-maven-dir
	mkdir -p build
	cd build && \
		wget https://download.01.org/crosswalk/releases/crosswalk/android/maven2/org/xwalk/xwalk_core_library/${XWALK_VERSION}/xwalk_core_library-${XWALK_VERSION}.pom
	sed -i -E \
		-e 's/${XWALK_VERSION}/${TARGET_VERSION}/' \
		-e 's/org.xwalk/org.medicmobile.crosswalk/' \
		build/xwalk_core_library-${XWALK_VERSION}.pom
	mv \
		build/xwalk_core_library-${XWALK_VERSION}.pom \
		${MAVEN_DIR}/xwalk_core_library-${TARGET_VERSION}.pom

deploy-local: create-maven-dir
	cp out/Default/xwalk_core_library.aar \
		${MAVEN_DIR}/xwalk_core_library-${TARGET_VERSION}.aar
