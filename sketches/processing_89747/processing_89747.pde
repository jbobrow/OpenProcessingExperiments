
PImage boy01, girl01, girl02, girl03, girl04;
float j = 0;

void setup() {
  size(1000, 600);
  smooth();
  boy01 = loadImage("boy01.jpg");
  girl01 = loadImage("girl01.jpg");
  girl02 = loadImage("girl02.jpg");
  girl03 = loadImage("girl03.jpg");
  girl04 = loadImage("girl04.jpg");
}


void draw() {

  image(girl01, 800, 0);
  image(girl02, 600, 0);
  image(girl03, 400, 0);
  image(girl04, 200, 0);
  image(boy01, 0, 0);

  color tmp = get(mouseX, mouseY);
  fill(tmp, 150);
  rectMode(CENTER);
  rect(mouseX, height/2, 200, 600);
   rect(width/2, mouseY, 1000, 200);
}



