
int pX;
int pY;

void setup() {
  size(600,600);
  background(105);
  smooth();
}

void draw() {
  pX = mouseX;
  pY = mouseY;
}

void mousePressed() {
  noStroke();
  fill(0);
  ellipse(pX,pY,130,130);
  ellipse(pX+45,pY-45,100,100);
  ellipse(pX-45,pY-40,100,100);
  
  fill(mouseX,0,mouseY);
  ellipse(pX+25,pY-20,10,10);
  ellipse(pX-25,pY-20,10,10);
  arc(pX,pY+10,80,70,0,PI);
}

void keyPressed() {
  background(mouseX,mouseY,0);
}
