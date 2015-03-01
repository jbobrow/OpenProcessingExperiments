
//Final Project Brining it all together Project 3
//(processesing, sound, and image) recolor area of earlier photoshop work

PImage img;
int w = 100;

float[][] matrix = { 
  { -2, -1, -1 }, 
  { -1, 9, -1  }, 
  { -1, -1, -1 }  }; 

void setup() {
  size(800, 600);
  frameRate(60);
  img = loadImage("postid.png");
}

void draw() {
  
  image(img, 0, 0);


  //rectangle are process
  int xstart = constrain(mouseX-w/2, 0, img.width);
  int ystart = constrain(mouseY-w/2, 0, img.height);
  int xend = constrain(mouseX+w/2, 0, img.width);
  int yend = constrain(mouseY+w/2, 0, img.height);
  int matrixsize = 3;
  loadPixels();
 
  for (int x = xstart; x < xend; x++) { // Begin loop pixel loop to get pass through function
    for (int y = ystart; y < yend; y++ ) {
      
      color c = convolution(x, y, matrix, matrixsize, img);
      int loc = x + y *img.width;
      pixels[loc] = c;
    }
  }
  updatePixels();

  stroke(0);
  noFill();
  rect(xstart, ystart, w, w);
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize;
  
  for (int i = 0; i < matrixsize; i++) {// Loop matrix
    for (int j= 0; j < matrixsize; j++) {
      // What pixel are we testing
      int xloc = x+i *offset;
      int yloc = y+j *offset;
      int loc = xloc + img.width * yloc;
      // Make sure we have not walked off the edge of the pixel array
      loc = constrain(loc, 0, img.pixels.length-1);
      
      // convolution
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // RGBrange
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  
  return color(rtotal, gtotal, btotal);// Returning the new color
}





