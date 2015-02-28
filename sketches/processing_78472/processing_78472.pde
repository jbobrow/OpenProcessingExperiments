
float amplitude = HALF_PI/2;

float freq = 1;

void draw()
{

  background(89);

  float angle = amplitude * cos(millis()/1000.0*freq);
 translate(width/6,9);
rotate(angle);
line(2,5,7,50);
ellipse(9,56,10,10);
}
