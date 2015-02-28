
void setup(){
  size(300,300);
}
void draw(){
  fill(mouseX, mouseY);
  triangle(mouseX, mouseY, 10,10, mouseY, mouseX);
}
