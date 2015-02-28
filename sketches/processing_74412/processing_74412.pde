
void setup()
{
  size(450, 450, P3D);
  frameRate(1);
}

void draw()
{
  background(0);
  pointLight(255,255,255,mouseX,mouseY,100);
  int time = 1;
  while (time <=100)
  {
    pushMatrix();
    int size = int(random(3, 50));
    int x = int(random(50, 400));
    int y = int (random(50, 400));
    translate(x, y, 0);
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    box(size);
    time++;
    popMatrix();
  }
}
/** Move your mouse around the screen to move the light shining on the boxes 
*/
