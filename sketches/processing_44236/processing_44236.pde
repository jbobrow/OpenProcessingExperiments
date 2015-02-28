
void setup()
{
  size(600, 450); 
  background(0); 
  smooth(); 
  
  xCenter = width/2;
  yCenter = height/2;
  
  pt1 = new BezierPoint();
  pt2 = new BezierPoint();
}

int saveCounter=1;
BezierPoint pt1;
BezierPoint pt2;
boolean pointSymmetry = false;
float xCenter, yCenter;

void draw()
{
  stroke(255, 255, 255, 50);
  noFill();
  
  float armX1 = pt1.getXForArm();
  float armX2 = pt2.getXForArm();
  float armY1 = pt1.getYForArm();
  float armY2 = pt2.getYForArm();
  
  //draw the 'primary' curve
  bezier(pt1.x,  pt1.y, armX1, armY1, armX2, armY2, pt2.x, pt2.y);
  
  //now, draw the reflected curve
  if(pointSymmetry)
    bezier(xCenter + (xCenter-pt1.x), yCenter + (yCenter-pt1.y), xCenter + (xCenter-armX1), yCenter + (yCenter-armY1), xCenter + (xCenter-armX2), yCenter + (yCenter-armY2), xCenter + (xCenter-pt2.x), yCenter + (yCenter-pt2.y));
  else
    bezier(xCenter + (xCenter-pt1.x),  pt1.y, xCenter + (xCenter-armX1), armY1, xCenter + (xCenter-armX2), armY2, xCenter + (xCenter-pt2.x), pt2.y);
  
  pt1.increment();
  pt2.increment();
}

void clearImage()
{
  fill(0);
  noStroke();
  rect(0,0,width, height);
}

void keyPressed()
{
  if(key == 's')
  {
    pointSymmetry = ! pointSymmetry;
    clearImage();
  }
  else
  {
    //save("output_" + saveCounter++ + ".png");
  }
}

void mouseClicked()
{
  clearImage();
  pt1.reinitializeIncrementers();
  pt2.reinitializeIncrementers();
}

         
            
class BezierPoint
{
  float x, y, xDelta, yDelta;
  float angle;
  float angleDelta;
  float armDistance;
  float armDelta;
  float margin=70;
  
  BezierPoint()
  {
    x = (margin + random(width-(2*margin)));
    y = (margin + random(height-(2*margin)));
    angle = random(360);
    armDistance = random(60);
    
    reinitializeIncrementers();
  }
  
  void reinitializeIncrementers()
  {
    xDelta = (random(30)-15);
    yDelta = (random(30)-15);
    angleDelta = random(6)-3;
    armDelta = random(4)-2;
  }
  
  float getXForArm()
  {
    return x + (armDistance * sin(radians(angle)));
  }
  float getYForArm()
  {
    return y + (armDistance * cos(radians(angle)));
  }
  
  void increment()
  {
    x+=xDelta;
    y+=yDelta;
    angle+=angleDelta;
    armDistance+=armDelta;
    
    //check the bounds...
    if(x < (0+margin) || x > (width-margin))
      xDelta *= -1;
    if(y < (0+margin) || y > (height-margin))
      yDelta *= -1;
    if(abs(armDistance) > 200)
      armDelta *= -1;
      
    angle = angle %360;
  }
}    
                                
