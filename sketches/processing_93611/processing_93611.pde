
void setup(){
  size(200,200);
  background(255);
}
void draw(){
  fill(mouseX, mouseY, 234);
  quad(mouseX, 150, 0, 0, 200, 200, mouseX, mouseY);
}
