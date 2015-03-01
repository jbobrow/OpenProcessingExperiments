
void setup(){
  size(500, 1000);
  smooth();
  background(0);
}

void draw(){
  stroke(255);
  line(mouseX, 0, mouseX, 1000);
  line(0, mouseY, 500, mouseY);
  noFill();
  stroke(245, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
  
}





