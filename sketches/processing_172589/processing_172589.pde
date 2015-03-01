
int j = 250;
int r = 30;
int g = 96;
int b = 50;
int x = 70;

void setup()
{
  size(1000,750);
  background(r,g,b);
 for (int c = 200; c < 500; c = c+5)
 { 
   strokeWeight(2);
   stroke(200);
   line(500, 0, 0, c);
   line(500, 375, 0, c);
   line(500, 750, 0, c);
   
 }
}

void draw()
{
  if (keyPressed == true)
  {
    background(255);
  }
  
  if (j > 0)
  {
    strokeWeight(5);
    stroke(random(255),random(255),random(255));
    fill(random(175),random(255),random(255));
    rectMode(CENTER);
    rect(mouseX,mouseY,j,j);
    j = j - 4;
  } 
  else
  {
    j = 250;
  }
  x = 10;
  while (x < 300)
  {
    ellipse(500, 375, x, random(250));
    fill(random(255)); 
    ellipseMode(CENTER);
    x = x + 20;
  }
}


 
