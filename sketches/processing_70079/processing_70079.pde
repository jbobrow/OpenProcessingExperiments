
int spaceX = 10;
int width = 1024;
int height = 768;

void setup()
{
  size(1024,768);
  smooth();
  background(255,255,255);
  stroke(0,0,0);
  
  strokeWeight(random(50, 60));
  stroke(255,0,0);
  for(int i = 0; i < 100; i++)
  {
  ellipse(random(0,width), random(0, height), random(100,200), random(100,200));
  }
  
  strokeWeight(random(50, 60));
  stroke(255,0,0);
  for(int i = 0; i < 100; i++)
  {
  ellipse(random(0,width), random(0, height), random(100,200), random(100,200));
  }
  
  stroke(0,0,0);
  noFill();
  strokeWeight(random(20,30));
  for(int i = 0; i < 75; i++)
  {
  ellipse(random(0,width), random(0, height), random(100,200), random(100,200));
  }
  
  
}

void draw()
{
  
  fill(0,0,0);
  //rect(0,0,500,768);
  
  for(int i=1024; i >= 0; i = i = i - 6)
  {
  strokeWeight(i);
  line(spaceX * i, 0, spaceX * i, height);  
  }
  
  
}

