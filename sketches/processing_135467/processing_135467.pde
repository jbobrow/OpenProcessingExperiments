
  void setup() {
  size(600, 600);
  colorMode(HSB);
  background(random(100),805,855);
}
void draw() {
   
  fill(mouseX/2,204,505,100);
  quad(mouseX, mouseY, 116, 60, 99, 93, 60, 106);
  quad(mouseY, mouseX, 106, 60, 93, 99, 60, 116);
  quad(height-mouseY, width-mouseX, 116, 60, 99, 93, 60, 106);
  quad(width-mouseX,height-mouseY, 0, 40, 150, 30, 35,56);
  quad(height-mouseY, mouseX, 180, 116, 100, 60, 80, 90);
  quad(mouseX,height-mouseY, 150, 70, 89, 90, 160, 77);
  quad(mouseY, width-mouseX, 600, 410, 540, 590, 480, 399);
}

