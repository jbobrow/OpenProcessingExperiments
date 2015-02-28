
//for loop & function exercise
//by Xiaofeng  

int xPos = mouseX/2;
int xVel = mouseY/2;

void setup(){
  size(500,500);
  background(255);
  
}

void draw(){
  
  xPos = mouseX/2;
  xVel = mouseY/2;
  
  fill(0,xPos,5,3);
  noStroke();
  smooth(); 

//patterning  
  for (int y = -10;y <= 500; y += 10){
    for (int x = -10; x <= 500; x += 10){
      ellipse (x + xPos/3, y + xPos/3, 15 + x/2, 10);
  }
  
}  
  moveShapes();
}

//overwring patterning
void moveShapes(){
  
  if(xPos < 10 || xPos > 390){
    xVel = xVel * (-1);
  }
  xPos = xPos + xVel;
}
