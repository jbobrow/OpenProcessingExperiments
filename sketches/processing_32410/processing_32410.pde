
float x;
float y;
float x1, y1;
float r=400;
float theta=0; 
void setup()
{
  size(600,600);
}
 
void draw()
{
  background(random(255));
  for(int i = 0; i < 30; i++)
  {
    for(int j=0;j<100;j++)
  {
  x=(height/2)-(r*cos(theta));
  y=(height/2)-(r*sin(theta));
  fill(random(255));
  ellipse(x,y,random(75),random(75));
  theta=theta+.4;
  x1=abs(300-mouseX);
  y1=abs(300-mouseY);
  r=sqrt((x1*x1)+(y1*y1));
  }
  }
  fill(255);  
}

