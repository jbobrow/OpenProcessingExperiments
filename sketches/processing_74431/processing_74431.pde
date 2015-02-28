
//Justin J. One Hundred Random Shapes, CP1, Mods 16/17
void setup()
{
  size(500, 500, P3D);
  frameRate(1);
}
void draw()
{
  background(0);
  int s=0;
  noStroke();
  lights();
  while (s<=150)
  {
    int shiftx=int(random(-251, 251));
    int shifty=int(random(-251, 251));
    int shiftz=int(random(-11, 11));
    translate(250+shiftx, 250+shifty, shiftz);
    fill(int(random(256)), int(random(256)), int(random(256)));
    sphere(10);
    translate(-(250+shiftx), -(250+shifty), shiftz);
    s++;
  }
}


