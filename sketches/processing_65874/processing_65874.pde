
PImage nomo;
PImage nomo2;
PImage kawai;
PImage baseball;


void setup() {
  size(1500, 150);
  smooth();
  nomo = loadImage("nomo.png");
  nomo2 =loadImage("nomo2.png");
  kawai = loadImage("kawai.png");
  baseball = loadImage("baseball.png");

  imageMode(CENTER);
}
 
void draw() {
  background(0);
  float x = random(180, 1250);
  float y = random(40, 80);
  float d = random(10, 10);
  
  frameRate(100);
  image(baseball, x, y, d, d);
  image(nomo, 1420, 75, 150, 150);
  image(nomo2, 1420, 75, 150, 150);
  image(kawai, 80, 75, 150, 150);
}

