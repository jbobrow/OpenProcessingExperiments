
void setup(){
size(300, 300);
background(255, 200, 0);
}
void draw(){
  drawLineBall(30, 20, 85, 75,
  300,
  85, 75, 20, 20,
  30, 20, 20, 20);
  
  drawLineBall(160, 30, 100, 200,
  5,
  100, 200, 30, 30,
  160, 30, 30, 30);
  
  drawLineBall(200, 150, 60, 80,
  10,
  60, 80, 10, 10,
  200, 150, 10, 10);
}

void drawLineBall (int a1, int b1, int a2, int b2, 
int c1, int d1, int e1, int d2, int e2,
int f1, int g1, int f2, int g2) {
  
line(a1, b1, a2, b2);
stroke(c1);
ellipse(d1, e1, d2, e2);
ellipse(f1, g1, f2, g2);
}


