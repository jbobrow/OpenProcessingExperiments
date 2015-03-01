
int num = 50;
int[] x = new int[num];
int[] y = new int[num];
void setup() { 
  size(1000, 600); 
  noStroke(); 
  smooth(); 
  
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
  // Draw the circles
  for (int i = 0; i < num; i++) {
    pushMatrix();
    translate(i,i/2);
    rotate(i);
    noStroke();
    fill(200,0,0 ,180);
    ellipse(x[i], y[i], i/1.5, i/1.5);
    stroke(250);
    line(x[i],y[i],x[5],y[5]);
   line(x[i],y[i],x[5],y[5]);
    line(x[i],y[i],x[15],y[15]);
    popMatrix();
  }
}



