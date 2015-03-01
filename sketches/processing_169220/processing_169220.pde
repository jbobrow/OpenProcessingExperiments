

float a=0;

void setup() {
  background(255);
  size(400, 400);
}

void draw() {
  ellipse(200, 200, 400-a, 400-a);
  a = a+10;
}



