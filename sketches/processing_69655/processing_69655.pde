
boolean mouseIsDown;

void setup()
{
size(1000,1000);
background(255,255,255);

}

void draw()
{

  rectMode(CENTER);
  smooth();

  
  if(mouseIsDown == true)
     ellipse(mouseX, mouseY, 80, 80);
     if(mouseIsDown == true)
     ellipse(height-mouseX, width-mouseY, 80, 80);
     if(mouseIsDown == true)
    ellipse(mouseX, height-mouseY, 80, 80);
    if(mouseIsDown == true)
    ellipse(width-mouseX, mouseY, 80, 80);
  
}

void mousePressed()
{
  mouseIsDown = true;
}
void mouseReleased()
{
  mouseIsDown = false;
}

void keyPressed()
{
  if (key == ' ')
  {
    stroke(255);
    fill(0);
    ellipse(mouseX, mouseY, 80, 80);
     ellipse(height-mouseX, width-mouseY, 80, 80);
    ellipse(mouseX, height-mouseY, 80, 80);
    ellipse(width-mouseX, mouseY, 80, 80);
  }
}

int value = 0;

void keyReleased() 
{
  if (key == ' ') 
  {
    stroke(0);
    fill(255);
     ellipse(mouseX, mouseY, 80, 80);
     ellipse(height-mouseX, width-mouseY, 80, 80);
    ellipse(mouseX, height-mouseY, 80, 80);
    ellipse(width-mouseX, mouseY, 80, 80);
    
  } else {
    value = 0;
  }
}




