
PImage one;
PImage two;
PImage three;
PImage four;
void setup() {
  background(0);
  size(500,500);
  one=loadImage("1.jpg");
  two=loadImage("2.jpg");
  three=loadImage("3.jpg");
  four=loadImage("4.jpg");
}

void draw() {
  background(255,255,255);
  tint(255,255,255,25);
  image(one,0,0);
  tint(255,255,255,194);
  image(two,0,0);
  tint(255,255,255,220);
  image(three,0,0);
  tint(255,255,255,195);
  image(four,0,0);
}


