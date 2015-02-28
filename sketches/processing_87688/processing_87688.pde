

float scale;

void setup()
{
  size(400, 400);
  
  scale = width / 720.0f;
}

void draw()
{
  background(255);
  DrawSpoon(width/2 - 100 * scale);
  DrawFork(width/2 + 100 * scale);
}

void DrawSpoon(float center)
{
  PVector handleRightEnd = DrawHandle(center);
  DrawSpoonEndHalf(center, true, handleRightEnd);
  DrawSpoonEndHalf(center, false, handleRightEnd);
}

void DrawFork(float center)
{
  PVector handleRightEnd = DrawHandle(center);
  DrawForkEndHalf(center, true, handleRightEnd);
  DrawForkEndHalf(center, false, handleRightEnd);
}

PVector DrawHandle(float center)
{
  DrawHandleHalf(center, false);
  PVector rightHandleEnd = DrawHandleHalf(center, true);
  
  return rightHandleEnd;
}

PVector DrawHandleHalf(float center, boolean rightHalf)
{
  float offset = 30 * scale;
  if (!rightHalf)
    offset *= -1;
  
  PVector origin = new PVector(center, 10 * scale);
  PVector nextPoint = new PVector(origin.x + offset, origin.y + 4 * scale);
  DrawLine(origin, nextPoint);
  
  offset *= -.5f;
  origin = nextPoint;
  nextPoint = new PVector(nextPoint.x + offset, origin.y + 460 * scale);
  DrawLine(origin, nextPoint);
  
  return nextPoint;
}

void DrawSpoonEndHalf(float center, boolean rightHalf, PVector rightHalfOrigin)
{
  float control1Offset = -800 * scale;
  float control2Offset = -300 * scale;
  
  PVector origin = rightHalfOrigin;
  
  if (!rightHalf)
  {
    control1Offset *= -1;
    control2Offset *= -1;
    
    rightHalfOrigin.x = center - (rightHalfOrigin.x - center);
  }
  
  PVector nextPoint = new PVector(center, height - 30 * scale);
  curve(origin.x + control1Offset, origin.y - 300 * scale, origin.x, origin.y, nextPoint.x, nextPoint.y, nextPoint.x + control2Offset, nextPoint.y - 200 * scale);
}

void DrawForkEndHalf(float center, boolean rightHalf, PVector rightHalfOrigin)
{
    float control1Offset = -400 * scale;
  
  PVector origin = rightHalfOrigin;
  
  float offset = 20 * scale;
  if (!rightHalf)
  {
    control1Offset *= -1;
    offset *=-1;
    rightHalfOrigin.x = center - (rightHalfOrigin.x - center);
  }  
  
  float heightDiff = height - 30 * scale - origin.y;
  PVector nextPoint = new PVector(origin.x + offset, origin.y + heightDiff);
  curve(origin.x + control1Offset, origin.y, origin.x, origin.y, nextPoint.x, nextPoint.y, nextPoint.x, nextPoint.y + 200 * scale);
  
  origin = nextPoint;
  offset *= -.35f;
  nextPoint = new PVector(origin.x + offset, origin.y);
  DrawLine(origin, nextPoint);
  
  origin = nextPoint;
  offset *= .5f;
  nextPoint = new PVector(origin.x + offset, origin.y - heightDiff * .7f);
  DrawLine(origin, nextPoint);
  
  origin = nextPoint;
  offset *= 2;
  nextPoint = new PVector(origin.x + offset, origin.y);
  DrawLine(origin, nextPoint);
  
  origin = nextPoint;
  offset *= .5f;
  nextPoint = new PVector(origin.x + offset, origin.y + heightDiff * .7f);
  DrawLine(origin, nextPoint);
  
  origin = nextPoint;
  offset *= 2;
  nextPoint = new PVector(origin.x + offset, origin.y);
  DrawLine(origin, nextPoint);
  
  origin = nextPoint;
  offset *= .5f;
  nextPoint = new PVector(origin.x + offset, origin.y - heightDiff * .7f);
  DrawLine(origin, nextPoint);
  
  origin = nextPoint;
  nextPoint = new PVector(center, origin.y);
  DrawLine(origin, nextPoint);
}

void DrawLine(PVector v1, PVector v2)
{
  line(v1.x, v1.y, v2.x, v2.y);
}


