
float i;
float incr = 0.002;

  
void setup()
{
  size(750, 700);
  smooth();
  noStroke();
  rectMode(CENTER);
  
}
  
void draw()
{
  background(#60A03C);
  translate(width/2, height/2);
  
  i += incr;
  for(int j = 0; j < 20; j++)
  {
    fill(10*j,40+10*j);
    rotate(.5*i);
    rect(10*j,10*j,10*j,10*j);
  }

if( mousePressed) { //induces seizure
  i += .004;
  }
}



