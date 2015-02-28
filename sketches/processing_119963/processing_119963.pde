

int xPos;
int yPos;

void setup() {
 
 size(600,600);
 background(255);
 
 xPos = 300;
 yPos = 300;

}

void draw() {

  line(xPos,yPos, pmouseX,pmouseY);
  line(yPos,xPos, pmouseY,pmouseX);
  stroke(mouseX, random(0,255), random(0,255), random(0,255));


  
}

void mousePressed() {
 
  xPos = mouseX;
  yPos = mouseY;
 
  
}


