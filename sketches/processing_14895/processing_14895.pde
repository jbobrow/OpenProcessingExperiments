
//declare the variable and give it a starting value
int xPosition = 0;
int yPosition = 0;
int zPosition = 0;
int speed = 4;

void setup(){
  size(400,400);
}

void draw(){
  background(150,40,90);
  fill(99,20,304);
  
  //draw a rectangle using the variable for the x position
  rect(xPosition,150,200,50);
  rect(yPosition,0,200,50);
  rect(zPosition,300,50,50);
    
  //change the value of xPosition
  xPosition = xPosition - 3;
  yPosition = yPosition + 20; 
  zPosition = zPosition + 3;
  
  //now check if we have reached the edge of the window
  if (xPosition > width){
    speed = speed * -1;
  } else if (xPosition < 10){
    speed = speed * -1;
  } 
}

