
/**
 Another refinement we can make to our simple oscillations is to 
 use two functions instead of one. 
 
 Our general form looks like this:
 
 x = A sin(a*angle+phi)
 y = B sin(b*angle)
 
 This forms a figure called a Lissajous figure, and it will form
 a closed figure centered on the origin, as x and y are restricted to 
 oscillate between -/+A and -/+B respectively. Different values for
 a and b create drastically different shapes as the frequencies interact.
 
 In this example, a and b are incremented in small intervals so we can
 slowly see how the figure changes as they change and grow.
 
 
 C. Andrews
 2014-01-27
 **/



float phi =  PI/2; // phase shift x by pi/2 (essentially making it cosine)
int numPoints = 300;
int amplitude = 100; // we will set A and B to be the same amplitude

// start a and b both at 1 (which is the equation for a circle)
float a = 1;
float b = 1;
void setup() {
  size(600, 600); 
  noFill();

  smooth();
}


/**
 If you look carefully, you will find this is exactly the same as the 
 sine wave, we have just added another harmonic function on x.
 **/
void draw() {
  background(255);

  translate(width/2, height/2);

  float x = 0;
  float y = 0;

  beginShape();
  for (int i = 0; i <= numPoints; i++) {
    float angle = map(i, 0, numPoints, 0, TWO_PI);
    x = sin(a * angle + phi)*amplitude;
    y = sin(b * angle)* amplitude;
    vertex(x, y);
  }
  endShape();
  a += 0.01;
  b += 0.005;
}



