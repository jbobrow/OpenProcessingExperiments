
void setup() 
{
  size(500, 500);
  background(0);
  noStroke();
  fill(102);
  for (int i = 0; i < 80; i = i+8) 
  {
    rect(70, i, 60, i);
  }
}

void draw() 
{
  fill(0, 50);
  rect(0, 0, width, height);
  
  fill(255,200,0);
  ellipse(random(width), random(height), 10, 3);
  fill(0,200,0);
  ellipse(random(width), random(height), 3, 13);
  fill(0,0,250);
  ellipse(random(width), random(height), 10, 3);
  ellipse(random(width), random(height), 3, 13);
  fill(255,10,0);
  ellipse(random(width), random(height), 3, 3);
  fill(255);
  ellipse(mouseX,mouseY, computeRandom(12),15);

}


int computeRandom (int n)
{
  if (n > 10)
  {
    return n;
  }
  else
  {
    return int(random(100)) + 100;
  }
}
  
color randomColor()
{
  return color(random(255),random(255), random(255));
}

void mousePressed() 
{
  if (mouseButton == LEFT) 
  {
    background(255);
  } 
  else if (mouseButton == RIGHT) 
  {
    background(0);
  }
float x = 0;
while (x < width) 
{
  float y = 0;
  while (y < height) 
  {
    if (random(100) > 98) 
    {
      fill(255, 0, 0);
    } 
    else 
    {
      fill(random(0, 105));
    }
    rect(x + 5, y + 10, 44, 44);
    y = y + 10;
  }
  x = x + 50;
}
 if (keyCode == UP) 
 {
   background(255);
 } 
 else if (keyCode == DOWN) 
 {
   background(0);
 }
 }


