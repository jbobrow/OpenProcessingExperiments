
PImage foxie;
   
void setup() {
  size(500, 500);
  foxie = loadImage("foxie.png");
  frameRate(1);
  imageMode(CENTER);
  background(255);
}
   
void draw() {
  
  float x = random(width);
  float y = random(height);
  float d = random(200, 500);

  image(foxie, x, y, d, d);
}



