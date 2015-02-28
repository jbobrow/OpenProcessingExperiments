
int a;
 
void setup()
{
size(250, 250);
frameRate(10);
fill(#25D8D7,10);
stroke(255);
smooth();
  
a = 0;
}
  
void draw()
{
a = a + 50;
  
rect(0, 0, width, height);
  
translate(width / 2, height / 2);
rotate(radians(a));
line(-height, -height, height, height);
}            
                
