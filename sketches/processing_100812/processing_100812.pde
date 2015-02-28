
void setup()
{
  size(400, 400);
  noStroke();
  smooth();
  colorMode(HSB);

  xpos = width/2;
  ypos = height/2;
  angle = random(2*PI);
  speed = random(25);
}

float xpos, ypos, angle, speed;
boolean grabbed;

void draw()
{
  background(100);
  makeBall();
  catchBall();
}

void makeBall()
{
  if (!grabbed)
  {
    xpos+=cos(angle)*speed;
    ypos+=sin(angle)*speed;

    if (xpos >= width-40 || xpos <= 40)  angle = PI-angle;
    if (ypos >= height-40 || ypos <= 40)  angle = 2*PI-angle;
    
    fill(160, 190, 255);
    ellipse(xpos, ypos, 80, 80);
  }
  else
  {
    xpos = mouseX;
    ypos = mouseY;
    
    if (xpos >= width-40)  xpos = width-40;
    if (xpos <= 40)        xpos = 40;    
    if (ypos >= height-40) ypos = height-40;
    if (ypos <= 40)        ypos = 40;
    
    fill(0, 190, 255);
    ellipse(xpos, ypos, 80, 80);
  }
}

void catchBall()
{
  if (mousePressed)
  {
    if (sqrt(pow(mouseX-xpos, 2)+pow(mouseY-ypos, 2)) <= 40)
    {
      grabbed = true;
    }
  }
}

void mouseReleased()
{
  if (grabbed)
  {
    float newSpeed = sqrt(pow(mouseX-pmouseX, 2)+
                          pow(mouseY-pmouseY, 2));
    float newAngle = atan2(mouseY-pmouseY, mouseX-pmouseX);
    
    speed = newSpeed;
    angle = newAngle;
    
    grabbed  = false;
  }
}



