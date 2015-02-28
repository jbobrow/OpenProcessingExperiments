
float[] x = new float [200];
float[] y = new float [200];

void setup () {
  size (500, 500);
  smooth ();
  noStroke();
  
  //reset all the number in both arrays 
  
  
  for (int i = 0; i<50; i++) {
  x[i] = 0;
  y[i] = 0;
}
}
void draw () {
  background (0);
  
  //now iterate 0 to 48
  
  for(int i = 0; i<x.length-1; i++) {
    x[i] = x [i+1];
     y[i] = y [i+1];
     fill (i, i, 200); 
     ellipse (x[i], y[i], i/4, i/4);
  }
  x [x.length-1] = mouseX;
  y [y.length-1] = mouseY;
  }

                
                                
