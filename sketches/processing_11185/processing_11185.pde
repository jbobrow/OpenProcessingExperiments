
boolean refresh;
Anaglyph[] grid;
int NUM;

void setup()
{
  noStroke();
  smooth();
  size(400,400);
  refresh = true;
  NUM = int(random(5,15));
  grid = new Anaglyph[NUM*NUM];
}



void draw()
{
  background(255);
 
  if(frameCount%(250) == 0)
    refresh = true;

  if(refresh)
  {
  int id = int(random(NUM*NUM));
  for (int i = 0; i < grid.length; i++ )
  {
    float off;
    if (id == i) off = random(5,10);
    else off = 2;
    grid[i] = new Circle(
      (i%NUM)*(width/NUM)+(width/(NUM))/2,
      (i/NUM)*(height/NUM)+(height/(NUM))/2,
      off,
      25 
      );
  }
  refresh = false;
  }
  
  for (int i = 0; i < grid.length; i++ )
  {
    grid[i].drawShape();
  }
  
  
}



