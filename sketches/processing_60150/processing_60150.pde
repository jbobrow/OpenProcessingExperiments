
/*
 * ----------------------------------
 *  Slider Class for Processing 2.0
 * ----------------------------------
 *
 * this is a simple prohgress class. The following shows 
 * you how to use it in a minimalistic way.
 *
 * DEPENDENCIES:
 *   N/A
 *
 * Created:  March, 26 2012
 * Author:   Alejandro Dirgan
 * Version:  0.11
 *
 * License:  GPLv3
 *   (http://www.fsf.org/licensing/)
 *
 * Follow Us
 *    adirgan.blogspot.com
 *    twitter: @ydirgan
 *    https://www.facebook.com/groups/mmiiccrrooss/
 *    https://plus.google.com/b/111940495387297822358/
 *
 * DISCLAIMER **
 * THIS SOFTWARE IS PROVIDED TO YOU "AS IS," AND WE MAKE NO EXPRESS OR IMPLIED WARRANTIES WHATSOEVER 
 * WITH RESPECT TO ITS FUNCTIONALITY, OPERABILITY, OR USE, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED 
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR INFRINGEMENT. WE EXPRESSLY 
 * DISCLAIM ANY LIABILITY WHATSOEVER FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL OR SPECIAL 
 * DAMAGES, INCLUDING, WITHOUT LIMITATION, LOST REVENUES, LOST PROFITS, LOSSES RESULTING FROM BUSINESS 
 * INTERRUPTION OR LOSS OF DATA, REGARDLESS OF THE FORM OF ACTION OR LEGAL THEORY UNDER WHICH THE LIABILITY 
 * MAY BE ASSERTED, EVEN IF ADVISED OF THE POSSIBILITY OR LIKELIHOOD OF SUCH DAMAGES.

//////////////////////////////////////
ADSliderBar
//////////////////////////////////////
comming...

//////////////////////////////////////
Example
//////////////////////////////////////
ADSliderBar color1, color2, color3;

color r, g, b;

boolean back=true;

//////////////////////////////////////////////////////////////
void setup()
{
  size(600,400);
  smooth();

  color1 = new ADSliderBar(100,79,200,0.0,255.0,"Slider 1");
  color2 = new ADSliderBar(256,77,200,0.0,255.0,"Slider 2");
  color3 = new ADSliderBar(410,77,200,0.0,255.0,"Slider 3");
  
  color1.setOrientation(2); // 1- horizontal, 2- Vertical
  color1.setThickness(100); // 15 to 300
  color1.setForegroundColor(#930303,#FF0000);
  color1.setBackgroundColor(#D84C4C,#FF0000);
  color1.setValue(180); // Min to Max as defined in the constructor
  
  color2.setOrientation(2);
  color2.setThickness(100);
  color2.setForegroundColor(#0B6400,#1CFF00);
  color2.setBackgroundColor(#5BCE4D,#1CFF00);
  color2.setValue(180);

  color3.setOrientation(2);
  color3.setThickness(100);
  color3.setForegroundColor(#0A007E,#9990FF);
  color3.setBackgroundColor(#4439C9,#9990FF);
  color3.setValue(180);
  
  activateMouseWheel();
}
//////////////////////////////////////////////////////////////
void draw()
{
  background(r,g,b);
  r=(int )color1.update();
  g=(int )color2.update();
  b=(int )color3.update();
}

//////////////////////////////////////////////////////////////
void mouseWheel(int delta)
{
  color1.changePositionWithWheel(delta);
  color2.changePositionWithWheel(delta);
  color3.changePositionWithWheel(delta);
}
//////////////////////////////////////////////////////////////
void activateMouseWheel()
{
 addMouseWheelListener(new java.awt.event.MouseWheelListener() 
 { 
   public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) 
   { 
     mouseWheel(evt.getWheelRotation());
   }
 });

}

*/ 

class ADSliderBar
{
  color darkColorBack=#434343;
  color lightColorBack=#909090;
  color darkColorFore=#622F7E;
  color lightColorFore=#CB74FA;
  color borderColor=0;
  color numbersColor=0;
  color labelColor=0;
  
  int externalBorder=2;
  
  boolean backgroundVisible=true;
  
  int labelSize=18;
  int numberSize=14;
  boolean visibleText=true;
  boolean visibleNumbers=true;
  
  int pX, pY, pW, pH;
  
  float pScaled=0, pValue=0;
  
  String ID;
  
  boolean debug=true;
  boolean pressOnlyOnce=true;
  int deb=0;
  
  float vMin=0, vMax=15;
  
  int O_HOR=1;
  int O_VER=2;
  
  int orientation=O_HOR;
  
  ADSliderBar(int x, int y, int w, float iValue, float fValue, String label)
  {
     pX=x;
     pY=y;
     pW=w;
     pH=30;
     ID=label;
     
     float step=0.1;
     setLimits(iValue, fValue, step);
     
     
  }

