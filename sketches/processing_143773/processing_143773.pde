
/*
 Douglas Tran
 Generative Art Series | April 8 2014
 The concept for this project was to redraw images of artists from photographs based on original artworks by the artists using their choice color palettes.
 This project is reworked from the example
 * Pointillism
 * by Daniel Shiffman. 
 
 */

PImage img;
PImage img2;

void setup() {
  size(700, 700);
  img = loadImage("kaws7.jpg");
  img2 = loadImage("kaws3.jpg");
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 



  int i = 0;
  while (i <= 25) {
    drawPoint();
    i = i +1;
  }
}

void drawPoint() {


  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);

  float value = brightness (pix);
  int i = round( map (value, 0, 255, 0, 700*700-1) );
  color c2 = img2.pixels[i];


  fill(c2, 128);
  rect(x, y, random(0, 15), random(0, 15));
}



