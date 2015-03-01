
void setup() {
  size(600, 600);
}
void draw() {
  
  quad(mouseX, mouseY,50, 85, 10 ,45, 95 ,5);
  quad(mouseY, mouseX,50, 85, 10 ,45, 95 ,5);
  quad(height-mouseY, width-mouseX,50, 85, 10 ,45, 95 ,5);
  quad(width-mouseX,height-mouseY,50, 85, 10 ,45, 95 ,5);
  quad(height-mouseY, mouseX,50, 85, 10 ,45, 95 ,5);
  quad(mouseX,height-mouseY,50, 85, 10 ,45, 95 ,5);
  quad(mouseY, width-mouseX,50, 85, 10 ,45, 95 ,5);
  quad(width-mouseX,mouseY,50, 50, 85, 10 ,45,5);
}
