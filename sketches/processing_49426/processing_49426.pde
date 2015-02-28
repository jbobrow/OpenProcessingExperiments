
// --------------------------- Creating a new Array

float [] x = new float [100];
float [] y = new float [100];

void setup () {
  
  size (500, 500);
  smooth ();
  noStroke ();

// For Loop ------------------ Reset all the numbers in both arrays

  for (int i = 0; i < x.length; i++) {
    
   x[i] = 0;
   y[i] = 0;
    
  }
  
}

void draw () {
  
  background (0);
  
// For Loop ----------------- Now iterate 0 to 48 ------ Letting the item in each index becom the previous item.
  
  for (int i = 0; i < x.length - 1; i++) {
    
   x[i] = x[i+1];
   y[i] = y[i+1];
   fill (i, i, 255);
   ellipse (x[i], y[i], i/2, i/2);
    
  }
  
  
// --------------------------- Making the first circle follow the mouse
  
  x[x.length-1] = mouseX;
  y[y.length-1] = mouseY;
   
   
}
