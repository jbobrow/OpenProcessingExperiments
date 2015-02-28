
PImage U;



int x=200;
int y=100;
int s=2;
int u=2;

void setup() {
  size (600, 400);
  String[] fontList = PFont.list();
  println(fontList);
  textSize(30);
  background(255);
  smooth();
  noStroke();
}


void draw() {

  U= loadImage("yoyo.jpg");
  image(U, x, y, 30, 30);
  x=x+1*s;

  if (x>width) {
    s=-2;
  }

  if (x<0) {
    s=2;
  }


  y=y+1*u;

  if (y>height) {
    u=-2;
  }

  if (y<0) {
    u=2;
  }
  if (x== mouseX||Y==mouseY) {
    image(U, x, y, 70, 70);
  }
  fill(mouseX, mouseY, random(30, 111), random(30, 111));
  
    text("Martin", mouseX, mouseY);


  if (mousePressed) {
    background(255);
  }
}


