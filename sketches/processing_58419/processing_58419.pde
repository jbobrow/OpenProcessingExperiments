
/** Rachel Genovese
/** CMSC 110/ Professor Xu
/** 4/10/12
/** Assignment 6
/** In this collage, four edited pictures of my golden retriever,
/** Murphy, are shown.  The first picture is an expression of
/** pointillism.  The second picture is a negative of the original.
/** The third has been filtered to sepia and the fourth has been
/** filtered to grayscale and has also been blurred.
**/

void setup () {
  size (800, 800);
  background (0);
  drawImg1 ();
  drawImg2 ();
  drawImg3 ();
  drawImg4 ();
}

//Image 1 = Pointillism
void drawImg1 () {

  PImage img1 = loadImage ("Murphy.jpg");
  image (img1, 0, 0, 400, 400);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();
  for (int i=0; i<20000; i++) 
    addPoint();
}

void addPoint() {

  // Add a random filled circle to pixels
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 6.5, 6.5);
}

//Image 2 = Negative
void drawImg2 () {

  PImage img2 = loadImage ("Murphy2.jpg");
  image (img2, 400, 0, 400, 400);
  img2.loadPixels ();
  for (int i = 0; i < img2.pixels.length; i++) {
    color c = img2.pixels [i];
    img2.pixels[i] = color(255-red(c), 255-green(c), 255-blue(c));
  }
  img2.updatePixels ();
  image (img2, 400, 0, 400, 400);
}

//Image 3 = Sepia
void drawImg3 () {

  PImage img3 = loadImage ("Murphy3.jpg");
  ;
  image (img3, 0, 400, 400, 400);

  //Sets as grayscale first
  img3.loadPixels ();
  for (int i = 0; i < img3.pixels.length; i++) {
    color c = img3.pixels [i];
    img3.pixels[i] = color(0.3*red(c)+ 0.59*green(c)+ 0.11*blue(c));
  }
  img3.updatePixels ();
  image (img3, 0, 400, 400, 400);

  //Sets from grayscale to sepia
  img3.loadPixels ();
  for (int i = 0; i < img3.pixels.length; i++) {
    color c = img3.pixels [i];

    //Defining R, G, B
    float r = red(c)*0.393+green(c)*0.769+blue(c)*0.189;
    float g = red(c)*0.349+green(c)*0.686+blue(c)*0.168;
    float b = red(c)*0.272+green(c)*0.534+blue(c)*0.131;

    img3.pixels[i] = color (r, g, b);
  }
  img3.updatePixels ();
  image (img3, 0, 400, 400, 400);
}

//Image 4 = Blur with low-pass filter
void drawImg4 () {

  float v = 1.0/15.0;
  float[][] matrix = { 
    {
      v, v, v
    }
    , 
    {
      v, v, v
    }
    , 
    {
      v, v, v
    }
  };
  PImage img4 = loadImage ("Murphy4.jpg");
  image (img4, 400, 400, 400, 400);
  img4.loadPixels();
  PImage edgeImg = createImage(img4.width, img4.height, RGB);
  // Loop through every pixel in the image.
  for (int y = 1; y < img4.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img4.width-1; x++) { // Skip left and right edges
      float sum = 0; // Matrix sum for this pixel
      for (int my = -1; my <= 1; my++) {
        for (int mx = -1; mx <= 1; mx++) {
          // Calculate the adjacent pixel for this matrix point
          int pos = (y + my)*img4.width + (x + mx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img4.pixels[pos]);
          // Multiply adjacent pixels based on the matrix values
          sum += matrix[my+1][mx+1] * val;
        }
      }
      edgeImg.pixels[y*img4.width + x] = color(sum);
    }
  }
  edgeImg.updatePixels();
  image(edgeImg, 400, 400, 400, 400);
}


