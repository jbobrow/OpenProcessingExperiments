
PImage fry;
PImage pizza1;
PImage pizza2;
PImage pizza3;

void setup() {
  size(600, 600);
  fry = loadImage("fry.png");
  pizza1 = loadImage("pizza1.png");
  pizza2 = loadImage("pizza2.png");
  pizza3 = loadImage("pizza3.png");

  frameRate(2);
  imageMode(CENTER);
}

void draw() {
  background(255);
  image(fry, 300, 300);
  
  float x = random(width);
  float y = random(height);
  float d = random(100, 300);
  float i = random(200,200);
  float m = random(100,100);
  
  image(pizza1, x, y, d, d);
  image(pizza2, y, x, d, d);
  image(pizza3, x+i, y+m, d, d);
}


