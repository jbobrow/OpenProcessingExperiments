
/*
Using other variables in loops.

 We can use the iterator inside the loop for lots of different things.
 In this example, we use x and y to change color.
 
 This sketch references code available in "Form + Code."
 * Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 */

int r = 0;
int g = 0;
int b = 0;

float r2 = 255;
float g2 = 255;
float b2 = 255;

int r3 = 255;
int g3 = 255;
int b3 = 255;

void setup() {
  size( 800, 800 );
  smooth();
  noFill();
}

void draw() {
  //background(203,191,255);

noStroke();
  for (int i = 0; i <= width; i += 1) {
    r2 -= .3;
    g2 -= .3;
    b2 -= .3; 
    fill(r2,g2,b2);
    rect(i,0,1,height);
    
  }
  r2 = 255;
  g2 = 255;
  b2 = 255;

noStroke();
  for (int x = 0; x <= width; x += 40) {
    r += 7;
    g += 7;
    for (int y = 0; y <= height; y+=40) {
      b += 7; 
      fill( r, g, b );
      triangle(x, y, x+40 , y, x+20, y+40);
    }
  }
  
  r = 0;
  g = 0;
  b = 0;
  
  
  
  
  noStroke();
  for (int x = 0; x <= width; x += 20) {
    for (int y = 0; y <= height; y+=20) {
  
      fill( r3, g3, b3 );
      triangle(x +7, y+23, x+20 , y, x+10, y+20);
    }
  }
  
  r3 = 255;
  g3 = 255;
  b3 = 255;
  
  
  
  //dark, small red triangles;
    noStroke();
  for (int x = 0; x <= width; x += 20) {
    for (int y = 0; y <= height; y+=20) {
  
      fill( r3, g3, b3 );
      triangle(x +10, y+28, x+20 , y, x+10, y+20);
    }
  }
  
  r3 = 21;
  g3 = 13;
  b3 = 144;
  
  
  
  
  
  
  //white raindrops
  noStroke();
  for (int x = 0; x <= width; x += 20) {
    for (int y = 0; y <= height; y+=20) {
  
      fill( r3, g3, b3 );
      triangle(x +10, y+28, x+20 , y, x+10, y+20);
    }
  }
  
  r3 = 255;
  g3 = 255;
  b3 = 255;
}
