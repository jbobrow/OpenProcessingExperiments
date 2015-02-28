

void setup()
{

  size(600, 300);
  background(96, 151, 222);
}

void draw()
{
  noStroke();
  fill(255, 238, 44);
  ellipse(0, 0, 150, 150);
  
  stroke(255, 238, 44, 25);
  line(0, 0, mouseX, mouseY); 
  
  fill(0,170,0);
  rect(0,250,width,50);
}
