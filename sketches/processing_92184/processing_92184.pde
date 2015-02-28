
Eye leftEye;
Eye rightEye;
 
float ioDist = 150;
 
float time = 0;
 
void setup()
{
  frameRate(60);
  smooth(8);
  size(600, 400);
  noStroke();
  leftEye = new Eye();
  rightEye = new Eye();
}
 
void draw()
{
  time += .01f;
 
  background(#f4f1ec);
  SetEyeTargets();
  CheckForBlink();
 
  leftEye.Draw(width / 2 - ioDist, height / 2);
  rightEye.Draw(width / 2+ ioDist, height / 2);
}
 
void CheckForBlink()
{
  float blinkVar = noise(time * 2, 34.1);
  float noiseMag = abs(blinkVar - 0.5);
   
  if (noiseMag > .22f && !rightEye.IsBlinking())
  {
    rightEye.Blink();
    leftEye.Blink();
  }
}
 
void SetEyeTargets()
{
  float magThreshold = .1;
   
  float xVar = noise(time, 423.6);
  float yVar = noise(time * 2, 126.32);
   
  float xMag = abs(xVar - leftEye.GetXVariance());
  float yMag = abs(yVar - leftEye.GetYVariance());
  if (xMag > magThreshold || yMag > magThreshold)
  {
 
  leftEye.SetVariance(xVar, yVar);
  rightEye.SetVariance(xVar, yVar);
  }
}
 
public class Eye
{
  float eyeballSize = 200;
  float irisScale = .5f;
  float minPupilScale = .45f;
  float maxPupilScale = .75f;
 
  float fullyDialatedDist = 400;
  float dialationAmount = .5f;
   
  float varXTarget = .5f;
  float varYTarget = .5f;
  float varX = .5;
  float varY = .5;
  float varSlide = .2;
 
  float blinkTimer = 100;
  float blinkLength = 4;
  float actualBlinkLength = 2;
   
  float trackX = .5f;
  float trackY = .5f;
  float mouseTrackingSlide = 0.25f;
  float mouseTrackingAmount = 0;
  float distanceThreshold = 10;
  float trackingTimer = 1;
  float trackingAmountTimeout = 10;
  float trackingDecaySlide = .2f;
 
  public void Draw(float x, float y)
  {
    blinkTimer += .1f;
 
    DrawWhite(x, y);
    DrawIris(x, y);
    DrawLids(x, y);
  }
 
  void UpdateMouseTracking(float x, float y)
  {
    float diffX = map(constrain((mouseX - x)  *.01, -1, 1), -1, 1, 0, 1);
    float diffY = map(constrain((mouseY - y)  *.01, -1, 1), -1, 1, 0, 1);
 
    trackX = lerp(trackX, diffX, mouseTrackingSlide);
    trackY = lerp(trackY, diffY, mouseTrackingSlide);
 
    trackingTimer -= .1f;
    if (dist(mouseX, mouseY, pmouseX, pmouseY) > distanceThreshold)
      trackingTimer = trackingAmountTimeout;
 
    float trackingTarget = 1;
    if (trackingTimer <= 0)
      trackingTarget= 0;
    mouseTrackingAmount = lerp(mouseTrackingAmount, trackingTarget, trackingDecaySlide);
  }
 
  public void DrawWhite(float x, float y)
  {
    fill(255);
    ellipse(x, y, eyeballSize * .99f, eyeballSize * .99f);
  }
 
  public void DrawIris(float x, float y)
  {   
    varX = lerp(varX, varXTarget, varSlide);
    varY = lerp(varY, varYTarget, varSlide);
     
    UpdateMouseTracking(x, y);
    float size = eyeballSize * irisScale;
    float minX = x - eyeballSize * .5f + size * .5f;
    float maxX = x + eyeballSize * .5f - size * .5f;
 
    float minY = y - eyeballSize * .4f + size * .5f;
    float maxY = y + eyeballSize * .4f - size * .5f;
    UpdateMouseTracking(x, y);
    x = lerp(minX, maxX, lerp(varX, trackX, mouseTrackingAmount * .5f));
    y = lerp(minY, maxY, lerp(varY, trackY, mouseTrackingAmount * .5f));
     
    fill(#a1cff4);
    ellipse(x, y, eyeballSize * irisScale, eyeballSize * irisScale);
 
    DrawPupil(x, y);
  }
 
  public void DrawPupil(float x, float y)
  {
    float pupilScale = lerp(minPupilScale, maxPupilScale, dialationAmount);
    float size = eyeballSize * irisScale*  pupilScale;
    fill(0);
    ellipse(x, y, size, size);
  }
 
  public void DrawLids(float x, float y)
  {
    fill(#f4f1ec);
    float left = x - eyeballSize * .5f;
    float right = x + eyeballSize * .5f;
    float top = y - eyeballSize * .75f;
    float bottom = y + eyeballSize * .75f;
 
 
    float topCX1 = right - eyeballSize * .3;
    float topCY1 = y - eyeballSize * .4f;
    float topCX2 = left + eyeballSize * .3;
    float topCY2 = y - eyeballSize * .4f;
 
    float bottomCX1 = right - eyeballSize * .1;
    float bottomCY1 = y + eyeballSize * .25f;
    float bottomCX2 = left + eyeballSize * .1;
    float bottomCY2 = y + eyeballSize * .25;
 
    if (IsBlinking())
    {
      float blinkProgress = blinkTimer / actualBlinkLength;
       
      if (blinkProgress < .5f)
        blinkProgress *= 2;
      else if (blinkProgress < 1)
        blinkProgress = (1 - blinkProgress) * 2;
      else
        blinkProgress = 0;
       
      blinkProgress *= blinkProgress;
      topCX1 = lerp(topCX1, bottomCX1, blinkProgress);
      topCY1 = lerp(topCY1, bottomCY1, blinkProgress);
      topCX2 = lerp(topCX2, bottomCX2, blinkProgress);
      topCY2 = lerp(topCY2, bottomCY2, blinkProgress);
    }
 
    beginShape();
    vertex(left, y);
    bezierVertex(left, top, right, top, right, y);
    bezierVertex(topCX1, topCY1, topCX2, topCY2, left, y);
    endShape(CLOSE);
 
    beginShape();
    vertex(left, y);
    bezierVertex(left, bottom, right, bottom, right, y);
    bezierVertex(bottomCX1, bottomCY1, bottomCX2, bottomCY2, left, y);
    endShape(CLOSE);
  }
  public void SetVariance(float x, float y)
  {
      float scaling = .5f;
   
     varXTarget = .5f + (x - .5f) * scaling;
     varYTarget = .5f + (y - .5f) * scaling;
  }
 
  public float GetXVariance()
  {
    return varXTarget;
  }
 
  public float GetYVariance()
  {
    return varYTarget;
  }
 
  public void Blink()
  {
    blinkTimer = 0;
  }
 
  public boolean IsBlinking()
  {
    return blinkTimer < blinkLength;
  }
}



