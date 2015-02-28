
/*
Aris Bezas
Jan 28 2012 Igoumeninja
Inspired from Sergio Albiac
http://igoumeninja.tumblr.com/post/16538467805/aris-bezas-inspired-from-sergio-albiac
*/
/* @pjs preload="face.jpg"; */

int i=0,j=0;
float[][] kernel = {
  { 
    -1, -1, -1
  }
  , 
  { 
    -1, 8, -1
  }
  , 
  { 
    -1, -1, -1
  }
};

int[][] shmeia = new int[140000][2];
PImage img;

void setup() { 
  size(400, 400);
  img = loadImage("face.jpg");
  //noLoop();
  background(255);
  fill(0); 
  img.loadPixels();
  //image(img,0,0);
  // Loop through every pixel in the image.
  for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
      float sum = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*img.width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum += kernel[ky+1][kx+1] * val;
          if (abs(sum) > 1100) {
            shmeia[i][0] = x;
            shmeia[i][1] = y; 
            i++;
          }          
        }
      }
    }
  }
}

void draw() {
    for (int k=0;k<i;k++) {
      if (dist(shmeia[j][0], shmeia[j][1], shmeia[k][0], shmeia[k][1]) < 5) {
        stroke(0, 55);
        line(shmeia[j][0], shmeia[j][1], shmeia[k][0], shmeia[k][1]);
      }
    }
    j++;
}


