

void setup(){
size(400, 400);
background(99, 166, 196);
}
void draw(){
  frameRate(30);
background(99, 166, 196);
  satellite(mouseX-mouseY/2, mouseY, mouseX-100);
  satellite(mouseX+mouseY/2, mouseY, mouseX-100);
  satellite(mouseX, mouseY-mouseX/2, mouseY-100);
  satellite(mouseX, mouseY+mouseX/2, mouseY-100);
  other (mouseX+mouseY, mouseX-mouseY, mouseX-100);
  other (mouseX-mouseY, mouseY+mouseX, mouseX-100);
}
  void satellite(int x, int y, int k){
    smooth();
    noStroke();
    fill(0, k);
    ellipse(x, y, 20, 20);
  }
  void other(int x, int y, int k){
    smooth();
    noStroke();
    fill(208, 219, 219, k);
    ellipse(x, y, 60, 60);
  }

