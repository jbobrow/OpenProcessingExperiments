
//George F, CP1 (4-5)
//Doubling Shapes
//Press W then Press E
void setup()
{
  size(200,250);
  background(0);
}

boolean press = true;
int num = 1;
int n = 1;
void draw()
{
  if(key == 'w' && press==true)
  {
    background(0);
    while(num <= n)
    {
      int r = int(random(1,256));
      int g = int(random(1,256));
      int b = int(random(1,256));
      fill(r,g,b);
      ellipse(int(random(10,191)),int(random(10,191)),10,10);
      num++;
    }
    fill(255);
    textAlign(CENTER);
    textSize(24);
    text((num-1),50,225);
    press=false;
  }
  if(key=='e' && press==false)
  {
    num=1;
    n=n*2;
    if(n>4000)
    {
      background(0);
      n=1;
    }
    press=true;
  }
}
