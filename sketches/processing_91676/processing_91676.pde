
float r, g, b;
int [] shapeColour = new int [1];
int [] xpos = new int[5];
int [] ypos = new int[5];
void setup()
{
  size(200, 200);
  background(0);
  shapeColour [0] = (random(255),random(255),random(255));
}

void draw()
{
  if(( mouseX < 20) || (mouseX> 180) || ( mouseY > 180 ))
  {
    x_movement();
  }
  
}

void x_movement()
{
  background(0);

  //if(mouseX < 20 || mouseX > 230 || mouseY > 230);
  {
    for (int i = 0;i < xpos.length;i++)
    {
      xpos[i] = xpos[i] +1;
      //shapeColour [0]
      rect(xpos[i], 10, 10, 10);
      //shapeColour [0]
      rect(xpos[i], 50, 10, 10);
      //shapeColour [0]
      rect(xpos[i], 100, 10, 10);
      //shapeColour [0]
      rect(xpos[i], 150, 10, 10);
      //shapeColour [0]
      rect(xpos[i], 190, 10, 10);

      if (xpos[i] > 200)
        xpos[i] = 0;
    }
  }
}
