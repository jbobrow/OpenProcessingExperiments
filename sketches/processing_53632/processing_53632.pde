
float rect1PX = 100;  // x abreviation... (rect1PositionX)
float rect1PY = 100;  // y 
float rect1W = 100;  // width
float rect1H = 100;  // height
 
float rect2PX;        // x - will move with mouse Position
float rect2PY;        // y - mouse Position
float rect2W = 100;   // width
float rect2H = 100;   // height
 
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  background(255,100,150);
   
  rect2PX = mouseX-50; // centers mouse 100/2 = 50 = mouseposition. hence, why the mouse appears in center of rect # 2.
  rect2PY = mouseY-50;
   
  if (rectRectIntersect(rect1PX, rect1PY, rect1PX+rect1W, rect1PY+rect1H, rect2PX, rect2PY, rect2PX+rect2W, rect2PY+rect2H) == true) {  // if its a whole, if its not a whole. true/false. colors change. 
    fill(255,0,0);
  } else {
    fill(0,0,255);
  }
  
  // This is a rough analysis I made that describes how each code respresents a certain side of the rectangle. I created several sketches on paper in order to figure this out, sketches can be shown if requested.
  // rect1PX = LEFT
  // rect1PY = TOP
  // rect1PX + rect1W = Right side of rectangle
  // rect1PY + rect1H = Bottom 
  // && Vise Versa for rectangle #2
  
   
  rect(rect1PX, rect1PY, rect1W, rect1H);
  rect(rect2PX, rect2PY, rect2W, rect2H);
   
}
 
boolean rectRectIntersect(float left, float top, float right, float bottom,  // #1 rect                       // condition. 
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {   // #2 rect
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);       // This part was quite confussing, however, Hasan and I figured it out and it makes complete sense. It covers every single possible way of interection  between both rectangles
         // the first two implication cover both the left and right side of both rect # 1 && rect # 2     
         // the Second two cover bottom & Top of both rectangles. 
         // I must admit this was probably the most challenging question I was faced with. It took me quite a while to understand and wrap my head around. However, it makes complete sense once understood.         
}







