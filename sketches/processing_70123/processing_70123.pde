
//Brian C, Functions and Animations, CP1 Mods 16/17

int x = 0;
int grow = 0;
int cloud = 0;
void setup()
{
  size(300,300);
}
void draw()
{
  ellipses();
  grass();
}
void grass()
{
  fill (54,137,32);
  int grass1 = 0;
  while (grass1<300)
  {
   triangle(grass1,300,10+grass1,300,5+grass1,290-grow);
   grass1 = grass1 + 10;
  }
}
void ellipses()
{
  background(70,158,188,5+x);
  noStroke();
  fill(224,224,41,x);
  ellipse(0,0,x,x);
  x = x +1;
  if(x>220)
  {
    x = 220;
    fill (54,137,32,x);
    int grass1 = 0;
    while (grass1<300)
    {
      fill(54,137,32);
      triangle(grass1,300,10+grass1,300,5+grass1,290-grow);
      grass1 = grass1 + 10;
    }
    grow = grow +1;
    if (grow > 15)
    {
      grow = 15;
      if (grow > 14)
      {
         fill(70,158,188);
         rect(0,0,300,300);
         fill(224,224,41,220);
         ellipse(0,0,220,220);
         fill(255);
         noStroke();
         ellipse(460-cloud,50,50,50);
         ellipse(430-cloud,50,50,50);
         ellipse(480-cloud,70,50,50);
         ellipse(445-cloud,80,50,50);
         ellipse(410-cloud,70,50,50);
         cloud = cloud +1;
       }
    }
    frameRate(0.1);
    }
    frameRate(70);
}
