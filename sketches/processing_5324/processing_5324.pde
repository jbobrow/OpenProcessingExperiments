
float x;
float speed = 1.9;

int direction = 1;

PImage buttl, buttr, poop;

void setup() {
  size (306, 208);
  buttl = loadImage("butt_left.jpg");
  buttr = loadImage("butt_right.jpg");
  poop = loadImage("poop.jpg");

}

void draw() {
  background(255);
  image(poop, x, height/2);
  imageMode(CENTER);
  x = x + speed * direction;
  if ((x > width) || (x < 0)) {
    direction = direction * -1;
  }
  
  image(buttl, 42, 100);
  image(buttr, 262, 100);

}

