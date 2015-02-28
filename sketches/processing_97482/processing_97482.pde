
float N= 500 ;
float th= 2.39997 ;
float c= 4 ;
float d= 4 ;
float r,a,x,y;

void setup()
{
  size(500, 500);
} 

void draw()
{
  background(211);
  noFill();
  translate(width/2, height/2);

  float c = map(mouseX, 0,width, 4,10);
  float th = map(mouseY, 0,height, 0, HALF_PI);
  for (int i=1 ; i<=N ; i++)
  {
    r = c*sqrt(i);
    a = i*th;
    x = r*cos(a);
    y = r*sin(a);
    
    ellipse(x,y,d,d);
  }
}



