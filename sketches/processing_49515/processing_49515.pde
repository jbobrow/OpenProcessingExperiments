
  //-------------------------------Creating Array
float [] x = new float [50];
float [] y = new float [50];

void setup() {
  size (500, 500);
  smooth();
  noStroke();  
  
  //-------------------------------For looping (resetting numbers for arrays)
  for (int i = 0; i < 50; i++) {
    x[i] = 0;
    y[i] = 0;
  }
}

void draw() {

  background (0);
  
  //-------------------------------Interating 0 to 48
  for (int i=0; i<49; i++) {
    x[i] = x[i+1];
    y[i] = y[i+1];
    
   //-------------------------------Drawing circle
    fill (i, i, 150);
    ellipse (x[i], y[i], i, i);
  }

  //-------------------------------Have loop follow mouse
  x[49] = mouseX;
  y[49] = mouseY;
}

