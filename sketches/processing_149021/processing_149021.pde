
int size = 10;
int count = 50;
int angle = 0;
int weight = 1;

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  strokeWeight(weight);
  stroke(random(255), random(255), random(255)); 

  if (mousePressed)
  {  
    translate(mouseX, mouseY);
    size = size+5; 
    count = count + 10;
    angle += 10;
    weight += 0.05;
    rotate(radians(angle));
    for (int i=1; i <= count; i++) 
       line(random(-size, size), 0, random(-size, size), 0);
  }

  
}
