
int red = 0;
int green = 0;
int blue = 0;

void setup() {
size(500,500);
}
 
void draw() {
  stroke(mouseX/2, mouseY/2, mouseX/2);
line(0, 0, mouseX, mouseY);
}
