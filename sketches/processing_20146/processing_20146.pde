
//A simple visualization of a sine wave.
//M. Kontopoulos 2011
float xpos=0.0;
float ypos=0.0;
float angle = 0.0;
float scaler;

void setup()
{
  size(800, 100);
  smooth();
  scaler = height/2; //change this around!
}

void draw()
{
  xpos++;

  ypos = height/2 + (sin(angle) * scaler);
  angle+=0.1; // change this around!

  ellipse(width/2, ypos, 10,10);
  ellipse(xpos,ypos, 10,10);
}


