
float zoogX;
float zoogY;
float eyeR;
float eyeG;
float eyeB;
float r;
float g;
float b;

void setup() {
  size(500,500);
  frameRate(60);
  zoogX=width/2;
  zoogY=height + 100;
  smooth();
}

void draw(){ // This was the starting point using the Zoog example in the textbook
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
  fill(150);
  rect(zoogX,zoogY,20,100);
  
  stroke(0);
  fill(255);
  ellipse(zoogX,zoogY-30,60,60);
  
  eyeR=random(255);
  eyeG=random(255);
  eyeB=random(255);
  fill(eyeR,eyeG,eyeB);
  
  ellipse(zoogX-19,zoogY-30,16,32);
  ellipse(zoogX+19,zoogY-30,16,32);
  
  stroke(150);
  line(zoogX-10,zoogY+50,zoogX-10,height);
  line(zoogX+10,zoogY+50,zoogX+10,height);
  
  zoogY=zoogY-1;
}
void mouseMoved()// This Triforce was thanks to the Design of OpenProcessing User- Jason T
{
  fill(255, 255, 0);
  triangle(mouseX, mouseY - 50, mouseX - 40, mouseY + 25, mouseX + 40, mouseY + 25);
  fill(0);
  triangle(mouseX, mouseY + 25, mouseX - 20, mouseY - 13, mouseX + 20, mouseY - 13);
}

void mouseClicked()
{
r=random(255);
g=random(255);
b=random(255);
background(r,g,b);
}


