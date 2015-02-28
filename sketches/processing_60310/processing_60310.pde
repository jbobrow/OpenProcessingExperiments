
import librarytests.*;
import org.openkinect.*;
import org.openkinect.processing.*;

Kinect kinect;
PImage img;

int w = 640;
int h = 480;
int fps = 30;

boolean fullQ = true;
boolean RGBimg = true;
int modeNum = 1;

int[] closestVal = new int[2];
float[] closestX = new float[2];
float[] closestY = new float[2];
float[] prevX = new float[2];
float[] prevY = new float[2];
float[] interX = new float[2];
float[] interY = new float[2];

int eTotal = 5;
int curTotal = 0;
int curCir = 0;
float[] cirX = new float[eTotal];
float[] cirY = new float[eTotal];
float[] cirZ = new float[eTotal];
int[] cirC = new int[eTotal];
int cirSpeed = 1;

int ballCount = 100;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speed = new float[ballCount];
color[] ballColor = new color[ballCount];
int bSize = 20;
float gravity = 0.1;
float dampening = -0.85;
int i = 0;
int ballNum = 0;

int sColor = 0;
Boolean incColor = false;

float deg = 15;

void setup()
{
  size(w, h);
  frameRate(fps);
  stroke(255, 0, 0);
  ellipseMode(CENTER);
  strokeWeight(3);
  kinect = new Kinect(this);
  background(240);
  drawCircles();
  initBalls();

  kinect.start();
  kinect.enableDepth(true);
  kinect.enableRGB(true);
}

void draw()
{
  kinect.tilt(deg);
  if (frameCount%100 == 0)
  {
    selectMode();
  }


  int[] depth = kinect.getRawDepth();
  if (RGBimg == true)
  {
    img = kinect.getVideoImage();

    pushMatrix();
    scale(-1.0, 1.0);
    image(img, -img.width, 0);
    popMatrix();
  }
  else
  {
    if (frameCount%240 == 0)
    {
      background(240);
      strokeWeight(.5);
      stroke(30);
      strokeWeight(random(0.1, 4));
    }
  }

  if (fullQ == false)
    fullQuery(depth);
  else
    dualQuery(depth);

  // Closest point marker
  if (RGBimg == true)
  {
    stroke(0, 0, 255);
    ellipse(closestX[0], closestY[0], 2, 2);
  }


  if (modeNum == 0)
  {
    updateCircles();
  }
  else if (modeNum == 1)
  {
    updateBalls();
  }
  else if (modeNum >= 2)
  {
    drawLines();
  }
  else if (modeNum == 3)
  {
    updateCircles();
    updateBalls();
  }
}

void selectMode()
{
  modeNum = (int)random(0, 4);
  if (modeNum == 0)
  {
    RGBimg = true;
    fullQ = true;
  }
  else if (modeNum == 1)
  {
    RGBimg = true;
    fullQ = true;
  }
  else if (modeNum == 2)
  {
    RGBimg = false;
    background(240);
    fullQ = false;
  }
  else if (modeNum == 3)
  {
    RGBimg = true;
    fullQ = true;
  }
  println(modeNum);
}
void fullQuery(int[] depth)
{
  closestVal[0] = 8000;
  for (int x = 0; x < w; x++)
  {
    for (int y = 0; y < h; y++)
    {
      int revX = w-x-1;
      int i = revX + y*w;
      int curDepth = depth[i];

      if (curDepth > 610 && curDepth < 1525 && curDepth < closestVal[0])
      {
        closestVal[0] = curDepth;
        closestX[0] = x;
        closestY[0] = y;
      }
    }
  }
}

