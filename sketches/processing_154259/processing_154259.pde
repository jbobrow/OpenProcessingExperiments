
int nbCircles;
int nbLines = 50;
Circle[] circles;
MyColor myColor;

final int nbModes = 13;
int currentMode = 0;
Boolean doFill = true;

float bezierRad = 40;

void setup()
{
  size(400, 400, P2D);
  rectMode(CENTER);

  nbCircles = 5;
  circles = new Circle[nbCircles];
  circles[0] = new Circle(0);
  circles[1] = new Circle(60);
  circles[2] = new Circle(130);
  circles[3] = new Circle(150);
  circles[4] = new Circle(100);

  myColor = new MyColor();
}

void draw()
{
  translate(width/2, height/2);
  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);

  myColor.update();

  for (int j = 0; j < nbCircles; j++)
  {
    circles[j].update();
  }
  
  if (doFill)
  {
    drawThings(true);
  }
  drawThings(false);
}

//allows to trace the line and the fill one after another
//for a better display
void drawThings(Boolean p_fill)
{
  if (!p_fill)
  {
    noFill();
  }
  for (int i = 0; i < nbLines; i++)
  {
    PVector pt1 = new PVector(0, 0);
    PVector pt2 = new PVector(0, 0);
    PVector pt3 = new PVector(0, 0);
    PVector pt4 = new PVector(0, 0);
    float l_colorAdjust = 60 * abs(cos(i));//each line has a slightly different color
    float curTheta = map(i, 0, nbLines, 0, TWO_PI);
    if (p_fill)
    {
      fill(min(myColor.R - l_colorAdjust, 255), min(myColor.G - l_colorAdjust, 255), min(myColor.B - l_colorAdjust, 255), 35);
    } else
    {
      stroke(min(myColor.R + l_colorAdjust, 255), min(myColor.G + l_colorAdjust, 255), min(myColor.B + l_colorAdjust, 255));
    }
    strokeWeight(1);
    beginShape();
    vertex(0, 0);
    for (int j = 0; j < nbCircles; j++)
    {
      //current circle, current point
      pt1.x = circles[j].radius * cos(curTheta + circles[j].theta);
      pt1.y = circles[j].radius * sin(curTheta + circles[j].theta);      
      //next circles, 'same' current point
      pt2.x = circles[(j+1) % nbCircles].radius * cos(curTheta + circles[(j+1) % nbCircles].theta);
      pt2.y = circles[(j+1) % nbCircles].radius * sin(curTheta + circles[(j+1) % nbCircles].theta);


      switch(currentMode)
      {
      case 0:
        vertex(pt1.x, pt1.y);
        break;
      case 1:
        vertex(pt1.x, pt2.y);
        break;
      case 2:
        pt3.x = pt1.x + bezierRad * cos(curTheta);
        pt3.y = pt1.y + bezierRad * sin(curTheta);
        bezierVertex(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
        break;
      case 3:
        pt3.x = pt1.x + bezierRad * cos(curTheta + HALF_PI);
        pt3.y = pt1.y + bezierRad * sin(curTheta + HALF_PI);
        bezierVertex(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
        break;
      case 4:
        pt3.x = pt1.x + bezierRad * cos(i) * cos(curTheta);
        pt3.y = pt1.y + bezierRad * cos(i) * sin(curTheta);
        bezierVertex(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
        break;       
      case 5:
        pt3.x = circles[(j+1) % nbCircles].radius * cos(map((i+5)%nbLines, 0, nbLines, 0, TWO_PI));
        pt3.y = circles[(j+1) % nbCircles].radius * sin(map((i+5)%nbLines, 0, nbLines, 0, TWO_PI));
        bezierVertex(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
        break;
      case 6:
        pt3.x = pt1.x + bezierRad * cos(map((i+15)%nbLines, 0, nbLines, 0, TWO_PI));
        pt3.y = pt1.y + bezierRad * sin(map((i+15)%nbLines, 0, nbLines, 0, TWO_PI));
        bezierVertex(pt3.x, pt3.y, pt2.x, pt2.y, pt1.x, pt1.y);
        break;
      case 7://cool!!
        pt3.x = circles[j].radius * cos(map((i+15)%nbLines, 0, nbLines, 0, TWO_PI) + circles[j].theta) + bezierRad * cos(i) * cos(curTheta);
        pt3.y = circles[j].radius * sin(map((i+15)%nbLines, 0, nbLines, 0, TWO_PI) + circles[j].theta) + bezierRad * cos(i) * sin(curTheta);
        bezierVertex(pt1.x, pt1.y, pt3.x, pt3.y, pt2.x, pt2.y);
        break;
      case 8:
        pt3.x = pt1.x + bezierRad * cos(i) * cos(curTheta);
        pt3.y = pt1.y + bezierRad * cos(i) * sin(curTheta);
        bezierVertex(pt3.x, pt3.y, pt1.x, pt1.y, pt2.x, pt2.y);
        break; 
      case 9:
        pt3.x = pt1.x + bezierRad * cos(map((i+15)%nbLines, 0, nbLines, 0, TWO_PI));
        pt3.y = pt1.y + bezierRad * sin(map((i+15)%nbLines, 0, nbLines, 0, TWO_PI));
        bezierVertex(pt3.x, pt3.y, pt1.x, pt1.y, pt2.x, pt2.y);
        break;
      case 10://cool!!
        pt3.x = pt1.x + bezierRad * cos(map((i*5)%nbLines, 0, nbLines, 0, TWO_PI));
        pt3.y = pt1.y + bezierRad * sin(map((i*5)%nbLines, 0, nbLines, 0, TWO_PI));
        pt2.x = pt1.x - bezierRad * cos(map((i*5)%nbLines, 0, nbLines, 0, TWO_PI));
        pt2.y = pt1.y - bezierRad * sin(map((i*5)%nbLines, 0, nbLines, 0, TWO_PI));
        bezierVertex(pt2.x, pt2.y, pt3.x, pt3.y, pt1.x, pt1.y);
        break;
      case 11:
        pt3.x = pt1.x + bezierRad * cos(map((i*3)%nbLines, 0, nbLines, 0, TWO_PI));
        pt3.y = pt1.y + bezierRad * sin(map((i*3)%nbLines, 0, nbLines, 0, TWO_PI));
        bezierVertex(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
        break;
      case 12:
        float l = dist(pt1.x, pt1.y, pt2.x, pt2.y)/2;
        float t = atan2(pt2.y - pt1.y, pt1.x - pt2.x);
        //        pt3.x = pt1.x + l * cos(map((i*3)%nbLines, 0, nbLines, 0, TWO_PI));
        //        pt3.y = pt1.y + l * sin(map((i*3)%nbLines, 0, nbLines, 0, TWO_PI));
        //        pt3.x = pt1.x + l * cos(t + HALF_PI);
        //        pt3.y = pt1.y + l * sin(t + HALF_PI);
        pt3.x = pt1.x + l * cos(t + HALF_PI);
        pt3.y = pt1.y + l * sin(t + HALF_PI);
        bezierVertex(pt1.x, pt1.y, pt2.x, pt2.y, pt3.x, pt3.y);
        break;
      }
    }
    endShape();
  }
}


void mousePressed()
{
  if (mouseButton == LEFT)
  {
    for (int j = 0; j < nbCircles; j++)
    {
      circles[j].changeRotSpeed();
    }
  } else if (mouseButton == RIGHT)
  {
    myColor = new MyColor();
  }
}

void keyPressed()
{
  switch(key)
  {
  case 'a':
    bezierRad = constrain(-50, bezierRad - 4, 50);
    println("bezierRad = " + bezierRad);
    break;
  case 'q':
    bezierRad = constrain(-50, bezierRad + 4, 50);
    println("bezierRad = " + bezierRad);
    break;
  case 'n':
    currentMode = (currentMode + 1) % nbModes;
    println("current mode: " + currentMode);
    break;
  case 'r':
    for (int j = 0; j < nbCircles; j++)
    {
      circles[j].changeRadius();
    }
    break;
  case 'l':
    doFill = !doFill;
    break;
  }
}

class Circle
{
  float radius, rotSpeed;
  float theta = 0;
  final float minRotSpeed = .005;
  final float maxRotSpeed = .03;

  Circle(float p_radius)
  {
    radius = p_radius;
    changeRotSpeed();
  }

  void update()
  {
    theta += rotSpeed;
  }

  void changeRotSpeed()
  {
    rotSpeed = (random(1) < .5 ? 1 : -1) * random(minRotSpeed, maxRotSpeed);
  }

  void changeRadius()
  {
    radius = random(0, width/2);
  }
}

class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .2;
  final static float maxSpeed = .5;
  MyColor()
  {
    init();
  }

  public void init()
  {
    R = random(255);
    G = random(255);
    B = random(255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }

  public void update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
}

