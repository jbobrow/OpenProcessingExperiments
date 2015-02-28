
float amplitude = HALF_PI/2;
float freq = 1;

void draw()
{
  
  background(211);
  float angle = amplitude * cos(millis()/1000.0*freq);
 translate(width/2,0);
rotate(angle);
line(0,0,0,50);
ellipse(0,50,10,10);
}


