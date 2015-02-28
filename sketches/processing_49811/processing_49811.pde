
final int g_iNumParticles = 4000;
Particle[] g_aParticles = new Particle[g_iNumParticles];
float g_fTime = 0;
PImage g_background;

class Particle
{
  Particle()
  {
    reset();
  }
  
  void reset()
  {
    m_vecPosition = new PVector(random(-width/2, width + width/2), random(-height/2, height + height/2), 0);
    m_fLifeAlpha = 0;
    float fMaxLife = random(1, 6);
    m_fLifeStep = (1.0/30.0) / fMaxLife;
    m_fSpeedAlpha = random(0, 1);
  }
  
  void update()
  {  
    m_fLifeAlpha += m_fLifeStep;
    if (m_fLifeAlpha > 1.0 || 
        m_vecPosition.x < -width/2 || m_vecPosition.x > width + width/2 || 
        m_vecPosition.y < -height/2 || m_vecPosition.y > height + height/2)
    {
      reset();
    }

    float fSize = lerp(20, 0, cos(m_fLifeAlpha * TWO_PI) * 0.5 + 0.5);
    float fNoiseHeadingAlpha = noise(m_vecPosition.x / width * 0.5, m_vecPosition.y / height * 0.5, g_fTime * 0.2);
    float fNoiseHeading = fNoiseHeadingAlpha * TWO_PI;
    float fSpeed = lerp(1, 3, m_fSpeedAlpha);

    fill(((fNoiseHeadingAlpha * 2) % 1) * 100, lerp(40, 90, m_fSpeedAlpha), lerp(100, 30, m_fLifeAlpha), 75);
    ellipse(m_vecPosition.x, m_vecPosition.y, fSize, fSize);
    
    m_vecPosition.x += sin(fNoiseHeading) * fSpeed;
    m_vecPosition.y += cos(fNoiseHeading) * fSpeed;
  }
  
  PVector m_vecPosition;
  float m_fHeading;
  float m_fLifeAlpha;
  float m_fLifeStep;
  float m_fSpeedAlpha;
}

void setup()
{
  size(512, 512);
  frameRate(30);
  smooth();
  colorMode(HSB, 100);
  noStroke();
  ellipseMode(CENTER);

  for (int i = 0; i < g_iNumParticles; i++)
  {
    g_aParticles[i] = new Particle();
  }

  // Create a background image
  PGraphics buffer = createGraphics(width, height, P2D);
  buffer.beginDraw();
  buffer.smooth();
  buffer.colorMode(HSB, 100);
  buffer.noStroke();
  for (int i = 0; i < height; i++)
  {
    buffer.stroke(0, 0, lerp(70, 90, sin((float)i / (float)height* PI)) + random(-1, 1));
    buffer.line(0, i, width, i);
  }
  buffer.endDraw();
  g_background = buffer.get(0, 0, width, height);

  // Run the simulation a few times to initialise it
  g_fTime = random(0, 1000);
  for (int i = 0; i < 50; i++)
  {
    update();
  }
}

void draw()
{
  image(g_background, 0, 0);
  update();
}

void update()
{
  g_fTime += (1.0 / 30.0);
  for (int i = 0; i < g_iNumParticles; i++)
  {
    g_aParticles[i].update();
  }
}

