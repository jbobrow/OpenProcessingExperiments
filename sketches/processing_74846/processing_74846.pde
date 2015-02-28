
// Keana M., CP1, mods 4-5, one hundred random shapes assignment


boolean isbox = true;
void setup()
{
  size(500, 500, P3D);
  noStroke();
  frameRate(1);
}
void draw()
{
  background(0);
  lights();
  int x = 1; 
  while (x<=500)
  {
    int size = int(random(20, 40));
    fill(random(0, 255), random(0, 255), random(0, 255)); 
    int offsetX = int(random(0, 500));
    int offsetY = int(random(0, 500));
    translate(offsetX, offsetY, 0);
    {
      if (isbox == true)
      {
        box(size);
      }
      else
      {
        sphere(size);
      }
      translate(-offsetX, -offsetY, 0);
      x = x+5;
    }
  }
}
void keyTyped()
{
  isbox = !isbox;
}
