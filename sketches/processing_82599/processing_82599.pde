
// Calculate rotation of toRotate about pivot point
void rotate2D(PVector toRotate, PVector pivot, float angleDeg) 
{
  float thetaRad = radians(angleDeg);
  float cosTheta = cos(thetaRad);
  float sinTheta = sin(thetaRad);

  float ox = toRotate.x ;
  float oy = toRotate.y;

  toRotate.x = pivot.x + (ox - pivot.x)*cosTheta - (oy - pivot.y)*sinTheta;
  toRotate.y = pivot.y + (ox - pivot.x)*sinTheta + (oy - pivot.y)*cosTheta;
}

class StarVertex
{
  public PVector m_vPos;
  public boolean m_bDrawn;

  public StarVertex(  PVector vPos, boolean bDrawn)
  {
    m_vPos = vPos;
    m_bDrawn = bDrawn;
  }
}

class Star
{
  PVector   m_centerPos;
  int       m_iBounce;
  float     m_fDistFromCenter;

  public String toString()
  {
    String result = "";
    result += m_centerPos.x + ";" + m_centerPos.y + ";";
    result += m_iBounce + ";";
    result += m_fDistFromCenter + ";";
    return result;
  }

  ArrayList<StarVertex> m_vStarVertex;

  public void SetVertexNb(int iNbVertex)
  {
    iNbVertex = Math.max ( iNbVertex, 3);
    if ( m_vStarVertex.size() > iNbVertex)
    {
      int nbToRemove=  m_vStarVertex.size() - iNbVertex;
      for ( int i=0; i<nbToRemove; i++)
      {
        m_vStarVertex.remove(0);
      }
      ComputeVertexPos();
    }
    if ( m_vStarVertex.size() < iNbVertex)
    {
      int nbToAdd =  iNbVertex - m_vStarVertex.size() ; 
      for ( int i=0; i<nbToAdd; i++)
      {
        m_vStarVertex.add( new StarVertex(new PVector(0, 0), false) );
      }
      ComputeVertexPos();
    }
  }

  public void SetDistFromCenter(float fDistFromCenter)
  {
    m_fDistFromCenter = fDistFromCenter;
    ComputeVertexPos();
  }

  public void SetBounce(int iBounce)
  {    
    int nbVertex = m_vStarVertex.size();
    iBounce %= nbVertex;
    m_iBounce =  Math.max ( iBounce, 2);
    ComputeVertexPos();
  }

  private void ComputeVertexPos()
  {
    int nbVertex = m_vStarVertex.size();
    float rotationStep = 360.0f / (float)nbVertex;

    for (int i=0; i<nbVertex; i++)
    {
      PVector vertexPos = m_vStarVertex.get(i).m_vPos;
      vertexPos.x = m_centerPos.x + m_fDistFromCenter;
      vertexPos.y = m_centerPos.y;
      rotate2D( vertexPos, m_centerPos, i * rotationStep);
    }
  }

  public Star(int iNbVertex, PVector centerPos, int iBounce, float fDistFromCenter )
  {           
    m_centerPos = centerPos;
  
    iBounce %= iNbVertex;
    m_iBounce =  Math.max ( iBounce, 2);
   
    m_fDistFromCenter = fDistFromCenter;

    iNbVertex = Math.max ( iNbVertex, 3);

    m_vStarVertex = new ArrayList<StarVertex>();
    for (int i=0; i<iNbVertex; i++)
    {
      m_vStarVertex.add( new StarVertex(new PVector(0, 0), false) );
    }
    ComputeVertexPos();
  }

  public void draw()
  {
    int nbVertexDraw = 0;
    for (int i=0; i<m_vStarVertex.size(); i++)
    {
      m_vStarVertex.get(i).m_bDrawn = false;
    }

    int endLineIndex;
    int nbVertex = m_vStarVertex.size();
    while ( nbVertexDraw < nbVertex)
    {
      for (int i=0; i<nbVertex; i++)
      {
        if ( !m_vStarVertex.get(i).m_bDrawn )
        {
          endLineIndex = (i + m_iBounce) % nbVertex;
          line (m_vStarVertex.get(i).m_vPos.x, m_vStarVertex.get(i).m_vPos.y, 
          m_vStarVertex.get(endLineIndex).m_vPos.x, m_vStarVertex.get(endLineIndex).m_vPos.y);
        }
        m_vStarVertex.get(i).m_bDrawn = true;
        nbVertexDraw++;
      }
    }
  }
}

Star m_Star;

int distFromCenter = 50;
int maxDistFromCenter = 300;

int vCount = 7;
int maxVCount = 30;

int bounce = 2;

void setup()
{
  size (800, 600);
  frameRate(60);
  m_Star = new Star(vCount, new PVector(400, 300), bounce, distFromCenter);
}


float elapsedTime = 0; //since the app started;

//in ms
float timeSinceLastUpdate = 0;
float timeForUpdate = 50;

int r= 2;
int g =4;
int b = 7;

void draw()
{
  float currentTime = millis();
  float deltaTime = currentTime - elapsedTime;
  elapsedTime = currentTime;

  strokeWeight(3);

  //fading effect
  fill(255, 255,255, 15);
  rect(0, 0, width, height); 


  timeSinceLastUpdate += deltaTime;
  if ( timeSinceLastUpdate > timeForUpdate)
  {
    timeSinceLastUpdate -= timeForUpdate;

    distFromCenter+=15;
    distFromCenter %= maxDistFromCenter;
    m_Star.SetDistFromCenter(distFromCenter);

    vCount++;
    vCount %= maxVCount;
    m_Star.SetVertexNb( vCount);

    bounce++;
    m_Star.SetBounce(bounce);
    
    r+=1;  r%= 255;
    g+=2;  g%= 255;
    b+=3;  b%= 255;
    stroke(r,g,b,255);
    m_Star.draw();

    //System.out.println( m_Star);
  }
  

}



