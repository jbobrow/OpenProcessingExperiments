
Eye eye, eye2, eye3;
float eyeborder = 60;
float smallborder = 20;
int mover = 0;

void setup()
{
  size(480, 320);
  frameRate(60);
  eye = new Eye(width/2, height/2, color(255,255,0), "one", true);
  eye2 = new Eye(width/4, height/4, color(75,0,255), "two", false);
  eye3 = new Eye(random(eyeborder, width-eyeborder), random(eyeborder,height-eyeborder), color(random(255),random(255),random(255)), "three", true);
  smooth();
}

void draw()
{
  background(255);
  eye.update();
  eye.draw();
  eye2.update();
  eye2.draw();
  eye3.update();
  eye3.draw();
  
  if (mousePressed)
  {
    if (mover == 0)
    {
      eye.agitate();   
      eye2.calm();
      eye3.calm();   
    }
    else if (mover == 1)
    {
      eye2.agitate();
      eye.calm();
      eye3.calm();
    }
    else
    {
      eye3.agitate();
      eye.calm();
      eye2.calm();
    }
  }
  else 
  {
    float newcenterX = min(width-eyeborder, mouseX);
    newcenterX = max(newcenterX, eyeborder);
    float newcenterY = min(height-eyeborder, mouseY);
    newcenterY = max(newcenterY, eyeborder);
    if (mover == 0)
    {
      if ( (eye.getCenterX() == newcenterX) && (eye.getCenterY() == newcenterY ) )
      {
        mover++;
      }
      else
      {
        eye.move(newcenterX, newcenterY);
      }
    }
    else if (mover == 1)
    {
      if ( (eye2.getCenterX() == newcenterX) && (eye2.getCenterY() == newcenterY ) )
      {
        mover++;
      }
      else
      {
        eye2.move(newcenterX, newcenterY);
      }
    }
    else
    {
      if ( (eye3.getCenterX() == newcenterX) && (eye3.getCenterY() == newcenterY ) )
      {
        mover = 0;
      }
      else
      {
        eye3.move(newcenterX, newcenterY);
      }
    }
  }
  
  if (keyPressed)
  {
    eye.calm();
    eye2.calm();
    eye3.calm();
  }
  
//  if (mousePressed)
//  {
//    float newcenterX = min(width-eyeborder, mouseX);
//    newcenterX = max(newcenterX, eyeborder);
//    float newcenterY = min(height-eyeborder, mouseY);
//    newcenterY = max(newcenterY, eyeborder);
//
//    if (mover == 0)
//    {
//      eye.move(newcenterX, newcenterY);      
//    }
//    else if (mover == 1)
//    {
//      eye2.move(newcenterX, newcenterY);
//    }
//    else
//    {
//      eye3.move(newcenterX, newcenterY);
//    }
//  }
//  else if (keyPressed)
//  {
//    if (mover == 0)
//    {
//      eye.agitate();   
//      eye2.calm();
//      eye3.calm();   
//    }
//    else if (mover == 1)
//    {
//      eye2.agitate();
//      eye.calm();
//      eye3.calm();
//    }
//    else
//    {
//      eye3.agitate();
//      eye.calm();
//      eye2.calm();
//    }
//  }
//  else
//  {
//    mover++;
//    if (mover > 2)
//    {
//      mover = 0;
//    }
//  }
}

class Eye
{
  float centerX, centerY, targetCenterX, targetCenterY, positionX, positionY;
  float pupil_diameter, maxPupilDiameter, minPupilDiameter, pupilEase;
  float tempTargetX, tempTargetY, maxWanderDist, wanderFudge, wanderEase, maxWanderEase, minWanderEase, wanderEaseDX;
  float irisX, irisY, irisAngle, maxIrisDistance, centerTrackSpeed;
  color col;
  float ease, maxEase, minEase, easeChange;
  String name;
  Boolean lefteye;
  public Eye(float X, float Y, color c, String n, Boolean leftOrientation)
  {
    name = n;
    centerX = X;
    centerY = Y;
    targetCenterX = centerX;
    targetCenterY = centerY;
    positionX = X;
    positionY = Y;
    irisX = positionX;
    irisY = positionY;
    irisAngle = 0.0;
    //col = c;
    col = color(255);
    pupil_diameter = 12;
    maxPupilDiameter = 12;
    minPupilDiameter = 6;
    pupilEase = 0.05;
    ease = 0.01;
    maxEase = 0.75;
    minEase = 0.01;
    easeChange = 0.01;
    maxIrisDistance = 9;
    maxWanderDist = random(eyeborder);
    tempTargetX = 0;
    tempTargetY = 0;
    wanderFudge = 1.0;
    wanderEase = 0.01;
    minWanderEase = 0.01;
    maxWanderEase = 0.5;
    wanderEaseDX = 0.001;
    centerTrackSpeed = 2.0;
    lefteye = leftOrientation;
  }
  
  int getCenterX()
  {
    return int(centerX);
  }
  
  int getCenterY()
  {
    return int(centerY);
  }
  
  void agitate()
  {
    // agitate the pupil easing
    if (ease < maxEase)
    {
      ease += easeChange;
    }
    if (ease > maxEase)
    {
      ease = maxEase;
    }
    
    // shrink the pupil
    if (pupil_diameter > minPupilDiameter)
    {
      pupil_diameter += (minPupilDiameter-pupil_diameter)*pupilEase;
    }
    if (pupil_diameter < minPupilDiameter)
    {
      pupil_diameter = minPupilDiameter;
    }

    // agitate the wandering
    maxWanderDist = eyeborder;
    if (wanderEase < maxWanderEase)
    {
      wanderEase += wanderEaseDX;
    }
    if (wanderEase > maxWanderEase)
    {
      wanderEase = maxWanderEase;
    }
  }
  
