
/**
 Now we add together modulation and Lissajou figures to get some 
 really interesting curves. Some look like random messes, and some 
 will be elegant and complex. Explore different values of a and b
 and the new control values aM and bM, which control the frequency of the 
 the modulation.
 
 C. Andrews
 2014-01-27
 **/

float phi =  PI/2;
int numPoints = 500;
int amplitude = 200;
float a = 6;
float b = 8;

float aM = 1;
float bM = 1;
void setup() {
  size(600, 600); 
  noFill();
  smooth();
}


void draw() {
  background(255);

  translate(width/2, height/2);

  float x = 0;
  float y = 0;

  beginShape();
  for (int i = 0; i <= numPoints; i++) {
    float angle = map(i, 0, numPoints, 0, TWO_PI);
    x = sin(a * angle + phi)*sin(aM*angle + phi)*amplitude;
    y = sin(b * angle)*sin(bM*angle + phi)*amplitude;
    vertex(x, y);
  }
  endShape();
}



