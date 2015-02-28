
PImage lights;
PImage mask;
PImage bg;
int y;
 
void setup() {
  size(600, 300);
  lights = loadImage("lights.jpg");
  mask = loadImage ("mask.png");
  frameRate(1.5);
  imageMode(CENTER);
  bg = loadImage("bg.jpg");
}
 
void draw() {
  background(bg);
  float x = random(width);
  float y = random(height);
  float d = random(x, y);
  float e = random(839,560);
  image(lights, x, y, e, e);
  image(mask, width/2,height/2);
}


