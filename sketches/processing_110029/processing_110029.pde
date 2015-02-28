
void setup(){
  size(400, 400);
  background(10, 50, 86);
  stroke(256, 256, 256);
}
 
void draw(){
  for(int i=0; i<30; i++){
    line(pmouseX, pmouseY, mouseX, mouseX);
  }
}


