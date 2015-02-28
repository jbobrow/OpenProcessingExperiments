
//copyright Irene Joung 2014
//ICE #14

String [ ] word = {"apple","banana","coconut","date","eggplant","grape","lemon","lime","orange","plum"};
float dx=0;
float x=40;

void setup()
{
  size(400,400);
  textSize(24);
  fill(255,255,0);
  frameRate(40);
}

void draw()
{
  background(0);
  dx += 1;
  for (int i=0; i<word.length; i++)
  {
    text(word[i],dx+x,30+30*i);
    if (dx > width)
    {
      dx=0;
    }
  }
}

  
  





