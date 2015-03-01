
int num = 60;
int[] x = new int[num];
int[] y = new int[num];
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
}
 
void draw() {
  background(0);
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;  
  y[0] = mouseY;  
  for (int i = 0; i < x. length; i++) {
    fill(255, 255,0);
    ellipse(x[i], y[i], 40, 40);
    fill(0);
    ellipse(x[i]-8, y[i]-5, 3, 3);// left eye
    ellipse(x[i]+8, y[i]-5, 3, 3);// right eye
    arc(x[i], y[i], 10, 8, 0,PI); // smile
    
  }
}


