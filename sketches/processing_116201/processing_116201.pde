
float[] x = new float[4000];
void setup() {
  size(900, 600);
  smooth(); 
  fill(30, 40, 0, 20);
  for (int i = 0; i < x.length; i++) {
    x[i] = random(-11000, 200);
  }
}
void draw() {
  background(0);
  for (int i = 0; i < x.length; i++) {
    x[i] += 100;
    float y = 10;
    stroke(mouseX, mouseY, mouseX);
    line(x[i], i, 1, 12);
    
  }
}
