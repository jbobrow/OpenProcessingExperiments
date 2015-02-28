
float x = -50;
float speed = 01;

PFont scotch;
String karma = "karma";

void setup () {
  size (300,120);
  smooth();
  loadFont("ScotchRomanMTStd-48.vlw");
}

void draw() {
  background(0);
  x += speed;
  if (x > width+50) {
    x= -50;
  }
  fill(255);
  textSize(30);
  text(karma,x,30, 100,100);
}

