
//Lama Kaddura
//Creative Computing Fall 2012


import processing.opengl.*;

float xPosition = 0;
float yPosition;
float xSpeed;
float ySpeed;
int inc = 1;

void setup(){
size(600,500, OPENGL);
//background(70);
smooth();
stroke(0,0,250,90);
noFill();
yPosition = height/2;
ySpeed = random(-8,8);
xSpeed = random(-8,8);
}


void draw(){
  fill (255);
      lights();
inc++;
pushMatrix();
translate(width/2, height/2);
rotateX(1);
rotateY(1);
box(150);
popMatrix();

fill(0,12);
rect(0,0, width, height);
noFill();


ellipse(mouseX,mouseY,50,90);

if(xPosition>width){
xSpeed *= -1;
}

// checks to see if ball position is smaller than 0 (left wall)
if(xPosition<0){
xSpeed *= -1;
}
if(yPosition<0){
ySpeed *= -1;
}
if(yPosition>height){
ySpeed *= -1;
}

fill(0,20,220);
ellipse(xPosition,yPosition,50,50);
// The below line says that the value of xPosition and yPosition
// will grow by the value currently held in the speed variables
xPosition += xSpeed;
yPosition += ySpeed;


if(xPosition>width){
xSpeed *= -1;
}

// checks to see if ball position is smaller than 0 (left wall)
if(xPosition<0){
xSpeed *= -1;
}
if(yPosition<0){
ySpeed *= -1;
}
if(yPosition>height){
ySpeed *= -1;
}

fill(0,20,220);
ellipse(xPosition,yPosition,50,50);
// The below line says that the value of xPosition and yPosition
// will grow by the value currently held in the speed variables
xPosition += xSpeed;
yPosition += ySpeed;


}


