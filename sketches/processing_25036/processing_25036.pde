
///////////////////////////////////
int iScene = 0;
float fSceneTime = 0;
int iNumScenes = 6;
boolean bAutoSceneAdvance = true;
int iNumParticles = 30000;
float fMaxSpeed = 20;
float fDamping = 0.85;

Particle[] aParticles = new Particle[iNumParticles];


///////////////////////////////////
void setup()
{
  size(512, 512, P2D);
  frameRate(30);
  smooth();

  for (int i = 0; i < iNumParticles; i++)
  {
    aParticles[i] = new Particle();
  }
}

void keyPressed()
{
  for (int i = '1'; i <= '1' + iNumScenes - 1; i++)
  {
    if (key == i)
    {
      iScene = i - '1';
      bAutoSceneAdvance = false;
    }
  }
  
  if (key == 'q')
  {
    exit();
  }
}

void draw()
{
  background(0);

  // Automatically advance scene every few seconds
  if (bAutoSceneAdvance)
  {
    fSceneTime += 1.0/30.0;
    if (fSceneTime > 5)
    {
      int iOldScene = iScene;
      while (iScene == iOldScene)
      {
        iScene = (int)random(iNumScenes);
      }
      fSceneTime = 0;
    }
  }
  
  // Update and render all particles
  for (int i = 0; i < iNumParticles; i++)
  {
    aParticles[i].Update();
  }
}


///////////////////////////////////
class Particle
{
  Particle()
  {
    Spawn();
  }

  void Update()
  {
    // Damp
    m_vecVelocity.mult(fDamping);

    // Add forces
    if (iScene == 0)
    {
      ApplyForce(new PVector(256, 256), 500, 0, 1);
    }
    else if (iScene == 1)
    {
      ApplyForce(new PVector(256, 406), 800, -1, 0);
    }
    else if (iScene == 2)
    {
      ApplyForce(new PVector(0+100, 156), 250, -0.5, 2);
      ApplyForce(new PVector(512-100, 156), 250, -0.5, -2);
      ApplyForce(new PVector(256, 250), 550, -1, 0);
    }
    else if (iScene == 3)
    {
      ApplyForce(new PVector(100, 100), 500, -1, 0);
      ApplyForce(new PVector(512-200, 512-200), 200, 1, 2);
    }
    else if (iScene == 4)
    {
      ApplyForce(new PVector(180, 200), 200, 0, 2);
      ApplyForce(new PVector(460, 450), 600, -2, 0.5);
    }
    else if (iScene == 5)
    {
      ApplyForce(new PVector(180, 200), 200, 0, 2);
      ApplyForce(new PVector(420, 40), 100, 2.1, 3);
      ApplyForce(new PVector(220, 400), 600, -2, 0);
      ApplyForce(new PVector(460, 450), 600, -2.2, 0.5);
    }

    // Update position
    m_vecOldPos = m_vecPos.get();
    m_vecVelocity.limit(fMaxSpeed);
    m_vecPos.add(m_vecVelocity);

    // Get particle speed
    PVector vecLength = m_vecPos.get();
    vecLength.sub(m_vecOldPos);
    float fSpeed = vecLength.mag();
    if (fSpeed < 0.5)
    {
      // Particle is pretty stationary
      m_iIdleFrames++;
      
      // Should we kill it yet?
      if (m_iIdleFrames > 10)
      {
        Spawn();
      }
    }
    else
    {
      // How far is particle from center of screen
      PVector vecDistance = new PVector(512/2, 512/2, 0);
      vecDistance.sub(m_vecPos);
      if(vecDistance.mag() > (512 * 2))
      {
        // Too far off screen - kill it
        Spawn();
      }
      else
      {
        // Particle is moving and not too far off screen
        m_iIdleFrames = 0;
        
        // Render it
        PVector vecDirNorm = vecLength.get();
        vecDirNorm.normalize();
        stroke(255,
               150 + 100 * sin(vecDirNorm.x * 10),
               120 + 90 * sin(vecDirNorm.y * 5),
               fSpeed / fMaxSpeed * 200 + 55);
        line(m_vecPos.x, m_vecPos.y, m_vecOldPos.x, m_vecOldPos.y);
      }
    }
  }

  void ApplyForce(PVector vecOrigin, float fRange, float fMaxAttractForce, float fMaxAngleForce)
  { 
    // Are we close enough to be influenced?
    PVector vecToOrigin = m_vecPos.get();
    vecToOrigin.sub(vecOrigin);
    float fDist = vecToOrigin.mag();
    if (fDist < fRange)
    {
      float fDistAlpha = (fRange - fDist) / fRange;
      fDistAlpha = fDistAlpha * fDistAlpha;
      if (fDistAlpha > 0.95)
      {
        // If particle is too close to origin then kill it
        Spawn();
      }
      else
      {
        // Apply attraction/replusion force
        PVector vecNormal = vecToOrigin.get();
        vecNormal.normalize();
        PVector vecForce = vecNormal.get();
        vecForce.mult(fDistAlpha * fMaxAttractForce);
        m_vecVelocity.add(vecForce);
  
        // Apply spin force
        PVector vecTangentForce = new PVector(vecNormal.y, -vecNormal.x, 0);
        vecTangentForce.mult(fDistAlpha * fMaxAngleForce);
        m_vecVelocity.add(vecTangentForce);
      }
    }
  }

  void Spawn()
  {
    m_vecPos = new PVector(random(-512/2, 512+512/2), random(-512/2, 512+512/2), 0);
    m_vecOldPos = m_vecPos.get();
    m_vecVelocity = new PVector(0, 0, 0);
    m_iIdleFrames = 0;
  }

  PVector m_vecPos;
  PVector m_vecOldPos;
  PVector m_vecVelocity;
  int m_iIdleFrames;
}





