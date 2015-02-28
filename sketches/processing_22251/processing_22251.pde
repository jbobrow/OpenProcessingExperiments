

//---------------------------------------------------------------
// file:     HScrollbar.pde
//           horizontal scrollbar class for value input 
// based on: http://processing.org/learning/topics/scrollbar.html
//
// class:    HScrollbar
//             HScrollbar   constructor
//             colorize     set all scrollbar colors
//             update       update scrollbar and return value
//             isMouseOver  check if mouse is over scrollbar
//             setValue     set current value
//             resetValue   set original start value
//             randomize    set random value between minValue and maxValue
//             position     return pixel position of slider
//             value        return current float value
//
// modified: v1.0  2011-03-03 initial release
//           v1.1  2012-03-23 return value at calling update()
//---------------------------------------------------------------

boolean globalLock = false;  // true if any scrollbar is locked

class HScrollbar
{
  int xpos, ypos;         // x and y pixel position of bar
  int sbWidth, sbHeight;  // width and height of bar
  float spos, newspos;    // current and intended slider position
  int smin, smax,sRange;  // min,max & range pixel value of slider
  int loose = 8;          // how loose/heavy
  float vmin,vmax,vRange; // min,max & range values of slider
  float initValue;        // origin value 
  boolean over = false;   // true if mouse is over the scrollbar
  boolean locked = false; // true if mouse button pressed
  color barColor       = color(244, 244, 244);  // light gray
  color frameOffColor  = color(177, 177, 177);  // gray  
  color frameOnColor   = color(255, 144,   0);  // orange 
  color sliderOffColor = color(102, 102, 102);  // dark gray
  color sliderOnColor  = color(200,  50,  60);  // wine red 

  //-------------------------------------------------------------
  // create horizontal scrollbar:
  //   xp,yp;               left top scrollbar position
  //   sWidth,sHeight;      scrollbar dimension
  //   minValue, maxValue;  value limits  
  //   startValue           slider start position, added resetValue
  //-------------------------------------------------------------
  HScrollbar (int xp, int yp, int sWidth, int sHeight
             ,float minValue, float maxValue, float startValue) 
  {
    sbWidth = max(40,sWidth);
    sbHeight = max(8,sHeight);
    xpos = max(0,xp);
    ypos = max(0,yp - sbHeight/2);
    spos = xpos + sbWidth/2 - sbHeight/2;
    newspos = spos;
    smin = xpos;
    smax = xpos + sbWidth - sbHeight;
    sRange = smax - smin - 1;
    vmin = minValue;
    vmax = maxValue;
    vRange = vmax - vmin;
    initValue = constrain (startValue, vmin, vmax);
    setValue (initValue);
  }

  //-------------------------------------------------------------
  // set all scrollbar colors
  //-------------------------------------------------------------
  void colorize (color bar, color frameOff, color frameOn
                ,color sliderOff, color sliderOn)
  { 
    barColor = bar;
    frameOffColor = frameOff;
    frameOnColor = frameOn;
    sliderOffColor = sliderOff;
    sliderOnColor = sliderOn;
  }

  //-------------------------------------------------------------
  // update slider position, draw scrollbar 
  // and return current float value
  //-------------------------------------------------------------
  float update() 
  {
    over = isMouseOver();
    if (!globalLock && mousePressed && over) 
    { locked = true;
      globalLock = true; 
    }
    
    if (locked)
    { newspos = constrain(mouseX-sbHeight/2, smin, smax);
      if(abs(newspos - spos) >= 0.1) 
        spos = spos + (newspos - spos) / loose;
    }
    
    if(!mousePressed) 
    { locked = false;
      globalLock = false;
    }
    
    colorMode(RGB);
    // draw scrollbar
    fill (barColor);
    if (locked) stroke(frameOnColor);
    else        stroke(frameOffColor);
    rect(xpos, ypos, sbWidth, sbHeight);  
    
    // draw slider
    if((over && !globalLock) 
    || locked) fill(sliderOnColor);
    else       fill(sliderOffColor);
    rect(spos, ypos, sbHeight, sbHeight);  
    fill(sliderOffColor);
    
    return value();
  }

  //-------------------------------------------------------------
  // check if mouse is over scrollbar
  //-------------------------------------------------------------
  boolean isMouseOver()
  { return (mouseX > xpos && mouseX < xpos+sbWidth &&
            mouseY > ypos && mouseY < ypos+sbHeight);
  }

  //-------------------------------------------------------------
  // set current value
  //-------------------------------------------------------------
  void setValue (float value) 
  { 
    value = constrain (value, vmin, vmax);
    spos = smin + sRange * (value-vmin) / vRange;
    newspos = spos;
  }
  
  //-------------------------------------------------------------
  // reset current value to origin value
  //-------------------------------------------------------------
  void resetValue()
  { setValue(initValue); }
  
  //-------------------------------------------------------------
  // set random value between minValue and maxValue 
  //-------------------------------------------------------------
  void randomize()
  { setValue (vmin + random(vRange)); }

  //-------------------------------------------------------------
  // return pixel position of slider
  //-------------------------------------------------------------
  int position() 
  { return round(spos); }

  //-------------------------------------------------------------
  // return current float value (between minValue and maxValue)
  //-------------------------------------------------------------
  float value()
  { return vmin + vRange * (int(spos)-smin) / sRange; }
}

//-------------------------------------------------------------
// usage example
//-------------------------------------------------------------
HScrollbar aScrollbar;
void scrollbarTest()
{
  aScrollbar = new HScrollbar(11, 22, width, height/2, 0, 255, 160); 
  aScrollbar.setValue(161);
  aScrollbar.randomize();
  float fval = aScrollbar.update();
  int ival = int(aScrollbar.update());
}


