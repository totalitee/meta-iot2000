do_compile_prepend() {
    export GO386=387
}

do_compile() {
	export GOARCH="${TARGET_ARCH}"
	# supported amd64, 386, arm arm64
	if [ "${TARGET_ARCH}" = "x86_64" ]; then
		export GOARCH="amd64"
	fi
	if [ "${TARGET_ARCH}" = "aarch64" ]; then
		export GOARCH="arm64"
	fi
	if [ "${TARGET_ARCH}" = "i586" ]; then
		export GOARCH="386"
	fi

	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
	# docker to download its dependencies but rather
	# use dependencies packaged independently.
	cd ${S}
	rm -rf .gopath
	mkdir -p .gopath/src/"$(dirname "${CONTAINERD_PKG}")"
	ln -sf ../../../.. .gopath/src/"${CONTAINERD_PKG}"
	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
	cd -

	# Pass the needed cflags/ldflags so that cgo
	# can find the needed headers files and libraries
	export CGO_ENABLED="1"
	export CFLAGS=""
	export LDFLAGS=""
	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
	export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
	export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"

        oe_runmake static
}
