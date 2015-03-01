
float x, y;
float angle = 0;
float maxVal = 222;
float r = maxVal;
float diff = 0.5;
int value1 = 50;
int value2 = 50;
int value3 = 0;
 
void setup() {
  size(700, 700);
  background(0);
  noStroke();
}
 
void draw() {
  x = r * sin(angle);
  y = r * cos(angle);
 
  translate(width/2, height/2);
  rotate(r);
  fill(value1, value2, value3, 40);
  ellipse(0, 0, x, y);
  ellipse(x, 0, x, 35);
  line( 0, 0, x, y);
 
  angle = angle +0.01;
  r = r - diff;
 
  if (r == 0 || r == maxVal) {
    diff =  diff * -1;
  } 
}

void mouseDragged() {
    value1 = random(0, 50);
    value2 = random(100, 200);
    value3 = random(200, 255);
}

void mouseMoved() {
  value1 = value1 + 5;
  value2 = value2 + 10;
  value3 = value3 + 10;

  if (value1 > 255) {
      value1 = 0;
  }
  if (value2 > 150) {
      value2 = 0;
  }
  if (value3 > 255) {
      value3 = 0;
  }
}
