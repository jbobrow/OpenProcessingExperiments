
int diameter=10;
int positionX=50;
int Switch=0;
void setup(){
  size(200,200);
}

void draw(){
  background(129);
  if(positionX>=width-diameter/2){
    Switch=1;
  }
  if(positionX==diameter/2){
    Switch=0;
  }
      if(Switch==0){
      positionX++; //position=position+1;
}
      else{
        positionX--;
  }
  fill(positionX);
  ellipse(100,positionX,diameter,diameter);
  ellipse(positionX,100,diameter,diameter);
  ellipse(positionX,positionX,diameter,diameter);
  println(positionX);
}


