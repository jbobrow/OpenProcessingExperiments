
//Derek Chan, Doubling Shapes, CP1 Mods 14-15
//http://derek-lhs.webs.com/Azn.html
int num = 1;
int amount = 2;
PImage myChonny;
PImage grade;
PImage rice;
PImage discipline;
PImage chicken;
void setup()
{  
  textSize(50);
  frameRate(2);
  size(400,400);
  myChonny = loadImage("http://derek-lhs.webs.com/MyChonny.jpg");
  grade = loadImage("http://derek-lhs.webs.com/B+.jpg");
  rice = loadImage("http://derek-lhs.webs.com/Rice.jpg");
  discipline = loadImage("http://derek-lhs.webs.com/Discipline.jpg");
  chicken = loadImage("http://derek-lhs.webs.com/Chicken.jpg");
}
void draw()
{
  fill(0);
  image(myChonny,0,0,400,400);
  int dishonor  = int(random(1,5));
  while(num<amount)
  {
    int x = int(random(0, 360));
    int x2 = int(random(0, 360));
    int s = int(random(30, 50));
    if(dishonor==1)
    {
      image(grade, x, x2, s, s);
    }
    else if(dishonor==2)
    {
      image(rice, x, x2, s, s);
    }
    else if(dishonor==3)
    {
      image(discipline, x, x2, s,s);
    }
    else if(dishonor==4)
    {
      image(chicken, x ,x2,s,s);
    }
    num++;
  }
  amount*=2;
  text(amount/4,50,50);
  if(amount/4==8192)
  {
    num=1;
    amount=2;
  }
}
