
float xPos;
float yPos;
float blast;
float laser;
float vx;
float vy;
float jumpHeight;
void setup()
{
  size (1280, 720);
  noStroke();
  background(255);
  yPos = 0;
  blast = xPos;
  laser = xPos;
  vx = 100;
  jumpHeight = 550;
  noCursor();
}
void draw()
{
  background (255);
  robo();

  //Fire Blast
  if (key == 'f' && keyPressed)
  {
    blast = xPos;
    fill(17, 35, 106);

    //Left Arm
    rect(xPos + 125, yPos + 600, 50, 15);
  }

  //Fire Ball
  fill(255, random (100, 255), 0);
  ellipse(blast + 200, yPos + 610, 75, 75);
  blast = blast + 15;
  
  //Laser
  if (key == 'd' && keyPressed)
  {
    laser = xPos;
    fill(17, 35, 106);

    //Right Arm
    rect(xPos + 20, yPos + 600, 60, 15);
  }
  
  //Laser Stream
  fill(255, random (100, 255), 0);
  rect(laser + 80, yPos + 600, 100, 15);
  laser = laser + 500;

  //Jump
  if (key == ' ' && keyPressed)
  { 
    //Gravity
    if (yPos + 850 > jumpHeight)
    {
      yPos = yPos - 50;
    }
  }
    
    //Jump Control
    if (yPos + 500 <= jumpHeight)
    {
    yPos = yPos + 10;
    }
}

void robo()
{
  //Head
  fill(152, 127, 127);
  rect(xPos, yPos + 500, 150, 100);

  //Eyes
  fill(252, 252, 0);
  ellipse(xPos + 50, yPos + 550, 50, 75);
  ellipse(xPos + 125, yPos + 550, 40, 60);

  //Mouth
  rect(xPos+75, yPos + 575, 30, 10);

  //Pupils
  fill(xPos-95, 0, 0);
  ellipse(xPos + 60, yPos + 550, 25, 35);
  ellipse(xPos + 132, yPos + 550, 20, 30);

  //Torso
  fill(61, 80, 242);
  rect(xPos + 25, yPos + 600, 100, 60);

  //Shoulders
  fill(17, 35, 106);
  ellipse(xPos + 25, yPos + 600, 30, 30);
  ellipse(xPos + 125, yPos + 605, 20, 20);

  //Right Arm
  //rect(xPos + 10, yPos + 600, 15, 60);

  //Legs
  rect(xPos + 20, yPos + 650, 60, 15);
  rect(xPos + 85, yPos + 650, 45, 15);
}

//Arrow Controls
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      xPos = xPos - 45;
    } else if (keyCode == RIGHT)
    {
      xPos = xPos + 45;
    }
  }
}
