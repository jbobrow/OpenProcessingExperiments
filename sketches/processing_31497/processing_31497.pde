
  
void setup(){
  
  size(500,500);
  background(0);
}

void draw(){
  
  stroke(48,216,49,20);
  strokeWeight(2);
  line(0,mouseX,mouseY,500);
  line(500,mouseX,mouseY,0);
}

