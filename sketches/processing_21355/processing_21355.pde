
float centerX = 100;
float centerY = 100;

void setup() {
  size(300,300); 
  smooth();
}
void draw() {
  background(0,3,2);
  stroke(0);
fill(188,255,90, 100);
triangle(mouseX, mouseY, 120,90,180,90);
fill(242,46,96, 100);
triangle(mouseX, mouseY,80,120,80,180);
fill(188,255,90, 100);
triangle(mouseX, mouseY,120,210,180,210);
fill(242,46,96, 100);
triangle(mouseX, mouseY,210,120,210,180);

}



