
float i;
int no=20;
float side1 =200;
float d = 5;     
float incr = 0.002;
int c=1;
 
void setup()
{
  size(650, 600);
  smooth();
  noStroke();
  rectMode(CENTER);
 
}
 
void draw()
{
  background(255);
  translate(width/2, height/2);
 
  i += incr;
  for(int j = 0; j < no; j++)
  {
    fill(5*j,40+10*j);
    rotate(i);
    rect(10*j,10*j, side1 - j * d, side1- j * d);
  }
}

