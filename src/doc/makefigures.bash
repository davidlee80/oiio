#!/bin/bash

if [ "${OIIOTOOL}" == "" ] ; then
    OIIOTOOL=oiiotool
fi

echo "Using OIIOTOOL=${OIIOTOOL}"

# Uncomment to make these files. But we check them in so that the figures
# can be generated without oiio-images.
#${OIIOTOOL} ../../../../oiio-images/tahoe-gps.jpg --colorconvert sRGB linear --resize 320x240 --colorconvert linear sRGB -o tahoe-small.jpg
#${OIIOTOOL} ../../../../oiio-images/grid.tif --resize 256x256 --colorconvert linear sRGB -o grid-small.jpg

${OIIOTOOL} tahoe-small.jpg --tocolorspace linear --addc 0.2 --tocolorspace sRGB -o addc.jpg
${OIIOTOOL} tahoe-small.jpg --tocolorspace linear --mulc 0.5 --tocolorspace sRGB -o mulc.jpg
${OIIOTOOL} tahoe-small.jpg --tocolorspace linear --chsum:weight=.2126,.7152,.0722 --ch 0,0,0 --tocolorspace sRGB -o luma.jpg
${OIIOTOOL} grid-small.jpg --flip -o flip.jpg
${OIIOTOOL} grid-small.jpg --flop -o flop.jpg
${OIIOTOOL} grid-small.jpg --flipflop -o flipflop.jpg
${OIIOTOOL} grid-small.jpg --rotate90 -o rotate90.jpg
${OIIOTOOL} grid-small.jpg --rotate180 -o rotate180.jpg
${OIIOTOOL} grid-small.jpg --rotate270 -o rotate270.jpg
${OIIOTOOL} grid-small.jpg --transpose -o transpose.jpg
${OIIOTOOL} grid-small.jpg --rotate 45 -o rotate45.jpg
${OIIOTOOL} grid-small.jpg --cshift +70+30 -o cshift.jpg
${OIIOTOOL} --pattern constant:color=1,0.7,0.7 320x240 3 --fill:color=1,0,0 50x100+50+75 --tocolorspace sRGB -o fill.jpg
${OIIOTOOL} --create 320x240 3 -fill:bottom=1,0.7,0.7:top=1,0,0 320x240 --tocolorspace sRGB -o fill.jpg
${OIIOTOOL} --pattern checker:color1=0.1,0.1,0.1:color2=0.4,0.4,0.4:width=32:height=32 320x240 3 --tocolorspace sRGB -o checker.jpg
${OIIOTOOL} --pattern fill:top=0.1,0.1,0.1:bottom=0,0,0.75 320x240 3 --tocolorspace sRGB -o gradient.jpg
${OIIOTOOL} --pattern fill:left=0.1,0.1,0.1:right=0,0.75,0 320x240 3 --tocolorspace sRGB -o gradienth.jpg
${OIIOTOOL} --pattern fill:topleft=.1,.1,.1:topright=1,0,0:bottomleft=0,1,0:bottomright=0,0,1 320x240 3 --tocolorspace sRGB -o gradient4.jpg
${OIIOTOOL} --pattern checker:width=16:height=16 256x256 3 --tocolorspace sRGB -o checker.jpg
${OIIOTOOL} --pattern noise:type=uniform:max=1:mono=1 256x256 3 --tocolorspace sRGB -o unifnoise1.jpg
${OIIOTOOL} --pattern noise:type=uniform:max=1 256x256 3 --tocolorspace sRGB -o unifnoise3.jpg
${OIIOTOOL} tahoe-small.jpg --noise:type=gaussian:mean=0:stddev=0.1 -o tahoe-gauss.jpg
${OIIOTOOL} tahoe-small.jpg --noise:type=salt:portion=0.01:value=0:mono=1 -o tahoe-pepper.jpg
${OIIOTOOL} tahoe-small.jpg --blur 7x7 -o tahoe-blur.jpg
${OIIOTOOL} tahoe-pepper.jpg --median 3x3 -o tahoe-pepper-median.jpg
${OIIOTOOL} --create 320x240 3 --text:x=25:y=50 "Hello, world" \
            --text:x=50:y=100:font="Arial Bold":color=1,0,0:size=30 "Go Big Red!" --tocolorspace sRGB -o text.jpg
#${OIIOTOOL} ../../../testsuite/oiiotool/tahoe-small.tif

