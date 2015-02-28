
float N = 1000;
float th = 2.39997 ;
float c = 4 ;
float d = 4 ;
float r;
float x;
float y;
float a;

void setup()
{
size (600,600);
}
void draw()
{
noFill();
translate(width/2,height/2);
float sc = map(mouseX, 0,width, 1.0,0.1);
float th = map(mouseY, 0,height, 0, HALF_PI);
for (float i=1 ; i<=N ; i++)
{
  r=c*sqrt(i);
  a=i*th;
  x=r*cos(a);
  y=r*sin(a);
  
stroke(i*5);
  ellipse(x,y,d,d);
  fill(26,26,26);
}
}


