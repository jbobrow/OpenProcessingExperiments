
int[] circle_x = new int[5];
 
void setup()
{
  size(800,800); 
 
  circle_x[0] = 20;
  circle_x[1] = 60;
  circle_x[2] = 100;
  circle_x[3] = 140;
  circle_x[4] = 180;
 
  fill(255,0,0);
}
 
void draw()
{
    for (int i = 0;i < 5;i++)
    {
      ellipse(i*100,i*100,circle_x[i],circle_x[i]); 
    }
}
