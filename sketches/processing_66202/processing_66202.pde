

import ddf.minim.*;

AudioSample note01;
AudioSample note02;
AudioSample note03;
AudioSample note04;
AudioSample bass;
Minim minim;

// Constants instead of enum because processing doesn't support it
private static final int CELL_STATE_Empty = 0;
private static final int CELL_STATE_Born = 1;
private static final int CELL_STATE_Alive = 2;
private static final int CELL_STATE_Dead = 3;

private static final int PATTERN_Random = 0;
private static final int PATTERN_RandomSymetry = 1;
private static final int PATTERN_Center3Vert = 2;

// Properties that can be modified
private static final float ms_fTimeStep = 800.0;
private static final int ms_nWorldWidth = 10;
private static final int ms_nWorldHeight = 10;
private static final int ms_nWorldDepth = 10;
private static final int ms_nInitialAliveCellPercent = 10;
private static final int ms_nInitialPattern = PATTERN_RandomSymetry;

private static final int ms_nWidth = 800;
private static final int ms_nHeight = 800;
private static final int ms_nDepth = 800;

// Private attributes
private final float m_fXOffset = (float)ms_nWidth / (float)ms_nWorldWidth;
private final float m_fYOffset = (float)ms_nHeight / (float)ms_nWorldHeight;
private final float m_fZOffset = (float)ms_nDepth / (float)ms_nWorldDepth;

private final float m_fXHalfOffset = m_fXOffset / 2.0;
private final float m_fYHalfOffset = m_fYOffset / 2.0;
private final float m_fZHalfOffset = m_fZOffset / 2.0;

private final float m_fXcamOffset = ((float)ms_nWidth / 2.0);
private final float m_fYcamOffset = ((float)ms_nHeight / 2.0);
private final float m_fZcamOffset = (float)ms_nDepth * 1.5;

private final float m_fZcamCenterOffset = (float)(ms_nHeight / 2.0);

private int[][][][] m_vecWorld;
private int m_nPreviousWorld;
private int m_nCurrentWorld;

private float m_fPreviousTime = 0.0f;
private float m_fDeltaTimer = 0.0f;

PImage iBackground;

void setup()
{
  size(800, 800, P3D);
  
  iBackground = loadImage ("LogoBackground.jpg");
  stroke(85);
  fill(64);
  
  minim = new Minim(this);
  note01 = minim.loadSample("Note01.mp3");
  note02 = minim.loadSample("Note02.mp3");
  note03 = minim.loadSample("Note03.mp3");
  note04 = minim.loadSample("Note04.mp3");
  bass = minim.loadSample("Bass.mp3");
  
  m_vecWorld = new int[2][ms_nWorldWidth + 2][ms_nWorldHeight + 2][ms_nWorldDepth + 2];

  resetWorld();
}

void draw()
{
  background(iBackground);
  
  float fTime = millis();
  m_fDeltaTimer += fTime - m_fPreviousTime;

  // Lights definition
  ambientLight(100, 100, 100);
  directionalLight(255, 255, 255, -800, 200, -400);
  directionalLight(150, 150, 150, 800, -200, 400);
  directionalLight(255, 255, 255, 0, 1, 0);

  // Camera definition
  float fCamPosX = (cos(fTime / 5000.0) * m_fZcamOffset) + m_fXcamOffset;
  float fCamPosY = ((cos(fTime / 10000.0) * m_fZcamOffset) + m_fYcamOffset);
  float fCamPosZ = (sin(fTime / 5000.0) * m_fZcamOffset) + m_fYcamOffset;

  beginCamera();
  camera(fCamPosX, fCamPosY , fCamPosZ, m_fXcamOffset, m_fYcamOffset, m_fZcamCenterOffset, 0.0, 1.0, 0.0);
  endCamera();
  
  while (m_fDeltaTimer > ms_fTimeStep)
  {
    updateWorld();
    if (!isWorldStatic())
    {
      playNote();
    }
    
    m_fDeltaTimer -= ms_fTimeStep;
  }
  
  drawWorld();
  drawCorner();
  
  m_fPreviousTime = fTime;
}

