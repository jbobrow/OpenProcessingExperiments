
//BOAT
  PImage img; 

//setup
  void setup() {
  size(610,630);
  img = loadImage("boat.jpg");
  smooth();
  }

//draw
  void draw() {
  background(255);
//load image pixels 
  loadPixels();  
// skip every 10 pixels along the y-axis
  for (int y = 0; y < img.height; y+=10) {
  for (int x = 0; x < img.width; x+=10)  {
  int loc = x + y*img.width;
// color according to the image
  if (mouseX < width/3) { 
      stroke(img.pixels[loc]);
      fill(img.pixels[loc],0);
  } else if (mouseX < 2*width/3) {
      stroke(img.pixels[loc]);
      fill(img.pixels[loc],5);
  } else {
      stroke(img.pixels[loc]);
      fill(img.pixels[loc],50);
      }
// use color from a pixel the render a rect in that color  
   rect(x-10,y-10,x,y,10,10);
      }
    }
  }
    

