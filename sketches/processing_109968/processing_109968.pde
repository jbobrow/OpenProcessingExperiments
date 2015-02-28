
/* Homework two - composition (added motion and loops)
*  Aaron Cook
*  09/17/2013
*/

//Color value variables
float outerCircleR, outerCircleG, outerCircleB;
float innerCircleR, innerCircleG, innerCircleB;
float trianglesR, trianglesG, trianglesB;

//Variables for motion of red rectangles
int x = 0;
int xSpeed = 8;
int y = 390;
int ySpeed = 8;

////Variables for outer circles
int circW = 450;
int circH = 450;

void setup() {
  size(400,400);
  //noLoop();
  smooth();
}

void draw() {
  //Green background
  background(70,130,40);
  frameRate(8);

  //outer circles
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
//For loop slows down composition significantly:  
//  for (int a = 0; a < 451; a++) {
//    ellipse(0,0,a,a);
//    ellipse(0,400,a,a);
//    ellipse(400,0,a,a);
//    ellipse(400,400,a,a);
//  println(outerCircleR);
//  println(outerCircleG);
//  println(outerCircleB);
//  }

  //red rectangles
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

  //white circles
  fill(255);
  for (int w = 0; w < 351; w++) {
    ellipse(0,0,w,w);
    ellipse(0,400,w,w);
    ellipse(400,0,w,w);
    ellipse(400,400,w,w);  
  }
   
  //inner circles
  innerCircleR = random(1,254);
  innerCircleG = random(1,254);
  innerCircleB = random(1,254);
  fill(innerCircleR,innerCircleG,innerCircleB);
  stroke(0);
  for (int i = 0; i < 301; i++) {
    ellipse(0,0,i,i);
    ellipse(0,400,i,i);
    ellipse(400,0,i,i);
    ellipse(400,400,i,i);
  }

  //center triangles
  trianglesR = random(1,254);
  trianglesG = random(1,254);
  trianglesB = random(1,254);
  fill(trianglesR, trianglesG, trianglesB);
  noStroke();
  quad(150,150,250,250,150,250,250,150);
//  println(trianglesR);
//  println(trianglesG);
//  println(trianglesB);
}





