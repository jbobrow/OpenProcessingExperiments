
//Victoria H, Animation1 CP1 mods 16/17
//http://miura-miura.webs.com/Animation.html

int x = 10;
int y = 5;
int z = 8;
int change = 170;
int fchange = -1;
int jchange = 1;
int xchange = 10;

void setup()
{
 size(300,200);
 frameRate(15);
}
void draw()
{
  background(25);
  fadeOut();
  movingPendulum();
  pendulum();
}
void fadeOut()
{
  fill(x,y,z,100);
  noStroke();
  ellipse(150,100,x,100);
  x = x + xchange;
  y = y + 5;
  z = z + 3;
}
int f = 160;
int j = 120;
void movingPendulum()
{
  stroke(59,31,8);
  strokeWeight(2);
  line(150,100,f,j);
  f = f + fchange;
  if(f < 140)
  {
    fchange = 1;
  }
  if(f >= 160)
  {
    fchange = -1;
  }
}
void pendulum()
{
  fill(x,y,z);
  ellipse(f,j,20,20);
  f = f + fchange;
  j = j + jchange;
  if(f < 140)
  {
    fchange = 1;
  }
  if(f > 160)
  {
    fchange = -1;
  }
    if(j > 130)
  {
    jchange = -1;
  }
  if(j < 120)
  {
    jchange = 1;
  }
}
