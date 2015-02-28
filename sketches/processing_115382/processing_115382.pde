
int diameter = 10;
int positionX = 0;
int positionY = 0;
int Switch = 0;

void setup(){
  size(350,400);
  rectMode(CENTER);
}

void draw(){
  background(0,139,191);
  
  if(positionX == width-diameter/2){
    Switch = 1;
  }
  if(positionX == diameter/2){
    Switch = 0;
  }
  if(Switch == 0 ){
    positionX++; //positionX = positionX +1;
  }
  else if(Switch == 1) {
    positionX--;    
  }
  
   if(positionY == height-diameter/2){
    Switch = 1;
  }
  if(positionY == diameter/2){
    Switch = 0;
  }
  if(Switch == 0 ){
    positionY++; //positionX = positionX +1;
  }
  else if(Switch == 1) {
    positionY--;    
  }
    
  noStroke();  
  ellipse(positionX,height/2,diameter,diameter);
  
  noStroke();  
  ellipse(positionX,positionY,diameter,diameter);
  
  
  }  



