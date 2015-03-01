
/* @pjs preload= "nike.png"; */

void setup() {
  size (600, 600);
}

void draw() {
  noStroke();

  int xPosition;
  int yPosition;
  int rect1;
  int rect2;

  float color1;
  float color2;
  float color3;

  color1 = (random(0, 255));
  color2 = (random(0, 255));
  color3 = (random(0, 255));


  xPosition = round( random(0, 600) );
  yPosition = round( random(0, 600) );
  rect1 = round( random(300) );
  rect2 = round( random(300) );


  fill(color1, color2, color3, mouseY);
  rect(xPosition, yPosition, rect1, rect2);

  PImage img;
  img = loadImage("nike.png");
  image(img, 0, 0, 600, 600);
}



