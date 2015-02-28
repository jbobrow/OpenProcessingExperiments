
  
  float a = 0;
  float b = 30;
  float speed = 0.5;
  float rectSize = 23;
  color c=color(0);
  
  void setup() {
    size (800, 600);
    smooth();
//    fill (255,255,255);
noStroke();
  }
  
  void draw() {
    
    a = a + speed;
    fill(255);
    noStroke();
    rect(a, b, 20, 50);
//  fill (0, 0, 2, 4);
//    rect(-10, -10, 2400, 2400);
    for (int x=0; x<width; x=x+55) {
      for (int y =0; y<height; y=y+55) {
//        fill(25);
        stroke(0.5);
        ellipse(x, y, 3, 3);
      }
      fill(c);
    stroke(1);
      rect(mouseX, mouseY, rectSize, rectSize);
    }
  
    rectSize = rectSize + 1;
  }
  void keyPressed() {
    if (key == '1') {
      c = color(#FF4040);
    } 
    if (key == '2') {
      c= color(#D1FFEE);
    } 
    if (key == '3') {
     c= color(#CCB9FF);
    }
    rectSize=1;
  }

