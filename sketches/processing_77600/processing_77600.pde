
// Leyli Guliyeva
// copyright 2012
// homework 11

final int MAX = 150;

int [] x;
int [] y;
int [] diam;
int [] dx;
int [] dy;
color [] col;

void setup () {
  
  x = new int [ MAX ];
  y = new int [ MAX ];
  diam = new int [ MAX ];
  dx = new int [ MAX ];
  dy = new int [ MAX ];
  col = new color [ MAX ];
  
  size (600, 600);
  smooth ();
  
  intArray (x, 0, width-50);
  intArray (y, 60, height-50);
  intArray (diam, 40, 200);
  intArray (dx, 2, 6);
  intArray (dy, 2, 6);
  intColArray (col);

}

void intArray (int [] anyArray, int low, int high){
  for (int i=0; i < anyArray.length; i++) {
    anyArray[i] = int (random (low, high));
  }
}

void intColArray (color [] anyArray) {
  for (int i=0; i < anyArray.length; i++) {
    anyArray [i] = color (random (255), 60);
  }
}

void draw () {
  prepScreen ();
  drawCircles ();
  moveCircles ();
}

void moveCircles () {
  for (int i=0; i <x.length; i++) {
    x [i] = x[i] + dx[i];
    if (x[i]>width || x[i] < 0) {
    dx[i] = -dx[i];
    }
   y [i] = y[i] + dy[i];
   if (y[i] > height || y[i]< 0) {
   dy[i] = -dy[i];
   }
  }
}  

void drawCircles () {
  for (int i=0; i < MAX; i++) { 
     fill (col [i]); 
      noStroke ();
      ellipse (x[i], y[i], diam[i], diam[i]);
      fill(255, 180, 180, 180);
      ellipse(x[i], y[i], diam[i]/3, diam[i]/3);
}
}

void prepScreen () {
  fill (255, 180, 180);
  noStroke ();
  rect (0, 0, width, height);
}

