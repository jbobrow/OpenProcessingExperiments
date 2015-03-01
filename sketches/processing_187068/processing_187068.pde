
int red = 255;
int green = 0;
int blue = 255;
 
 void setup() {
size(300,300);
}
 
void draw() {
  stroke(mouseY-140, mouseX-222, mouseY-2);
line(200, 200, mouseX, mouseY);
}
