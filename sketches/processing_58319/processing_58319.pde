
   color c1;
   color c2;
   
void setup ()
{
  size(500, 400);
  colorMode(HSB, 100);
  
   c1 = color(random(100),100,100);
   c2 = color(random(100),100,30);

//   dmeter = diameter;
for(int y = 0; y < height; y++)
{
  float decimal = map(y, 0, height, 0, 1);
  color newcolor = lerpColor(c1, c2, decimal);
  stroke(newcolor);
  line(0, y, width, y);
 
}

}

void draw()
{
/*
    for int(int dmeter = 0; dmeter < maxradius; dmeter++)
     {
      float n = map(dmeter, 0, maxradius, 0, 1);
      color newcircle = lerpColor(c1, c2, n);
      stroke(newcircle);
      ellipse(width/2, height/2, dmeter, dmeter);
*/
 
 }
 



