
int n = 7;
//Rect[] b = new Rect[n];
void setup()
{
  size(500, 550);

  frameRate(5);
}
void draw()
{ 
  
  for (int y=0; y<400; y+=400) 
  {
    for (int x=0; x<500; x+=500/7) 
    {  
      noStroke();
      fill(random(1,7)*30, random(1,7)*30, random(1, 7)*20); // change the fill color
      rect(x, y, 500/7, 400);
    }
  }



  for (int y=400; y<450; y+=50) 
  {
    for (int x=0; x<500; x+=500/3) 
    {  
      noStroke();
      fill(random(0, 255), random(0, 255), random(0, 255)); // change the fill color
      rect(x, y, 500/3, 50);
    }
  }
  for (int y=450; y<550; y+=100) 
  {
    for (int x=0; x<500; x+=100) 
    {  
      noStroke();
      fill(random(0, 255), random(0, 255)); // change the fill color
      rect(x, y, 100, 100);
    }
  }
}




