
void setup()
{
  size(600, 600);
  background(0);
  frameRate(70);
}
int x=0;
void draw()
{
  background(0,0,0,255);
  fill(255);
  quad(29+x,251,100+x,251,100+x,299,29+x,299);
  fill(0);
  quad(501,250,600,250,600,300,501,300);
  quad(0,250,99,250,99,300,0,300);
  noFill();
  stroke(255);
  quad(100,250,500,250,500,300,100,300);
  stroke(0);
  strokeWeight(3);
  x=x+10;
  if (x>500)
  {
    x=1;
  }
  
}



