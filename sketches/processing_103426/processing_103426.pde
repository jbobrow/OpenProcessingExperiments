
int side;
int count = 0;
int step = 256;

boolean colorState = true;

void setup()
{
  size(600, 600);
  //strokeWeight(4);
  side = max(width,height)/2;
}

void draw()
{
  background(0);
  noFill();
    
  pushMatrix();
  translate(side,side);
  
  for(int i=0; i<side; i++)
  {
    if((i+count)%side == 0)
    {
      stroke(0,255,255);
      rect(-i, -i ,i*2,i*2);
    }
    
    int j = side-i;
    if((j+count)%side == 0)
    {
      stroke(255,100,0);      
      ellipse(0, 0 ,i*2,i*2);
    }
  }
  
  popMatrix();
  
  count++;
}
