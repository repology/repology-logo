INKSCAPE?=		inkscape
OPTIPNG?=		optipng
OPTIPNG_ARGS?=	-q -o 99

all: repology16x16.png repology40x40.png repology256x256.png

# for favicon
repology16x16.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=16 --export-height=16 repology-logo.svg
	${OPTIPNG} ${OPTIPNG_ARGS} $@

# for site logo
repology40x40.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=40 --export-height=40 repology-logo.svg
	${OPTIPNG} ${OPTIPNG_ARGS} $@

# for github logo and other uses where larger image is needed
repology256x256.png: repology-logo.svg
	${INKSCAPE} --export-png="$@" --export-width=256 --export-height=256 repology-logo.svg
	${OPTIPNG} ${OPTIPNG_ARGS} $@

clean:
	rm -f *.png
