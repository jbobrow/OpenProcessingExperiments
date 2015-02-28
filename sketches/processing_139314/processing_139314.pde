
int linelength = 100;
int[] x = new int[linelength];
int[] y = new int[linelength];
color[] c = new color[linelength];


int counter = 0;

void setup() {
  size(600,600);
  background(255);
  smooth();
}

void draw() {
  
  stroke(50, 50, 150);
  fill(150, 150,255);
  
  if ( keyPressed ) {
    background( random(0, 255), random(0, 255), random(0, 255) );
  }
  
  int i = 0;
  while ( i < x.length ) {
    ellipse( x[i], y[i], 10, 10 );
    i = i + 1;
  }
  
  if ( mousePressed ) {
    if ( counter >= x.length ) {
      x = expand(x);
      y = expand(y);
    }
    x[counter] = mouseX;
    y[counter] = mouseY;
    
    if ( key == 'r' ){
      c[0] = (50);
    }
    
    counter = counter + 1;
    }
}


