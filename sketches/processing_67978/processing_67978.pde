
void setup ()
{
  size(400,300);
  background(255);
  noFill();
}

void draw()
{
  background(255);
  strokeWeight(4);
  circulos1();
  circulos2();
  circulo_random();
}
void circulos1()
{
  for(int i=100;i<=200;i=i+100)
  {
    if(i==100)
    {
      stroke(0,0,255);
      ellipse (i,100,90,90);
    }
    else    
      stroke(0,0,0);
      ellipse (i,100,90,90);
  }
}

void circulos2()
{
  for(int i=150;i<=250;i=i+100)
  {
    if(i==150)
    { 
      stroke(255,255,0);
      ellipse (i,150,90,90);
    }
    else
     stroke(0,255,0);
     ellipse (i,150,90,90);
  }
}

void circulo_random()
{
  int x,y;
  stroke(255,0,0);
  x=int(random(400));
  y=int(random(300));
  if((x!=300) && (y!=100))
  {
    ellipse(x,y,90,90);
  }
  else{
    ellipse(300,100,90,90);
    noLoop();
  } 
}

