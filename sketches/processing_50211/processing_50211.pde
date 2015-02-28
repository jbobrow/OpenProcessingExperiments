
/* Shugo Tanaka
   1/24/2012

   This program does a buncha fun awesomeness in a box!
*/

int ballCount = 100;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speed = new float[ballCount];
color[] ballColor = new color[ballCount];
float gravity = 0.1;
float dampening = -0.85;
int i = 0;
int ballNum = 0;

void setup()
{
  size(480, 480);
  ellipseMode(CENTER);
  colorMode(RGB, 255, 255, 255, 255);
  fill(0);
  background(240);
  noStroke();
  // Initializes array
  for (i=0;i<100;i++)
  {
    x[i]=-10;
    y[i]=-10;
    speed[i]=0;
    ballColor[i]=0;
  }
}

void draw()
{
  background(240);

  for (i = 0; i<ballCount; i++)
  {
    fill(ballColor[i]);
    y[i] += speed[i];
    speed[i] += gravity;

    if (y[i] >= height-5)
    { 
      speed[i] *= dampening;
    }
    ellipse(x[i], y[i], 10, 10);
  }
}

void mouseDragged()
{ 
  ballNum++;
  y[ballNum] = mouseY;
  x[ballNum] = mouseX;
  speed[ballNum] = 0;
  color c;
  c = color(random(255),random(255),random(255),random(75,100));
  ballColor[ballNum]=c;

  if (ballNum == (ballCount-1))
  {
    ballNum = 0;
  }
}

void keyPressed()
{
  ballNum = 0;
  background(240);
  for (i=0;i<ballCount;i++)
  {
    x[i]=-10;
    y[i]=-10;
    speed[i]=0;
    ballColor[i]=0;
  }
}


