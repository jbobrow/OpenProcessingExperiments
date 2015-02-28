
ArrayList pos;

int ArraySize, a;





void setup()
{
  size(400, 400);
  
  ArraySize = round(random((width/20)*(height/20)));

  pos = new ArrayList();
  
  a = 255;

  
  
  for(int i = 0; i<ArraySize; i++)
  {

    pos.add(new PVector(int(round(random(width))), int(round(random(height)))));
  }
  
}


void draw()
{
  background(0);
  for(int i = 0; i<ArraySize; i++)
  {
    PVector p = (PVector)pos.get(i);
    //point(pos.get(i).x, pos.get(i).y);
    a = round(map(sin(frameCount*.01), -1, 1, 0, 255));
    stroke(255,255,150,a);
    strokeWeight(3);
    point(p.x, p.y);
  }
  
  
}


