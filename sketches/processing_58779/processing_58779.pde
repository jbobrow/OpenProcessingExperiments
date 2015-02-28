
/*
Assignment 6
Name: Hoang Ha
Email: hha@brynmawr.edu
Course: CS110 - 02
4/10/2012
I altered the image and make place the images so that it is in the shape of a heart.

*/

PImage img2;
int row = 10;
int col = 10;
int s = 10;
float[][] matrix = {
  {
    1/16., 2/16., 1/16.
  }
  , 
  {
    2/16., 4/16., 2/16.
  }
  , 
  {
    1/16., 2/16., 1/16.
  }
};

void setup() {
  //gray scale image then tile it to make as background
  PImage img = loadImage("Dock.jpg");
  size(img.width, img.height);
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    img.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  img.updatePixels();

  int w = width/col;
  int h = height/row;

  for (int i=0; i<row; i++) {
    for (int j=0; j<col; j++) {
      image(img, w*j, h*i, w, h);
    }
  }
  
  //red tint to fill outline of heart
  PImage img5 = loadImage("Dock.jpg");
  size(img5.width, img5.height);
  
  img5.loadPixels();
  for (int i=0; i<img5.pixels.length; i++) {
    color c = img5.pixels[i];
    img5.pixels[i] = color(red(c), 0, 0);
  }
  img5.updatePixels();
  
  pushMatrix();
  translate(width*.2, height*.2);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.3, height*.2);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.4, height*.3);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width*.5, height*.3);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.6, height*.2);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.7, height*.2);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.8, height*.3);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.8, height*.4);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.7, height*.5);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width*.6, height*.6);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width*.5, height*.7);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.4, height*.7);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.3, height*.6);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.2, height*.5);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.1, height*.4);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width*.1, height*.3);
  scale(.1,.1);
  image(img5, 0, 0);
  popMatrix();

  
  // fill heart with visualization
  secondImage (width*.2, height*.3);
  secondImage (width*.2, height*.4);
  secondImage (width*.3, height*.5);
  secondImage (width*.4, height*.6);
  secondImage (width*.5, height*.6);
  secondImage (width*.6, height*.5);
  secondImage (width*.7, height*.4);
  secondImage (width*.7, height*.3);
  secondImage (width*.6, height*.3);
  secondImage (width*.5, height*.4);
  secondImage (width*.4, height*.4);
  secondImage (width*.3, height*.3);


  //blur to fill heart
  PImage img3 = loadImage("Dock.jpg");
  PImage img4 = createImage(img3.width, img.height, RGB);
  img3.loadPixels();
  for (int y=0; y<img3.height; y++ ) {
    for (int x=0; x<img3.width; x++) {
      color c = convolution(x, y, img3);
      img4.pixels[y*img3.width+x] = c;
      // use this line with the emboss filter
      //img2.pixels[y*img.width+x] = color(red(c)+127, green(c)+127, blue(c)+127);
    }
  }
  img4.updatePixels();

  pushMatrix();
  translate(width*.3, height*.4);
  scale(.1, .1);
  image(img4, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width*.4, height*.5);
  scale(.1, .1);
  image(img4, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width*.5, height*.5);
  scale(.1, .1);
  image(img4, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width*.6, height*.4);
  scale(.1, .1);
  image(img4, 0, 0);
  popMatrix();
}

// calculates the color after applying the filter
color convolution(int x, int y, PImage img3) {
  int offset = matrix.length/2;
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img3.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img3.pixels.length-1);
      // Calculate the convolution
      r += (red(img3.pixels[idx]) * matrix[i][j]);
      g += (green(img3.pixels[idx]) * matrix[i][j]);
      b += (blue(img3.pixels[idx]) * matrix[i][j]);
    }
  }

  return color(r, g, b);
}

// calculates the color after applying the filter, no nested loops
color convolutionNoLoop(int x, int y, PImage img3) {
  int lx = x-1;
  lx = constrain(lx, 0, img3.width);
  int rx = x+1;
  rx = constrain(rx, 0, img3.width-1);
  int ty = y-1;
  ty = constrain(ty, 0, img3.height-1);
  int by = y+1;
  by = constrain(by, 0, img3.height-1);

  // top row colors
  color tl = img3.pixels[ty*img3.width+lx];
  color tm = img3.pixels[ty*img3.width+x];
  color tr = img3.pixels[ty*img3.width+rx];
  // middle row colors
  color ml = img3.pixels[y*img3.width+lx];
  color mm = img3.pixels[y*img3.width+x];
  color mr = img3.pixels[y*img3.width+rx];
  //bottom row colors
  color bl = img3.pixels[by*img3.width+lx];
  color bm = img3.pixels[by*img3.width+x];
  color br = img3.pixels[by*img3.width+rx];

  float r = red(tl)*matrix[0][0] + red(tm)*matrix[0][1] + red(tr)*matrix[0][2]
    + red(ml)*matrix[1][0] + red(mm)*matrix[1][1] + red(mr)*matrix[1][2]
    + red(bl)*matrix[2][0] + red(bm)*matrix[2][1] + red(br)*matrix[2][2];
  float g = green(tl)*matrix[0][0] + green(tm)*matrix[0][1] + green(tr)*matrix[0][2]
    + green(ml)*matrix[1][0] + green(mm)*matrix[1][1] + green(mr)*matrix[1][2]
    + green(bl)*matrix[2][0] + green(bm)*matrix[2][1] + green(br)*matrix[2][2];
  float b = blue(tl)*matrix[0][0] + blue(tm)*matrix[0][1] + blue(tr)*matrix[0][2]
    + blue(ml)*matrix[1][0] + blue(mm)*matrix[1][1] + blue(mr)*matrix[1][2]
    + blue(bl)*matrix[2][0] + blue(bm)*matrix[2][1] + blue(br)*matrix[2][2];

  return color(r, g, b);
}






void secondImage(float xx, float yy) {
  //image visualization 
  pushMatrix();
  translate(xx, yy);
  img2 = loadImage("Dock.jpg");  
  size(img2.width, img2.height);  
  img2.loadPixels();
  for (int y=0; y<img2.height/10; y+=s/3) {
    for (int x=0; x<img2.width/10; x+=s/3) {
      int i = x*2 + width*y*2;
      color c = img2.pixels[i];
      stroke(c);
      noFill();
      rect(x, y, s/3, s/3);
    }
  }
  popMatrix();
}


