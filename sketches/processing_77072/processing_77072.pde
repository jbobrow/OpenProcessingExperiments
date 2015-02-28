
/* TrigMountains
   Version: 1.0, 2012-10-26
   By Phillip Kent
   http://www.phillipkent.net
   
   Illustrates the use of randomness to generate visual richness.
   In each drawing cycle, a sine-shaped solid is plotted, with random magnitude, period
   and colour.
*/

int j;
float x, funcx;

void setup() {
  size(640,480);
  smooth();
  background(255);
  fill(255,0,0);
  frameRate(1);
}

void draw() {  
   float h = random(1);
   float p = random(0.15,1);
   
   stroke(int(random(255)),int(random(255)),int(random(255)));
   for (j=0; j<=width; j++) { 
     x = float(j);
     funcx = h*height*(1+sin(x/(50*p)))/2;
     line(x,height,x,height-funcx);
   }
}

