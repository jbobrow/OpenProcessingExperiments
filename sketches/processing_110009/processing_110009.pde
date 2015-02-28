
void setup(){
  size(400, 400);
}

void draw(){
  for(int i=0; i<30; i++){
    line(pmouseX, pmouseY, mouseX, mouseX);
  }
}


