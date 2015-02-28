
float[] x = new float[4000];
void setup() {
  size(600, 600);
  smooth(); 
  fill(30, 40, 0, 20);
  for (int i = 0; i < x.length; i++) {
    x[i] = random(-11000, 200);
  }
}
void draw() {
  background(250, 50, 50);
  for (int i = 0; i < x.length; i++) {
    x[i] += 1;
    float y = 10;
    rect(x[i], x[i], 12, 12);
    
  }
}
