
int blue = 0;

void setup() {
  size (600, 600);
  background(0);
}
  
  void draw() {
    if (mousePressed) {
      int x1 = mouseX;
    int y1 = mouseY;
    int x2 = mouseX + (width - width/6);
    int y2 = mouseY + width/6;
    int x3 = mouseX - width/20;
    int y3 = mouseY;
    int x4 = width/2;
    int y4 = height/2;
    noFill();
    stroke(255, 0, blue);
    smooth();
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
   // bezier(350, 100, 500, 200, 130, 200, 300, 300);
   // bezier(150, 450, 75, 100, 400, 450, 300, 300);
  }
  
  }
  void mouseClicked() {
  blue = blue + 10;
}
  
    
    


