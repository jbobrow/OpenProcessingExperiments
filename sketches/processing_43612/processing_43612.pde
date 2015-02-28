
PImage img;
float firsthold = 50; //threshold used to generate all pixels with hue value greater than 50
float secondhold = 150; //threshold preventing pixels generating that have a high secondary hue value


int[][] angles = { 
  { 
    0, 1
  }
  , { 
    1, 1
  }
  , { 
    1, 0
  }
  , { 
    1, -1
  }
  , 
  { 
    0, -1
  }
  , {
    -1, -1
  }
  , {
    -1, 0
  }
  , {
    -1, 1
  }
};
int numAngles = angles.length;
int x, y, newx, newy;
int dir = 0;
color black = color(0);
color white = color(255);


void setup() {
  smooth();
  background(255); //white background
  size(400, 267); //the size of the image
  img = loadImage("GeorgeSeurat.jpg"); //imput image is George Seurat's "A Sunday Afternoon on the Island of La Grande Jatte"
  img.loadPixels(); // pixels loaded from image

  //the following parts of code sets up the pixels from the image
  x = width / 2;
  newx = x;
  y = height / 2;
  newy = y;
  float woodDensity = width * height * .25;
  for (int i = 0; i < woodDensity; i++) {
    int rx = int(random(width));
    int ry = int(random(height));
    set(rx, ry, black);
  }

  stroke(0); //blue
  for (int i=0; i <img.pixels.length; i++) {
    if (blue(img.pixels[i]) > firsthold) { //if the pixel's blue value is higher than the first threshold...
      if (red(img.pixels[i])< secondhold) { //...and the red value is lower than the second threshold...
        if (green(img.pixels[i])< secondhold) { //...and the green value is also lower than the second threshold...
          point(i % img.width, floor((i)/img.width)); //... then a black point is drawn
        }
      }
    }
  }
}

void draw() {
  int rand = int(abs(random(-1, 2)));
  dir = (dir + rand + numAngles) % numAngles;
  newx = (newx + angles[dir][0] + width) % width;
  newy = (newy + angles[dir][1] + height) % height;
  if ((get(x, y) == black) && (get(newx, newy) == white)) {
    // The termite moves the chip one space
    set(x, y, white);
    set(newx, newy, black);
    x = newx;
    y = newy;
  }
  else if ((get(x, y) == black) && (get(newx, newy) == black)) {
    // Make the "termite" move in the opposite direction
    dir = (dir + (numAngles / 2)) % numAngles;
    x = (x + angles[dir][0] + width) % width;
    y = (y + angles[dir][1] + height) % height;
  }
  else {
    // Not carrying
    x = newx;
    y = newy;
  }
  newx = x; // saves the current position
  newy = y;
}


