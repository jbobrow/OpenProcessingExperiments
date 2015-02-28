
import processing.pdf.*;
 
boolean record;
 
 
PImage img; //declar image variable
int xy = 15; // variable to set size of grid
 
void setup() {
  size (506,900);
  img = loadImage ("bruna.jpg"); // load image here
  background (0);
  smooth ();
  imageMode(CENTER);
}
 
void  draw () {
 
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }
 
 
 
//this loop draws one kind of triangle
 
  for (int y=0; y<height; y+= xy) {
    for (int x=0; x<width; x+= xy) {
      int loc = x + y*img.width;
 
      //look up the rgb color in the source image
 
      loadPixels();
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      noStroke();
 
      //draw a triangle
 
      fill (r, g, b);
      triangle (x, y, x-xy/2, y+xy, x+xy/2, y+xy);
 
    }
  }
 
//this loop draws another kind of triangle
 
  for (int y=0; y< height; y+= xy) {
    for (int x=xy/2; x<width+xy; x+= xy) {
      int loc = x + y*img.width;
 
 
 
      //look up the rgb color in the source image
 
      loadPixels();
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      noStroke();
 
      //draw a triangle with color of sampled pixel
 
      fill (r, g, b);
      triangle (x-xy/2, y, x+xy/2, y, x, y+xy);
    }
  }
   
   
 
   
   
   
   
   
 
  if (record) {
    endRecord();
    record = false;
  }
}
 
 
// Use a keypress so thousands of files aren't created
void mousePressed() {
  record = true;
}

