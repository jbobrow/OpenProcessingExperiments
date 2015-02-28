
/*
Fermat's Spiral

The location of the nth point in polar coordinates:
  r = c*sqrt(n)
  phi = n*a
  where c and a are constants chosen by the user.

LEFT/RIGHT ARROW    = -/+ divergence angle (a)  
DOWN/UP ARROW       = -/+ scaling factor (c)
Z/X                 = -/+ number of points (N)
SPACE               = reset default values
*/

float a = 137.5;     // divergence angle
float c = 5.0;       // scaling factor
int N = 1000;        // number of dots

void setup() {
  size(400,400);
  noLoop();
}


void draw() {
  print("c = " + c + "   a = " + a + "   N = " + N + "\n");
  background(0);
  float r, phi;                                      // polar coordinates
  int j, i;                                          // row, column coordinates 
    
  loadPixels();
  for (int n=0; n<N; n++) {
      phi = n*a;                                     // calculate phi and r for nth point
      r = c*sqrt(1.0*n);
      j = int( r*cos(phi) ) + width/2;               // convert polar coords to row/column
      i = int( r*sin(phi) ) + height/2;
      if ( (0<=i)&&(0<=j)&&(i<width)&&(j<height) ) {
        pixels[j + i*width] = color( int(255*2*r/width), int(255 - 255*2*r/width), 0 );
      }    
  }
  updatePixels();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)     { c = c + 0.1; }
    if (keyCode == DOWN)   { c = c - 0.1; }
    if (keyCode == LEFT)   { a = a - 0.1; }
    if (keyCode == RIGHT)  { a = a + 0.1; }
  }
  if (((key=='z')||(key=='Z'))&&(N>0)) { N = N - 50; }
  if ((key=='x')||(key=='X'))          { N = N + 50; }
  if (key == ' ')         { c=5.0; a=137.5; N=1000;} 
  redraw();
}
  
  


