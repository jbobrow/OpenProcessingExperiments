
int i=0;
int col=0;
int x=0;
void setup() {
  size(500, 500);
  background(0);

  colorMode(HSB,100);
}
void draw() {
  while (i<100) {
    fill(col, 255, 255);
    rect(x, 250, 40, 40);
    col=col+1;
    x=x+5;
    i=i+1;
  }
  
  println(x);
}


