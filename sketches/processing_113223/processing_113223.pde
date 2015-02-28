
void setup()
{
  size(750,750);
  background(50,20,4);
  
    
  
}


void draw()
{
  for (int y= 1 ; y<(height/50); y=y+3)
  {
    for(int x=1; x<(width/50);x=x+3)
    {
      flower(x*50,y*50);
    }
    //x=0;
  }

  
  for(int x=1; x<100;x++)
  {
    OutlineRect();
  }
  
  
  
}


int RandInt(int yyyy)
{
  int rand = (int)(random(yyyy));
  return rand;
}

void OutlineRect()
{
  noFill();
  stroke(50,20,4);
  strokeWeight(1);
  rectMode(CENTER);
  rect(random(((width/2)-50),((width/2)+50)), random(((height/2)-50),((height/2)+50)), random( (width-50), (width) ), random( (height-50), (height) ), 100, 100, 100, 100);
}


void flower(int x, int y)
{
  fill(255,150,150);
  //else
  //{fill(234,69,69);}
  
  noStroke();
  ellipseMode(CORNER);
  ellipse(x-50, y-50, 50,50);
  ellipse(x+50, y-50, 50,50);
  ellipse(x-50, y+50, 50,50);
  ellipse(x+50, y+50, 50,50);
  ellipseMode(CENTER);
  fill(255);
  ellipse(x-50,y-50,35,35);
}


