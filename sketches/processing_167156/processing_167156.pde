
float c=2;
 
void setup() {
  size(400, 400);
  background(0);
}
 
void draw() {
 
  for (int i=0; i<100; i++) {
    if (i<50) {
      stroke (255, 0, 0);
    } else {
      stroke (255);
    }
    c=c+1;
    noFill();
    ellipse(i*100, i*100, c, c);
  }
}
