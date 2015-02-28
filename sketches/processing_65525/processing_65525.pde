
// Anna Lee
// DMA 28 Summer 2012
// Workshop 5


// From a 3 x 9 grid of images that make up a 360 degree panorama,
// display a 3 x 5 subset. Shift over a column every three frames.
// Make a layer with the images lined up, then make another layer with
// each image randomly translated, scaled and rotated.


PImage[] images_t = new PImage[9]; // top row
PImage[] images_c = new PImage[9]; // center row
PImage[] images_b = new PImage[9]; // bottom row

int offset = 0;

int[] order = {0, 4, 1, 3, 2};


void jitter()
{
/*
  apply a random transformation
*/
  translate(random(-20, 20), random(-20, 20));
  scale(random(0.75, 1.25), random(0.75, 1.25));
  rotate(random(-PI/8.0, PI/8.0));
}


void setup()
{
  size(600, 300);
  smooth();
  frameRate(1);
  imageMode(CENTER);
  String imageName;
  for (int i = 0; i < 9; i++)
  {
    imageName = "zm_0" + i + ".jpg";
    images_t[i] = loadImage(imageName);
    
    imageName = "zm_1" + i + ".jpg";
    images_c[i] = loadImage(imageName);
    
    imageName = "zm_2" + i + ".jpg";
    images_b[i] = loadImage(imageName);
  }
}


void draw() 
{
  background(150);
    
  // change the set of images every three frames
  if (frameCount % 3 == 1)
  {
    offset = (offset+1) % 9;
  }
 
  // draw images in a grid 
  for (int i=0; i<5; i++)
  {
    pushMatrix();
    translate(i*150, 0);
    image(images_t[(i+offset) % 9], 0, 0, 150, 150);
    translate(0, 150);
    image(images_c[(i+offset) % 9], 0, 0, 150, 150);
    translate(0, 150);    
    image(images_b[(i+offset) % 9], 0, 0, 150, 150);
    popMatrix();
  }
  
  
  // draw each image again with a random transformation
  // within a row, draw images in order from edge to center: |[1st] [3rd] [5th] [4th] [2nd]|
  
  // top row
  for (int i=0; i<5; i++)
  {
    int idx = order[i];
    pushMatrix();
    translate(idx*150, 0);  
    jitter();
    image(images_t[(idx+offset) % 9], 0, 0, 150, 150);
    popMatrix();
  }
  
  // bottom row
  for (int i=0; i<5; i++)
  {
    int idx = order[i];
    pushMatrix();
    translate(idx*150, 300);    
    jitter();
    image(images_b[(idx+offset) % 9], 0, 0, 150, 150);
    popMatrix();
  }
  
  // center row
  for (int i=0; i<5; i++)
  {
    int idx = order[i];
    pushMatrix();
    translate(idx*150, 150); 
    jitter();
    image(images_c[(idx+offset) % 9], 0, 0, 150, 150);
    popMatrix();
  }
}

