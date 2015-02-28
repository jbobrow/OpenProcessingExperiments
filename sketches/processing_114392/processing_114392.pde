
int diameter = 10; 
int positionX = 50;
int Switch = 0;
int positionY = 50;
int SwitchY = 0;

void setup(){
  size(200,200);
}

void draw(){
 
  
  if(positionX >= width-diameter/2){
    Switch = 1;
  }
  if(positionX  == diameter/2){
    Switch = 0;
  }
  if(Switch == 0) { 
  positionX++; //position = position + 1;
  }
  else if (Switch == 1) {
    positionX--;
  }
   ellipse(positionX,100,diameter,diameter);
   ellipse(100,positionX,diameter,diameter);
   
    if(positionX >= height-diameter/2){
    Switch = 1;
  }
  if(positionX  == diameter/2){
    Switch = 0;
  }
  if(Switch == 0) { 
  positionX++; //position = position + 1;
  }
  else if (Switch == 1) {
    positionX--;
  }
   ellipse(positionX,100,diameter,diameter);
   ellipse(100,positionX,diameter,diameter);
}



