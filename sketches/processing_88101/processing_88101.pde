
Mug[] mugs;

void setup()
{
  size(720, 720);
  mugs = new Mug[100];
  
  for (int i = 0; i < 100; i++)
  {
    int column = (int)(i % 10);
    int row = (int)(i / 10);
   
    float columnWidth = width / 10;
    float rowHeight = height / 10;
    mugs[i] = new Mug(columnWidth / 2 + columnWidth * column, rowHeight / 2 + rowHeight * row);
  }
}

void draw()
{
  background(0);
  for (int i =0 ; i < 100; i++)
  {
    mugs[i].Draw();
  }
}

void Reset()
{
  for (int i = 0; i < 100; i++)
  {
    mugs[i].Morph();
  }
}

void mousePressed()
{
  Reset();
}
float minAspectRatio = .33;
float maxAspectRatio = 1.0;

float minHandleWidth = 25;
float maxHandleWidth = 50;

public class Mug
{
  public float taperAmount;
  public float taperSpeed;
  
  public float cupHeight;
  public float cupWidth;
  
  public float handleThickness;
  public float handleWidth;
  public float handleHeight;
  public float handlePos;
  
  public float handleInnerRoundedness;
  public float handleOuterRoundedness;
  public float handleRoundedness;
  
  float x;
  float y;
  
  Mug morphTo;
  boolean morphing = false;
  float morphFactor = 0;
  
  public Mug(float x, float y)
  {
    float cupSize = width / 16;
    
    this.x = x;
    this.y = y;
    
    taperAmount = random(.25, 1);
    taperSpeed = random(0, 0.75);
    
    float aspectRatio = random(minAspectRatio, maxAspectRatio);
    if (random(0, 1.0) > .5)
    {
      cupWidth = cupSize;
      cupHeight = cupWidth * aspectRatio;
    }
    else
    {
      cupHeight = cupSize;
      cupWidth = cupHeight * aspectRatio;
    }
    
    handleThickness = random(.3, .4);
    handleWidth = random(cupSize / 5, cupSize / 3);
    
    handleHeight = random(0.4, .6);
    handlePos = random(0.25, 0.75);
    
    handleOuterRoundedness = random(0.0, 1.0);
    handleInnerRoundedness = random(0.0, handleOuterRoundedness);
    handleRoundedness = random(0.0, 1.0);
  }
  
  public void Morph()
  {
    morphTo = new Mug(x, y);
    morphing = true;
  }
  
  public void Draw()
  {
    if (morphing)
      morphFactor += .1f;
    
    if (morphFactor > 1.0f)
    {
      morphing = false;
      morphFactor = 0;
      
      taperAmount = morphTo.taperAmount;
      taperSpeed = morphTo.taperSpeed;
  
      cupHeight = morphTo.cupHeight;
      cupWidth = morphTo.cupWidth;
  
      handleThickness = morphTo.handleThickness;
      handleWidth = morphTo.handleWidth;
      handleHeight = morphTo.handleHeight;
      handlePos = morphTo.handlePos;
      handleInnerRoundedness = morphTo.handleInnerRoundedness;
      handleOuterRoundedness = morphTo.handleOuterRoundedness;
      handleRoundedness = morphTo.handleRoundedness;
      
      morphTo = null;
    }
    
    DrawCup();
    DrawHandle();
  }
  
  public void DrawCup()
  {
    noStroke();
    fill(255);
    
    float speed = taperSpeed;
    if (morphing)
      speed = lerp(taperSpeed, morphTo.taperSpeed, morphFactor);
    
    beginShape();
    vertex(bottomRight(), bottom());
    vertex(bottomLeft(), bottom());
    bezierVertex(topLeft(), lerp(bottom(), top(), speed), topLeft(), top(), topLeft(), top());
    vertex(topRight(), top());
    bezierVertex(topRight(), top(), topRight(), lerp(bottom(), top(), speed), bottomRight(), bottom());
    endShape(CLOSE);
  }
  
