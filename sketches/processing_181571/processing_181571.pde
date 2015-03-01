
  /*
  
  Amanda Mahoney-Fernandes
  Visualize 60 Secs
  Excercise III
   watched youtube tutorial to learn how to make clock~ see ~ https://www.youtube.com/watch?v=tZ_xQUqUgVM
  
 */

int x1, y1;
float secondsRadius; // determines seconds radius


void setup() {
  size(500, 500); // determines canvas size
  background(0); // determines background color to be white

  float radius = min(width, height) /1.25; 
  secondsRadius = radius *1; //radius of second stroke

  x1 = width /2; //determines width
  y1 = height /2;  //determines height
}

void draw() {  
  background(255); // draw white background

  int start = 60;
  float strokeWeight = .05;
  float line;
  for (int a = 0; a < 100; a++) {
    line = map(second(), 0, start, 0, TWO_PI) - HALF_PI;
    stroke(64,224,208);
    strokeWeight(strokeWeight);
    line(x1, y1, x1 + cos(line) * secondsRadius, y1 + sin(line) * secondsRadius);
    strokeWeight(1);
    strokeWeight = strokeWeight + .05;
    start = start + 1;
  }  
  
  }

