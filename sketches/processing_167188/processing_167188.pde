
//Created by Monocheddar in 2014
//Keep your mouse cursor at same spot for a while to draw in higher density
//Use your mouse to adjust melt start to your cursor position, press R to start over again.


/* @pjs preload="gonegirl.jpg"; */

PImage img;

int lengthofline = 100; //change this to set brush size

int x; //mouse X location
int y; //mouse Y location
int loc; //location of selected pixel inside pixel grid
int verticalmovement; //width of given img, this variable is used for vertical movement in pixel grid.


color [] carray = new color[lengthofline]; // color array which stores color data

float floatlength = carray.length; // length of color array converted to floating number;

float [] dist = new float[carray.length]; // stores distance of given "color-picking" cell at the top


float cellsize; // horizontal dimension of "color picking" cell, calculated from width of image and length of color array.
float distance; //distance between each cell.


void setup() {
  img = loadImage("gonegirl.jpg");
    
  size(637, 817);

  image(img, 0, 0);

  noStroke();

  cellsize = width / floatlength;

  for (int i = 0; i < dist.length; i++) { 
    dist[i] += distance;
    distance += cellsize;
  }
}


void draw() {

  verticalmovement+=width; // move to lower line of pixels
  img.loadPixels(); 
  loadPixels();

  //Fill array with given pixels color data

  x = mouseX-50; 
  y = mouseY;

  loc = x + y * width;
  loc = constrain(loc, 0, pixels.length);


  for (int i = 0; i < carray.length; i++) {
    carray[i] = img.pixels[loc+i];
  }

  // Copy and draw given pixels over original image

  loc = constrain(loc + verticalmovement, 0, pixels.length - width);

  for (int i  = 0; i < carray.length; i ++) {
    pixels[loc+i] = carray[i];
  }

  // reset "melting" point

  if (mousePressed) {
    verticalmovement = 0;
  }


  updatePixels();


  // draw color-picking top bar

  for (int i = 0; i < carray.length; i++ ) {
    fill(carray[i]);
    rect(dist[i], 0, width/carray.length, width/carray.length*5);
  }

  // press R to start over

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      loadPixels();
      img.loadPixels();
      for ( int i = 0; i < pixels.length; i++) {
        color c = img.pixels[i];
        pixels[i] = c;
      }
    }
    
   
    updatePixels();
  }
}



