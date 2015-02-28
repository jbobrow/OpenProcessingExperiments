
void setup(){
  size(400,400);
  background(#000000);
}
int xPos = 0;       
int yPos = 0;
int speed = 1;
int size = 40; 
  
void draw(){
  fill(random(255),random(20), random(15));
  stroke(0,0);
  rect(xPos,yPos,size,size);
    
  if (xPos == width){
    yPos = yPos +size;
    speed = -1*speed;
  }
    
  if (xPos == -size && speed == -1) {
   yPos = yPos + size;
   speed = -1*speed;
  }
  xPos = xPos + speed*size;
    
  if(yPos == height) {
    yPos = 0;
  }
}



