
int maxPoint = 1000;

float[] Xp = new float[maxPoint];
float[] Yp = new float[maxPoint];

void setup(){

  size(540,334);
  background(255);
  smooth();
  fill(255,255,255,50);
  
  for(int i = 0 ; i < maxPoint ; i++)
  {
    Xp[i] = random(0,width);
    Yp[i] = random(0,height);
  }

    
  for(int i = 0 ; i < maxPoint ; i++)
  {
    strokeWeight((maxPoint - i)/20);
    int a = i % maxPoint;
    int b = (i + 1) % maxPoint;
    int c = (i + 2) % maxPoint;
    int d = (i + 3) % maxPoint;
    
      drawCurve(true, false,a,b,c,d);
  }
}

void drawCurve(boolean drawCircles, boolean drawLines, int p0, int p1, int p2,int p3){

    bezier(Xp[p0],Yp[p0],Xp[p1],Yp[p1],Xp[p2],Yp[p2],Xp[p3],Yp[p3]);
}

