
int x=250;
int y=250;
int r=100;
int g=30;
int b=230;
int reps=1;
int limit=2;

void setup()
{
  size(500,500);
  background(0);
  frameRate(1);
}

void draw()
{
  background(0);
  stroke(r,g,b);
  
  while (reps<limit)
  {
    fill(r,g,b,60);
    ellipse(x,y,30,30);
    noFill();
    arc(x,y,15,15,PI/6,5*PI/6);
    point(x-5,y-5);
    point(x+5,y-5);
    line(x,y+15,x,y+45);
    line(x-13,y+22,x+13,y+22);
    line(x,y+45,x-13,y+58);
    line(x,y+45,x+13,y+58);
    x=int(random(0,498));
    y=int(random(0,498));
    reps++;
    
  }
  
  if (limit<400)
  {
    limit=limit*2;
  }
  else limit=2;
  reps=0;
  r=int(random(0,255));
  g=int(random(0,255));
  b=int(random(0,255));
}
