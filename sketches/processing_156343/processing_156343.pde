
/* @pjs preload= "space_00_by_space_kid-d5v4fz2.jpg"; */

int x = 0;
int y = 0;
int z = 0;

int speed;

void setup() {
  size (800, 800);
  background (255);
  smooth();
  speed = 3;
}

void draw() {

  background (255);
  PImage img;
  img = loadImage("space_00_by_space_kid-d5v4fz2.jpg");
  image(img, 0, 0);
  x= x + 1 + (mouseX/10);
  y= y + 3 + (mouseX/30);
  z= z + 5 +(mouseX/50);

  strokeWeight(4);

  stroke (150, 200, 50);
  noFill();
  ellipse (height*.25, abs(x), 50, 50);   

  stroke (250, 250, 50);
  noFill();
  ellipse (height*.5, abs(y), 50, 50);   

  stroke (200,250,50);
  ellipse (height*.75, abs(z), 50, 50);   


  if (x>400) {
    x = -400;
  }

  if (y>400) {
    y = -400;
  }

  if (z>400) {
    z = -400;
  }
}



