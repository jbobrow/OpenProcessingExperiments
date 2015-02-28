
/******************************************************
 
 * Assignment 6
 * Name: Stephen Lazzaro
 * Email: slazzaro@haverford.edu
 * Course: CS110- Section 02
 * Submitted: 4/9/2012
 *
 * The following file creates a collage of modified images which came from an original photo of an aurora.  The images img1 and img2 use
 * image visualization, img3 uses an area based filter, and img4, img5 as well as img6 use simple filters.  The collage is created by 
 * by having img3 set as the background of the screen, and then rotating and translating all of the images at various sizes around the screen.
 * 
 *
 *
 *
 
 *********************************************************/
PImage img1;
PImage img2;
PImage img3dummy; //This image is just used in order to sharpen the original image into img3
PImage img3;
PImage img4;
PImage img5;
PImage img6;
int s=12; // This variable creates the sizes of rectangles and ellipses for the image visualization of img1
int z=8; // This variable creates the sizes of rectangles for the image visualization of img2

// Matrix used to sharpen img3
float[][] matrix = 
{{ -1, -1, -1}, 
  { -1, 9, -1}, 
  {-1, -1, -1}};

// The following code used to create "convolution" was obtained from the code used in class on March 29th

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

void setup () {

  size(1200, 900);
  
  /* The following code creates Image visualization for img1.  The first one third of the screen (in the x direction) is made up
   of rectangles, the middle third of ellipses, and the final third of rectangles again.
   */

  background(0, 0, 100);
  img1 = loadImage("aurora.jpg");

  for (int y=0; y<img1.height; y+=s) {
    for (int x=0; x<img1.width; x+=s) {
      int i = x + width*y;
      color c = img1.pixels[i];
      if (x< img1.width/3) {
        rectMode(CORNER);
        noStroke();
        fill(c);
        rect(x, y, s+4, s+4);
      }
      else if (x>=img1.width/3 && x<2*img1.width/3) {
        ellipseMode(CORNER);
        noStroke();
        fill(c);
        ellipse(x, y, s+3, s+3);
      }
      else if (x>=2*img1.width/3) {
        rectMode(CORNER);
        noStroke();
        fill(c);
        rect(x, y, s, s);
      }
    }
  }

  //This code is necessary in order to update the pixels in img1 and have the processed image be called when img1 is used.

  img1.loadPixels();
  loadPixels();
  for (int y=0; y<img1.height; y++) {
    for (int x=0; x<img1.width; x++) {
      int i = x + width*y;
      img1.pixels[i] = pixels[i];
    }
  }
  updatePixels();
  img1.updatePixels();
  rectMode(CORNER);

  /* The following code creates a different type of Image visualization for img2.  The image is recreated using boxes which have
   thick strokes but are not filled with the pixel colors.  Instead, these empty areas take on the color of the bluish background.
   */

  background(0, 0, 100);
  img2 = loadImage("aurora.jpg");
  for (int y=0; y<img2.height; y+=s) {
    for (int x=0; x<img2.width; x+=s) {
      int i = x + width*y;
      color c = img2.pixels[i];
      stroke(c);
      strokeWeight(4.0);
      noFill();
      rectMode(CORNER);
      rect(x, y, z, z);
    }
  }

  //This code is necessary in order to update the pixels in img2 and have the processed image be called when img2 is used.

  img2.loadPixels();
  loadPixels();
  for (int y=0; y<img1.height; y++) {
    for (int x=0; x<img1.width; x++) {
      int i = x + width*y;
      img2.pixels[i] = pixels[i];
    }
  }
  updatePixels();
  img2.updatePixels();
  rectMode(CORNER);

  // The following code used to sharpen (area based filter) the original image into img3 was guided by the code used in class on March 29th

  background(0, 0, 100);
  img3dummy = loadImage("aurora.jpg");
  img3 = createImage(img3dummy.width, img3dummy.height, RGB);

  img3dummy.loadPixels();
  img3.loadPixels();
  for (int y=0; y<img3dummy.height; y++ ) {
    for (int x=0; x<img3dummy.width; x++) {
      color c = convolution(x, y, img3dummy);
      img3.pixels[y*img3dummy.width+x] = c;
    }
  }
  img3.updatePixels();

  // The following code creates a type of negative visual (simple filter) for img4.

  img4 = loadImage("aurora.jpg");

  img4.loadPixels();
  for (int i=0; i<img4.pixels.length; i++) {
    color c = img4.pixels[i];
    img4.pixels[i] = color(red(c), 45-green(c), blue(c));
  }
  img4.updatePixels();

  // The following code creates a different type of simple filter for img5.

  img5 = loadImage("aurora.jpg");

  img5.loadPixels();
  for (int i=0; i<img5.pixels.length; i++) {
    color c = img5.pixels[i];
    img5.pixels[i] = color(red(c), green(c)/2, 2*blue(c));
  }
  img5.updatePixels();

  // The following code creates another modified simple filter for img6.

  img6 = loadImage("aurora.jpg");

  img6.loadPixels();
  for (int i=0; i<img6.pixels.length; i++) {
    color c = img6.pixels[i];
    img6.pixels[i] = color(1.5*red(c), green(c)/4, blue(c)/1.5);
  }
  img6.updatePixels();

  //The following code draws the images to create a collage

  image(img3, 0, 0, width, height);

  pushMatrix();
  translate(width/8, 0);
  rotate(PI/8);
  image(img1, 0, 0, width/3, height/3);
  popMatrix();

  pushMatrix();
  translate(-width/8, height/7.8);
  rotate(-PI/20);
  image(img2, width/2, 0, width/3.5, height/3.7);
  popMatrix();

  pushMatrix();
  image(img6, width/2.8, height/4, width/3.2, height/4.1);
  popMatrix();

  pushMatrix();
  rotate(PI/20);
  translate(-width/25, -height/12);
  image(img4, width/1.4, 0, width/3, height/3.1);
  popMatrix();

  pushMatrix();
  rotate(-PI/20);
  image(img5, 0, height/2, width/3.2, height/4.3);
  popMatrix();

  pushMatrix();
  rotate(PI/100);
  image(img4, width/100, height/2.9, width/5, height/7);
  popMatrix();

  pushMatrix();
  rotate(PI/50);
  translate(-width/15, -height/20);
  image(img3, width/2, height/2, width/3.2, height/3.6);
  popMatrix();

  pushMatrix();
  translate(width/5, height/6);
  rotate(PI/40);
  image(img6, 0, height/2, width/4, height/5);
  popMatrix();

  pushMatrix();
  translate(width/2.4, height/4);
  rotate(-PI/40);
  image(img1, 0, height/2, width/4.5, height/6);
  popMatrix();

  pushMatrix();
  rotate(-PI/40);
  translate(-width/8, height/30);
  image(img5, 4*width/5, height/2.1, width/4, height/2.7);
  popMatrix();
}


