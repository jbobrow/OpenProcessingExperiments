
class AniQuad
{
  float x1i, x2i, x3i, x4i; //initial x values
  float y1i, y2i, y3i, y4i; //initial y values
  float x1f, x2f, x3f, x4f; //final x values
  float y1f, y2f, y3f, y4f; //final y values
  float x1c, x2c, x3c, x4c; //current x values
  float y1c, y2c, y3c, y4c; //current y values
  float cTrans,iTrans,fTrans; //current Transparency, initial Transparency, final Transparency
  Boolean isVisible, isAniFinished, debugMode; // whether or not this object is visible, whether it's finished its current Animation
  int totalFrames, currentFrame, aniSegment;
  int colourH,colourS,colourB,quadNum;
  float screenX, screenY;
  
  
  AniQuad(float xi1,float yi1,float xi2,float yi2,float xi3,float yi3,float xi4,float yi4,
  float xf1,float yf1,float xf2,float yf2,float xf3,float yf3,float xf4,float yf4,
  int numFrames,int cH,int cS, int cB, int dT, int qNum)
  { 
    
    screenX = 900;
    screenY = 562;
    quadNum =qNum;
    fTrans =dT;
    iTrans =255;
    cTrans = 255;
    debugMode = false;
    isVisible = true;
    aniSegment = 0;
    x1i = xi1;
    y1i = yi1;
    x2i = xi2;
    y2i = yi2;
    x3i = xi3;
    y3i = yi3;
    x4i = xi4;
    y4i = yi4;
    x1f = xf1;
    y1f = yf1;
    x2f = xf2;
    y2f = yf2;
    x3f = xf3;
    y3f = yf3;
    x4f = xf4;
    y4f = yf4;

    x1c = x1i;
    y1c = y1i;
    x2c = x2i;
    y2c = y2i;
    x3c = x3i;
    y3c = y3i;
    x4c = x4i;
    y4c = y4i;

    totalFrames = numFrames;
    currentFrame = 0;
    isAniFinished = false;
    colourH = cH;
    colourS = cS;
    colourB = cB;
  }

  void animateMe()
  { 
    if (currentFrame<=totalFrames)
    {
      x1c = x1i + ((x1f-x1i)/totalFrames)*currentFrame;
      y1c = y1i + ((y1f-y1i)/totalFrames)*currentFrame;
      x2c = x2i + ((x2f-x2i)/totalFrames)*currentFrame;
      y2c = y2i + ((y2f-y2i)/totalFrames)*currentFrame;
      x3c = x3i + ((x3f-x3i)/totalFrames)*currentFrame;
      y3c = y3i + ((y3f-y3i)/totalFrames)*currentFrame;
      x4c = x4i + ((x4f-x4i)/totalFrames)*currentFrame;
      y4c = y4i + ((y4f-y4i)/totalFrames)*currentFrame;
      cTrans = iTrans + ((fTrans-iTrans)/totalFrames)*currentFrame;
      currentFrame++;
    }
    else {
      isAniFinished = true;
      aniSegment++;
    }

    if (isVisible==true)
    { 
      noStroke();
      fill (colourH,colourS, colourB,cTrans);
      float xRatio = screenX/1440;
      float yRatio = screenY/900;
       quad (x1c*xRatio,y1c*yRatio,x2c*xRatio,y2c*yRatio,x3c*xRatio,y3c*yRatio,x4c*xRatio,y4c*yRatio); 
    }
    if ((debugMode) && (globalDebug))
    {
      println("quad"+quadNum+" coordinates: "+x1c+","+y1c+","+x2c+","+y2c+","+x3c+","+y3c+","+x4c+","+y4c+" quad"+quadNum+"Frame: "
        +currentFrame+" quad"+quadNum+"aniSegment: "+aniSegment);
    }
  }

  void animateFromHere(float xf1,float yf1,float xf2,float yf2,float xf3,float yf3,float xf4,
  float yf4,float dT, int numFrames)
  {
    iTrans = cTrans;
    fTrans =dT;
    x1i = x1c;
    y1i = y1c;
    x2i = x2c;
    y2i = y2c;
    x3i = x3c;
    y3i = y3c;
    x4i = x4c;
    y4i = y4c;
    x1f = xf1;
    y1f = yf1;
    x2f = xf2;
    y2f = yf2;
    x3f = xf3;
    y3f = yf3;
    x4f = xf4;
    y4f = yf4;
    totalFrames = numFrames;
    currentFrame = 0;
    isAniFinished = false;
  }

  void hideMe () {
    isVisible = false;
  }
  void showMe () {
    isVisible = true;
  }
}


