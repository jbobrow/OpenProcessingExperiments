
/*
==================================================================================
  ## Minion spring class ##
==================================================================================
*/

class Minion
{
  int minionWidth, minionHeight;
  float X, Y;
  float originPositionX;
  float originPositionY;
  float distance;
  float currentAngle;
  boolean active;
  
  // sound
  AudioSample audioPlayer;
  //FFT fft;
  
  Minion()
  {
  }
  
//===========================================================
//  Setup
//===========================================================
  
  void Setup(float originX, float originY, int w, int h)
  {
    originPositionX = originX;
    originPositionY = originY;
    X = originPositionX;
    Y = originPositionY;
    minionWidth = w;
    minionHeight = h;
  }
  
  void loadSound(String fileName)
  {
    audioPlayer = minim.loadSample(fileName);
    //fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
    //fft.logAverages(60, 7);
  }
  
//===========================================================
//  Update
//===========================================================
  
  void Update(float parentX, float parentY, float parentDistance, boolean parentActive)
  {     
    if (parentDistance > 10)
    {
      currentAngle = findAngle(parentX, parentY);
            
      X = originPositionX + cos(currentAngle) * (parentDistance / 2);
      Y = originPositionY + sin(currentAngle) * (parentDistance / 2);
    }
    else
    {
      X = originPositionX;
      Y = originPositionY;
    }
    
    // calculate distance of the object from origin position
    float dX = 0, dY = 0;
    if (X > originPositionX) dX = X - originPositionX; else dX = originPositionX - X;
    if (Y > originPositionY) dY = Y - originPositionY; else dY = originPositionY - Y;
    distance = dX + dY;
    
    // sound
    active = parentActive;
    if (distance <= 200 && active)
    {
      audioPlayer.trigger();
    }
  }
  
//===========================================================
//  Draw
//===========================================================
  
  void Draw()
  {
    /*
    // spectrum graphic
    stroke(255, 50);
    strokeWeight(10);
    fft.forward(audioPlayer.mix);
    float rAngle;
    float lineX, lineY;
    int gap = (360 / fft.avgSize()) + 15;
    int nextGap = 0;
    float avgFFT;
    for (int i = 0; i < fft.avgSize(); i++)
    {
      avgFFT = fft.getAvg(i) / 2;
      if (avgFFT > 80) avgFFT = 80;
      rAngle = (float)Math.toRadians(nextGap);
      lineX = (width/2) + cos(rAngle) * avgFFT;
      lineY = (height/2) + sin(rAngle) * avgFFT;
      line(width/2, height/2, lineX, lineY);
      nextGap += gap;
    }
    strokeWeight(1);
    */
    
    // minion
    stroke(0);
    ellipse(X + 1, Y + 1, minionWidth, minionHeight);
    stroke(200);
    ellipse(X, Y, minionWidth, minionHeight);
  }
  
//===========================================================
//  findAngle
//===========================================================
  
  float findAngle(float posX, float posY)
  {
    float mX = originPositionX - posX;
    float mY = originPositionY - posY;
  
    float angle = 0;
    
    if (mX == 0)
    {
      if (mY == 0) angle = 0;
      else if (mY < 0) angle = PI / 2;
      else angle = PI * 3 / 2;
    }
    else if (mY == 0)
    {
      if (mX < 0) angle = 0;
      else angle = PI;
    }
    else
    {
      if (mX > 0) angle = atan(mY / mX) + PI;
      else if (mY > 0) angle = atan(mY / mX) + (2 * PI);
      else angle = atan(mY / mX);
    }
    
    angle = angle * 180 / PI;
    angle = (float)Math.toRadians(angle);
    return angle;
  }
  
//===========================================================
//  Upload
//===========================================================
  
  void Unload()
  {
    audioPlayer.close();
  }
}

