
//Derek Chan, One Hundred Shapes, CP1 Mods 14-15
//http://derek-lhs.webs.com/RandomMemes.html
PImage troll;
PImage trololol;
PImage yaoMing;
PImage spongebob;
PImage no;
void setup()
{
  size(600, 600);
  troll = loadImage("Troll.jpg");
  trololol = loadImage("Trololol.jpg");
  yaoMing = loadImage("yaoMing.jpg");
  spongebob = loadImage("Spongebob.jpg");
  no = loadImage("no.jpg");
  frameRate(3);
}
void draw()
{
  background(random(0, 256), random(0, 256), random(0, 256));
  int number = 0;
  while (number<=100)
  {
    int shapeChanger = int(random(1, 6));  
    int x = int(random(0, 601));
    int x2 = int(random(0, 601));
    int s = int(random(50, 101));
    fill(random(0, 256), random(0, 256), random(0, 256));
    if (shapeChanger==1)
    {
      tint(random(0, 256), random(0, 256), random(0, 256));
      image(spongebob, x, x2, s, s);
    }
    else if (shapeChanger==2)
    {
      tint(random(0, 256), random(0, 256), random(0, 256));
      image(yaoMing, x, x2, s, s);
    }
    else if (shapeChanger==3)
    {
      tint(random(0, 256), random(0, 256), random(0, 256));
      image(trololol, x, x2, s, s);
    }
    if (shapeChanger==4)
    {
      tint(random(0, 256), random(0, 256), random(0, 256));
      image(troll, x, x2, s, s);
    }
    else if (shapeChanger==5)
    {
      tint(random(0, 256), random(0, 256), random(0, 256));
      image(no, x, x2, s, s);
    }
    number=number+1;
  }
}



