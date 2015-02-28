
class Mouth {
  float x, y, r;
   
 Mouth(float x_, float y_, float r_)
   {
     x = x_; y = y_; r = r_; 
   }
   
   void display(float r_)
   {
     fill(0);
     r = r_;
     ellipseMode(CENTER_RADIUS);
     noStroke();
     ellipse(x, y, 130, r);
   }
}

class Eye1 {
  float x, y, r;
   
 Eye1(float x_, float y_, float r_)
   {
     x = x_; y = y_; r = r_; 
   }
   
   void display(float r_)
   {
     fill(random(255),random(255),random(255));
     r = r_;
     ellipseMode(CENTER_RADIUS);
     noStroke();
     ellipse(x, y, r, r);
   }
}

class Eye2 {
  float x, y, r;
   
 Eye2(float x_, float y_, float r_)
   {
     x = x_; 
     y = y_; 
     r = r_;  
   }
   
   void display(float r_)
   {
     fill(random(255),random(255),random(255));
     r = r_;
     ellipseMode(CENTER_RADIUS);
     noStroke();
     ellipse(x, y, r, r);
   }
}

