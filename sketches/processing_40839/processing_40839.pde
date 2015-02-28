
//make a circle that follows the mouse

void setup ()
{
  size (800, 800);
  background (100);
  smooth();
}

float xpos = 50;
float ypos = 50;
float xpos2 = 750;
float ypos2 = 50;
float xpos3 = 750;
float ypos3 = 750;
float xpos4 = 750;
float ypos4 = 50;
float xVal = 0;
float yVal = 0;
float xVal4 = 0;
float yVal4 = 0;
float rand = 0;
float rand2 = 0;
float rand3 = 0;
float bc = 100;

void draw ()
{
  background (bc);
  stroke(5);

  fill (255);
  fill (color (rand, 2*rand, rand2));
  ellipse (mouseX, mouseY, 30, 30);
  ellipse (xpos, ypos, 50, 50);
  ellipse (xpos2, ypos2, 20, 20);
  ellipse (xpos3, ypos3, 20, 20);
  ellipse (xpos4, ypos4, 50, 50);


  if (mousePressed == true)
  {
    xpos += xVal;
    ypos += yVal;
    xpos2 = 2*xpos;
    ypos2 = 2*ypos;
    xpos3 = xpos/2;
    ypos3 = ypos/2;
    xpos4 += xVal4;
    ypos4 += yVal4;   
    rand = random(255);
    rand2 = random(200);
    rand3 = random(125);
    bc = random (200, 250); 

    if (xpos > mouseX)
    {
      xVal -= 2;
    }
    else if (xpos < mouseX)
    {
      xVal += 2;
    } 

    if (ypos > mouseY)
    {
      yVal -= 1;
    }
    else if (ypos < mouseY)
    {
      yVal += 1;
    }



    if (xpos4 < mouseX)
    {
      xVal4 += 0.1;
    }
    else if (xpos > mouseX)
    {
      xVal4 -= 0.1;
    } 

    if (ypos < mouseY)
    {
      yVal4 += 1;
    }
    else if (ypos > mouseY)
    {
      yVal4 -= 1;
    }
  }

  else
  {
    rand = 0;
    rand2 = 0;
    rand3 = 0;
    bc = 100;
  }
  
  
  
}


