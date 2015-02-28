
int[] colour = {1, 2, 4, 6, 3};
int [] shapeE = {1, 2, 3, 5, 8};
int[] direction = {2, 4, 6};
void setup()
{
  background(0);
size(200, 200);
}
void draw()
{
if ((mouseX < 20) || (mouseX > 180) || (mouseY > 180))
{
colour[0] = color( random(255), random(255), random(255), random(255));
colour[1] = color( random(255), random(255), random(255), random(255)); 
colour[2] = color( random(255), random(255), random(255), random(255)); 
colour[3] = color( random(255), random(255), random(255), random(255)); 
colour[4] = color( random(255), random(255), random(255), random(255)); 


fill(colour[1]);
rect(shapeE[1], 50, 40, 60);
fill(colour[0]);
rect(150, shapeE[2], 20, 90);
fill(255, 50, 0);
ellipse(100, 105, 80, 80);
fill(50, 255, 0);
triangle(100, 70, 130, 130, 70, 130);
fill(colour[1]);
ellipse(140, shapeE[0], 50, 20);

shapeE[0] = shapeE[0] + direction[0];
   shapeE[1] = shapeE[1] + direction[1];
   shapeE[2] = shapeE[2] + direction[2];



if (shapeE[0] > 180 || shapeE[0] < 0)
{
  direction[0] = direction[0] * -1;
}
   
   if (shapeE[1] > 80 || shapeE[1] < 0)
   {
   direction[1] = direction[1] * -1;
   }
   if (shapeE[2] > 80 || shapeE[2] < 0)
  {
    direction[2] = direction[2] * -1;
  }
   if (shapeE[3] > 180 || shapeE[3] < 0)
   {
   direction[3] = direction[3] * -1;
   }

 }
}
