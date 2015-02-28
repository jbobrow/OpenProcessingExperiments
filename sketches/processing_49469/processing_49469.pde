
float[] x = new float [50];
float[] y = new float [50];

void setup () {
  size (500, 500);
  smooth ();
  noStroke();
  
  for (int i = 0; i<50; i++) {
  x[i] = 0;
  y[i] = 0;
}
}
void draw () {
  background (0);
  
  for(int i = 0; i<49; i++) {
    x[i] = x [i+1];
     y[i] = y [i+1];
     ellipse (x[i], y[i], i, i);
  }
  x [49] = mouseX;
  y [49] = mouseY;
  }

                
                                
