
/* 
Homework - array added 
Aaron Cook
10/10/2013
*/

Circles OuterCircles; //outer circles
PFont f;
int[] circles = new int[50];
int circlesX;
int circlesY;
int circlesR;
int circlesG;
int circlesB;
int circlesA;

void setup() {
  size(400,400);
  smooth();
  OuterCircles = new Circles();
  f = loadFont("MyriadArabic-Bold-36.vlw");
}

void draw() {
  frameRate(5);
  background(10,235,245);
  OuterCircles.display();
  words();
  rectangles();
  whiteCircles();
  innerCircles();
  triangles();
  transparentCircles();
  circle();
  circles();
}

void circles(){
  for (int i=0; i < circles.length; i++) {
    circles[i] = circles[i];
    circlesX = (int) random(0,400);
    circlesY = (int) random(0,400);
    circlesR = (int) random(225); 
    circlesG = (int) random(225);
    circlesB = (int) random(225);
    circlesA = (int) random(100);
    fill(circlesR, circlesG, circlesB, circlesA);
    ellipse(circlesX, circlesY, 20, 20);
  }
}

class Circles {
  //outer circles
  void display() {  
    float outerCircleR, outerCircleG, outerCircleB;
    int circW = 450;
    int circH = 450;
    outerCircleR = random(1,254);
    outerCircleG = random(1,254);
    outerCircleB = random(1,254);
    ellipseMode(CENTER);
    noStroke();
    fill(outerCircleR,outerCircleG,outerCircleB);
    ellipse(0,0,circW,circH);
    ellipse(0,400,circW,circH);
    ellipse(400,0,circW,circH);
    ellipse(400,400,circW,circH);
//  println("Outer Circle R, G, and B values: " 
//    + outerCircleR + ", " + outerCircleG + ", " + outerCircleB);
  }
}

//rectangles
int x = 0;
int xSpeed = 8;
int y = 390;
int ySpeed = 8;
void rectangles() {
  x = x + xSpeed;  
  y = y - ySpeed;
  if ((x > width - 10) || (x < 0)) {
    xSpeed = xSpeed * -1;  //reverse direction when hits edge
  }
  if ((y > height - 10) || (y < 0)) {
    ySpeed = ySpeed * -1;  //reverse direction when hits edge
  }
//  fill(191,54,8);
  if (key == 'g') {
    fill(52,255,8);
  } else if (key == 'r') {
    fill(191,54,8); 
  } else if (key == 'b') {
    fill(31,51,255);
  }
  rect(0,x,400,10);
  rect(x,0,10,400);
  rect(y,0,10,400);
  rect(0,y,400,10);
}

//white circles
void whiteCircles() {
  fill(255);
  ellipse(0,0,350,350);
  ellipse(0,400,350,350);
  ellipse(400,0,350,350);
  ellipse(400,400,350,350);
}

//inner circles
void innerCircles() {
  float innerCircleR, innerCircleG, innerCircleB;
  innerCircleR = random(1,254);
  innerCircleG = random(1,254);
  innerCircleB = random(1,254);
  fill(innerCircleR,innerCircleG,innerCircleB);
  stroke(0);
  ellipse(0,0,mouseX,mouseY);
  ellipse(0,400,mouseX,mouseY);
  ellipse(400,0,mouseX,mouseY);
  ellipse(400,400,mouseX,mouseY);
//  println("Inner Cirle R, G, and B values: " 
//    + innerCircleR + ", " + innerCircleG + ", " + innerCircleB);
}

//white transparent circles
int diameter = 5;
int dSpeed = 16;
void transparentCircles() {
  fill(255, 80);
  noStroke();
  diameter = diameter + dSpeed;
  if ((diameter > 295) || (diameter < 5)) {
    dSpeed = dSpeed * -1;
  }
    ellipse(0,0,diameter,diameter);
    ellipse(0,400,diameter,diameter);
    ellipse(400,0,diameter,diameter);
    ellipse(400,400,diameter,diameter);
}
  
//center trianges
void triangles() {
  float trianglesR, trianglesG, trianglesB;
  if (mouseX < width/2) {
    trianglesR = random(1,127);
  } else {
    trianglesR = random(128,254);
  }
  if (mouseX < height/2) {
    trianglesG = random(1,127);
  } else {
    trianglesG = random(128,254);
  }
  if (mouseX < width/2) {
    trianglesB = random(1,127);
  } else {
    trianglesB = random(128,254);
  }
  fill(trianglesR, trianglesG, trianglesB);
  noStroke();
  quad(150,150,250,250,150,250,250,150);
//  println("Triangles R, G, and B values: " 
//    + trianglesR + ", " + trianglesG + ", " + trianglesB);
}

void circle() {
  noStroke();
  fill(random(255),random(255),random(255),75);
  ellipse(mouseX,mouseY,36,36);
}

void words() {
  fill(random(255), random(255), random(255));
  String words = ("c o o l");
  textAlign(LEFT);
//  rotate(PI/3);
  text(words,10,205);
  text(words,353,205);
}


