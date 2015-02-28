
class Ball {
 
 int id;
 float x;
 float y;
 float endX;
 float endY;
 float colHue;
 float w = 50;
 float h = 50;
 String category;
 Boolean visible = true;

 Ball(int id_, float x_, float y_, String category_) {
   id = id_;
   x = x_;
   y = y_; 
   endX = x_;
   endY = y_;
   category = category_;
 }
 
 void display() {
   if (category == "red") {
     fill(255, 0, 0);
   } else if (category == "green") {
     fill(0, 255, 0);
   } else if (category == "blue") {
     fill(0, 0, 255);
   }
   
   noStroke();
   
   x = x + (endX - x) * damping;
   y = y + (endY - y) * damping;
   
   if (visible) {
     ellipse(x, y, w, h);
     
     // draw label
     fill(255);
     textAlign(CENTER);
     textFont(font);
     textSize(15);
     text("" + id, x, y+5);
   }
 }
 
 void position(float x_, float y_) {
   endX = x_;
   endY = y_; 
 }
}

