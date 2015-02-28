
//Animation(Star)
//Lucky 
float x=50;
float y=500;
float z=50;
float u=500;
float changez=1;
float changeu=2;
float changex=1;
float changey=2;
void setup()
{
  background(0);
  size(600,600);
}
void draw()
{
  fill(0);
  rect(20,475,570,50);
  noStroke();
  fill(250,250,45,10);
  ellipse(x,y,40,40);
  ellipse(z,u,30,30);
  z=z+changez;
  u=u-changeu;
  x=x+changex;
  y=y-changey;
  if (y<0)
  {
    changey=-2;
  }
  if(y>500)
  {
    changey=2;
  }   
  if (x>550)
  {
    changex=-3;
    changey=-2;
  }
  if (x<50)
  {
    changey=0;
    changex=2;
  }
  if (x<0)
  {
    changey=-1;
    changex=0;
  }
  if (u<0)
  {
    changeu=-2;
  }
  if (z>550)
  {
    changez=-1;
    changeu=2;
  }
  if (z<50)
  {
   changez=1;
   changeu=2;
  }
 }