  ////////////////////////////////////////////////////////
  float getValue()
  {
    return pValue;
  }
  
  ////////////////////////////////////////////////////////
  void setThickness(int w)
  {
    if (w<15) w=15;
    if (w>300) w=300;
    pH=w;  
  }

  ////////////////////////////////////////////////////////
  void setOrientation(int o)
  {
    if (o<1) o=1;
    if (o>2) o=2;
    
    orientation=o;
  }
  ////////////////////////////////////////////////////////
  void setLimits(float iv, float fv, float st)
  {
     vMin=iv;
     vMax=fv;     
     
     setValue(iv);
     
  }
  ////////////////////////////////////////////////////////
  void showLabel()
  {
    visibleText=true;
  }
  ////////////////////////////////////////////////////////
  void hideLabel()
  {
    visibleText=false;
  }
  ////////////////////////////////////////////////////////
  void showNumbers()
  {
    visibleNumbers=true;
  }
  ////////////////////////////////////////////////////////
  void hideNumbers()
  {
    visibleNumbers=false;
  }
  
  ////////////////////////////////////////////////////////
  float round2nDecimals(float number, float decimal) {
      return (float)(round((number*pow(10, decimal))))/pow(10, decimal);
  }  
  ////////////////////////////////////////////////////////
  void setDebugOn() {
      debug=true;
  }  
  ////////////////////////////////////////////////////////
  void setDebugOff() {
      debug=false;
  }  
  ////////////////////////////////////////////////////////
  void setExternalBorder(int b) {
      externalBorder=b;
  }  
  ////////////////////////////////////////////////////////
  void hideBackground() {
      backgroundVisible=false;
  }  
  ////////////////////////////////////////////////////////
  void showBackground() {
      backgroundVisible=true;
  }  
  ////////////////////////////////////////////////////////
  void setLabelSize(int s) {
      if (s<4) s=4;
      
      labelSize=s;
  }  
  ///////////////////////////////////////////////////////
  void setForegroundColor(color upColor, color downColor)
  {
    darkColorFore=upColor;
    lightColorFore=downColor;
  }
  ///////////////////////////////////////////////////////
  void setBackgroundColor(color upColor, color downColor)
  {
    darkColorBack=upColor;
    lightColorBack=downColor;
  }
  ///////////////////////////////////////////////////////
  boolean mouseOver()
  {
    boolean result=false;
    
    if (orientation==O_HOR)
    {
       if (mouseX>=pX && mouseX<=pX+pW && mouseY>=pY && mouseY<=pY+pH)
         result=true;
    }
    else
       if (mouseX>=pX && mouseX<=pX+pH && mouseY>=pY-2 && mouseY<=pY+pW+2)
         result=true;
    
    return result;
  }
  ///////////////////////////////////////////////////////
  void drawText()
  {
    if (visibleText)
    {
      fill(labelColor);
      textSize(labelSize);
      textAlign(CENTER);
      if (orientation==O_HOR)
        text(str((int )pValue),pX+pW/2,pY+pH/2+labelSize/2-2);
      else
      {
        pushMatrix();
        translate(pX+pH/2,pY+pW/2);
        rotate(radians(-90));
        text(str((int )pValue),0,0+labelSize/2-2);
        popMatrix();
      }
    }
    
    if (visibleNumbers)
    {
      textSize(numberSize);
      fill(numbersColor);
      if (orientation==O_HOR)
      {
        textAlign(LEFT);
        text("Min: "+str((int)vMin),pX,pY-numberSize/2);
        textAlign(RIGHT);
        text("Max: "+str((int)vMax),pX+pW,pY-numberSize/2);
      }
      else
      {
        pushMatrix();
        textAlign(RIGHT);
        translate(pX-numberSize/2,pY);
        rotate(radians(-90));
        text("Max: "+str((int)vMax),0,0);
        popMatrix();
        pushMatrix();
        textAlign(LEFT);
        translate(pX-numberSize/2,pY+pW);
        rotate(radians(-90));
        text("Min: "+str((int)vMin),0,0);
        popMatrix();
      }
    }
    
  }
  ///////////////////////////////////////////////////////
  void drawVerticalBar()
  {
    if (backgroundVisible)
    {
      setGradient(pX,      pY, pH/2, pW, darkColorBack,lightColorBack,2);
      setGradient(pX+pH/2, pY, pH/2, pW, lightColorBack,darkColorBack,2);
    }
    noFill();
    stroke(borderColor);
    strokeWeight(externalBorder);
    rect(pX,pY,pH,pW);

    if (pValue>0)
    { 
      setGradient(pX+2,    pY+pW-2, pH/2-2, pScaled-pW+4,  darkColorFore,lightColorFore,2);
      setGradient(pX+pH/2, pY+pW-2, pH/2-2, pScaled-pW+4,  lightColorFore,darkColorFore,2);
      //setGradient(pX+2,    pY+2, pH/2-2, pScaled,  darkColorFore,lightColorFore,2);
      //setGradient(pX+pH/2, pY+2, pH/2-2, pScaled,  lightColorFore,darkColorFore,2);
      stroke(borderColor);
      strokeWeight(1);
      rect(pX+1,    pY+pW-2, pH-2, pScaled-pW+4);
      //rect(pX+2,pY+2,pH-4,pScaled);

    }

    

  }
  ///////////////////////////////////////////////////////
  void drawHorizontalBar()
  {
    if (backgroundVisible)
    {
      setGradient(pX,pY,pW,pH/2,darkColorBack,lightColorBack,1);
      setGradient(pX,pY+pH/2,pW,pH/2,lightColorBack,darkColorBack,1);
    }
    noFill();
    stroke(borderColor);
    strokeWeight(externalBorder);
    rect(pX,pY,pW,pH);

    if (pValue>0)
    { 
      setGradient(pX+2,pY+2,pScaled,pH/2-2,darkColorFore,lightColorFore,1);
      setGradient(pX+2,pY+pH/2,pScaled,pH/2-2,lightColorFore,darkColorFore,1);
      stroke(borderColor);
      strokeWeight(1);
      rect(pX+2,pY+2,pScaled,pH-4);
      
      
    }
  }  
  ///////////////////////////////////////////////////////
  void drawBar()
  {
    
    if (orientation==O_HOR) drawHorizontalBar();
    if (orientation==O_VER) drawVerticalBar();
    
    
  }
  ///////////////////////////////////////////////////////
  void checkPosition()
  {
    if (debug)
    {
      if (mouseOver()  && keyPressed && mouseButton==LEFT && mousePressed)
      {
        if (keyCode==CONTROL)
        {
          pX=pX+mouseX-pmouseX;
          pY=pY+mouseY-pmouseY;
        }
        if (keyCode==SHIFT && pressOnlyOnce)
        {
          printGeometry();
          pressOnlyOnce=false;
        }
        deBounce(5);
      }
      
    }
    
  }
  
