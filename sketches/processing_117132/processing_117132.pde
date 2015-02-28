
float xPos=30;
float yPos=50;
float zPos=90;



void setup(){
  size(500,500);
  noCursor();
}

void draw(){
  background(255);
  
  ellipse(xPos, height/2, 30, 30);
  fill(0);
  xPos = xPos + 1;
  if(xPos > width) {
    xPos=30;
  }
  
  
  ellipse(yPos, height/2, 50, 50);
  fill(0);
   yPos = yPos + 3;
  if(xPos > width) {
    yPos= 50;
  }
  
 
  ellipse(zPos, width/2, 20, 20);
  fill(0);
    zPos = zPos + 2;
  if(xPos > width) {
    yPos= 90;
  }
  
  noStroke();
  ellipse (mouseX, mouseY, 10, 10);
  
}
