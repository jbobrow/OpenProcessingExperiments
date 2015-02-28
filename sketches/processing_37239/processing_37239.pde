
boolean mouseIsDown = false;

float posX = 100;
float posY = 100;
float myDiameter = 30;
float myDiameterTwo = 10;

void setup() {
size(500, 500);
background(255, 255, 255);
smooth();
noStroke();
frameRate(30);
}

void mousePressed() {
mouseIsDown = true;
}
 
//this function is called every time you release a mouse button
void mouseReleased() {
mouseIsDown = false;
}

void draw() {
  float dx = mouseX - posX;
  float dy = mouseY - posY;
 
  posX += dx/10;
  posY += dy/10;
 
  float strokeW = abs(mouseX/Y-pmouseX/Y);
  strokeWeight(strokeW);

  if (mouseIsDown == true) //same as if(mouseIsDown)
{
stroke(random(200,256),0,random(256),70);
line(random(mouseX), random(mouseY), pmouseX, pmouseY);

noFill();
rect(posX-15, posY-15, myDiameter, myDiameter);

fill(random(10,256),0,random(10,256),70);
ellipse(posX, posY, myDiameterTwo, myDiameterTwo);
}

}
