
void setup(){
  size(400, 400);
  }
  background(100);

void draw(){


  for(int i=0; i<100; i++){
    
    point(mouseX + random(10), mouseY + random(10));
  }
  
  stroke(222)
}
