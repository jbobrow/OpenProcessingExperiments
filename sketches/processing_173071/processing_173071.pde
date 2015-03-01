
int SECTORS = 5;
float ROT_SPEED = 1;
int a = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < SECTORS; i++) {
    arc(0, 0, width/2, height/2, radians(a), radians(180/SECTORS + a));
    rotate(radians(360/SECTORS));
  }
  a += ROT_SPEED;
}
