
// "Leaf Monster" by Kelly Peterson. Created for "Processing Monsters"
//
//  Click either mouse button to make the leaves attracted to the mouse
//
// slickkelly@hotmail.com

float m_sinWaveIncrement = 0.02;
float m_currentSinParameter = 0.0f;

int m_maxNodes = 150;
int m_minNodes = 30;

int g_iLeavesPerRib = 13;
int g_iTotalRibs = 36;

int g_screenWidth = 500;
int g_screenHeight = 500;

int g_centerX;
int g_centerY;

float g_E = 2.71828;

int eyeTime = 0;

void setup() {
  size(g_screenWidth, g_screenHeight);

}

void draw()
{
  background(255);
  stroke(0);
  fill(0);

  m_currentSinParameter += m_sinWaveIncrement;

  g_centerX = g_screenWidth / 2;
  g_centerY = g_screenHeight / 2;

  double a = (float)g_iLeavesPerRib;
  double currentSin = sin(m_currentSinParameter);
  currentSin += 1.0f;
  currentSin *= 0.5f;

  int totalNodes = (int)(currentSin * (float)(m_maxNodes - m_minNodes)); // number of nodes along the structure
  totalNodes += m_minNodes;
  float w = g_screenWidth / 4; // radius of circle to fill (movie is 300 pixels wide)

  float phi = (sqrt(5.0f) + 1.0f) / 2.0f - 1.0f; // the golden ratio
  float ga = phi * 2.0f * PI;    // the golden angle - used for phyllotaxis on many plants

  for (int i = 1; i <= totalNodes; i++)
  {
    float theta = i * ga;            // angle of phyllotaxis
    float r = log(1.0f + i * (g_E - 1.0f) / totalNodes); // logarithmic distance to edge of movie (0-1)

    r *= w;
    // make sure that this theta get bounded from [0,2?]
    int radians = (int)(theta / (1.0f * PI));
    theta = theta - ((float)radians * (1.0f * PI));

    // draw the first set of "leaves"
    drawLeaf(r, theta);

    // above we were only filling in from 0 to PI
    theta += PI;
    drawLeaf(r, theta);

    // finally, let's draw an eye in the middle
    drawEye();
  }
}

void drawLeaf(float r, float theta)
{
  float x = g_centerX;
  x += r * cos( theta );
  float y = g_centerY;
  y += r * sin( theta );

  float leafLength = 20;

  float toX = g_centerX;
  float toY = g_centerY;
  // let's see if we want to attract the leaves
  if( mousePressed )
  {
    toX = mouseX;
    toY = mouseY;
  }

  float dx = x - toX;
  float dy = y - toY;
  float dMag = sqrt((dx * dx) + (dy * dy));
  dx /= dMag;
  dy /= dMag;

  float x2 = x + (dx * leafLength);
  float y2 = y + (dy * leafLength);

  drawLeafShape(x, y, x2, y2);
}

void drawLeafShape(float x1,float y1,float x2, float y2)
{
  float dx = x1-x2;
  float dy = y1-y2;
  float d = sqrt(dx*dx+dy*dy);
  float a = atan2(dy,dx);
  float ar1 = random(-2.7,-3);
  float ar2 = random(-.2,-.9);
  float l1 = random(.4,.7);
  float l2 = l1+random(-.2,.2);
  float cx1 = x1+cos(a+ar1)*d*l1;
  float cy1 = y1+sin(a+ar1)*d*l1;
  float cx2 = x2+cos(a+ar2)*d*.3;
  float cy2 = y2+sin(a+ar2)*d*.3;
  noStroke();
  fill(0);
  bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);
  cx1 = x1+cos(a-ar1)*d*l2;
  cy1 = y1+sin(a-ar1)*d*l2;
  cx2 = x2+cos(a-ar2)*d*.3;
  cy2 = y2+sin(a-ar2)*d*.3;
  bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);
}

void drawEye()
{
  float x = g_screenWidth / 2;
  float y =  g_screenHeight / 2;

  noFill();
  stroke(0);
  ellipse(x, y, 51, 51);

  fill(255);
  ellipse(x, y, 50, 50);

  double currentCos = cos(m_currentSinParameter);
  currentCos += 1.0f;
  currentCos *= 0.5f;
  int maxPupilSize = 30;
  int pupilSize = (int)(currentCos * maxPupilSize);

  noStroke();

  boolean enableBlink = false;
  if( enableBlink && eyeTime % 10000 > 5000)
  {
    fill(255);

    ellipse(x, y, pupilSize, pupilSize);
  }
  else
  {
    fill(0);
    ellipse(x, y, pupilSize, pupilSize);
  }

  eyeTime++;
}










