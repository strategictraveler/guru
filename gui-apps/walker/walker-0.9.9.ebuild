# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A basic clipboard manager for Wayland."
HOMEPAGE="https://github.com/abenz1267/walker"
SRC_URI="
	https://github.com/abenz1267/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://jroy.ca/dist/${P}-deps.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	gui-libs/gtk
	>=gui-libs/gtk4-layer-shell-1.0.4
	dev-libs/gobject-introspection
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-libs/glib-2.80.0[introspection]
"

src_compile() {
	cd "${S}"/cmd || die
	ego build -o walker
}

src_install() {
	dobin cmd/"${PN}"
}
