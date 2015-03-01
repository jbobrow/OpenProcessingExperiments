
void setup() {
  size(600,600);
background (28, 57, 187);
strokeWeight(6);
strokeCap(ROUND);
}


void draw() {
  background (28, 57, 187);
  for (int i=0; i<35; i++) {
    
    int x1=(int) random(50,200);
    int y1=20+i*15;
    int x2=x1+ (int) random(10,400);
    int y2=20+i*15;
    int col=(int) random(1,200);
    stroke(col);
line(x1, y1, x2, y2);
  }
}

