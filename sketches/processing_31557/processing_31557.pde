
void setup(){
  
  size(500,500);
  background(0);
}

void draw(){
  
  stroke(185,21,21,30);
  strokeWeight(2);
  line(mouseX,mouseY,0,0);
  line(mouseX,mouseY,500,500);
  line(mouseX,mouseY,0,500);
  line(mouseX,mouseY,500,0);
}

