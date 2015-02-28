
final color SAND = color(0);
final color AIR = color(127,127,255);
final color SOLID = color(200,0,255);
final int pipes = 10;
final int LIQUIDITY = 12;
void setup()
{
  frameRate(50);
  stroke(AIR);
  size(500,500);
  background(AIR);
}

void draw()
{
  if(mousePressed)
  {
    fill(SOLID);
    noStroke();
    rect(mouseX-2,mouseY-2,4,4);
  }
  for(int i=0; i<width; i+=width/(pipes+1))
  {
    if(get(i,0)==AIR)
      set(i,0,SAND);
  }
  for(int y=height; y>=0; y--)
  {
    for(int x=width; x>=0; x--)
    {
      int dir = int(-(LIQUIDITY/2)+random(LIQUIDITY));
      if((get(x,y)==SAND)&&(get(x,y+1)==AIR))
      {
        set(x,y,AIR);
        set(x,y+1,SAND);
      }
      else
        if((get(x,y)==SAND)&&(get(x+dir,y+1)==AIR))
        {
          set(x,y,AIR);
          set(x+dir,y+1,SAND);
        }
    }
  }
  strokeWeight(1);
  stroke(AIR);
  line(0,height-1,width,height-1);
  println(frameRate);
}


