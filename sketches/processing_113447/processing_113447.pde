
float x;
float y;
/*@pjs preload="willy.png"; */
PImage img;

void setup() {
  size(600, 600);
  img = loadImage("willy.png");
  image(img,0,0);
}

void draw() {
  x=mouseX;
  y=mouseY;
  //noLoop();
  //image(online,0,0);
  noStroke();
  if (mousePressed) {
    noFill();
    stroke(255, 102, 0);
    stroke(0, 0, 0);
    ellipse(x, y, 20, 20);
    ellipse(x, y, 15, 15);
    ellipse(x, y, 10, 10);
    ellipse(x, y, 5, 5);
    //noLoop();
    }
  }





