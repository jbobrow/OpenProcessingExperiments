
float xPosition = 0;
float yPosition;
float xSpeed;
float ySpeed;

int num=0;

PFont f;

void setup() {
  size(600,600);
  smooth();
  noStroke();
  yPosition = height/2;
  ySpeed = random(-8,8);
  xSpeed = random(-8,8);
  
  f=loadFont("AGaramondPro-BoldItalic-48.vlw");
}

void draw() {
  background(0);

  // checks to see if ball position is larger than width of sketch or smaller than 0
  if((xPosition>width)||(xPosition<0)) {
    num+=1;
    xSpeed *= -1; 
  }
  
  if((yPosition<0)||(yPosition>height)) {
    num+=1;
    ySpeed *= -1; 
  }
  
  ball();
  
  fill(255);
  textFont(f,18);
  text("COUNT "+num, 250,300);
  
  // The below line says that the value of xPosition and yPosition
  // will grow by the value currently held in the speed variables
  xPosition += xSpeed;
  yPosition += ySpeed;
 }
 
 void ball() {
  fill(random(255),random(255),random(255));
  ellipse(xPosition,yPosition,50,50);
}


