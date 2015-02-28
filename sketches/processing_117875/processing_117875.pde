
int diameter = 50;
int positionX = 50;
int Switch = 0;
int positionY = 50;
int SwitchY = 0;
void setup(){ 
  size(200,200);
}

void draw(){
  //background(192);
  
  if(positionX >= width-diameter/2){
    Switch = 1;
  }
  if(positionX == diameter/2){
    Switch = 0;
  }
  if(Switch == 0){  
  positionX++; //position = position + 1;
}
else {
  positionX--; 
}
    
   
 
    
  ellipse(positionX,100,diameter,diameter); 
  
    if(positionY >= height-diameter/2){
    Switch = 1;
  }
  if(positionY == diameter/2){
    Switch = 0;
  }
  if(Switch == 0){  
  positionY++; //position = position + 1;
}
else {
  positionY--; 
}
    
   
 
    
  ellipse(100, positionY,diameter,diameter); 
  
 }
