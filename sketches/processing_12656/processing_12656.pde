

int cols = 20;
int r = 0;
int g = 0 ;
int b = 0;
void setup() {
  size(500,500);
}
void draw() 
{
  frameRate(1);
for (int x = 5; x < width; x+=5) 
{
  for (int y = 5; y < height; y+=5)
{
   stroke(0);
    fill(r,g,b);
    rect(x,y,cols-1,cols-1);
}
    r +=mouseX+ random(205);
      g += mouseX+random(205);
	 b += mouseX+random(205);
  if ( r > 255 )
{
    r = 0;
}
  if ( g > 255 )
{
    g = 0;
}
  if ( b > 255 )
{
    b = 0;
}
} 

}

