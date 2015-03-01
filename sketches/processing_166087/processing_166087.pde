
void setup()
{
  size(500,500);
}
int x=250;
int y=250;
int x1=0;
int y1=0;
int x2=450;
int y2=0;
int x3=0;
int y3=450;
int x4=450;
int y4=450;
int t=0;
int z=0;
int o=0;
int pm=0;
int p=0;
int v=100;
int a=0;
int r=0;
int re=0;
int ve=0;
void draw()
{
  if(re < t)
  {
    ve= 1;
  }
  if(r == 1)
  {
    r =0;
    x=250;
    y=250;
    x1=0;
    y1=0;
    x2=450;
    y2=0;
    x3=0;
    y3=450;
    x4=450;
    y4=450;
    t=0;
    z=0;
    o=0;
    pm=0;
    p=0;
    v=100;
    a=0;
    ve=0;
  }
  a++;
  p=pm/10;
  z++;
  t = z /100;
  background(250);
  rect(0,0,125,125);
  rect(0,125,125,250);
  rect(0,375,125,125);
  rect(125,0,250,125);
  rect(125,375,250,125);
  rect(375,0,125,125);
  rect(375,125,125,250);
  rect(375,375,125,125);
  fill(250);
  if(mouseX < 125 && mouseY < 125)
  {
    x--;
    y--;
    x--;
    y--;
  }
  else if(mouseX < 125 && mouseY < 375)
  {
   x--;
   x--;
  }
  else if(mouseX < 125 && mouseY > 375)
  {
   x--;
   y++;
   x--;
   y++;
  }
  else if(mouseX < 375 && mouseY < 125)
  {
   y--;
   y--;
  }
  else if(mouseX < 375 && mouseY > 375)
  {
   y++;
   y++;
  }
  else if(mouseX > 375 && mouseY < 125)
  {
   x++;
   y--;
   x++;
   y--;
  }
  else if(mouseX > 375 && mouseY < 375)
  {
   x++;
   x++;
  }
  else if(mouseX > 375 && mouseY > 375)
  {
   x++;
   y++;
   x++;
   y++;
  }
  if(x1 < x)
  {
    x1++;
  }
  else if(x1 > x)
  {
    x1--;
  }
  else if(y1 < y)
  {
    y1++;
  }
  else if(y1 > y)
  {
    y1--;
  }
  if(y1 > y-1 & y1 < y)
  {
    y1++;
  }
  else if(y1 < y+1 & y1 > y)
  {
    y1--;
  }
  if(x1 > x-2 & x1 < x & y1 < y)
  {
    x1++;
  }
  else if(x1 < x+52 & x1 > x & y1 < y)
  {
    x1--;
  }
  
  if(x1 >= x-50 & x1 <= x+50 & y1 >= y-50 & y1 <= y+50)
  {
    pm++;
  }
  if(x2 < x & a > 50)
  {
    x2++;
    if(a >125)
    {
      x2++;
      if(a >135)
      {
        x2++;
        if(a >140)
        {
        a=0;
        }
      }
    }
  }
  else if(x2 > x & a > 50)
  {
    x2--;
    if(a >125)
    {
      x2--;
      if(a >135)
      {
        if(a >140)
        {
        a=0;
        }
        x2--;
      }
    }
  }
  if(y2 < y & a > 50)
  {
    y2++;
    if(a >125)
    {
      y2++;
      if(a >135)
      {
        if(a >140)
        {
        a=0;
        }
        y2++;
      }
    }
  }
  else if(y2 > y & a >50)
  {
    y2--;
    if(a >125)
    {
      y2--;
      if(a >135)
      {
        if(a >140)
        {
        a=0;
        }
        y2--;
      }
    }
  }
  if(x2 >= x-50 & x2 <= x+50 & y2 >= y-50 & y2 <= y+50)
  {
    pm++;
  }
   
  if(y3 < y)
  {
    y3++;
  }
  else if(y3 > y)
  {
    y3--;
  }
  else if(x3 < x)
  {
    x3++;
    x3++;
    if(x3 > x-250 & x3 < x)
    {
      x3++;
    }
  }
  else if(x3 > x)
  {
    x3--;
    x3--;
    if(x3 < x+150 & x3 > x)
    {
      x3--;
    }
  }
   
  if(x3 >= x-50 & x3 <= x+50 & y3 >= y-50 & y3 <= y+50)
  {
    pm++;
  }
   
  if(x4 < x)
  {
    x4++;
  }
  if(x4 > x)
  {
    x4--;
  }
  if(y4 < y)
  {
    y4++;
  }
  if(y4 > y)
  {
    y4--;
  }
  if(x4 >= x-50 & x4 <= x+50 & y4 >= y-50 & y4 <= y+50)
  {
    pm++;
  }
  if(x < 0 || x+50 > 500 || y < 0 || y+50 > 500)
  {
    o=1;
  }
  fill(0);
  textSize(32);
  text("Score: "+t, 10, 30);
  textSize(32);
  text("Live:"+(v-p)+"%", 350, 30);
  rect(x,y,50,50);
  fill(100,20,30);
  rect(x1,y1,50,50);
  rect(x2,y2,50,50);
  rect(x3,y3,50,50);
  rect(x4,y4,50,50);
  fill(150,15,50);
  if(o == 1)
  {
    z--;
    background(0);
    if(ve == 1)
    {
      re = t;
    fill(230);
    textSize(50);
    text("New Record!", 100, 200);
    fill(230);
    textSize(38);
    text("Score : "+ t, 158, 300);
    }else
    {
    fill(230);
    textSize(50);
    text("Score : "+ t, 150, 250);
    }
    textSize(30);
    text("Restart", 200, 450);
    if(mouseX > 200 & mouseX < 300 & mouseY > 430 & mouseY < 480)
    {
      r = 1;
      o = 0;
    }
  }
  if(v - p<=0)
  {
    o = 1;
  }
}
