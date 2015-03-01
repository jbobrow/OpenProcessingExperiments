
int a, b;
void setup() {
  size(800, 800);
  stroke(10,90);
}
void draw() {
  //background(0);
  fill(0,9);
  rect(0,0,width, height);
  fill(255);
  for (int i =0; i<1600; i++) {
    a = int(random(width));
    b = int(random(height));
    ellipse(a,b,5,6);
    
  }
}
