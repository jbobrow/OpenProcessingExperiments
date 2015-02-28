
// Ethan Frier
// Hw 8 - doodling in the while and for loops
// Febuary 26th 2013
// copywrite 2013
 
 int phase;

void setup()
{
  size(400,400);
  background(255);
  smooth();
}
 
void draw()
{
  if (phase == 0)
  {
    forloop();
  }
  else if (phase == 1)
  {
    whileloop();
  }
}
 
 
void whileloop()
{
  float x = 0;
  float y = 0;
  float interval = 5;
  
  while (x < width+1)
  {    
    stroke (200, random(255), 40, 10);
    strokeWeight(5);
    
    line (width/2, height/2, x, 0);
    line (width/2, height/2, width, y);    
    line (width/2, height/2, 0, y);    
    line (width/2, height/2, x, height);

    x +=  interval + random(-5, 5);
    y +=  interval + random(-5, 5);
  }
}
 

void forloop()
{
  float interval = 20;
  
  for (int x = 0; x < width; x += interval) {
    for (int y = 0; y < height; y += interval) {
      fill(10, random(10, 200), 200, 10);
      rect(x, y, interval, interval);
      noStroke();
    }
  }
}
 

 
void keyPressed()
{
  if (key == '1')
  {
    phase = 1;
    background(255);
  }
   
  if (key == '2')
  {
    phase = 0;
    background(255);

  }
}


