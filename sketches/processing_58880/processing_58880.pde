
/* Assignment 6
*Nancy Toure
*CS110 Section 2
*ntoure@brynmawr.edu
This program contains the code to a collage
of different images that have been modified 
in different forms. One image has been used with 
the get function, but only once.  When I tried
to use the get function with the other images
a null point exception was declared.
*/

// Sharpen
float[][] matrix = {{-1, -1, -1},
                    {-1,  9, -1},
                   {-1, -1, -1}};

//Pointillism
PImage img;
void setup() {
background(0);
  img = loadImage("sunshine.jpg");
  size(int(img.width*(1.1)), int(img.height*(1.1)));  
  img.loadPixels(); 
  imageMode(CENTER);
  image(img, width/2, height/2, width/3, height/3);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();          // Cover with random circles
  for (int i=0; i<15000; i++) addPoint();

  //Converting to Negative
  PImage img2 = loadImage("sunshine.jpg");
  img2.loadPixels();
  for ( int i = 0; i<img2.pixels.length; i++) {
    color c = img2.pixels [i];
    img2.pixels[i] = color (255-red(c), 255-green(c), 255-blue(c));
  }
  img2.updatePixels();
  image(img2, 5*width/6, 5*width/6, width/3, height/3);


  //Threshold

  PImage img3= loadImage("sunshine.jpg");
  color purple= color( 200, 0, 255);
  color yellow= color(255, 255, 0);
  color orange= color (255, 150, 0);
  color g= color(22, 219, 23);



  loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    color c= img.pixels[i];
    float total = red(c)+green(c)+blue(c);

    if (total < 182) {
      img3.pixels[i] = purple;
    }
    else if (total < 364) {
      img3.pixels[i] = yellow;
    }
    else if (total < 546) {
      img3.pixels[i] = g;
    }
    else {
      img3.pixels[i] = orange;
    }
  }
  img3.updatePixels();

  image(img3, width/6, height/6, width/3, height/3);


  PImage img = loadImage("sunshine.jpg");
  // new image to store the changed pixels
  PImage img4 = createImage(img.width, img.height, RGB);


  img.loadPixels();
  img4.loadPixels();
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      color c = convolution(x, y, img);
      img4.pixels[y*img.width+x] = c;
      
    }
  }
  img4.updatePixels();
  
image(img4, 515,100,  width/3, height/3);
}


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


void addPoint() {
  // Add a random filled circle to image
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 7, 7);

}

PImage img2;
PImage img3;

void draw () {
PImage tile;
tile= img.get(100, 100, 200, 200);
image(tile, 100, 515);


  
  
  
 }

