
int[][] pSpace;
int nWalkers = 0;
int[] r,g,b;
float[] scaleVariation = {-0.1,0.1};
ArrayList walkers;
boolean isStart = false;
boolean isPause = false;
PFont f;

int numPoints = 0;
float[] cX,cY;

void setup()
{
  size(640,480);
  background(255);
  noStroke();
  
  walkers = new ArrayList();
  r = new int[0];
  g = new int[0];
  b = new int[0];
  
  pSpace = new int[width][height];
  for(int i = 0;i < width;i++)
  {
    for(int j = 0;j < height;j++)
    {
      pSpace[i][j] = 0;
    }
  }
  
  f = createFont("Georgia",20,true);
}

void draw()
{
  background(255);
  if(isStart == false)
  {
    textFont(f,20);
    fill(0);
    text("Click anywhere to start.",200,240);
    text("Every click starts a random walker.",200,270);
    text("Left/Right clicks vary Red/Blue components.",200,300);
  }
  else
  {
    for(int i = 0;i < walkers.size();i++)
    {
      fill(r[i],g[i],b[i],100);
      RandomWalker walker = (RandomWalker) walkers.get(i);
      if(isPause == false)
      {
        walker.update(pSpace);
      }
      walker.display();
    }
    
    textFont(f,20);
    fill(0);
    text("p: Play/Pause | r: Reset | s: Save",50,450);
  }
}

void keyPressed()
{
  switch(key)
  {
    case 'p':
      isPause = !isPause;
      break;
    case 'r':
      r = new int[0];
      g = new int[0];
      b = new int[0];

      for(int i = walkers.size()-1;i > -1;i--)
      {
        RandomWalker walker = (RandomWalker) walkers.get(i);
        walker.reset();
        walkers.remove(i);
      }
      nWalkers = 0;
      break;
    case 's':
      saveFrame("rWalker-#####.png");
      break;
  }
}

void mousePressed()
{
  isStart = true;
  
  nWalkers += 1;
  if(mouseButton == LEFT)
  {
    r = expand(r,nWalkers);
    g = expand(g,nWalkers);
    b = expand(b,nWalkers);
    
    r[nWalkers-1] = int(random(127,255));
    g[nWalkers-1] = int(random(127,255));
    b[nWalkers-1] = int(random(0,127));
  }
  else
  {
    r = expand(r,nWalkers);
    g = expand(g,nWalkers);
    b = expand(b,nWalkers);
    
    r[nWalkers-1] = int(random(0,127));
    g[nWalkers-1] = int(random(127,255));
    b[nWalkers-1] = int(random(127,255));
  }
  walkers.add(new RandomWalker(nWalkers,mouseX,mouseY));
  RandomWalker walker = (RandomWalker) walkers.get(nWalkers-1);
  walker.setParameters(random(10,15),random(5,15),scaleVariation);
  walker.setBrushShape("star",int(random(3,6)),0.4);
}
class RandomWalker
{
  private int idx;
  private int numPoints;
  private int shapeType,numSides;
  private float holeRad;
  private float stepLength;
  private float radius;
  
  private float minRad,maxRad;
  
  private float[] cX,cY;
  private float[] shapeX,shapeY;
  
  private boolean isStop;
  
  RandomWalker(int id, float orgX,float orgY)
  {
    idx = id;
    
    numPoints = 1;
    holeRad = 0.0;
    shapeType = 0;
    numSides = 2;
    
    isStop = true;
    
    cX = new float[1];
    cY = new float[1];
    
    stepLength = 10;
    radius = 7;
    minRad = -0.05;
    maxRad = 0.05;
    
    cX[0] = orgX;
    cY[0] = orgY;
    
    setBrushShape("star",5,0.4);
  }
  
  void setParameters(float stp,float scl,float[] sclVar)
  {
    stepLength = stp;
    radius = scl;
    minRad = sclVar[0];
    maxRad = sclVar[1];
  }
  
  void setBrushShape()
  {
    setBrushShape("polygon",2,0.0);
  }
  
  void setBrushShape(String sType,int nSides)
  {
    setBrushShape(sType,nSides,0.0);
  }
  
  void setBrushShape(String sType,int nSides,float inRad)
  {
    shapeX = new float[0];
    shapeY = new float[0];
    
    if(inRad > 1.0)holeRad = 0.0;
    else holeRad = inRad;
    
    if(nSides > 2)
    {
      if(sType.equals("polygon") == true)
      {
        numSides = nSides;
        shapeX = new float[nSides];
        shapeY = new float[nSides];
        shapeType = 1;
        
        float theta = TWO_PI/float(numSides);
        for (int i = 0; i < numSides; i++)
        {
          shapeX[i] = cos(TWO_PI*float(i)/float(numSides));
          shapeY[i] = sin(TWO_PI*float(i)/float(numSides));
        }
      }
      else if(sType.equals("star") == true)
      {
        numSides = 2*nSides;
        shapeX = new float[2*nSides];
        shapeY = new float[2*nSides];
        shapeType = 2;
        
        for (int i = 0; i < numSides; i++)
        {
          if(i%2 == 1)
          {
            shapeX[i] = inRad*cos(TWO_PI*float(i)/float(numSides));
            shapeY[i] = inRad*sin(TWO_PI*float(i)/float(numSides));
          }
          else
          {
            shapeX[i] = cos(TWO_PI*float(i)/float(numSides));
            shapeY[i] = sin(TWO_PI*float(i)/float(numSides));
          }          
        }
      }
    }
    else // Vertical Unit Line centered at (0,0)  
    {
      numSides = nSides;
      shapeX = new float[2];
      shapeY = new float[2];
      shapeType = 0;
      shapeX[0] = 0.0;
      shapeX[1] = 0.0;
      shapeY[0] = -0.5;
      shapeY[1] = 0.5;
    }
  }
  
  void update(int[][] pSpc)
  {
    if(isStop == false){return;}
    
    float ang = random(0,360);
    float scl = random(minRad,maxRad);
    
    float tX = cX[numPoints-1]+(stepLength+scl)*cos(ang);
    float tY = cY[numPoints-1]+(stepLength+scl)*sin(ang);
    
    int px = int(tX);
    int py = int(tY);
    
    px = px%width;
    py = py%height;
    
    if(px < 0){px += width;}
    
    if(py < 0){py += height;}
    
    tX = float(px);
    tY = float(py);
    
    if(pSpc[px][py] == 0 || pSpc[px][py] == idx)
    {
      numPoints = numPoints+1;
      cX = expand(cX,numPoints);
      cY = expand(cY,numPoints);
      cX[numPoints-1] = tX;
      cY[numPoints-1] = tY;
      pSpc[px][py] = idx;
    }
    else isStop = false;
  }
  
  void reset()
  {
    cX = new float[0];
    cY = new float[0];
    numPoints = 0;
  }
  
  void display()
  {
    for(int j = 0; j < cX.length; j++)
    {
      pushMatrix();
      translate(cX[j],cY[j]);
        beginShape();
        for (int i = 0; i < numSides; i++)
        {
          float scl = random(-0.01,0.05);
          vertex((radius+scl)*shapeX[i],(radius+scl)*shapeY[i]);
        }
        if(shapeType > 0)
        {endShape(CLOSE);}
        else{endShape();}
      popMatrix();
    }
  }
}


