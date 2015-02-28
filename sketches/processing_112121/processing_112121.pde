
int numCircles = 14;
int spacing = 15;

void setup() {
  size(800, 600);
  smooth();
  background(0);
  noLoop();
}

void draw() { 
  background(0);

for(int i=0; i<50;i++){
  int bx = int(random(0,width));
  int by = int(random(0,height));
  int bnum = int(random(2,8));
  bullseye(bx,by,bnum);
  
}
  //bullseye(width/2, height/2, int(map(mouseY,0,600,2,100)));
  //bullseye(width/2-200, height/2, 15);
  //bullseye(mouseX,mouseY, 5);
  //bullseye(width/2, height/2-200, 10);
  //bullseye(width/2, height/2+200, 20);
  
}

void bullseye(int xPos, int yPos, int numCircles) {
  stroke(127);
  strokeWeight(.5);
  noFill();
  // bullseye
  for (int i=0;i < numCircles;i++)
  {
    ellipse(xPos, yPos, i*spacing, i*spacing);
   
  }
 // line(mouseX,mouseY,xPos,yPos);
}
