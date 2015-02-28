
int num = 50; 
int[] x = new int[num]; 
int[] y = new int[num];
void setup() { 
  size(500, 500); 
  noStroke(); 
  smooth(); 
  fill(255, 102);
}
void draw() { 
  background(0);
  for (int i = num-1; i > 0; i--) {
    x[i] = x[i-1]; 
    y[i] = y[i-1];
  }
  x[0] = mouseX; 
  y[0] = mouseY; 
  for (int i = 0; i < num; i++) {
    stroke(255-(i*(255/num)));
    if(i > 0) line(x[i], y[i], x[i-1], y[i-1]);
    noStroke();
    fill(255, 255-(i*(255/num)));
    ellipse(x[i], y[i], i/2.0, i/2.0);
  }
}

