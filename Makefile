INKSCAPE?=		inkscape
CONVERT?=		convert
OPTIPNG?=		optipng
OPTIPNG_ARGS?=	-q -o 99
BASE64ENC?=		openssl enc -base64

all: repology.ico repology40x40.png repology256x256.png repology16x16.png.txt

# for favicon
repology16x16.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=16 --export-height=16 repology-logo.svg
	${OPTIPNG} ${OPTIPNG_ARGS} "$@"

repology16x16.png.txt: repology16x16.png
	echo -n "data:image/png;base64," > "$@"
	${BASE64ENC} < repology16x16.png | tr -d '\n' >> "$@"

repology32x32.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=32 --export-height=32 repology-logo.svg

repology64x64.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=64 --export-height=64 repology-logo.svg

repology.ico: repology16x16.png repology32x32.png repology64x64.png
	${CONVERT} repology16x16.png repology32x32.png repology64x64.png "$@"

# for site logo
repology40x40.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=40 --export-height=40 repology-logo.svg
	${OPTIPNG} ${OPTIPNG_ARGS} "$@"

# for github logo and other uses where larger image is needed
repology256x256.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=256 --export-height=256 repology-logo.svg
	${OPTIPNG} ${OPTIPNG_ARGS} "$@"

clean:
	rm -f *.png repology.svg *.ico *.txt
