
//Benjamin Z, Mods 16/17, Doubling Shapes
int q=1;
int p=1;
void setup()
{
  size(600, 600);
  frameRate(1);
}

void draw()
{
  background(0);
  while (q<=p)
  {
    float x=int(random(1, 600));  
    float y=int(random(1, 600));  
    float z=int(random(-41, 41)); 
    noStroke();
    fill(random(256), random(256), random(256));
    ellipse(x, y, 50, 50);
    q++;
    fill(255);
    textSize(30);
    text(p/2, 40, 100, 0);
  }
  p=p*2;
  if (p>1025)
  {
    q=2;
    p=1;
  }
}
