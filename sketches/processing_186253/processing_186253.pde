
/*
Pulsing Circles/Lines 
Created by Jasmine Rajavadee 
Feb. 16, 2015 
*/

int x, y, z; 

void setup()
{
  size(500, 500); 
  background(203, 175, 194); 
  smooth(); 
  frameRate(10); 
  //noLoop();
}

void draw()
{
  for (x = -100; x < 600; x = x + 100) 
  {
    for (y = 0; y < 600; y = y + 150) 
    {
      for (z = 50; z < 500; z = z + 50) 
      {
        circle(x, y);
        lines(z);
      }
    }
  }
} 

//draw the systems of circles

void circle(int x, int y) 
{
  stroke(35, 66, 75); 
  strokeWeight(random(1, 3)); 
  fill(0, 255, 255); 
  ellipse(x, y, 60, 60); 
  fill(0, 0, 255); 
  ellipse(x, y, 20, 20); 
  fill(0); 
  ellipse(x + 50, y + 50, 20, 20); 
  ellipse(x - 50, y - 50, 20, 20); 
  ellipse(x + 50, y - 50, 20, 20); 
  ellipse(x - 50, y + 50, 20, 20); 
  fill(98, 167, 145); 
  ellipse(x, y + 70, 35, 35);
}

//function for lines 

void lines(int z) 
{
  strokeWeight(2); 
  stroke(200); 
  line(z, 0, z, height);
} 

