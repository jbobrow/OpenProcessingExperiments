
//http://www.openprocessing.org/sketch/49075//
float [] x = new float [50];
float [] y = new float [50];
 
void setup () {
   
  size (1200,850);
  smooth();
  noStroke();
   
  for (int i = 0; i<50; i++) {
    x[i] = 0;
    y[i] = 0;
     
  }
   
}
 
void draw () {
   

   
  for (int i=0; i<49; i++) {
    x[i] = x [i+1];
    y[i] = y [i+1];
     
    fill (i*2); //colour i is the circles devided by two makes it lighter
    ellipse (x[i], y[i], i, i);
     
  }
   
  x[49] = mouseX;
  y[49] = mouseY;
   
}


