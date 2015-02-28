
PImage cats;
  
void setup() {
  size(500, 500);
  cats = loadImage("cats.png");
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  background(random(200, 225),100);
  float x = random(width);
  float y = random(height);
  float d = random(200, 500);
//  tint(random(255),20,0, random(255));
  image(cats, x, y, d, d);
}

