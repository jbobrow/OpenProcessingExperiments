
int num = 50;
float inc=0.02;
int[] x = new int[num];
int[] y = new int[num];
void setup() { 
  size(800, 600); 
  noStroke(); 
  smooth(); 
  fill(255);
}
void draw() {
  background(0);
  // Shift the values to the right 
  for (int i = num-1; i > 0; i--) {
  x[i] = x[i-1];
  y[i] = y[i-1];
}
x[0] = mouseX;
y[0] = mouseY;
for (int i = 0; i < num; i++) {
  rotate(inc);
  rect(x[i], y[i], i/2.0, i/2.0);
  inc=inc+0.01;
}
}


