
void setup(){
  size(400, 400);
  background(48,139,206);
  stroke(255);
}

void draw(){
  
  for(int i=0; i<30; i++){
    point(mouseX + random(100), mouseY + random(10));
  }
}


