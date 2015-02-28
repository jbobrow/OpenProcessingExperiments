
class Ball {
  
 float x;
 float y;
 float endX;
 float endY;
 float colHue;
 float w = 100;
 float h = 100;
 int stackOrder;
  
 Ball(float x_, float y_, float colHue_, int stackOrder_) {
   x = x_;
   y = y_;
   endX = x_;
   endY = y_;
   colHue = colHue_;
   stackOrder = stackOrder_;
 }
  
 void display() {
   colorMode(HSB, 100);
   fill(colHue, 100, 100);
   noStroke();
    
   x = x + (endX - x) * damping;
   y = y + (endY - y) * damping;
    
   ellipse(x, y, w, h);
 }
  
 void position(float x_, float y_) {
   endX = x_;
   endY = y_;
 }
