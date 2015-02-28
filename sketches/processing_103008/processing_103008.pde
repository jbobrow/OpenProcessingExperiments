
float circuloX;
float circuloY;
int rot=0;
float radio=0;
float colorin;
void setup ()
{
  size (300,300);
  background (0);
  colorMode (HSB);
  fill (0);
}

void draw ()
{
  radio=1;
 translate (width/2-40, height/2-40);
 colorin= (colorin+(dist (width/2,height/2,mouseX,mouseY))/4.2);
for ( int i=0; i< 3050; i+=3)

{ ellipse (circuloX+40,circuloY+40,40,40); circuloX= radio *cos(radians(i));
circuloY= radio *sin(radians(i)); stroke ((colorin+i)%255,255,255); 
radio=radio+.2;}
 

}


