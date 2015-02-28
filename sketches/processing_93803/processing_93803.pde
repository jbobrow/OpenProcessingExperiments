
int N= 1000 ;
float th= 2.39997 ;
float c= 5 ;
float d= 5 ;
float r, a, x, y;

void setup()
{
  size(500, 500);
}
void draw()
{
  background(50);
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
 fill(255,255,0);
}

}



