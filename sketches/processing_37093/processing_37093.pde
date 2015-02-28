
float myDiameter = 10;
float posX = 0;
float posY = 0;

boolean mouseIsDown = false;
void mousePressed() {
mouseIsDown = true;
}
  
void mouseReleased() {
mouseIsDown = false;
}


void setup ()
{
  size(500, 500);
  fill(0,0,0);
  frameRate(60);
  smooth ();
  noStroke();
}

void draw ()
{
  fill(0,0,0,1);
  rect (0,0, width, height);
  
  
  float dx = mouseX - posX;
  float dy = mouseY - posY;
  
  posX += dx/10;
  posY += dy/10;
  
  if(mouseIsDown ==true)
  {
    fill(random(255), 255,255);
    ellipse(posX, posY, dx+dy, dy+dx);
    rect(random(width), random(height), 50, 50);

  }
  else
  {
  
  fill(random(255), random(255), random(255));
  ellipse(posX, posY, dx+dy, dy+dx);
  
  }
  
  
}

