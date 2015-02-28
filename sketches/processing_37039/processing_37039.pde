
int direction = 2;
int numrect = 10000;
float[] x = new float[numrect];
float[] h = new float[numrect];
int p = 0;
int currenth = 0;

//void mousePressed(){
//}

void setup() {
  size (700, 400);
  smooth();
  noStroke();
  fill(255, 30);
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int i=0; i<p; i++) {
    float nh = h[i] + 40-constrain(abs(mouseX-x[i])*0.5,0,100);
    rect(x[i], 200, 20, nh);
  }
}

void mouseMoved() {
  x[p] = mouseX;
  h[p] = currenth;
  p = p+1;
  currenth = currenth + direction;
  if (currenth>400) {
    direction = -2;
  }
  if (currenth<0) {
    direction = +2;
  }
}
//
//void mouseReleased() {
//  currenth = 0;
//}
                                
