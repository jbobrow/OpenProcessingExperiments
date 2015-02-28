

float num = 0;
int speed = 10;

void setup() {
  size(400,400);
}

void draw() {
  background(30,54,57);
  num = num + speed;
  ellipse(num,num,num,num);

  if (num > 450) {
    speed = - 10;
  }
  if (num < - 50) {
    speed = 10;

    if (num > 450) {
      speed = - 10;
    }
    if (num < -50) {
      speed = 10;
    }
  }
}  


