
float N=3000;
float th=2.39997;
float c=4;
float d=4;
float r,a,x,y;
size(500,500);
translate (width/2, height/2);
for(int i=1 ; i<=N ; i++)
{
  r=c * sqrt(i);
  a=i*th;
  x=r*cos(a);
  y=r*sin(a);
 ellipse(x,y,d,d);
 
}