  ///////////////////////////////////////////////////////
   void setValue(float value)
   {
      if (value>vMax) value=vMax;
      if (value<vMin) value=vMin;
      pValue=value;
      if (orientation==O_HOR)
        pScaled=map(pValue,vMin,vMax,0,pW-4);
      else
        pScaled=map(pValue,vMin,vMax,pW-4,0);
   }
  ///////////////////////////////////////////////////////
   void change()
   {
     if (mouseOver())
     {
       if (mousePressed && mouseButton==LEFT)
       {
         if (orientation==O_HOR)
           pValue=(int)map((mouseX-pX),0,pW-4,vMin,vMax);
         else
           pValue=(int)map((mouseY-pY),pW-4,0,vMin,vMax);
            
         if (pValue>vMax) pValue=vMax;
         if (pValue<vMin) pValue=vMin;
       }


       if (keyPressed && pressOnlyOnce)
       {
         if (keyCode==LEFT || keyCode==DOWN) pValue--;
         if (keyCode==RIGHT || keyCode==UP) pValue++;
         if (pValue>vMax) pValue=vMax;
         if (pValue<vMin) pValue=vMin;
         pressOnlyOnce=false;
       }
       deBounce(5);

       if (orientation==O_HOR)
         pScaled=map(pValue,vMin,vMax,0,pW-4);
       else
         pScaled=map(pValue,vMin,vMax,pW-4,0);
       
       
     }
   }
  ///////////////////////////////////////////////////////
  float update()
  {
    checkPosition();
    change();
    drawBar();
    drawText();
    
    return pValue;
    
  }
  ///////////////////////////////////////////////////////
  void setGradient(float x, float y, float w, float h, color c1, color c2, int axis ) {

    noFill();
    strokeWeight(1);
    if (axis == 1) {  // Top to bottom gradient
      for (float i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }   
    else if (axis == 2) {  // Left to right gradient
      for (float i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
////////////////////////////////////////////////////////////////////////
  void changePositionWithWheel(int delta)
  {
    if (!mouseOver()) return;
    
    if (orientation==O_VER) delta=-delta;
    
    if (keyPressed && keyCode==SHIFT) delta=delta*(int )(vMax/10);
    if (keyPressed && keyCode==CONTROL) delta=delta*(int )(vMax/4);    
    
    setValue(pValue+delta);

  }
///////////////////////////////////////////////////////  
  void deBounce(int n)
  {
    if (pressOnlyOnce) 
      return;
    else
      
    if (deb++ > n) 
    {
      deb=0;
      pressOnlyOnce=true;
    }
    
  }    
  ///////////////////////////////////////////////////////  
  void printGeometry()
  {
    println("  sliderBar = new ADSliderBar("+pX+","+pY+","+pW+","+vMin+","+vMax+",\""+ID+"\");");
  }
  
  
}


