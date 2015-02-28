
void setup() {
  size(858,858);

  background(255);
  fill(0,255,100, 50);
  noStroke();
  for (int i = 1; i<=50; i= i+1) {
    rect (i*8,i*8,50-i,50);
  }
  fill(255,0,100,50);
  for (int i = 1; i<=50; i= i+1) {
    rect (400+i*8,400+i*8,0+i,50);
  }
}
