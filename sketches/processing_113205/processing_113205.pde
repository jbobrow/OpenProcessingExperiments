
int diameter = 10;
int positionY = 50;
int Switch = 0;
void setup(){    
  size(200,200);
}

void draw(){  
  background(#080707);

  if(positionY == width-diameter/2){
    Switch = 1;
  }
  if(positionY == diameter/2){
    Switch=0;
  }
  if(Switch == 1){
  positionY--;// position = position + 1;
 
  }
  
  else if  (Switch == 0){
    positionY++;// position = position + 10;
  }
  
  
 ellipse(100,positionY,diameter,diameter);
  
}



