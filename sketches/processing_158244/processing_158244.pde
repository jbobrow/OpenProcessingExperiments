
boolean isMousePressed = false;
int MAXWIDTH = 200;   //constant
int MAXHEIGHT = 70;  //constant

void setup()
{
  size(600,600);
}

void draw()
{
  if (isMousePressed == false)
  {
    //draw
    int rndW = (int)random(10,MAXWIDTH);
    int rndH = (int)random(10,MAXHEIGHT);
    color rndCol = color ( random(0,255),   //R
                           random(0,255),   //G
                           random(0,255) ); //B
    fill(rndCol);
    ellipse(mouseX, mouseY, rndW, rndH);
  }
}

void mousePressed() //called when mouse is pressed
{
  isMousePressed = true;
}

void mouseReleased()
{
  isMousePressed = false;
}


