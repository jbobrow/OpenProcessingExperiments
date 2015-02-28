
int diameter = 10;
int positionX = 50;
int Switch = 0;
void setup(){
  size(200,200);
}

void draw(){
  background(90,167,247);
  fill(247,232,90);
   if (positionX >= width-diameter/2) {
    Switch = 1;
}
 if(positionX == diameter/2){ 
   Switch = 0;
}
   if(Switch == 0){
  positionX = positionX + 10;
}
else {
     positionX--; 
  }
  ellipse(positionX, 100, diameter, diameter);

}
