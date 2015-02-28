
PImage cat;
PImage puppy;
 
void setup() {
  size(600, 400);
  cat = loadImage("laser_cat.png");
  puppy = loadImage("puppy.png");
  frameRate(3);
  imageMode(CENTER);
}
 
void draw() {
  background(0);
  
  image(cat, mouseX, mouseY, 45, 45);
  image(puppy, mouseX+20, mouseY-35, 40, 40);
  
  float x = random(100, width-100);
  float y = random(100, height-100);
  float c = random(50, 150);
  float d = random(20, 120);
  float angle = random(0, TWO_PI);
  rotate(angle);
  image(cat, x, y, c, c);
  image(puppy, x+45, y-90, d, d);
  
  
  
}

