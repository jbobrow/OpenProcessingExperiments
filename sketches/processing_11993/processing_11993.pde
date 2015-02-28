

float xPosition;
float yPosition;
float xSpeed;
float ySpeed;

float xPosition2;
float yPosition2;
float xSpeed2;
float ySpeed2;

float xPosition3;
float yPosition3;
float xSpeed3;
float ySpeed3;

float xPosition4;
float yPosition4;
float xSpeed4;
float ySpeed4;



void setup(){
size(450,350);
smooth();
noStroke();
yPosition2 = height/2;
yPosition = height/2;
yPosition3 = height/2;
yPosition4 = height/2;
ySpeed = random(-15,10);
xSpeed = random(-10,10);
ySpeed2 = random(-10,10);
xSpeed2 = random(-10,10);
ySpeed3 = random(-10,10);
xSpeed3 = random(-10,10);
ySpeed4 = random(-10,10);
xSpeed4 = random(-10,10);

}

void draw(){
background(450, 34, 15);

if(xPosition2>width){
  xSpeed2 *= -1;
}

if(xPosition4>width){
  xSpeed4 *= -1;
}

if(xPosition3>width){
  xSpeed3 *= -1;
}


if(xPosition>width){
xSpeed *= -1;
}

if(xPosition3<0){
  xSpeed3 *= -1;
}

if(xPosition4<0){
  xSpeed4 *= -1;
}

if(xPosition<0){
xSpeed *= -1;
}
if(xPosition2<0){
  xSpeed2 *= -1;
}

if(yPosition2>height){
  ySpeed2 *=-1;
}

if(yPosition4>height){
  ySpeed4 *= -1;
}

if(yPosition4<0){
  ySpeed4 *= -1;
}

if(yPosition3<0){
ySpeed3 *= -1;
}

if(yPosition3>height){
  ySpeed3 *= -1;
}

if(yPosition2<0){
  ySpeed2 *= -1;
}
if(yPosition<0){
ySpeed *= -1;
}
if(yPosition>height){
ySpeed *= -1;
}

fill(0,20,220);
rect(xPosition,yPosition,50,50);
rect(xPosition2,yPosition2,40,40);
rect(xPosition3,yPosition3,45,45);
rect(xPosition4,yPosition4,55,55);

xPosition += xSpeed;
yPosition += ySpeed;
xPosition2 += xSpeed2;
yPosition2 += ySpeed2;
xPosition3 += xSpeed3;
yPosition3 += ySpeed3;
xPosition4 += xSpeed4;
yPosition4 += ySpeed4;
}

