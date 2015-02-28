
void setup(){
  background (0);
  size(200,200);
}
void draw(){
  fill(mouseX, 60,mouseY, 50);
  triangle(mouseX, mouseY, mouseY, mouseX, mouseX,mouseX);
 }
