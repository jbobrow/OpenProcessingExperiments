
/* Homework two - composition 
*  Aaron Cook
*  09/19/2013
*/

Circles OuterCircles; //outer circles

void setup() {
  size(400,400);
  smooth();
  OuterCircles = new Circles();
//noLoop();
}

void draw() {
  background(70,130,40);
  frameRate(8);
  OuterCircles.display();
  rectangles();
  whiteCircles();
  innerCircles();
  triangles();
  transparentCircles();
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
    println("Outer Circle R, G, and B values: " + outerCircleR + ", " + outerCircleG + ", " + outerCircleB);
  }
}

//red rectangles
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
  fill(191,54,8);
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
  ellipse(0,0,300,300);
  ellipse(0,400,300,300);
  ellipse(400,0,300,300);
  ellipse(400,400,300,300);
  println("Inner Cirle R, G, and B values: " + innerCircleR + ", " + innerCircleG + ", " + innerCircleB);
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
  trianglesR = random(1,254);
  trianglesG = random(1,254);
  trianglesB = random(1,254);
  fill(trianglesR, trianglesG, trianglesB);
  noStroke();
  quad(150,150,250,250,150,250,250,150);
  println("Triangles R, G, and B values: " + trianglesR + ", " + trianglesG + ", " + trianglesB);
}


