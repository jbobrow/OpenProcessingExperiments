
//Position
float xPos=20;
float yPos=50;
float zPos=80;

//Direction
float xDir = 1;

void setup() {
size(500,300);
noCursor();
}


void draw() {
  
  background(0);
  
  //ellipse 1
  ellipse(xPos, height/2, 50, 50);
  xPos = xPos + 1; 
  if(xPos > width)  {
  xPos = 20;
  }
  
  //ellipse 2
  ellipse(yPos, width/2, 20, 20);
  yPos = yPos + 1; 
  if(yPos > width)  {
  yPos = 50;
  }
  
  //ellipse 3
  ellipse(zPos, width/2, 80, 80);
  zPos = zPos + 2; 
  if(zPos > width)  {
  zPos = 80;
  }
  
  
  noStroke();
  ellipse (mouseX,mouseY,40,40);
  
  if (mousePressed) {
 stroke (255); strokeWeight(50); smooth(); fill (255,80);
 }
  
 
  
  
}
