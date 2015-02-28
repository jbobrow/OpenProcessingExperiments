
int diameter = 50;
int Switch = 0;
int positionY = 25;
void setup(){
  size(400,400);
  background(190);
}
void draw(){
  background(190);
  fill(mouseX,mouseY,mouseX);
  
  if (positionY >= height - diameter/2){
  Switch = 1;
  }
if (positionY == diameter/2){  
Switch = 0;
}
if (Switch == 0){
  positionY++;
}else{
  positionY--;
}
ellipse(mouseX,positionY,diameter,diameter);
}
    
  


