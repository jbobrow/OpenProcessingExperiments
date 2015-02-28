
void setup() {
  size(200, 200);
  stroke(0); 
  noLoop ();
}

void draw() {
  background(0); 
  for (int x= 0; x<200; x=x+20)
    for (int y= 0; y<200; y=y+20) {
      fill(x, y, 100);
      beginShape();
      vertex(4+x, 4+y);
      vertex(8+x, 4+y);
      vertex(8+x, 8+y);
      vertex(12+x, 8+y);
      vertex(12+x, 12+y);
      vertex(4+x, 12+y);
      endShape(CLOSE);
    }
}
