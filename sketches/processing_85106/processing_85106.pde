
// source= http://www.openprocessing.org/sketch/83974

float blocksize;

void setup() {

  size(500, 500);

  blocksize = 1;

  noStroke();
}


void draw() {

  PImage img = loadImage("image1.jpg");

  background (img);

  rect(0, 0, 0, 0);

  for (float y = 160; y < 368; y+=blocksize) {

    for (float x = 317; x < 343; x+=blocksize) {

      fill(random(255), random(255));

      rect(x, y, blocksize, blocksize);

      float velocitat = 1;

      x = x + velocitat;
    }
  }
}


