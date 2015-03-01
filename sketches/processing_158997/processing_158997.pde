
// Draw a Fibonacci Spiral
// November 22, 2010
// from: http://processing.org/discourse/yabb2/YaBB.pl?num=1234653729

void setup() {
size(400, 400);
smooth();
background(255);
strokeWeight(0);   // Thicker

drawFibonnaciTiles(400);
}

void drawFibonnaciTiles(int iterations) 
{ 
scale(2);
 int r = 2;      // red range 0 - 255
 int g = 10;     // green range 0 - 255
 int b = 25;     // blue range 0 - 255
 stroke(1, 255); 
 int posx = width/2;
 int posy = height/2;
 int fibprev = 1;
 int fibnew = 0;
  for (int fib = 1; fib < iterations;) {    
      for (int a = 0; a < 4; a++) {
      fibnew = fib + fibprev;
      fibprev = fib;
      fib = fibnew;
           r = r + 0;
           g = g + 10;
           b = b + 1;
           fill(r, g, b);
           strokeWeight(0);   // Thin
       rect(posx, posy, fib, fib);
        if (a == 0) {
          strokeWeight(2);   // Thicker
          arc(posx + fib, posy + fib, fib*2, fib*2, PI, TWO_PI-PI/2);
          posx = posx + fib;
          } else if (a == 1) {
              strokeWeight(2);   // Thicker
              arc(posx, posy + fib, fib*2, fib*2, TWO_PI-PI/2, TWO_PI);
              posx = posx - fibprev;
              posy = posy + fib;
              } else if (a == 2) {
                 strokeWeight(2);   // Thicker
                 arc(posx, posy, fib*2, fib*2, 0, PI/2);
                 posx = posx - fib - fibprev;
                 posy = posy - fibprev;
                 } else if (a == 3) {
                   strokeWeight(2);   // Thicker    
                   arc(posx + fib, posy, fib*2, fib*2, PI/2, PI);
                   posy = posy - fib - fibprev;
                 }
             }
          } 
// save("fibonacci_6");  // save a tif file
}
