
//Average
// calculates the color after applying the filter
color convolution(int x, int y, PImage img) {
  int offset = matrix.length/2;
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  }

  return color(r, g, b);
}

// calculates the color after applying the filter, no nested loops
color convolutionNoLoop(int x, int y, PImage img) {
  int lx = x-1;
  lx = constrain(lx, 0, img.width);
  int rx = x+1;
  rx = constrain(rx, 0, img.width-1);
  int ty = y-1;
  ty = constrain(ty, 0, img.height-1);
  int by = y+1;
  by = constrain(by, 0, img.height-1);

  // top row colors
  color tl = img.pixels[ty*img.width+lx];
  color tm = img.pixels[ty*img.width+x];
  color tr = img.pixels[ty*img.width+rx];
  // middle row colors
  color ml = img.pixels[y*img.width+lx];
  color mm = img.pixels[y*img.width+x];
  color mr = img.pixels[y*img.width+rx];
  //bottom row colors
  color bl = img.pixels[by*img.width+lx];
  color bm = img.pixels[by*img.width+x];
  color br = img.pixels[by*img.width+rx];

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

// Average Matrix
float[][] matrix = {
  {
    1/9., 1/9., 1/9.
  }
  , 
  {
    1/9., 1/9., 1/9.
  }
  , 
  {
    1/9., 1/9., 1/9.
  }
};