void mousePressed()
{
  resetWorld();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  note01.close();
  note02.close();
  note03.close();
  note04.close();
  minim.stop();
  
  super.stop();
}

private void updateWorld()
{
  m_nPreviousWorld = m_nCurrentWorld;
  m_nCurrentWorld = 1 - m_nCurrentWorld;

  copyExtremityCells();

  for (int i = 0; i < ms_nWorldWidth; ++i)
  {
    for (int j = 0; j < ms_nWorldHeight; ++j)
    {
      for (int k = 0; k < ms_nWorldDepth; ++k)
      {
        int x = i + 1;
        int y = j + 1;
        int z = k + 1;
        int nSum = getNeighbourhoodAliveCellCount(x, y, z);

        if (isAlive(m_nPreviousWorld, x, y, z))
        {
          if (nSum >= 2 && nSum <= 3)
          {
            m_vecWorld[m_nCurrentWorld][x][y][z] = CELL_STATE_Alive;
          }
          else
          {
            m_vecWorld[m_nCurrentWorld][x][y][z] = CELL_STATE_Dead;
          }
        }
        else
        {
          if (nSum == 3)
          {
            m_vecWorld[m_nCurrentWorld][x][y][z] = CELL_STATE_Born;
          }
          else
          {
            m_vecWorld[m_nCurrentWorld][x][y][z] = CELL_STATE_Empty;
          }
        }
      }
    }
  }
}

private void resetWorld()
{
  m_nPreviousWorld = 0;
  m_nCurrentWorld = 1;

  for (int i = 0; i < ms_nWorldWidth + 2; ++i)
  {
    for (int j = 0; j < ms_nWorldHeight + 2; ++j)
    {
      for (int k = 0; k < ms_nWorldDepth + 2; ++k) 
      {
        m_vecWorld[m_nCurrentWorld][i][j][k] = CELL_STATE_Empty;
      }
    }
  }

  switch (ms_nInitialPattern)
  {
  case PATTERN_Random: 
    initializeWorldRandom(); 
    break;
  case PATTERN_RandomSymetry: 
    initializeWorldRandomSymetry(); 
    break;
  case PATTERN_Center3Vert: 
    initializeWorldCenter3Vert(); 
    break;
  }
}

private void initializeWorldRandom()
{
  for (int i = 0; i < ms_nWorldWidth + 2; ++i)
  {
    for (int j = 0; j < ms_nWorldHeight + 2; ++j)
    {
      for (int k = 0; k < ms_nWorldDepth + 2; ++k)
      {
        m_vecWorld[m_nCurrentWorld][i][j][k] = (int)random(100) > ms_nInitialAliveCellPercent ? CELL_STATE_Empty : CELL_STATE_Alive;
      }
    }
  }
}

private void initializeWorldCenter3Vert()
{
  m_vecWorld[m_nCurrentWorld][ms_nWorldWidth / 2 + 1][ms_nWorldHeight / 2][ms_nWorldDepth / 2 + 1] = CELL_STATE_Alive;
  m_vecWorld[m_nCurrentWorld][ms_nWorldWidth / 2 + 1][ms_nWorldHeight / 2 + 1][ms_nWorldDepth / 2 + 1] = CELL_STATE_Alive;
  m_vecWorld[m_nCurrentWorld][ms_nWorldWidth / 2 + 1][ms_nWorldHeight / 2 + 2][ms_nWorldDepth / 2 + 1] = CELL_STATE_Alive;
}

