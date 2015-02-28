
float r=255;
float g=255;
float b=255;
void setup() {
  size(400, 400);
     }
void draw() {
  line(150, 25, mouseX, mouseY);
  stroke(r-mouseX,g-mouseY,b);
     }
  void mousePressed() {
    background(0+mouseX, 0+mouseY, 0+mouseX);
     }



