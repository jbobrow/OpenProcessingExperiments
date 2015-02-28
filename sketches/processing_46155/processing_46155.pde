
PImage myImage1;
PImage myImage2;

void setup() {
  size (1920,1080);
  myImage1 = loadImage("macro eye.jpg");
  myImage2 = loadImage("tiger in water.jpg");
}

void draw() {
  tint(0,255,255,50);
image(myImage1, random(-1920,1920),random(-1080,1080));
}


