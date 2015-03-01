
void setup()
{
  size(750,750);
  background(0,0,0);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float R = random(255);
  float G = random(255);
  float B = random(255);
  fill(0+r,0+g,0+b);
  stroke(0+R,0+G,0+B);
  strokeWeight(5);
  for (int q=0; q<750; q+=50)
  {
    for (int w=0; w<750; w+=25)
    {
      ellipse(q,w,50,50);
    }
  }
}



void draw()
{
}



void mousePressed()
{
  DrawARectangle();
}



void keyPressed()
{
  fill(randomColor2());
  stroke(randomStroke2());
  strokeWeight(10);
  int i = 0;
  int n = 0;
  while (i<=750){
    while (n<=750){
      ellipse (i,n,50,50);
      n+=randomChange();
      i+=50;
    }
  }
}



void DrawARectangle()
{
  fill(randomColor3());
  stroke(randomStroke3());
  strokeWeight(15);
  rect(randomLocx(),randomLocy(),75,75);
}



color randomColor()
{
  return color(random(255),random(255),random(255));
}
color randomStroke()
{
  return color(random(255),random(255),random(255));
}



color randomColor2()
{
  return color(random(255),random(255),random(255));
}
color randomStroke2()
{
  return color(random(255),random(255),random(255));
}



color randomColor3()
{
  return color(random(255),random(255),random(255));
}
color randomStroke3()
{
  return color(random(255),random(255),random(255));
}



int randomChange()
{
  return int (random(50));
}



int randomLocx()
{
  return int (random(600)+50);
}
int randomLocy()
{
  return int (random(600)+50);
}
