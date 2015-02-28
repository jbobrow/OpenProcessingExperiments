
int x1 = 50;
int y1 = 10;
int x2 = 30;
int y2 = 40;
int x3 = 70;
int y3 = 40;
boolean reverseX = false;
boolean reverseY = false;
boolean reverseX2 = false;
boolean reverseY2 = false;
boolean reverseX3 = false;
boolean reverseY3 = false;
int numCircles = 100;
float gradientColor = 0;
 
void setup() {
  size(500, 500);
  frameRate(24);
}
 
void draw() {
  
  for(int i = 100; i > 0; i-- ) {
    noStroke();
    gradientColor = map(i, 0, 100, random(100, 255), 0);
    fill(gradientColor);
    ellipse(width/2, height/2, i*7, i*7);
  }
  noStroke();
  fill(random(206,255), random(206,247), 0, 100);
  for(int i = 0; i < 70; i++ ) {
    for(int j = 0; j < 70; j++ ) {
      ellipse(i*20+10, j*20+10, 20, 20);
    }
  }
 
  
  noStroke();
  fill (20, random(100, 125), 200, 120);
  triangle(x1, y1, x2, y2, x3, y3);
  fill(random(200, 255), 0, 25, 150);
  triangle(x1+100, y1+250, x2+80, y2+80, x3+150, y3+150);
  
  
  //here we check if it has gone too far
  if (x1 >= 500) {
    reverseX = true;
  }
  else if ( x1 <= 0) {
    reverseX = false;
  }
  if (y1 >= 500) {
    reverseY = true;
  }
  else if ( y1 <= 0) {
    reverseY = false;
  }
  if (x2 >= 500) {
    reverseX2 = true;
  }
  else if ( x2 <= 0) {
    reverseX2 = false;
  }
  if (y2 >= 500) {
    reverseY2 = true;
  }
  else if ( y2 <= 0) {
    reverseY2 = false;
  }
    if (x3 >= 500) {
    reverseX3 = true;
  }
  else if ( x3 <= 0) {
    reverseX3 = false;
  }
  if (y3 >= 500) {
    reverseY3 = true;
  }
  else if ( y3 <= 0) {
    reverseY3 = false;
  }
 
 
  //here we see what direction to go
  if (reverseX) {
    x1-=4;
  }
  else {
    x1+=4;
  }
  if (reverseY) {
    y1-=5;
  }
  else {
    y1+=5;
  }
  if (reverseX2) {
    x2-=6;
  }
  else {
    x2+=6;
  }
  if (reverseY2) {
    y2-=7;
  }
  else {
    y2+=7;
  }
if (reverseX3) {
    x3-=8;
  }
  else {
    x3+=8;
  }
  if (reverseY3) {
    y3-=9;
  }
  else {
    y3+=9;
  }
}



