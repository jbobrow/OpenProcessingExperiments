
int x, y, colorR, colorG, colorB, oldColorR, oldColorG, oldColorB, x1, y1, x2, y2;
boolean bounce = false;
int bounceFrameCount = 0;
boolean controlsActive = true;
boolean[] keysArray = new boolean[]{false,false,false};
boolean wait = false; //wait frames
int waitCounter = 0;



void setup()
{
  size(800, 600);
  x = width/2;
  y = height-50;
  x1 = width;
  y1 = -100;
  x2 = x1 + 800;
  y2 = y1 + 800;
  oldColorR = 0;
  oldColorG = 0;
  oldColorB = 0;
  frameRate(90);
  mousePressed(); //initiates random colors
}

void draw()
{
  background(255-colorR, 255-colorG, 255 - colorB); //makes the background inverted color of ball
  lines();
  ball();
  if(keysArray[0] && x > 50)
    x-=5;
  if(keysArray[1] && x < width - 50)
    x+=5;
  if(keysArray[2] && y == height - 50)
    bounce = true;
  if (controlsActive) //toggles controls menu
  {
    controls();
  }
  if (wait) //wait frames to prevent ball from appearing to bounce without touching the ground
  {
    waitCounter++;
    if (waitCounter == 4)
    {
      waitCounter = 0;
      wait = false;
    }
  }
}

void ball() //draws ball
{
  fill(colorR, colorG, colorB);
  ellipseMode(CENTER);
  ellipseMode(RADIUS);
  strokeWeight(1);
  if (bounce && !wait) //makes the ball bounce if true
  {
    if (y <= height - 50 - bounceFrameCount)
    {
      y -= 25 - bounceFrameCount;
      bounceFrameCount++;
    }
    else
    {
      y = height - 50;
      bounceFrameCount = 0;
      bounce = false;
      wait = true;
    }
  }
  
  ellipse(x, y, 50, 50);
}

void lines() //draws background lines
{
  stroke(255, 70);

  strokeWeight(50);

  if (x1 > width - 99)
  {
    x1 -= 3;
    x2 -= 3;
  }
  else
  {
    x1 = width;
    x2 = x1 + 800;
  }
  for (int i = 0; i < 17; i++)
  {
    line(x1 - i * 100, y1, x2 - i * 100, y2);
  }
}

void keyPressed() 
{
  int movement = 10;
  if (keyCode == LEFT) //moves left
    keysArray[0] = true;
    //x -= movement;
  if (keyCode == RIGHT) //moves right
    keysArray[1] = true;
    //x += movement;
  if (keyCode == UP) //jumps
  {
    keysArray[2] = true;
    //bounce = true;
  }
  if (key == 'p') //togges controls menu
  {
    controlsActive = !controlsActive;
  }
  if (key == 'g') //toggles greyscale
  {
    if (colorR != colorG && colorG != colorB)
    {
      int greyScale =  0.21 * colorR + 0.71 * colorG + 0.07 * colorB;
      oldColorR = colorR;
      oldColorG = colorG;
      oldColorB = colorB;
      colorR = greyScale;
      colorG = greyScale;
      colorB = greyScale;
    }
    else
    {
      colorR = oldColorR;
      colorB = oldColorB;
      colorG = oldColorG;
    }
  }
}

void keyReleased()
{
  if(keyCode == LEFT)
    keysArray[0] = false;
  if(keyCode == RIGHT)
    keysArray[1] = false;
  if(keyCode == UP)
    keysArray[2] = false;
}

void mousePressed() //randomizes the colors on left mouse click
{
  colorR = random(255);
  colorG = random(255); 
  colorB = random(255);
}

void controls() //draws the controls on the screen if controlsActive is true
{
  fill(0, 160);
  rect(50, 50, width-100, 325);
  fill(255);
  textSize(25);
  text("Controls", 75, 90);
  text("Left Arrow Key: Move left", 75, 150);
  text("Right Arrow Key: Move right", 75, 190);
  text("Up Arrow Key: Jump", 75, 230);
  text("Left Mouse Click: Randomize colors", 75, 270);
  text("G: Toggle greyscale", 75, 310);
  text("P: Toggle controls menu", 75, 350); 
}

