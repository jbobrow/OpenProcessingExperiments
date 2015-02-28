
//Jasmine Hoyle
//Lesson 2 Project
//variables

//declare variables
float moveY;
float xpos;
boolean going = false;

void setup() {
  size (300,300);
  moveY= height-300;
  xpos= width/2;
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  background (25,35,68);
  smooth();
  ellipse(xpos+80, moveY, 50,50);
  ellipse(xpos-80, moveY, 50, 50);
  fill(200,0,0);
  stroke(200,0,0);
  ellipse(xpos, moveY, 150,150);
  fill(0,200,0);
  rect(xpos-25, moveY-25, 30,60);
  rect(xpos+25, moveY-25,30,60);
  strokeWeight(5);
  stroke(255);
  line(xpos-25, moveY-50, xpos-25, moveY);
  line(xpos+25, moveY-50, xpos+25, moveY);
  fill(255);
  stroke(0,200,0);
  ellipse(xpos, moveY+30, 30,30);





  if (going) {
    moveY = moveY + 6;
  }
}
void mousePressed() {
  going=true;
}




