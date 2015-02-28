
void setup() 
{
  size(900, 450, P2D);
  background(0);
}

float m_AngleDelta = 6;
float m_RadiusDelta = 10;
float m_Distance = 6;
float m_Angle = 45;
float m_Radius = 60;
float m_X = 400;
float m_Y = 300;

void draw() 
{
  smooth();
  
  drawNextCircle(color(0));
  drawNextCircle(color(255));
}

void drawNextCircle(color c)
{
  ellipseMode(CENTER);
  fill(c);
  
  ellipse(m_X, m_Y, m_Radius, m_Radius);

  m_Angle += m_AngleDelta;
  m_Radius += m_RadiusDelta;
  m_X += m_Distance * sin(radians(m_Angle));
  m_Y += m_Distance * cos(radians(m_Angle));

  if(random(100) < 2)
    m_AngleDelta = random(10) - 5;

  if(random(100) < 2)
    m_RadiusDelta = random(6) - 3;

  if(m_X < 0 || m_Y < 0 || m_X >= width || m_Y >= height)
    m_Angle += 90;

  if(m_Radius > 100 || m_Radius < -100)
    m_RadiusDelta *= -1;
}                                                                                                               
