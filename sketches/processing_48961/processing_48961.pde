
float[] x = new float[50]; 
float[] y = new float[50]; 

void setup() { 
  size(450,450); 
  smooth(); 
  noStroke(); 
  
  // reset all the numbers in both arrays
  for(int i = 0; i<x.length; i++) {
    x[i] = 0;
    y[i] = 0; 
  }
  
}
void draw() { 
  
  background(0); 
  
  // now iterate 0 to the 2nd last item in the array
  for(int i = 0; i<x.length-1; i++) {
    // and shift all the values down one item
    x[i] = x[i+1];
    y[i] = y[i+1]; 
    
    // set the fill colour to be darker the 
    // lower its index in the array
    fill(i*2);
    // and draw the circle at the position
    ellipse(x[i], y[i], i, i); 
    
  }
  
  // set the last items in the array to match the mouse position
  x[x.length-1] = mouseX; 
  y[y.length-1] = mouseY;
  
}
