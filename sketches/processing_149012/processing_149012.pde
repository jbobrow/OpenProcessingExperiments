
int size = 10;
int count = 50;
int angle = 0;

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  strokeWeight(1);
  stroke(255, 255, 255, 255);

  if (keyPressed)
  {  
    translate(width/2, height/2);
    size = size+5; 
    count = count + 10;
    angle += 5;
    rotate(radians(angle));
    for (int i=1; i <= count; i++) 
       line(random(-size, size), 0, random(-size, size), 0);
  }

  
  if (mousePressed)
  {
    save("galaxy.png");
  }
}



