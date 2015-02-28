

void setup(){
  size(400,400);
  background(102,0,51);
  stroke(51,51,255);
  
}

void draw(){
  
  for(int i=10; i<50; i++){
   point(mouseX + random(5), mouseY + random(20));
}
}


