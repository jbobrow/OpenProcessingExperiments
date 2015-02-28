
//catleft catright blending

// Two source images
PImage source0;      // Source image 1
PImage source1;      // Source image 2

// A percentage (10% one image, 90% the other, etc.  starts at 0%);
float p = 0;

void setup() {
  size(841,595);
  frameRate(20);
  source0 = loadImage("catleft0.png");
  source1 = loadImage("catright1.png");

}

void draw() {
  // Percentage goes from 0 to 1 then back to 0
  //p += 0.01;
  //if (p > 1.0) p = 0;
  p=(1+sin(frameCount/100.0))/2;
 //p=sin(frameCount/100.0);
  println(p);
  
  loadPixels();
  // We are going to look at both image's pixels
  source0.loadPixels();
  source1.loadPixels();
  
  for (int x = 0; x < source0.width; x++ ) {
    for (int y = 0; y < source0.height; y++ ) {
      int loc = x + y*source0.width;
      // Two colors
      color c0 = source0.pixels[loc];
      color c1 = source1.pixels[loc];
      
      // Separate out r,g,b components
      float r0 = red(c0); float g0 = green(c0); float b0 = blue(c0);
      float r1 = red(c1); float g1 = green(c1); float b1 = blue(c1);
      
      // Combine each image's color
      float r = p*r0+(1.0-p)*r1;
      float g = p*g0+(1.0-p)*g1;
      float b = p*b0+(1.0-p)*b1;
      
      // Set the new color
      pixels[loc] = color(r,g,b);
      
    }
  }
  
  updatePixels();
 
}

