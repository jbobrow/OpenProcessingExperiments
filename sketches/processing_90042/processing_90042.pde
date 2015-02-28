
//disrupt_pixels

PImage img;
//declare array
color[] colors;
//locations for pixels
int xLoc;
int yLoc;


void setup() {
  size(265,174) ;
  background(255);
  noStroke();
  //initialize array
  colors = new color [width * height];
  //assign path to img
  img = loadImage("clouds.png");
  //image(img,0,0,265,174);
}


void draw () {
  background(255);
  image(img,0,0);
  //variables tracks count
  int i = 0;
  //loop
  //kind of like making grid for image
  for( int j = 0; j < height; j++) {
    for ( int k = 0; k < width; k++ ) {
      xLoc = (int) (k);
      yLoc = (int) (j);
      colors [i] = img.get(xLoc, yLoc);
      i++;
    }
  }
  //render colors [l] to screen 
  int l = 0;
  for ( int m = 0; m < height; m++ ) {
    for (int n = 0; n < width; n++ ) {
      fill(colors[l]);
      //declare a variance called offset
      int offset = (int) random (width/2);
      rect ( n + offset, m, 1, 1);
      l++;
    }
  }
 
}

