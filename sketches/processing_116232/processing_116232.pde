
int xback = 250;
int yback = 250;
int xforw = 250;
int yforw = 250;
int numBoxA = 3;
int numBoxB = 6;
boolean revxback = false;
boolean revyback = false;
boolean revxforw = false;
boolean revyforw = false;
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
float innerCircle = 20;
float a = 0.0;
float inc = TWO_PI/25.0;
PImage photo;

void setup() {
  size(500, 500);
  frameRate(30);
  photo = loadImage("heli.gif");

}
 
void draw() {
 background(217, random(187, 192), 234);
 
  noStroke();
  fill (random(100, 125), 0, 120, 100);
  triangle(x1, y1, x2, y2, x3, y3);
  stroke(0);
 
 
 for(int i = numBoxA; i < numBoxB; i++ ) { //make x-axis squares
    for(int j = numBoxA; j < numBoxB; j++ ) { //make y-axis squares
      fill(innerCircle*10, innerCircle*10, 203);
      rect(i*52+20, j*52+20, 40, 40, 7);
      fill(0, 109, 209);
      ellipse(i*52+40, j*52+40, innerCircle, innerCircle);
    }
  }

fill (50, 165, 255); 
ellipse(xback, yback, 60, 40); 
if(xback >= 475) {
    revxback = false;
  }
  if(xback <= 25) {
    revxback = true;
  }
  if(yback >= 475) {
    revyback = false;
  }
  if(yback <= 25) {
    revyback = true;
  }
  if(revxback) {
    xback+=5;
  }else{
    xback-=5;
  }
  if(revyback) {
    yback+=5;
  }else{
    yback-=5;
  }
  
fill (0, 165, 100); 
ellipse(xforw, yforw, 40, 60); 

if(xforw >= 475) {
    revxforw = true;
  }
  if(xforw <= 25) {
    revxforw = false;
  }
  if(yforw >= 475) {
    revyforw = true;
  }
  if(yforw <= 25) {
    revyforw = false;
  }
  if(revxforw) {
    xforw-=5;
  }else{
    xforw+=5;
  }
  if(revyforw) {
    yforw-=5;
  }else{
    yforw+=5;
  }
  
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

for (int i = 0; i < 25; i++) {
  fill(100+a, 0, a);
  ellipse(i*4, mouseY, i*4, 50+cos(a)*40.0);
  a = a + inc;
}

}

void mousePressed() {
innerCircle++;
numBoxA--;
numBoxB++;
ellipse(25, 250, 50, 50);
if (mouseButton == RIGHT) {
    image(photo, -50, 35);
  }
  

}

void mouseDragged(){
a = mouseX*.05;
}
//  x = mouseX;
//  y = mouseY;
//  ball1VelX = random(-10,10);
//  ball1VelY = random(-10,10);
//  ballTwoX = mouseX;
//  ballTwoY = mouseY;
//  ball2VelX = random(-10,10);
//  ball2VelY = random(-10,10);