void dualQuery(int[] depth)
{
  closestVal[0] = 8000;
  closestVal[1] = 8000;

  for (int x = 0; x < w/2; x++)
  {
    for (int y = 0; y < h; y++)
    {
      int revX = w-x-1;
      int i = revX + y*w;
      int curDepth = depth[i];

      if (curDepth > 610 && curDepth < 1525 && curDepth < closestVal[0])
      {
        closestVal[0] = curDepth;
        closestX[0] = x;
        closestY[0] = y;
      }
    }
  }

  for (int x = w/2; x < w; x++)
  {
    for (int y = 0; y < h; y++)
    {
      int revX = w-x-1;
      int i = revX + y*w;
      int curDepth = depth[i];

      if (curDepth > 610 && curDepth < 1525 && curDepth < closestVal[1])
      {
        closestVal[1] = curDepth;
        closestX[1] = x;
        closestY[1] = y;
      }
    }
  }
}
void keyPressed()
{
  if (keyCode == UP)
  {
    if (deg < 30)
      deg++;
  }
  else if (keyCode == DOWN)
  {
    if (deg > 0)
      deg--;
  }
  if (key == ' ')
  {
    ballNum = 0;
    background(240);
    initBalls();
  }
}

void drawCircles()
{
  for (int i = 0; i < eTotal; i++)
  {
    cirX[i] = (int)random(0, width);
    cirY[i] = (int)random(0, height);
    cirZ[i] = 0;
    cirC[i] = 0;
  }
}

void updateCircles()
{
  for (int i = 0; i < eTotal; i++)
  {
    stroke(140+cirC[i], 194+cirC[i], 240+cirC[i]);
    noFill();
    cirZ[i] += cirSpeed;
    cirC[i] += cirSpeed;
    ellipse(cirX[i], cirY[i], cirZ[i], cirZ[i]);

    if ((closestX[0] < cirX[i]+cirZ[i]) && (closestX[0] > cirX[i]-cirZ[i]) &&
      (closestY[0] > cirY[i]-cirZ[i]) && (closestY[0] < cirY[i]+cirZ[i]))
    {
      cirX[i] = (int)random(0, width);
      cirY[i] = (int)random(0, height);
      cirZ[i] = 0;
      cirC[i] = 0;

      if (frameCount > (2*fps))
        addBall();
    }
  }
}

void initBalls()
{
  for (i=0;i<100;i++)
  {
    x[i]=-10;
    y[i]=-10;
    speed[i]=0;
    ballColor[i]=0;
  }
}

void addBall()
{
  ballNum++;
  y[ballNum] = closestY[0];
  x[ballNum] = closestX[0];
  speed[ballNum] = 0;
  color c;
  c = color(random(255), random(255), random(255), random(85, 100));
  ballColor[ballNum]=c;
}
void updateBalls()
{
  if (modeNum == 2)
  {
    ballNum++;
    y[ballNum] = closestY[0];
    x[ballNum] = closestX[0];
    speed[ballNum] = 0;
    color c;
    c = color(random(255), random(255), random(255), random(75, 100));
    ballColor[ballNum]=c;
  }

  if (ballNum == (ballCount-1))
  {
    ballNum = 0;
  }

  for (i = 0; i<ballCount; i++)
  {
    noStroke();
    fill(ballColor[i]);
    y[i] += speed[i];
    speed[i] += gravity;

    if (y[i] >= height-5)
    { 
      speed[i] *= dampening;
    }
    ellipse(x[i], y[i], bSize, bSize);
  }
}

void drawLines()
{
  if (frameCount%120 == 0)
  {
    background(240);
    strokeWeight(.5);
    stroke(30);
    line(w/2, 0, w/2, h);
    strokeWeight(random(0.1, 4));
  }

  interX[0] = lerp(prevX[0], closestX[0], 0.3);
  interY[0] = lerp(prevY[0], closestY[0], 0.3);
  interX[1] = lerp(prevX[1], closestX[1], 0.3);
  interY[1] = lerp(prevY[1], closestY[1], 0.3);

  //image(img,0,0);
  if (incColor)
    sColor++;
  else
    sColor--;

  if (sColor >= 255)
    incColor = false;
  else if (sColor <= 0)
    incColor = true;

  stroke(sColor, 0, 0);
  line(interX[0], interY[0], interX[1], interY[1]);
  prevX[0] = interX[0];
  prevY[0] = interY[0];
  prevX[1] = interX[1];
  prevY[1] = interY[1];
}

void stop()
{
  kinect.quit();
  super.stop();
}


