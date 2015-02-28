
//Finding the mouse "speed" using the distance function
//Also includes mousePressed and mouseButton

void setup()
{
  size(400, 400);
  smooth();
  background(100);
}

void draw()
{
  if (mousePressed)
  {
    if(mouseButton == LEFT){ //only check which button if we already
        fill(255);           //know the mouse is being pressed... 
        stroke(0);
    } else {
       fill(0);
       stroke(255);
    }
    
    float speed = 3 * dist(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, speed, speed);
  }
}


