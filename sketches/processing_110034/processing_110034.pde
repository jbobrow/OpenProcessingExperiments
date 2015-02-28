
void setup(){
  size(400, 400);
stroke(256,256,256);
background(0,0,0);
}

void draw(){
  for(int i=0; i<30; i++){
    line(pmouseX, pmouseY, mouseX, mouseX);
   
  }
}


