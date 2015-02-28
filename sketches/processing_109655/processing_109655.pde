
// copyright Yasha Mushtaq Mir
// Sep-12th/13
// Pittsburgh, PA

float x,y,wd,ht;

void setup()
{
  size(600,400);
  x=width*.5;
  y=height*.5;
  wd=width;
  ht=height;
  textSize(14); 
}

void draw()
{
  background(227,218,204);
  if (keyPressed)
  {
    sunRise();
  }
  else if(mousePressed)
  {
    sunSet();
  }
  else
  {
    fill (0);
    text("press a key to watch the sun rise or click your mouse to watch it set", 75, 20);
  }
}

void sunRise()
{    
  noStroke();
  fill(245,165,15);
  ellipse(x,y*.5,50,50);
  fill(60,87,219,80);
  rect(0,300,600,100);
  y=y-1;
}

void sunSet()
{  
  noStroke();
  fill(245,165,15);
  ellipse(x,y*.5,50,50);
  fill(60,87,219,80);
  rect(0,300,600,100);
  y=y+1;
}


