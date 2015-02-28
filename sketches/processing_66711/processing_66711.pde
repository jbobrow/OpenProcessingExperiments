
int goVer=480;
boolean hit=false;
void setup()
{
  size(500,500);
}

void draw()
{
  if(!hit)
  {
   background(255);
    if(goVer == 10)
    {
    hit = true;
    }
  goVer -= 5; 
  ellipse(250,goVer,20,20);
  }
  else
  {
    background(255);
    if(goVer == 480)
    {
      hit=false;
    }
    goVer += 5;
    ellipse(250,goVer,20,20);
  }
}

