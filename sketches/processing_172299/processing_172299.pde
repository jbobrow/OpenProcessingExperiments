

/**
----------------------------------------------------------------------------
 SKETCH:  Android_Multitouch.pde          v1.0  2014-11-18

 testframe to show how to handle multitouch events on Android smartphones

 ATTENTION:  switch to 'Android' mode and ignore import warnings.
 
 tags:  android, multitouch, input, points, coordinates 
 
 additional infos:
 http://developer.android.com/reference/android/view/MotionEvent.html
 https://victorcheung.igloocommunities.com/blogs/surface/usingmultitouchinandroidwithprocessing
-----------------------------------------------------------------------------
*/ 

import android.view.MotionEvent;

float sw, sh, touchX, touchY;
ArrayList<PVector> points;
int pointerCount;
PFont font;

//----------------------------------------------------------------------
void setup() 
{  
  size(displayWidth, displayHeight);  
  sw = displayWidth;  
  sh = displayHeight;
  println("Multitouch-Test:  "+sw+"*"+sh);  
  frameRate(30);
  points = new ArrayList<PVector>();
  font = createFont("Arial", 24);  
  textFont(font);
  smooth();  
} 
//----------------------------------------------------------------------
void draw() 
{  
  background(0);  
  
  pointerCount = points.size();
  text("Multitouch points: " + pointerCount, 10, 30);
  if (pointerCount <= 0) return;
  
  PVector p1 = new PVector();
  PVector p2 = new PVector();

  // draw multitouch point polygon
  noFill();  
  stroke(127);  
  strokeWeight(4);  
  for(int ni = 1; ni < points.size(); ni++) 
  {
    p1 = points.get(ni-1);
    p2 = points.get(ni);
    line(p1.x, p1.y, p2.x, p2.y);
  }
  if (points.size() > 2)
  {
    p1 = points.get(0);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  // draw multitouch points
  stroke(255,255,0);  
  for(int ni = 0; ni < points.size(); ni++) 
  {
    p1 = points.get(ni);
    ellipse(p1.x, p1.y, 50, 50);
    text(round(p1.x)+", "+round(p1.y), p1.x+10, p1.y-10);
  }
} 

//----------------------------------------------------------------------
// Override Processing's surfaceTouchEvent, which will intercept all
// screen touch events.  This code only runs when the screen is touched.
//----------------------------------------------------------------------
boolean surfaceTouchEvent(MotionEvent event) 
{
  pointerCount = event.getPointerCount();
  // println("Number of pointers: "+pointerCount);
  points.clear();
  for(int ni = 0; ni < pointerCount; ni++) 
    points.add(new PVector(event.getX(ni), event.getY(ni)));
  
  // if the event is a pressed gesture finishing, 
  // it means the lifting the last touch point
  if (event.getActionMasked() == MotionEvent.ACTION_UP) 
    points.clear();
  
  // if you want the variables for motionX/motionY, mouseX/mouseY etc.
  // to work properly, you'll need to call super.surfaceTouchEvent().
  return super.surfaceTouchEvent(event);
}

/* if single touch is all you need, this would work just fine
void mouseDragged() 
{  
  touchX = mouseX;  
  touchY = mouseY;
}
*/


