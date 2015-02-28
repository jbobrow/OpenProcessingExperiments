
// Alina V, CP1 mods 16,17, Doubling Shapes
int b;
PFont font;  
void setup()
{
  size (500, 500);
  frameRate(0.8);
  font = loadFont("Vivaldii-60.vlw");
  b = 1;
}
void draw()
{ 
  background(150);
  int a = 1;
  while (a <= b)
  {
    stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), int(random(25, 255)));
   rect(int(random(470)), int(random(470)), 30, 30);
    fill(255, 255, 255);
    textAlign(CENTER);
    textFont(font, 60);
    text(b, 60, 50);
    a++;
  }
  b = b*2;
  if (b > 2048)
  {
    a = 1;
    b = 1;
  }
}
