
float prevX;
float prevY;
int currentBrush = 0;
color backgroundColor;
float rotation = 0;
float s = .5;
float t = .5;

void setup()
{
  size(750,750);
  
  background(#FFFFFF);
}

void draw()
{
  float x = mouseX;
  float y = mouseY; 
  
  if (mousePressed == true && mouseButton == RIGHT)
  {
    backgroundColor = get(mouseX, mouseY);
  }
  
  
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (currentBrush == 0)
      {
        strokeWeight(random(44));
        stroke(random(255), random(255), random(255));
        scale(this.t);
        line(prevX, prevY, mouseX, mouseY);
      }
       
        if (currentBrush == 1)
      {
        strokeWeight(random(94));
        stroke(random(255), random(255), random(255));
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(radians(rotation));
        scale(this.s);
        ellipse(50, 50, 50, 50);
        popMatrix();
      } 
    }
  }
}


void keyReleased()
{
  if (key == '1')
  {
    currentBrush = 0;
  }
  if (key == '2')
  {
    currentBrush = 1;
  }
  {
    if (key == 's')
    this.s += .5;
  }
  {
    if (key == 'a')
    this.s += -.5;
  }
  {
    if (key == 'z')
    this.s += .5;
  }
  {
    if (key == 'x')
    this.s += -.5;
  }{
    if (key == 'f')
    this.t += .5;
  }
  {
    if (key == 'd')
    this.t += -.5;
  }
  {
    if (key == 'c')
    this.t += .5;
  }
  {
    if (key == 'v')
    this.t += -.5;
  }
  {
    if (key == 'r')
    background(#FFFFFF);
  }
}



