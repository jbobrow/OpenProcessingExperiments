
void setup()
{
  size(1000, 1000);
  frameRate(1);
}

void draw()
{
  background(255);

  int w=1;
  while(w<=25)
  {
    stroke(100);
    fill(255);
    ellipse(int(random(1000)),int(random(1000)),50,50);
    w++;
  }

  int x=1;
  while(x<=25)
  {
    noStroke();
    fill(0,0,0,75);
    ellipse(int(random(1000)),int(random(1000)),50,50);
    x++;
  }
  
  int y=1;
  while(y<=25)
  {
    noStroke();
    fill(225,225,225,250);
    ellipse(int(random(1000)),int(random(1000)),50,50);
    y++;
  }
  
  int z=1;
  while(z<=25)
  {
    stroke(200,200,200);
    noFill();
    ellipse(int(random(1000)),int(random(1000)),50,50);
    z++;
  }
}
