
//Justin J. Doubling Shapes, CP1, Mods 16/17
int limiter=1;
void setup()
{
  size(500, 500, P3D);
  frameRate(1);
  textSize(32);
}
void draw()
{
  background(0);
  noStroke();
  lights();
  for (int s=1; s<=limiter; s++)
  {
    int shiftx=int(random(-251, 251));
    int shifty=int(random(-251, 251));
    int shiftz=int(random(-6, 6));
    translate(250+shiftx, 250+shifty, shiftz);
    fill(int(random(256)), int(random(256)), int(random(256)));
    sphere(10);
    translate(-(250+shiftx), -(250+shifty), -shiftz);
    translate(0, 0, 20);
    fill(255, 0, 0);
    text(limiter, 235, 235);
    translate(0, 0, -20);
  }
  limiter*=2;
  if (limiter==4096*8)
  {
    limiter=1;
    println("OVER 9000 SPHERES! THE PROGRAM HAS RESET!");
  }
}

