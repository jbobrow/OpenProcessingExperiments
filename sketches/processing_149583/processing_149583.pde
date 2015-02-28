
int size = 10;
int count = 50;

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  strokeWeight(1);
  stroke(255, 255, 255, 255);

  if (mousePressed)
  {  
    size = size+5; 
    count = count + 10;
    for (int i=1; i <= count; i++) 
       point(width/2 + random(-size, size), height/2 + random(-size, size));
  }
}





