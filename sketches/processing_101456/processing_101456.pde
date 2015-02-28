
// Twister: Demo for the "TwistStroke" class 
// Copyright (C) 2013, Vinayak <vinayak.pro@gmail.com>
/*
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

// Object of type "TwistStroke" 
TwistStroke tS;

// Font variable for "Help" display. 
PFont f;

// Keyboard control variables
boolean isWiggle,isContinuous; // Wiggle and Stroke continuity
boolean isPoly,isLine,isStar; // Type of brush shape
boolean isHelp; // Help Toggle
int numSides; // Number of sides of the Brush Shape
float innerRadius; // Inner Radius for star-shaped brush

void setup()
{
  size(512,512);
  background(255);
  noStroke();
  fill(255,126,0,50);
  strokeWeight(1);
  stroke(255,126,0,150);
  tS = new TwistStroke();
  
  isWiggle = false;
  isContinuous = true;
  isPoly = false;
  isLine = false;
  isStar = true;
  isHelp = false;
  
  numSides = 5;
  innerRadius = 0.4;
  tS.setContinuity(true,true,true);
  tS.setBrushShape("star",numSides,innerRadius);
  
  f = createFont("Georgia",20,true);
  textFont(f);
}

void draw(){

  background(255);
  
  if(isHelp == true)
  {
    helpText();
  }
  else
  {
    infoText();
  
    noStroke();
    fill(255,126,0,50);
    strokeWeight(1);
    stroke(255,126,0,150);
    tS.display();
  }
}

void mouseDragged()
{
  if(isHelp == false)
  {
    tS.update();
  }
}

void keyPressed()
{
  switch(key)
  {
    case 'h':
      isHelp = !isHelp;
      break;
    case 'w':
      isWiggle = !isWiggle;
      tS.setWiggle(isWiggle);
      break;
    case 'c':
      isContinuous = !isContinuous;
      tS.setContinuity(isContinuous,isContinuous,isContinuous);
      break;
    case 'p':
      tS.setBrushShape("polygon",numSides,innerRadius);
      isPoly = true;
      isLine = false;
      isStar = false;
      break;
    case 'l':
      tS.setBrushShape();
      isPoly = false;
      isLine = true;
      isStar = false;
      break;
    case 's':
      tS.setBrushShape("star",numSides,innerRadius);
      isPoly = false;
      isLine = false;
      isStar = true;
      break;
    case 'I':
      if(innerRadius < 0.9 && (isPoly == true || isStar == true))
      {
        innerRadius += 0.1;
        if(isPoly == true)
        {tS.setBrushShape("polygon",numSides,innerRadius);}
        else if(isStar == true)
        {tS.setBrushShape("star",numSides,innerRadius);}
      }
      break;
    case 'i':
      if(innerRadius > 0.1 && (isPoly == true || isStar == true))
      {
        innerRadius -= 0.1;
        if(isPoly == true)
        {tS.setBrushShape("polygon",numSides,innerRadius);}
        else if(isStar == true)
        {tS.setBrushShape("star",numSides,innerRadius);}
      }
      break;
    case 'N':
      if(numSides == 2)
      {
        isPoly = true;
        isLine = false;
        isStar = false;
      }
      numSides += 1;
      if(isPoly == true)
      {tS.setBrushShape("polygon",numSides,innerRadius);}
      else if(isStar == true)
      {tS.setBrushShape("star",numSides,innerRadius);}
      break;
    case 'n':
      if(numSides < 3)
      {
        numSides = 2;
        tS.setBrushShape();
        isPoly = false;
        isLine = true;
        isStar = false;
      }
      else
      {
        numSides -= 1;
        if(isPoly == true)
        {tS.setBrushShape("polygon",numSides,innerRadius);}
        else if(isStar == true)
        {tS.setBrushShape("star",numSides,innerRadius);}
      }
      break;
    case 'r':
      tS.reset();
      break;
  }
}

void infoText()
{
  String on = "On";
  String off = "Off";
  String pStr = "Poly";
  String lStr = "Line";
  String sStr = "Star";
  
  String wStr,cStr,shStr;
  if(isWiggle == false){wStr = new String(off);}
  else {wStr = new String(on);}
  
  if(isContinuous == false){cStr = new String(off);}
  else {cStr = new String(on);}
  
  if(isPoly == true){shStr = new String(pStr);}
  else if(isLine == true) {shStr = new String(lStr);}
  else {shStr = new String(sStr);}
  
  textFont(f,20);
  fill(0, 102, 153);
  text("Wiggle: "+wStr+" | Continuity: "+cStr+" | Shape: "+shStr,10,475);
  text("Sides: "+numSides+" | In Radius: "+nf(innerRadius,1,1)+" | (h -> Help)",10,505);
}

void helpText()
{
  textFont(f,20);
  fill(0, 102, 153);
  text("HELP",50,30);
  text("w: Toggle Wiggle",50,70);
  text("c: Toggle Continuity",50,100);
  text("p/l/s: Select Shape (Polygon/Line/Star)",50,130);
  text("N/n: Increase/Decrease Number of sides",50,160);
  text("I/i: Increase/Decrease Inner Radius",50,190);
  text("r: Reset the screen",50,220);
  text("h: Toggle help (this menu)",50,250);
}
// TwistStroke: Implementation of "TwistStroke" class 
// Copyright (C) 2013, Vinayak <vinayak.pro@gmail.com>

/*
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

class TwistStroke
{
  private int smMode,numPoints;
  private int shapeType,numSides;
  private float minScale,maxScale;
  private float rot,rotSpeed;
  private float holeRad;
  private float smConst;
  private boolean isWiggle;
  private boolean isPthSmooth;
  private boolean isRotSmooth;
  private boolean isSclSmooth;
  
  private float[] cX,cY,radius,angle;
  private float[] shapeX,shapeY;
  
  TwistStroke()
  {
    numPoints = 0;
    smMode = 2;
    minScale = 10;
    maxScale = 20;
    rot = 0;
    rotSpeed = 10;
    holeRad = 0.0;
    shapeType = 0;
    numSides = 2;
    smConst = 0.5;
    
    isWiggle = false;
    isPthSmooth = false;
    isRotSmooth = false;
    isSclSmooth = false;

    cX = new float[0];
    cY = new float[0];
    radius = new float[0];
    angle = new float[0];
    
    setBrushShape();
  }
  
  void setBrushShape()
  {
    setBrushShape("polygon",2,0.0);
  }
  
  void setBrushShape(String sType,int nSides)
  {
    setBrushShape(sType,nSides,0.0);
  }
  
  void setBrushShape(String sType,int nSides,float inRad)
  {
    shapeX = new float[0];
    shapeY = new float[0];
        
    if(inRad > 1.0)holeRad = 0.0;
    else holeRad = inRad;
    
    if(nSides > 2)
    {
      if(sType.equals("polygon") == true)
      {
        numSides = nSides;
        shapeX = new float[nSides];
        shapeY = new float[nSides];
        shapeType = 1;
        
        float theta = TWO_PI/float(numSides);
        for (int i = 0; i < numSides; i++)
        {
          shapeX[i] = cos(TWO_PI*float(i)/float(numSides));
          shapeY[i] = sin(TWO_PI*float(i)/float(numSides));
        }
      }
      else if(sType.equals("star") == true)
      {
        numSides = 2*nSides;
        shapeX = new float[2*nSides];
        shapeY = new float[2*nSides];
        shapeType = 2;
        
        for (int i = 0; i < numSides; i++)
        {
          if(i%2 == 1)
          {
            shapeX[i] = inRad*cos(TWO_PI*float(i)/float(numSides));
            shapeY[i] = inRad*sin(TWO_PI*float(i)/float(numSides));
          }
          else
          {
            shapeX[i] = cos(TWO_PI*float(i)/float(numSides));
            shapeY[i] = sin(TWO_PI*float(i)/float(numSides));
          }          
        }
      }
    }
    else // Vertical Unit Line centered at (0,0)  
    {
      numSides = nSides;
      shapeX = new float[2];
      shapeY = new float[2];
      shapeType = 0;
      shapeX[0] = 0.0;
      shapeX[1] = 0.0;
      shapeY[0] = -0.5;
      shapeY[1] = 0.5;
    }
  }
  
  void setContinuity(boolean isPthSm,boolean isRotSm,boolean isSclSm)
  {
    isPthSmooth = isPthSm;
    isRotSmooth = isRotSm;
    isSclSmooth = isSclSm;
  }
  
  void setWiggle(boolean wig)
  {
    isWiggle = wig;
  }
  
  void setSideLimits(float loSide,float hiSide)
  {
    minScale = loSide;
    maxScale = hiSide;
  }
  
  void setRotationSpeed(float rSpeed)
  {
    rotSpeed = rSpeed;
  }
  
  void update()
  {
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
    if(speed > 0.0)
    {
      numPoints = numPoints+1;
      cX = expand(cX,numPoints);
      cY = expand(cY,numPoints);
      radius = expand(radius,numPoints);
      angle = expand(angle,numPoints);
      
      cX[numPoints-1] = mouseX;
      cY[numPoints-1] = mouseY;
      radius[numPoints-1] = map(speed, 0, 20, minScale, maxScale);
      angle[numPoints-1] = rot;
      rot = (rot+rotSpeed)%360;
    }
    
    if(isPthSmooth == true || isRotSmooth == true || isSclSmooth == true)
    {
      smoothLap();
    }
  }
  
  void reset()
  {
    cX = new float[0];
    cY = new float[0];
    radius = new float[0];
    angle = new float[0];
    numPoints = 0;
  }
  
  private void wiggle()
  {
   if(cX.length > 2)
    {
      for(int j = 1; j < cX.length-1; j++)
      {
        cX[j] += random(-0.2,0.2);
        cY[j] += random(-0.2,0.2);
        radius[j] += random(-0.1,0.1);
      }
    }
  } 
  
  private void smoothLap()
  {    
    if(cX.length > 2)
    {
      for(int j = 1; j < cX.length-1; j++)
      {
        if(isPthSmooth == true)
        {
          cX[j] = 0.5*(cX[j-1]+cX[j+1]);
          cY[j] = 0.5*(cY[j-1]+cY[j+1]);
        }
        
        if(isRotSmooth == true)
        {
          angle[j] = 0.5*(angle[j-1]+angle[j+1]);
        }
        
        if(isSclSmooth == true)
        {
          radius[j] = 0.5*(radius[j-1]+radius[j+1]);
        }        
      }
    }
  }
  
  void display()
  {
    if(isWiggle == true)
    {
      wiggle();
    }
    
    for(int j = 0; j < cX.length; j++)
    {
      pushMatrix();
      translate(cX[j],cY[j]);
      rotate(radians(angle[j]));
        beginShape();
        for (int i = 0; i < numSides; i++)
        {
          vertex(radius[j]*shapeX[i],radius[j]*shapeY[i]);
        }
        if(shapeType > 0)
        {endShape(CLOSE);}
        else{endShape();}
      popMatrix();
    }
  }
}


