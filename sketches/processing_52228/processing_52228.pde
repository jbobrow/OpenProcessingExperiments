
//Alex Mutter - Creative Code
//Homework 3 - Bumpercups

float theta;
float y = 50.0;
float x = 50.0;
float speed = 1.0;
float radius = 25.0;
int direction = 1;

void setup() {
 size(600, 600);
 background(255, 201, 64);
 smooth();
 ellipseMode(CENTER);
 strokeWeight(2);
 saveFrame();
 theta = 20;
}

void drawBumperCarOne() { //draw red bumper car
  stroke(0);
  fill(175, 44, 44);
  rect(0, 0, 60, 40);
  fill(0);
  ellipse(0, 0, 10, 8);
  ellipse(60, 0, 10, 8);
  ellipse(0, 40, 10, 8);
  ellipse(60, 40, 10, 8);
  rect(40, 10, 10, 20);
}

void drawBumperCarTwo() {// draw green bumper car
  stroke(0);
  fill(45, 129, 22);
  rect(0, 0, 60, 40);
  fill(0);
  ellipse(0, 0, 10, 8);
  ellipse(60, 0, 10, 8);
  ellipse(0, 40, 10, 8);
  ellipse(60, 40, 10, 8);
  rect(40, 10, 10, 20);
}

void drawBumperCarThree() {//draw light blue bumper car
  stroke(0);
  fill(38, 216, 234);
  rect(0, 0, 60, 40);
  fill(0);
  ellipse(0, 0, 10, 8);
  ellipse(60, 0, 10, 8);
  ellipse(0, 40, 10, 8);
  ellipse(60, 40, 10, 8);
  rect(10, 10, 10, 20);
}
  

void drawTeaCup() {//draw blue and black teacup
  stroke(0);
  fill(0, 0, 255, 240);
  ellipse(0, 0, 60, 80);
  stroke(0);
  fill(0);
  ellipse(0, 0, 25, 30);
}

void drawTeaCupTwo() {//draw purple teacup
  stroke(0);
  fill(111, 11, 152);
  ellipse(0, 0, 60, 80);
  stroke(0);
  fill(0);
  ellipse(0, 0, 25, 30);
}

void drawMegaTeaCup() {
  stroke(0);
  fill(198, 195, 195);
  ellipse(0, 0, 90, 60);//main ellipse
  stroke(0);
  fill(118, 237, 55);
  ellipse(-45, 0, 50, 30);//left ellipse
  stroke(0);
  fill(118, 237, 55);
  ellipse(0, -35, 50, 30);//upper ellipse
  stroke(0);
  fill(118, 237, 55);
  ellipse(0, 35, 50, 30);//lower ellipse
  stroke(0);
  fill(118, 237, 55);
  ellipse(45, 0, 50, 30);//right ellipse
  fill(0);
  ellipse(0, 0, 30, 20);//center ellipse
}

void draw() {
  fill(255, 201, 64, 8);//motion blur
  rect(0, 0, width, height);
  
  for (int i = 0; i <= 600; i = i+40) {//background grid
  line(i, 0, i, height);
  line(0, i, width, i);
 }
 
 
  pushMatrix();
  translate(width/2, y);
  rotate(radians(theta));
  drawBumperCarOne();
  y += speed * direction;
  if ((y > height-radius) || (y < radius)) {
    direction = -direction;
  }
  translate(200, 100);
  drawTeaCup();
  rotate(radians(theta));
  //drawFigureThree();
  popMatrix();
  
  pushMatrix();
  translate(x, 200);
  rotate(radians(theta));
  drawBumperCarTwo();
  x += speed * direction;
  if ((x > width-radius) || (x < radius)) {
    direction = -direction;
  }
  translate(50, 100);
  drawTeaCupTwo();
  rotate(radians(theta));
  popMatrix();
  
  pushMatrix();
  translate(width - x, 500);
  rotate(radians(theta));
  drawBumperCarThree();
  popMatrix();
  
  pushMatrix();
  translate(200, height - y);
  rotate(radians(theta));
  drawMegaTeaCup();
  popMatrix();
  
  theta+= 0.7;
}

