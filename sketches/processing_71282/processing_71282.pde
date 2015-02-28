
// User Imput, Laura R., computer programming 1, 14-15

int s = 10;
void setup()
{
  size (600, 500);
  background (255);
  fill(242, 105, 192);
  text ("press the key of the color you want while cliking and dragging your mouse", 10, 20);
  text("r = red", 10, 40);
  text("y = yellow", 10, 55);
  text("g = green", 10, 70);
  text("b = blue", 10, 85);
  text("p = purple", 10, 100);
  text("o = orange", 10, 115);
  text("w = white", 10, 130);
  text("press +  and - to change the size", 10, 150);
  fill(255);
}
void draw()
{
  noStroke ();
}
void mouseDragged()
{ 
  if (keyPressed == true && key == 'r')
  {
    fill (255, 0, 0);
    //    ellipse(mouseX,mouseY,10,10);
  }

  if (keyPressed == true && key == 'g')
  {
    fill (135, 203, 10);
    // ellipse(mouseX,mouseY,10,10);
  }

  if (keyPressed == true && key == 'y')
  {
    fill (255, 202, 8);
    // ellipse(mouseX,mouseY,10,10);
  }
  if (keyPressed == true && key == 'p')
  {
    fill (178, 48, 250);
    // ellipse(mouseX,mouseY,10,10);
  }
  if (keyPressed == true && key == 'b')
  {
    fill (8, 156, 252);
    // ellipse(mouseX,mouseY,10,10);
  }
  if (keyPressed == true && key == 'o')
  {
    fill (255, 148, 8);
    
  }
  if (keyPressed == true && key == 'w')
  {
    fill (255);
    
  }
  
  ellipse(mouseX, mouseY, s, s);
}
void keyTyped ()
{
  if (key == '+')
  {
    s = s + 10;
  }
  if (key == '-')
  {
    s = s - 10;
  }
}

