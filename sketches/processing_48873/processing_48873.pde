
/*
    Jan. 3, 2011    Jiansheng Feng

*/

int NumVertex = 100;
int NumCnt = 8;
float dia = 6;
float minD = 22;
float maxD = 36;

Network nN;
Signal sS;

int StepCount;

void setup()
{
  size (300, 300);
  background (123);
  smooth();
  
  nN = new Network (NumVertex, minD, maxD);
  sS = new Signal (int(random(NumVertex)), nN.dots);
  
  StepCount = 0;
}


void draw()
{
  if (StepCount < 300)  
  {
    sS.transmit();  
    StepCount++;
  }
  
  //delay(600);
}


class Adot
{
  int id;
  float x;
  float y;
  float dia;
  int[] cnt;
  int n;
  
  Adot (int tempid, float tempx, float tempy, float tempdia)
  {
    id = tempid;
    x = tempx;
    y = tempy;
    dia = tempdia;
    cnt = new int[NumCnt];
    
    for (int i=0; i<NumCnt; i++)
    {  cnt[i] = -1;  }
  }
}


class Network
{
  int NumDots;
  ArrayList dots;
  float MaxDist;
  float MinDist;
 
  Network (int tempN, float tempMinD, float tempMaxD)
  {
    NumDots = tempN;
    MinDist = tempMinD;
    MaxDist = tempMaxD;
    dots = new ArrayList();
    fill(222);
    strokeWeight(2);
    stroke(222);
    
    float xX;
    float yY;
    boolean gooddot;
    for (int p=0; p<NumDots; )
    {
      xX = random(10, width-10);
      yY = random(10, height-10);
      gooddot = true;
      Adot AnotherDot;
      for (int q=0; q<dots.size(); q++)
      {
        AnotherDot = (Adot) dots.get(q);
        if (dist(AnotherDot.x,AnotherDot.y, xX,yY) < MinDist)
        {  gooddot = false;  }
      }
      if (gooddot)
      {
        dots.add(new Adot(p, xX, yY, dia));
        p++; 
        ellipse (xX, yY, dia,dia);
      }
    }
    
    Adot dot1;
    Adot dot2;
    float d12;
    for (int j=0; j<NumDots; j++)
    {
      dot1 = (Adot) dots.get(j);
      for (int k=j+1; k<NumDots; k++)  
      {
        dot2 = (Adot) dots.get(k);
        d12 = dist (dot1.x, dot1.y, dot2.x, dot2.y);
        if (d12 <= MaxDist)
        {
          line (dot1.x, dot1.y, dot2.x, dot2.y);
          for (int p=0; p<dot1.cnt.length; p++)
          { 
            if (dot1.cnt[p] == -1)
            { dot1.cnt[p] = k; 
              dot1.n = p+1; 
              break;  }
          }
          for (int q=0; q<dot1.cnt.length; q++)
          { 
            if (dot2.cnt[q] == -1)
            { dot2.cnt[q] = j;  
              dot2.n = q+1;
              break;  }
          }
        }
      }
    }
  }
}  
  

class Signal
{
  int prevId;
  int fromId;
  int toId;
  ArrayList NWdots;
  
  Signal(int startId, ArrayList tempdots)
  {
    prevId = -1;
    fromId = startId;
    NWdots = tempdots;
  }
  
  void transmit()
  {  
    Adot prevDot;
    Adot fromDot;
    Adot toDot;
    fromDot = (Adot) NWdots.get(fromId);
    toId = fromDot.cnt[int(random(fromDot.n))];
    toDot = (Adot) NWdots.get(toId);
    
    if (prevId >= 0)
    {
      strokeWeight(2);
      stroke(222);
      fill(222);
      prevDot = (Adot) NWdots.get(prevId);
      ellipse (prevDot.x, prevDot.y, dia,dia);
      line (prevDot.x, prevDot.y, fromDot.x, fromDot.y);
    }
    
    strokeWeight(1);
    stroke(222,0,0);
    fill(222,0,0);
    ellipse (fromDot.x, fromDot.y, dia,dia);
    ellipse (toDot.x, toDot.y, dia,dia);
    line (fromDot.x, fromDot.y, toDot.x, toDot.y);
    prevId = fromId;
    fromId = toId;
  }
  
}



                                                            
