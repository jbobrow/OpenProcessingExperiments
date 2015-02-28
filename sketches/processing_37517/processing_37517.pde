
//code goes here
void setup(){
  size(400,400);
}

void draw(){
  
  for(int i=0;i<30;i++){
    point(mouseX+random(20),mouseY+random(20));
  }
  //line(pmouseX,pmouseY,mouseX,mouseY);
}

