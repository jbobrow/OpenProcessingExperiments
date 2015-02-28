
import processing.core.*;


public class ghostRadar extends PApplet {

 public static final int HSPARSENESS = 2;
 public static final int VSPARSENESS = 2;
 public static final int DECAY=2;
 public static final int DIMMING = 2;
 int []  sourceImagePixels;
 int [] nextFrame;
 int x,y,c,i, cset = 0;

 public void setup () {
   frameRate(width/3);
   //PImage sourceImage = loadImage("I:/nove.jpg", "jpg");
   //PImage sourceImage = loadImage("I:/tfl.gif", "gif");
   PImage sourceImage = loadImage("darwin.jpg", "jpg");
   sourceImage.loadPixels();
   //sourceImagePixels = sourceImage.pixels;
   sourceImagePixels = new int [sourceImage.pixels.length];
   for (i=0; i<sourceImage.pixels.length; i++) {
     sourceImagePixels[i] = floor(brightness(sourceImage.pixels[i]));
   }
   size(sourceImage.width, sourceImage.height);
   print(String.format("width: %d height %d", sourceImage.width, sourceImage.height));
   background(0);
   cset=VSPARSENESS;
   loadPixels();
 }

 int cToI(int x, int y) {
   if ((x*y) > (width * height) | (x < 0) | (y < 0)) {
     print(String.format("\n\nERROR: X %s Y%s",  x, y));
   }
   return ((y * width) + x);
 }

 void dimPixel(int x, int y) {
   int currentPixel = cToI(x,y);
   float currentBrightness = (brightness(pixels[currentPixel]));
   if (currentBrightness  > sourceImagePixels[currentPixel] /DIMMING) {
     pixels[currentPixel] = color(currentBrightness - DECAY);
   }
 }

 void lightPixel(int x, int y) {
   int currentPixel = cToI(x,y);
   if (sourceImagePixels[currentPixel] > 128 ) { pixels[currentPixel] = color(255); }
   else {pixels[currentPixel] = color(128); }
 }

 public void draw() {
   // keep not of which column we are setting full bright.
   if (c > width - VSPARSENESS ) { //time to go backwards
     cset = 0 - VSPARSENESS;
     c = width -1;
   }
   if (c < 1 ) { //time to go forwards again.
     cset = VSPARSENESS;
     c = 0;
   }

   c += cset;
   // end of the scan line monitor

   for (y = 0; y < height; y+=HSPARSENESS) {
     for (x = 0; x < width; x+=VSPARSENESS) {
       dimPixel(x,y);
     }
   }

   for (y=0; y<height; y+=HSPARSENESS) {
     lightPixel(c,y);
   }


   updatePixels();
 } //end draw function
}

