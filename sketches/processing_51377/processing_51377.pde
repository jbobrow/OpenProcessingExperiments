
class Ball {
 
 int id;
 float x;
 float y;
 float endX;
 float endY;
 float colHue;
 float w;
 float h;
 
 Ball(int id_, float x_, float y_, float colHue_) {
   id = id_;
   x = x_;
   y = y_; 
   endX = x_;
   endY = y_;
   colHue = colHue_;
   w = ballSize;
   h = ballSize;
 }
 
 void display() {
   colorMode(HSB, 100);
   fill(colHue, 100, 50);
   noStroke();
   
   // tween ball to end position
   x = x + (endX - x) * damping;
   y = y + (endY - y) * damping;
   
   ellipse(x, y, w, h);
   
   // draw label
   fill(100);
   textAlign(CENTER);
   textFont(font);
   text("" + id, x, y+5);
 }
 
 void position(float x_, float y_) {
   endX = x_;
   endY = y_; 
 }
}

