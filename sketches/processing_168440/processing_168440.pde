
void setup()
{
  size(500,500);
  background(255);
  fill(0);
  noStroke();
  
  smooth();
}

void draw()
{
  translate(width/2, height/2);
  
  rotate(radians(second())*15.0);
  
  rectMode(CENTER);
  rect(50,50,40,5);
  
  rectMode(CENTER);
  rect(80,80,60,7.5);
  
  rectMode(CENTER);
  rect(120,120,80,10);
  
  rectMode(CENTER);
  rect(175,175,100,15);
}

