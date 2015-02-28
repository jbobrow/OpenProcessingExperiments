
void setup(){
  size(500,500);
}

void draw(){
  fill(mouseY,mouseX,85,10);
  stroke(mouseY,mouseX,85,10);
  triangle(250,250,mouseX,mouseY,mouseY,mouseX);
}
