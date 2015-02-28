
int NumLayers = 6;   // smaller values = bigger blobs
int Speed = 15;       // smaller values = faster animation
PImage img1;
PImage img2;
int[] array1 = new int[600*500];
int[] array2 = new int[600*500];


void setup() {
   size(600, 500);
   img1 = loadImage("sean.png");
   image(img1, 0, 0, 600, 500);
   loadPixels();
   arrayCopy(pixels, array1);
   img2 = loadImage("satan.png");
   image(img2, 0, 0, 600, 500);
   loadPixels();
   arrayCopy(pixels, array2);
}

void draw() {
   float layerHeight = 1.0/NumLayers;
   
   loadPixels();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*.015, y*.015);
         color color0 = color(array1[(y*width)+x]);
         color color1 = color(array2[(y*width)+x]);
         color thisColor = color0;

         float noiseBump = lerp(0, layerHeight, (frameCount % Speed)/(1.0*Speed));
         int whichColor = int((noiseVal+noiseBump)/layerHeight);
         int startingColor = (((frameCount/Speed) % 2) == 0) ? 0 : 1;
         if (((whichColor+startingColor) % 2) == 0) thisColor = color0;
         else thisColor = color1;
         
         pixels[(y*width)+x] = thisColor;
      }
   }
   updatePixels();
}

