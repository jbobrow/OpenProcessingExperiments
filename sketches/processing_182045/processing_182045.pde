
int red = 0;
int green = 255;
int blue = 0;



void setup() {
size(500,500);
}
 
void draw() {
  stroke(mouseX-300, mouseX-20, mouseY-10);
line(50, 100, mouseX, mouseY);
}

