
void setup(){
  size(400, 400);
  background(200);
}

void draw(){
  
  for(int i=0; i<30; i++){
  stroke(100,100,200); 
  point(mouseX + random(55), mouseY + random(55));
  
  }
}



