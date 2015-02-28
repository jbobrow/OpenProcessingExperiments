
void setup(){
  size(400, 400);
  background(0);
}

void draw(){
  stroke(150);
  for(int i=0; i<250; i++){
    //point(mouseX, mouseY); 
    point(mouseX + random(50), mouseY + random(10));
  }
 
}
