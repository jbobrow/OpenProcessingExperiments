
PImage see, me, poetry;
int count=0;

void setup()
{
  size(600,800);
  see=requestImage("mikhail2.jpg");
  me=requestImage("me.jpg");
  poetry=requestImage("poet.png");
}

void draw()
{
  if(count<500)
  {
    image(see,0,0,600,800);
  }
  if(count>500&&count<1000)
  {
    image(me,0,0,600,800);
  }
  if(count>1000)
  {
    image(poetry,0,0,600,800);
  }
  count++;
}


