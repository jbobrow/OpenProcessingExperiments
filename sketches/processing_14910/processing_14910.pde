


                
 int xPosition=0;
int speed=1;

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  fill(255);
  
 
  fill(25,140,10);
  rect(xPosition,200,50,50);
  
   
    fill(0,25,89);
    rect(xPosition/2+100,150,50,30);
    
  
  xPosition =xPosition+speed;
  
  
  if (xPosition>width-50){
    speed =speed*-1;
  } else if (xPosition<0){
    speed =speed*-1;
  } 
}               
