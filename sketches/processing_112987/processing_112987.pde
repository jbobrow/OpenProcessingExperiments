
PImage plane;
PImage plane_2;
PImage plane_3;

void setup() {
  size(500,500);
  smooth();
  plane = loadImage("plane.png");
  plane_2 = loadImage("plane_2.png");
  plane_3 = loadImage("plane_3.png");
  frameRate(2);
  imageMode(CENTER);
}

void draw() {
  background(255,209,232);
  float a = random(width);
  float b = random(height);
  float c = random(100, 400);
  image(plane, a+50,b-100,c,c);
  image(plane_2,b,a,c/2,c/2);
  image(plane_3, a,b,c,c);
  
}


