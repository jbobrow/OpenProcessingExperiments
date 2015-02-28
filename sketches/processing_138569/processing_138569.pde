
//copyright Irene Joung 2014
//ICE#11

int pos;

void setup()
{
  size(800,400);
}

void draw()
{
  fill(0);
  rectMode(CORNER);
  rect(0,0,width/2,height);
  pos=0;
  while(pos<width/2)
  {
    fill(255,0,0);
    rect(pos,0,20,20);
    rect(0,pos,20,20);
    rect(width/2-20,pos,20,20);
    rect(pos,width/2-20,20,20);
    pos+=20;
  }
  
  fill(255);
  rectMode(CORNER);
  rect(width/2,0,width/2,height);
  for(int pos=0;pos<width/2;pos+=20)
  {
    fill(0,0,255);
    ellipse(width-pos,pos,20,20);
    ellipse(pos+width/2,pos,20,20);
    pos+=5;
  }
}


