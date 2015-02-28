
color c;
int i, x1, y1, x2, y2;
int iterations;
float theta = 2f*PI/iterations;

void setup()
{
  size(700, 700);
  smooth();
  background(0);
  // frameRate(4);
}

void draw()
{
  translate(width/2, height/2);
  
  x1 = (int) random(width/2);
  y1 = (int) random(height/2);
  x2 = (int) random(width/2);
  y2 = (int) random(height/2);
  c = color( (int) random(255), (int) random(255), (int) random(255), (int) random(50));
  float decide = random(1);
  if(decide > 0.125)
  {
    stroke(c);
  }
  else
  {
    stroke(0);
  }
  
  int j = (int) random(8);
  iterations = (int) pow(2, j);
  
  for( i=0 ; i < iterations; i++)
  {
    line(x1, y1, x2, y2);
    rotate(2f*PI/iterations);
  }
}

void mousePressed()
{
  if( key == 115)
  {
    saveFrame("Screenshot.jpg");
  }
}

