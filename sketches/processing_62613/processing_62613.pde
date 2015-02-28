
int NumLayers = 10;   // smaller values = bigger blobs
int Speed = 20;       // smaller values = faster animation
int WindowSize = 1000; // smaller values = smaller window = smoother animation

void setup() {
   size(WindowSize, WindowSize);
}

void draw() {
   background(0);
   color color0 = color(255, 60, 55);
   color color1 = color(255, 216, 0);
   color thisColor = color0;
   float layerHeight = 1.0/NumLayers;
   
   loadPixels();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*.015, y*.015);

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
