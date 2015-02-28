

int RED = 150;
int GREEN = 25;
int BLUE = 100;
int ellipseSize = 120;

void setup(){
  size(300, 600);
  background(RED, GREEN, BLUE);
  }
  void draw(){
    fill(80);
    stroke(0);
    rect(50, 100, 65, 300);
    ellipse(150, 300, ellipseSize, ellipseSize);
    
    stroke(140, 140, 140);
    line(40, 500, 260, 500);
  }




