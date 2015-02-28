
void setup() {
  size(400, 400);
  background(0);
  smooth();
}

int red1 = 200;
int green2 = 0;
int blue3 = 0;
float random1 = 0.0;
float random2 = 0.0;

void draw() {
  //fill(252, 252, 0);
  rotate(cos(second()*2));
  fill(red1, green2, blue3);
  random1 += 50;
  random2 += 50;
  if (random1 > 400){
    random1 = 0.0;
  }
  if (random2 > 400){
    random2 = 0.0;
  }
  float n = random(random1);
  float n2 = random(random2);
  ellipse(n, n2, 100, 100);
  fill(18, 255, 59);
  ellipse(n-20, n2-20, 10, 10);
  ellipse(n+20, n2-20, 10, 10);
  noFill();
  arc(n, n2, 60, 60, 0, PI);
}

void mouseMoved() {
  red1 += 5;
  if (red1 > 255) {
    red1 = 0;
  }
  green2 += 10;
  if (green2 > 255) {
    green2 = 0;
  }
  blue3 += 2;
  if (blue3 > 255) {
    blue3 = 0;
  }
}


