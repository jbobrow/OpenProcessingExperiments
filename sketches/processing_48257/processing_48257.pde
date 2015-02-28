
class Pin
{
 //pin data
 float c1,c2,c3; 
 float x;
 float y;
 float sx;
 float sy;
  
  
 //constructor
Pin(float _y, float _x, float _s1, float _s2, float k, float g, float b)
{
  c1 = k;
  c2 = g;
  c3 = b;
 x = map(_x, 130, 60, -60, width);
 y = map(_y, 50, 20, -15, height);
 sx = map(_s1, 0, 30, 0, 30);
 sy = map(_s2, 0, 30, 0, 30);
}
  
 //functions
void display()
{
  noStroke();
  fill(c1, c2, c3);
  ellipse(x, y, sx*3,sy*3);
}
//
//void grow()
//{
//  if 
//  
//  
//}
  
}