  public void DrawHandle()
  {
    float hh = handleHeight;
    float hp = handlePos;
    float hw = handleWidth;
    float ht = handleThickness;
    
    float hr = handleRoundedness;
    float hir = handleInnerRoundedness;
    float hor = handleOuterRoundedness;
    
    float ch = cupHeight;
    if (morphing)
    {
      hh = lerp(handleHeight, morphTo.handleHeight, morphFactor);
      hp = lerp(handlePos, morphTo.handlePos, morphFactor);
      hw = lerp(handleWidth, morphTo.handleWidth, morphFactor);
      ht = lerp(handleThickness, morphTo.handleThickness, morphFactor);
      hr = lerp(handleRoundedness, morphTo.handleRoundedness, morphFactor);
      hir = lerp(handleInnerRoundedness, morphTo.handleInnerRoundedness, morphFactor);
      hor = lerp(handleOuterRoundedness, morphTo.handleOuterRoundedness, morphFactor);
      ch = lerp(cupHeight, morphTo.cupHeight, morphFactor);
    }
    
    beginShape();
    float maxStart = (1 - hh);
    float start = lerp(0, maxStart, hp);
    
    PVector startPoint = GetPointOnMugSide(start);
    PVector endPoint = GetPointOnMugSide(start + hh);
    
    PVector midPoint = new PVector(lerp(startPoint.x, endPoint.x, 0.5) - hw,
                                   lerp(startPoint.y, endPoint.y, 0.5));
    
    vertex(startPoint.x, startPoint.y);
    bezierVertex(lerp(midPoint.x, startPoint.x, hr), startPoint.y + hor * hh * ch *  .5,
                midPoint.x, startPoint.y,
                midPoint.x, midPoint.y);
    bezierVertex(midPoint.x, endPoint.y,
                lerp(midPoint.x, endPoint.x, hr), endPoint.y - hor * hh * ch * .5,
                endPoint.x, endPoint.y);
    
    float innerStart = start + (hh * ht / 2);
    float innerEnd = (start + hh) - (hh * ht / 2);
    
    for (int i = 0 ; i < 10; i++)
    {
      float t = lerp(start + hh, innerEnd, i / 9.0f);
      PVector point = GetPointOnMugSide(t);
      vertex(point.x, point.y);
    }
    
    
    float outerStartY = startPoint.y;
    
    startPoint = GetPointOnMugSide(innerStart);
    endPoint = GetPointOnMugSide(innerEnd);
    
    float actualThickness = abs(outerStartY - startPoint.y);
    midPoint = new PVector(lerp(startPoint.x, endPoint.x, 0.5) - hw + actualThickness,
                                   lerp(startPoint.y, endPoint.y, 0.5));
    
    vertex(endPoint.x, endPoint.y);
    bezierVertex(lerp(midPoint.x, endPoint.x, hr), endPoint.y - hir * hh * ch * .4,
                  midPoint.x, endPoint.y,
                  midPoint.x, midPoint.y);
    bezierVertex(midPoint.x, startPoint.y,
                lerp(midPoint.x, startPoint.x, hr), startPoint.y + hir * hh * ch *  .4,
                startPoint.x, startPoint.y);
    
    for (int i = 0 ; i < 10; i++)
    {
      float t = lerp(innerStart, start, i / 9.0f);
      PVector point = GetPointOnMugSide(t);
      vertex(point.x, point.y);
    }
    endShape(CLOSE);
}
  
  float bottom()
  {
    float h = cupHeight;
    if (morphTo != null)
      h = lerp(cupHeight, morphTo.cupHeight, morphFactor);
      
    return y + h / 2;
  }
  
  float top()
  {
    float h = cupHeight;
    if (morphTo != null)
      h = lerp(cupHeight, morphTo.cupHeight, morphFactor);
      
    return bottom() - h;
  }
  
  float topRight()
  {
    float w = cupWidth;
    if (morphTo != null)
      w = lerp(cupWidth, morphTo.cupWidth, morphFactor);
    
    return x + w / 2;
  }
  
  float topLeft()
  {
    float w = cupWidth;
    if (morphTo != null)
      w = lerp(cupWidth, morphTo.cupWidth, morphFactor);
      
    return topRight() - w;
  }
  
  float bottomRight()
  {
    float w = cupWidth;
    float taper = taperAmount;
    if (morphTo != null)
    {
      w = lerp(cupWidth, morphTo.cupWidth, morphFactor);
      taper = lerp(taperAmount, morphTo.taperAmount, morphFactor);
    }
      
    return x + w * taper / 2;
  }
  
  float bottomLeft()
  {
    float w = cupWidth;
    float taper = taperAmount;
    if (morphTo != null)
    {
      w = lerp(cupWidth, morphTo.cupWidth, morphFactor);
      taper = lerp(taperAmount, morphTo.taperAmount, morphFactor);
    }
      
    return x - w * taper / 2;
  }
  
  PVector GetPointOnMugSide(float t)
  {
    float ts = taperSpeed;
    if (morphing)
      ts = lerp(taperSpeed, morphTo.taperSpeed, morphFactor);
    PVector s = new PVector(bottomLeft(), bottom());
    PVector st = new PVector(topLeft(), lerp(bottom(), top(), taperSpeed));
    PVector e = new PVector(topLeft(), top());
    PVector et = new PVector(topLeft(), top());
    float rt = 1 - t;
    
    float x = rt * rt * rt * s.x + 3 * rt * rt * t * st.x + 3 * rt * t * t * et.x + t * t * t * e.x;
    float y = rt * rt * rt * s.y + 3 * rt * rt * t * st.y + 3 * rt * t * t * et.y + t * t * t * e.y;
    
    return new PVector(x, y);
  }
}


