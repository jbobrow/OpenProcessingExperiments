
int diameter = 10;
int positionX = 50;
int Switch = 0;

void setup(){
  size(350,400);
  rectMode(CENTER);
}

void draw(){
  background(0,139,191);
  
  if(positionX == height-diameter/2){
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
  
  noStroke();  
  ellipse(width/2,positionX,diameter,diameter);
  
  
 
  }  