private void initializeWorldRandomSymetry()
{
  int nWidthMax = ms_nWorldWidth + 2;
  int nHeightMax = ms_nWorldHeight + 2;
  int nDepthMax = ms_nWorldDepth + 2;

  for (int i = 0; i < nWidthMax / 2; ++i)
  {
    for (int j = 0; j < nHeightMax / 2; ++j)
    {
      for (int k = 0; k < nDepthMax / 2; ++k)
      {
        int nCellValue = (int)random(100) > ms_nInitialAliveCellPercent ? CELL_STATE_Empty : CELL_STATE_Alive;
        
        m_vecWorld[m_nCurrentWorld][i][j][k] = nCellValue;
        m_vecWorld[m_nCurrentWorld][nWidthMax - i - 1][j][k] = nCellValue;
        m_vecWorld[m_nCurrentWorld][i][nHeightMax - j - 1][k] = nCellValue;
        m_vecWorld[m_nCurrentWorld][i][j][nDepthMax - k - 1] = nCellValue;
        m_vecWorld[m_nCurrentWorld][nWidthMax - i - 1][nHeightMax - j - 1][k] = nCellValue;
        m_vecWorld[m_nCurrentWorld][nWidthMax - i - 1][j][nDepthMax - k - 1] = nCellValue;
        m_vecWorld[m_nCurrentWorld][i][nHeightMax - j - 1][nDepthMax - k - 1] = nCellValue;
        m_vecWorld[m_nCurrentWorld][nWidthMax - i - 1][nHeightMax - j - 1][nDepthMax - k - 1] = nCellValue;
      }
    }
  }
}

private void copyExtremityCells()
{
  for (int i = 0; i < ms_nWorldWidth + 2; ++i)
  {
    for (int j = 0; j < ms_nWorldDepth + 2; ++j)
    {
      m_vecWorld[m_nPreviousWorld][i][0][j] = m_vecWorld[m_nPreviousWorld][i][ms_nWorldHeight][j];
      m_vecWorld[m_nPreviousWorld][i][ms_nWorldHeight + 1][j] = m_vecWorld[m_nPreviousWorld][i][1][j];
    }
  }

  for (int i = 0; i < ms_nWorldHeight + 2; ++i)
  {
    for (int j = 0; j < ms_nWorldDepth + 2; ++j)
    {
      m_vecWorld[m_nPreviousWorld][0][i][j] = m_vecWorld[m_nPreviousWorld][ms_nWorldWidth][i][j];
      m_vecWorld[m_nPreviousWorld][ms_nWorldWidth + 1][i][j] = m_vecWorld[m_nPreviousWorld][1][i][j];
    }
  }

  for (int i = 0; i < ms_nWorldWidth + 2; ++i)
  {
    for (int j = 0; j < ms_nWorldHeight + 2; ++j)
    {
      m_vecWorld[m_nPreviousWorld][i][j][0] = m_vecWorld[m_nPreviousWorld][i][j][ms_nWorldDepth];
      m_vecWorld[m_nPreviousWorld][i][j][ms_nWorldDepth + 1] = m_vecWorld[m_nPreviousWorld][i][j][1];
    }
  }
}

private int getNeighbourhoodAliveCellCount(int x, int y, int z)
{
  int nSum = 0;

  for (int i = -1; i <= 1; ++i)
  {
    for (int j = -1; j <= 1; ++j)
    {
      for (int k = -1; k <= 1; ++k)
      {
        if (!(i == 0 && j == 0 && k ==0) && isAlive(m_nPreviousWorld, x + i, y + j, z + k))
        {
          nSum++;
        }
      }
    }
  }

  return nSum;
}

private boolean isAlive(int nWorld, int x, int y, int z)
{
  return m_vecWorld[nWorld][x][y][z] == CELL_STATE_Alive || m_vecWorld[nWorld][x][y][z] == CELL_STATE_Born;
}

private void drawWorld()
{
  for (int i = 1; i <= ms_nWorldWidth; ++i)
  {
    for (int j = 1; j <= ms_nWorldHeight; ++j)
    {
      for (int k = 1; k <= ms_nWorldDepth; ++k)
      {
        if (isAlive(m_nCurrentWorld, i, j, k))
        {
          drawCell(i, j, k);
        }
      }
    }
  }
}

private void drawCell(int x, int y, int z)
{
  float posX = (x * m_fXOffset) - m_fXHalfOffset;
  float posY = (y * m_fYOffset) - m_fYHalfOffset;
  float posZ = (z * m_fZOffset) - m_fZHalfOffset;
  
  pushMatrix();
  translate(posX, posY, posZ);
  box(m_fXOffset / 1.2, m_fYOffset / 1.2, m_fZOffset / 1.2);
  popMatrix();
}

