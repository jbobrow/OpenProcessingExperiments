
/* Homework two - random colors composition
*  Aaron Cook
*  09/09/2013
*/

float outerCircleR;
float outerCircleG;
float outerCircleB;

float innerCircleR;
float innerCircleG;
float innerCircleB;

float trianglesR;
float trianglesG;
float trianglesB;

void setup() {
  size(400,400);
  noLoop();
  smooth();
}

void draw() {
  //Green background
  background(70,130,40);

  //outer circles
  outerCircleR = random(1,254);
  outerCircleG = random(1,254);
  outerCircleB = random(1,254);
  ellipseMode(CENTER);
  noStroke();
  fill(outerCircleR,outerCircleG,outerCircleB);
  ellipse(0,0,450,450);
  ellipse(0,400,450,450);
  ellipse(400,0,450,450);
  ellipse(400,400,450,450);

  //red rectangles
  fill(191,54,8);
  noStroke();
  rect(0,0,400,10);
  rect(0,0,10,400);
  rect(390,0,10,400);
  rect(0,390,400,10);

  //white circles
  fill(255);
  ellipse(0,0,350,350);
  ellipse(0,400,350,350);
  ellipse(400,0,350,350);
  ellipse(400,400,350,350);
  
  //inner circles
  innerCircleR = random(1,254);
  innerCircleG = random(1,254);
  innerCircleB = random(1,254);
  fill(innerCircleR,innerCircleG,innerCircleB);
  stroke(0);
  ellipse(0,0,300,300);
  ellipse(0,400,300,300);
  ellipse(400,0,300,300);
  ellipse(400,400,300,300);

  //center triangles
  trianglesR = random(1,254);
  trianglesG = random(1,254);
  trianglesB = random(1,254);
  fill(trianglesR, trianglesG, trianglesB);
  noStroke();
  quad(150,150,250,250,150,250,250,150);
}

void keyPressed() {
  if (key == ' ') {
    redraw();
  }
}




