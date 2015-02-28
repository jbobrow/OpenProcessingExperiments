
//Nick Myette
//Art 478
//Image Processing

//Borrowed from : 
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-7: Displaying the pixels of an image

PImage img;

int state;

void setup() {
  img = loadImage("psychedelic_by_dudeinemerica.jpeg");
  img.resize(img.width/2, img.height/2);
  size(img.width,img.height);
  state = 0;
}

void draw() {
  state = state%3;
  loadPixels();

  img.loadPixels();
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      if (state == 0) {
        pixels[loc] = color(r,g,b);
      }else if (state == 1) {
        pixels[loc] = color(g,b,r);
      }else if (state == 2) {
        pixels[loc] = color(b,r,g);
      }
    }
  }
  updatePixels();
}

void mousePressed() {
  state++;
}               
