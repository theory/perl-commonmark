Param (
  $VERSION
)

$BASENAME = "cmark-${VERSION}"
$PREFIX = "$env:GITHUB_WORKSPACE/${BASENAME}"

if (Test-Path "Makefile") {
  make realclean
}

echo "Building ${BASENAME} in ${PREFIX}";
C:\msys64\usr\bin\wget.exe -q "https://github.com/jgm/cmark/archive/${VERSION}.tar.gz"
tar -zxf "${VERSION}.tar.gz"
cd "${BASENAME}"
nmake /nologo /f Makefile.nmake install
cd ..

echo "Building and testing CommonMark"
perl Makefile.PL
make test
