
void setup(){
  size(500, 500);
  background(0, 0, 0);
}
void draw(){
  fill(0, 0, 0, 10);
    rect(0, 0, 500, 500);
  if(mousePressed){    
  fill(mouseX, 0, mouseY);
  ellipse(250, 250, mouseX, mouseY);
  }
}

