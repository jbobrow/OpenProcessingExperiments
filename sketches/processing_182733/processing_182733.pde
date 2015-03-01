
float rojo = 255;
void setup() {
  size(300,300);
}
 
void draw() {
  stroke(rojo, mouseX, mouseY);
  line(0, 0, mouseX, mouseY);
}


