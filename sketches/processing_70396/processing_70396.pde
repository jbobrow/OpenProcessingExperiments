
//Jun Min Zhong, CP1, Animation, Mods 16-17

int y=0;
int a=10;
int b=10;
int x=0;
void setup()
{
  size(1000,1000);
  noStroke();
  fill(100);
}
void draw()
{
  background(0);
 
  //center
  fill(100);
  triangle(500,y,600,y-50,400,y-50);
  triangle(500,y,600,y+50,400,y+50);
  fill(200);
  rect(475,y-5,50,10);
  
  //left
  fill(100);
  triangle(500-200,1000-y,600-200,1000-(y-50),400-200,1000-(y-50));
  triangle(500-200,1000-y,600-200,1000-(y+50),400-200,1000-(y+50));
  fill(200);
  rect(475-200,1000-(y+5),50,10);
  
  //right
  fill(100);
  triangle(500+200,1000-y,600+200,1000-(y-50),400+200,1000-(y-50));
  triangle(500+200,1000-y,600+200,1000-(y+50),400+200,1000-(y+50));
  fill(200);
  rect(475+200,1000-(y+5),50,10);
  y=y+a;
  if(y>1000)
  {
    a=-10;
  }
  if(y<0)
  {
    a=10;
  }
  
  //Projectile
  ellipse(x,500,50,50);
  x=x+b;
  if(x>1000)
  {
    b=-10;
  }
  if(x<0)
  {
    b=10;
  }
}
