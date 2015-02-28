
int diameter = 10;
int positionX = 100;
int Switch = 0;
 
void setup(){
  size(400,400);
  rectMode(CENTER);
}
 
void draw(){
  background(245,96,96);
   
  if(positionX == height-diameter/2){
    Switch = 1;
  }
  if(positionX == diameter/2){
    Switch = 0;
  }
  if(Switch == 0 ){
    positionX = positionX + 5; //positionX = positionX +1;
  }
  else if(Switch == 1) {
    positionX--;   
  }
   
  noStroke(); 
  ellipse(width/2,positionX,diameter,diameter);
  stroke(255,255,255);
  
   
   
  
  }
