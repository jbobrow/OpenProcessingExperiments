
int xPos;
int yPos;

void setup(){
 
 size(600,600);
 xPos = width/2;
 yPos = height/2;
}

void draw(){
  
  background(0);
  
  fill(255);
  ellipse(xPos, yPos, 50,50);
  
  if (keyPressed){
    
    if (keyCode == LEFT){
      xPos = xPos - 5;
    }
    if (keyCode == RIGHT){
      xPos = xPos + 5;
    }
    if (keyCode == UP){
      yPos = yPos - 5;
    }
    if (keyCode == DOWN){
      yPos = yPos + 5;
    }
  }
}
  
  


