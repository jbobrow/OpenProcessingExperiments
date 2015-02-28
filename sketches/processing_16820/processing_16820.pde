
PImage img;
color r;
int count = 0;
int colourWidth = 4;
int bright = 0;
int dB = 50;  // change in brightness

void setup() {
  colorMode(HSB, 360, 100, 100);
  r = color(255, 100, 100);
   img = loadImage("logo.jpg");
   size(500,150); 
   //loadPixels();
   image(img,0,0);
   loadPixels();

   for (int i=0; i<height; i++) {
     for (int j=0; j<width; j++) {
       int k = i*width+j;
       color cp = pixels[k];
       float b = brightness(cp);
       float s = saturation(cp);
       if (b > 10) {
         if (count < colourWidth/2) {
           pixels[k] = color(100, 100, bright);
         } else {
           pixels[k] = color(40, 100, bright);
         }
         
       }
     } 
     bright += dB;
         if (bright < 0 || bright > 100) {
           dB *= -1; 
         }
     count ++;
     if (count > colourWidth) {
       count = 0; 
     }
   }
   updatePixels();
   //save("logo018.jpg");
}

void draw() {
  
}

