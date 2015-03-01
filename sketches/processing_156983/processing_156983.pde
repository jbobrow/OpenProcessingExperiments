
float angulo=0;
  float n=0;
  float x=0;
  float y=0;
  float q=0;
  float fase=0;
  float inicio=1;

void setup()
{
  size(500,500);
  smooth();
  frameRate(10000);
}
void draw()
{
  inicio=1;
  n=0;
  angulo=0;
  background(255);
  stroke(250, 0, 0);
  q+=PI/6;
  translate(width/2,height/2);
  rotate(q);
{
  translate(-width/2,-height/2);
   while(inicio>0.9)
{
   if(inicio==1)
{    
  x = 2*cos(angulo) * n + width/2;
  y = 2*sin(angulo) * n + height/2;
  fill(0);
  ellipse( x, y,10,10);    
  angulo+=0.01; 
  n+=0.02;    
        }
  if(x>=width+150)
{
  inicio=0; 
          
  
}
  if(y>=height+150)
  {
  inicio=0;
          
}
}
}
}
