
float turn = .005;
int x = 255;
int y = 0;
int z = 255;

void setup()
{
  size(400, 400, P3D); 
}

void draw()
{
  background(0);
  translate(mouseX,mouseY, 0);
  rotateX(mouseX+turn);
  rotateY(mouseY+turn);
 
  stroke(255);
  fill(x,y,z,100);
  box(100);
}
   
 void mousePressed() //changes color of box
 {
   x = x - 10;
   if (x <=0)
   {
     x = x +50;
   }
   if (x >= 255)
   {
     x =x -50;
   }
   y = y + 10;
   if (y <= 0)
   {
     y = y +50;
   }
   if (y >= 255)
   {
     y= y- 50;
   }
   z = z - 10;
   if (z <=0)
   {
     z = z +40;
   }
   if (z >= 255)
   {
     z = z - 40;
   }
 }
 /**Use your mouse to rotate the cube. Click the box to change its color from magenta to green.
 */
