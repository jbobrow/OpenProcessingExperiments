
void setup()
{
  frameRate(200);
  size(1000, 800);
background(0,0,0);
  smooth();
}

void draw()
{

  //circle

  fill(0,70,255); 
 noStroke();

  
  ellipse(mouseX, mouseY, 70,70);
  
  
  fill(0,0,0,20);
  rect(0,0,width,height);
  
}

void mousePressed()
{
fill(255,50,0);
 rect(0,0,width,height);
 
}
void mouseReleased()
{
  fill(255,255,255);
  rect(0,0,width,height);
}

