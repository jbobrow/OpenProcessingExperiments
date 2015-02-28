
int[] posY = {0,40,80,120,160};
int x;
int speedX;
int x = 0;
int speedX = 1;        

void setup()
{
  size(200,200);
  }

void outline()
{
  stroke(0);
  fill(0);
  rect(0,0,width,height);
  stroke(255);
  fill(255);
  rect(20,0,160,180);
}

void draw()
{
  outline();
rect(x,posY[0],20,20);
rect(x,posY[1],20,20);
rect(x,posY[2],20,20);
rect(x,posY[3],20,20);
rect(x,posY[4],20,20);
x = x+speedX;
if(x+20>180||x<20)
speedX=speedX*-1;
}
