
//Eric Trinh, HundredRandomShapes, CP1 mods 16-17
//url: http://ericsprogrammingsite.host22.com/HundredRandomShapes.html

void setup()
{
  size(400, 400, P3D);
  smooth();
  frameRate(10);
}
void draw()
{
  int numBoxes = 1;
  background(0);
  while (numBoxes < 400)
  {
    int x = int(random(-300, 300));
    int y = int(random(-300, 300)); 
    fill(int(random(256)), int(random(256)), 128 + x, 110);
    translate(200 + x, 200 + y, y);
    box(20, 25, 10);
    translate(-(200 + x), -(200 + y), -y);
    numBoxes++;
  }
}
