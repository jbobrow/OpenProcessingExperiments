
int x = 100;
int y = 100;
int a = 25;
int b = 400;
boolean reverseX = false;
boolean reverseY = false;
boolean reverseA = false;
boolean reverseB = false;
int numCircles = 100;
float gradientColor = 0;
 
void setup() {
  size(500, 500);
  frameRate(30);
}
 
void draw() {
  background(200);

  for(int i = 100; i > 0; i-- ) {
    noStroke();
    gradientColor = map(i, 0, 100, 0, 255);
    fill(gradientColor);
    rect(width/250, height/250, i*8, i*8);
  }

  fill(7, 240, 43);
  ellipse(x, y, 50, 50);
  fill(240, 7, 174);
  ellipse(a, b, 50, 50);
  //here we check if it has gone too far
  if (x >= 475) {
    reverseX = true;
  }
  else if ( x <= 25) {
    reverseX = false;
  }
  if (y >= 475) {
    reverseY = true;
  }
  else if ( y <= 25) {
    reverseY = false;
  }
  if (a >= 475) {
    reverseA = true;
  }
  else if ( a <= 25) {
    reverseA = false;
  }
  if (b >= 475) {
    reverseB = true;
  }
  else if ( b <= 25) {
    reverseB = false;
  }
 
 
  //here we see what direction to go
  if (reverseX) {
    x-=4;
  }
  else {
    x+=4;
  }
  if (reverseY) {
    y-=5;
  }
  else {
    y+=5;
  }
  if (reverseA) {
    a-=8;
  }
  else {
    a+=8;
  }
  if (reverseB) {
    b-=10;
  }
  else {
    b+=10;
  }
}