  void calm()
  {
    // relax the pupil easing
    if (ease > minEase)
    {
      ease -= easeChange;
    }
    if (ease < minEase)
    {
      ease = minEase;
    }
    
    // dialate the pupil
    if (pupil_diameter < maxPupilDiameter)
    {
      pupil_diameter += (maxPupilDiameter-pupil_diameter) * pupilEase;
    }
    if (pupil_diameter > maxPupilDiameter)
    {
      pupil_diameter = maxPupilDiameter;
    }
    
    // relax the wandering
    if (wanderEase > minWanderEase)
    {
      wanderEase -= wanderEaseDX;
    }
    if (wanderEase < minWanderEase)
    {
      wanderEase = minWanderEase;
    }
    maxWanderDist = random(eyeborder);
  }
  
  void draw()
  {
    noStroke();
    
    // local coordinates to mouse from eye
    float localMX = mouseX-positionX;
    float localMY = mouseY-positionY;
    
    float angle = atan2(localMY, localMX);
    float targetX = (maxIrisDistance * cos(angle)) + positionX;
    float targetY = (maxIrisDistance * sin(angle)) + positionY;
    
    irisX += (targetX - irisX) * ease;
    irisY += (targetY - irisY) * ease;

    // draw the eye
    float orient;
    if (lefteye) // draws inverse x coordinates
    {
      orient = -1;
    }
    else
    {
      orient = 1;
    }
    fill(255);
    stroke(0);
    strokeWeight(1);
    beginShape();
    vertex((orient*0)+positionX,-18+positionY);
    bezierVertex((orient*-25) + positionX, -15 + positionY, (orient*-39) + positionX, -2 + positionY, (orient*-39) + positionX, 4 + positionY);
    bezierVertex((orient*-29) + positionX, 6 + positionY, (orient*-13) + positionX, 21 + positionY, (orient*2) + positionX, 19 + positionY);
    bezierVertex((orient*15) + positionX, 18 + positionY, (orient*35) + positionX, 16 + positionY, (orient*38) + positionX, 4 + positionY);    
    bezierVertex((orient*39) + positionX, 1 + positionY, (orient*36) + positionX, 3 + positionY, (orient*34) + positionX, 1 + positionY);
    bezierVertex((orient*33) + positionX, 0 + positionY, (orient*32) + positionX, -3 + positionY, (orient*31) + positionX, -4 + positionY);
    bezierVertex((orient*21) + positionX, -10 + positionY, (orient*21) + positionX, -18 + positionY, (orient*0) + positionX, -18 + positionY);
    endShape();

    // draw the iris
    fill(col);
    ellipseMode(CORNERS);
    float irisLeft = irisX-17;
    float irisRight = irisX+17;
    float irisTop = max(irisY-17, positionY-17);
    float irisBot = min(irisY+17, positionY+19);
    ellipse(irisLeft, irisTop, irisRight, irisBot);
    
    // draw the pupil
    fill(0);
    ellipseMode(CENTER);
    ellipse(irisX, irisY, pupil_diameter, pupil_diameter);
    
    // draw reflection
    fill(255);
    ellipse(positionX+14, positionY+3, 4, 4);
  }
  
  void update()
  {
    //fill(255,0,0);
    //ellipseMode(CENTER);
    //ellipse(centerX, centerY, 10,10);
    if (targetCenterX != centerX)
    {
      float originalX = centerX;
      if (centerX > targetCenterX)
      {
        centerX -= centerTrackSpeed;
        if (centerX < targetCenterX)
        {
          centerX = targetCenterX;
        }
      }
      else
      {
        centerX += centerTrackSpeed;
        if (centerX > targetCenterX)
        {
          centerX = targetCenterX;
        }
      }
      tempTargetX = centerX;
    }
    
    if (targetCenterY != centerY)
    {
      float originalY = centerY;
      if (centerY > targetCenterY)
      {
        centerY -= centerTrackSpeed;
        if (centerY < targetCenterY)
        {
          centerY = targetCenterY;
        }
      }
      else
      {
        centerY += centerTrackSpeed;
        if (centerY > targetCenterY)
        {
          centerY = targetCenterY;
        }
      }
      tempTargetY = centerY;
    }
    
    if ( ((tempTargetX - positionX) < wanderFudge) && ((tempTargetY - positionY) < wanderFudge) ) // arrived near target?
    {
      // new tempTargetX and Y
      float rangle = random(-TWO_PI, TWO_PI);
      float wanderDist = random(-1, 1);
      tempTargetY = (maxWanderDist * wanderDist * sin(rangle)) + centerY;
      tempTargetX = (maxWanderDist * wanderDist * cos(rangle)) + centerX;
    }
    
    float originalX = positionX;
    float originalY = positionY;
    positionX += (tempTargetX - positionX) * wanderEase;
    positionX = min(width-smallborder, positionX);
    positionX = max(smallborder, positionX);
    positionY += (tempTargetY - positionY) * wanderEase;
    positionY = min(height-smallborder, positionY);
    positionY = max(smallborder, positionY);
    irisX += positionX - originalX;
    irisY += positionY - originalY;
  }
  
  void move(float newcenterX, float newcenterY)
  {
    //println("moving eye " + name + " to " + newcenterX + ", " + newcenterY);
    targetCenterX = newcenterX;
    targetCenterY = newcenterY;
  }
}

