
int diameter = 10; 
int positionX = 50;
int Switch = 0;

void setup(){
  size(200,200);
}

void draw(){
  background(192);
  
  if(positionX >= width-diameter/2){
    Switch = 1;
  }
  if(positionX  == diameter/2){
    Switch = 0;
  }
  if(Switch == 0) { 
  positionX = positionX + 5;
  }
  else if (Switch == 1) {
    positionX--;
  }
   ellipse(positionX,positionX,diameter,diameter);

}


