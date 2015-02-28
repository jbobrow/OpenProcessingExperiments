
/*
PImage Example.
August 5
Parsons Bootcamp Purple Section 2011
*/
PImage party;

int img_x = 0;
int img_y = 0;
float img_w = 400;
float img_h = 250;


void setup() {
  size(600, 500);
  party = loadImage("BToNa.jpg");
}

void draw() {
  img_w = mouseX;
  img_h = mouseY;
  image(party, img_x, img_y, img_w, img_h);
  
}

