
void setup()
{
  size(300, 300);

  colorMode(HSB, width);
}
float x = 0;


void draw ()
{
}

void mouseDragged()
{
  fill(150,width,width);
  stroke(150,width,width);
    rectMode(CENTER);
  rect(50, 300-mouseY, 20, 20);
  
  fill(190,width,width);
  stroke(190,width,width);
  rect(100, mouseY, 20, 20);
  
  fill(150,width,width);
  stroke(150,width,width);
  rect(150, 300-mouseY, 20, 20);
  
  fill(250,width,width);
  stroke(250,width,width);
  rect(200, mouseY, 20, 20);
  
  fill(225,width,width);
  stroke(225,width,width);
  rect(250, 300-mouseY, 20, 20);
  
  fill(175,width,width);
  stroke(175,width,width);
  rect (300-mouseY, 50, 30, 30);
  
  fill(180,width,width);
  stroke(180,width,width);
  rect(mouseY, 120, 30, 30);
  
  fill(50,width,width);
  stroke(50,width,width);
  rect(300-mouseY, 190, 30, 30);
  x++;
}

void mousePressed ()
{
  background (100, width, width);
}


