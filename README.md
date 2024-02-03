# Plotter_Party
 Sketches for partying plotter style


 ## Plot_Noise

 This sketch renders random lines within a margin area.


 Set the WIDTH_INCH and HEIGHT_INCH to your final output size.  Default is 4x6 inches.  Keep in mind "inch" is somewhat relative in a pixel based environment, and  probably could be converted to, say, centimeters pretty easily.


DPI is dots per inch, 72 is the default, this is more for final output size as the output is SVG (vector, not raster).


 MARGIN, also in inches, keeps lines from crossing the edge of the output area, useful for matting/framing.

 Clicking the image as it's rendered generates a new random image.

 Hitting the "s" key on the keyboard saves the current drawing to disk.  This is rendered as three SVG files, each intended to be drawn on top of each other in a different color.  So "layer1" could be drawn with a red pen, "layer2" in a green pen, and "layer3" in blue.  The fun part would be experimenting with different drawing tools like brush tip markers.




