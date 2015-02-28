
float rotation, s;
PImage rainbow;
color currentColor;

//up or down to change scale
//left or right to change rotation

void setup()
{
  size(600, 600);
  rotation = 0.0;
  s = 1.0;
  currentColor = color(0);
  rainbow = requestImage("rainbow.jpg");
}

void draw()
{
  if(mousePressed == true && (mouseX <= 132 && mouseY >= 458))
  {
    currentColor = get(mouseX, mouseY);
  }
  
  else if(mousePressed == true)
  {
    pushMatrix();
    fill(currentColor);
    translate(mouseX, mouseY);
    scale(s);
    rotate(rotation);
    triangle(0, -10, -5, 0, 5, 0);
    popMatrix();
  }
  
  image(rainbow, 0, height - 132);
}

void keyPressed()
{
  if (key == CODED)
  {
    if(keyCode == UP)
    {
      s = s + 0.5;
    }
    
    if(keyCode == DOWN)
    {
      s = max(s - 0.5, 0);
    }
    
    if(keyCode == LEFT)
    {
      rotation-=radians(1);
    }
    
    if(keyCode == RIGHT)
    {
      rotation+=radians(1);
    }
  }
}


