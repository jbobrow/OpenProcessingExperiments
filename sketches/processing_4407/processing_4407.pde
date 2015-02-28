
int pW = 720;
int pH = 480;
int nSS = 10;
float s = 10.0;
float sP = 20.0;
float[][] sL = new float [nSS][3];
float[][] pS = new float[pW][pH];

void setup() {
  size(pW, pH);
  smooth();
  background(255); 
  for(int l = 0; l < sL.length; l++) {
    sL[l][0] = (random(pW));
    sL[l][1] = (random(pH));
    sL[l][2] = (random(100));
  }
  
  for (int pX = 0; pX < width; pX++) {
    for (int pY = 0; pY < height; pY++) {
      float[] lP = new float[sL.length];
      for (int tL = 0; tL < sL.length; tL++) {
        float lOX, lOY;
        lOX = sL [tL][0];
        lOY = sL [tL][1];
        lP [tL] = sqrt(pow(lOX - pX, 2) + pow(lOY - pY, 2));
      }
      
      float mD = max(lP);
      float[] lW = new float[sL.length];
      float tW = 0.0;   
      for (int tL = 0; tL < sL.length; tL++) {
        float iD = mD - lP [tL];
        lW [tL] = pow(iD, s);
        tW += lW [tL];
      }
      
      float[] lI = new float[sL.length];
      float iA = 0.0;  
      for (int tL = 0; tL < sL.length; tL++) {
        float sI = sL [tL][2]; 
        lI [tL] = (lW [tL] / tW) * sI;
        iA += lI [tL];
      }
      
      pS[pX][pY] = iA;
    }
  }
}

void draw() {
  background(255);
  for (int pX = 0; pX < width; pX++) {
    for (int pY = 0; pY < height; pY++) {
      float sI = pS[pX][pY];
      sI = sI * (sI / sP);
      stroke(sI);
      strokeWeight(1);
      point(pX, pY);
    }
  }
}






















