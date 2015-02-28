
PImage pup;
PImage mouth;

void setup() {
  size(600, 600);
  pup = loadImage("pup02.png");
  mouth = loadImage("mouth.png");
  frameRate(1);
  imageMode(CENTER);
}

void draw() {
  background(255, 60, 60);
  float x = random(width);
  float y = random(height);
  float d = random(200, 600);
  float a = random(width/2);
  float b = random(height/2);
  float c = random(100, 340); 
  image(mouth, a, b, c, c); 
  image(pup, x, y, d, d);
}



