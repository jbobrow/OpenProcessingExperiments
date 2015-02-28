
float x,y,ang, amplitud;
boolean flag = true;
int w = 800; int h = 600; 

void setup()
{
  size (800,600);
  background(0);
  ang = 0;
  x = 0;
  amplitud = 120;
  
  
}

void draw()
{
  while( x < w)
  {
    for( int i = 1; i < h/amplitud; i+= amplitud)
    {
      trama1(x , h/(i * amplitud/2));
       x+=0.2;
    }
  }// end while
  
}  

void trama1(float x,float posY)
{
  y = posY * sin(ang) * amplitud;
  stroke((x+y)/2,x,y);
  strokeWeight(7);
  point(x,y);
  
  y = posY + sin(ang) * amplitud;
  
  stroke(x,(x+y)/2,y);
  strokeWeight(5);
  point(y + w/2,x);
  
  stroke(x,y,(x+y)/2);
  point(x,y + h/2);
  
  if(flag == true) { ang++; }
  if ( ang >= 180) { flag = false; }
  if (flag == false) { ang--;}
  if ( ang <= 0 ) {flag = true;}
}
