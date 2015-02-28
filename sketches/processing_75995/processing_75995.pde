
//Sydney C CP1 mods: 4/5 Doubling Shapes
int g = 255;
int b = 123;
int r, xOffset, yOffset, zOffset;
int siz = 20;
int x = 1;
int x2 = 1;
void setup()
{
  size(300, 300, P3D);
  frameRate(1);
  smooth();
}

void draw()
{
  background(0, 150, int(random(255)));
  
  while (x < x2)
  {
     x = x+1;
    fill(r, g, b);
    r = int(random(255));
    g = g - 1;
    b = b + 1;
    xOffset = int(random(300));
    yOffset = int(random(300));
    zOffset = int(random(-300));
    translate(xOffset, yOffset, zOffset);
    box(20);
    translate(-xOffset, -yOffset, -zOffset);
    print(x);
    print(":");
    println(x2);
  }
  
  x2=x2*2;
  

  text((x/2),45,45);
  textSize(30);
 
  if (x>512)
  {
    x = 1;
    x2 = 1;
    g = 255;
    b = 123;
  }
  
}
