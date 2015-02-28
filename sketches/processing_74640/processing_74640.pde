
//Derek Kwong Mods 14/15
void setup()
{ 
  size(500, 500, P3D);

}
void draw()
{
  background(0);
  int x=1;
  rotateX(0.2);
  rotateY(0.5);
  while (x<301)
  { 
    translate(random(0, 500), (random(0, 500)), -100);
    rotateX(0.2);
    rotateY(0.5);
    stroke(int(random(0, 255)));
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    box(30);

    x++;
  }
}
