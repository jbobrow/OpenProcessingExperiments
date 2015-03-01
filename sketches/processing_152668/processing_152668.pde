
  float angulo=0;
  float t=0;
  float x=0;
  float y=0;
  float i=0;
  float j=0;
  float fase1=1;
  float fase2=0;
  float inicio=1;

void setup()

{

  size(750, 750);
  smooth();
  frameRate(9000);
}

void draw()

{
  inicio=1;
  t=0;
  angulo=0;
  background((mouseX+mouseY)/6);
  fill( 0, 250, 0);
  stroke(0, 250, 0);
  i+=PI/6;
  translate(width/2,height/2);
  rotate(i);
{
  translate(-width/2,-height/2);
  
while(inicio>0.9)
{
  
if(inicio==1)
{    
  
  x = 2*cos(angulo) * t + width/2;
  y = 2*sin(angulo) * t + height/2;
  rotate(j);
  ellipse( x, y, 2, 2);    
  angulo+=0.01; 
  t+=0.02;    
}
  if(x>=width)
{
  inicio=0;         

}
  if(y>=height)
{
  inicio=0;

}
}
}
  if(fase1==1)
{
  
  j+=PI;      
  println(j);
  if(j==163.36278)
{
  
  fase2=1;
  fase1=0;
}

}
  if(fase2==1)
{

  j-=PI;
  println(j);
  if(j==-163.3628)
{
  
  fase2=0;
  fase1=1;
}}}