private void drawCorner()
{
 line (0.0, 0.0, 0.0, m_fXOffset, 0.0, 0.0);
 line (0.0, 0.0, 0.0, 0.0, m_fYOffset, 0.0);
 line (0.0, 0.0, 0.0, 0.0, 0.0, m_fZOffset);
 
 line (ms_nWidth, 0.0, 0.0, ms_nWidth - m_fXOffset, 0.0, 0.0);
 line (ms_nWidth, 0.0, 0.0, ms_nWidth, m_fYOffset, 0.0);
 line (ms_nWidth, 0.0, 0.0, ms_nWidth, 0.0, m_fZOffset);
 
 line (0.0, ms_nHeight, 0.0, m_fXOffset, ms_nHeight, 0.0);
 line (0.0, ms_nHeight, 0.0, 0.0, ms_nHeight - m_fYOffset, 0.0);
 line (0.0, ms_nHeight, 0.0, 0.0, ms_nHeight, m_fZOffset);
 
 line (ms_nWidth, ms_nHeight, 0.0, ms_nWidth - m_fXOffset, ms_nHeight, 0.0);
 line (ms_nWidth, ms_nHeight, 0.0, ms_nWidth, ms_nHeight - m_fYOffset, 0.0);
 line (ms_nWidth, ms_nHeight, 0.0, ms_nWidth, ms_nHeight, m_fZOffset);
 
 line (0.0, 0.0, ms_nDepth, m_fXOffset, 0.0, ms_nDepth);
 line (0.0, 0.0, ms_nDepth, 0.0, m_fYOffset, ms_nDepth);
 line (0.0, 0.0, ms_nDepth, 0.0, 0.0, ms_nDepth - m_fZOffset);
 
 line (ms_nWidth, 0.0, ms_nDepth, ms_nWidth - m_fXOffset, 0.0, ms_nDepth);
 line (ms_nWidth, 0.0, ms_nDepth, ms_nWidth, m_fYOffset, ms_nDepth);
 line (ms_nWidth, 0.0, ms_nDepth, ms_nWidth, 0.0, ms_nDepth - m_fZOffset);
 
 line (0.0, ms_nHeight, ms_nDepth, m_fXOffset, ms_nHeight, ms_nDepth);
 line (0.0, ms_nHeight, ms_nDepth, 0.0, ms_nHeight - m_fYOffset, ms_nDepth);
 line (0.0, ms_nHeight, ms_nDepth, 0.0, ms_nHeight, ms_nDepth - m_fZOffset);
 
 line (ms_nWidth, ms_nHeight, ms_nDepth, ms_nWidth - m_fXOffset, ms_nHeight, ms_nDepth);
 line (ms_nWidth, ms_nHeight, ms_nDepth, ms_nWidth, ms_nHeight - m_fYOffset, ms_nDepth);
 line (ms_nWidth, ms_nHeight, ms_nDepth, ms_nWidth, ms_nHeight, ms_nDepth - m_fZOffset);
}

private void playNote()
{
  int aliveCell = 0;
  for (int i = 1; i <= ms_nWorldWidth; ++i)
  {
    for (int j = 1; j <= ms_nWorldHeight; ++j)
    {
      for (int k = 1; k <= ms_nWorldDepth; ++k)
      {
        if (isAlive(m_nCurrentWorld, i, j, k))
        {
          aliveCell++;
        }
      }
    }
  }
  
  int noteToPlay = aliveCell % 5;
  
  switch(noteToPlay) {
    case 1: 
      note01.trigger();
      break;
    case 2: 
      note02.trigger();
      break;
    case 3: 
      note03.trigger();
      break;
    case 4: 
      note04.trigger();
      break;
  }
  
  bass.trigger();
}


private boolean isWorldStatic()
{
    for (int i = 0; i < ms_nWorldWidth; ++i)
    {
        for (int j = 0; j < ms_nWorldHeight; ++j)
        {
            for (int k = 0; k < ms_nWorldDepth; ++k)
            {
                if (isAlive(m_nCurrentWorld, i, j, k) != isAlive(m_nPreviousWorld, i, j, k))
                {
                    return false;
                }
            }
        }
    }
    
    return true;
}





