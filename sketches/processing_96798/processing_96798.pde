
 /*borrowed from processing.org 
*/

int N= 1000 ;
float th= 2 ;
float c= 5 ;
float d= 4 ;
 
float r, a, x, y;
 
void setup()
{
  size(600, 600);
} 

void draw()
{
  background(220);
  translate(width/2, height/2);
 
  th = map(mouseX, 0, width, 0, HALF_PI);
  c  = map(mouseY, 0, height, 0, 5*d);
 
    for (int i=1 ; i<=N ; i++ )
  {
    r= c * sqrt(i) ;
    a= i * th  ;
    x= r * cos(a) ;
    y= r * sin(a) ;
 
    ellipse(x, y, d, d);
  }
}



