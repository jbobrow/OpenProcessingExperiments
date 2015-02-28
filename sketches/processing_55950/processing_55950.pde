
class Circle {
  float x = random(width);
  float y = random(height);
  float r;
  String w;
  String p;

  color c;
  //boolean isHovered = false;
  Label label;

  //FROM CLUSTERING
  float endX;
  float endY;
  float endR;
  float damping = 0.005;
  float spring = 0.90;
  boolean isHovered = false;
  int count = 0;

  Circle(String w_,int count_, String p_) {
    //x = x_;
    //y = y_;
    w = w_;
    p = p_;
    count = count_;
    //c = c_;

    // FROM CLUSTERING - for gravitational pull toward the center, set endX and endY coordinates to center point
    endX = width/2;
    endY = height/2;
    //endR = 0;
    r = endR;
    
    if (p.equals("R")) {
       c = color(190, 30, 45);
    } else if (p.equals("D")) {
       c = color(46, 49, 146);
    } else {
       c = color(102, 45, 145);
    }
    
      

    // initialize label
    
    String txt = (w);

    //String txt = "Value: " + int(r);
    label = new Label(txt);
  }
  
  
  void setCount() {

    count++;
    minMax(count);
    
  }
  
  
  void setRadius() {
    // map the radius to the count
    endR = map(count, minValue, maxValue, 30, 200);
  }

  void display() {

    
      
    // increment end coordinates toward centerpoint
    endX = endX + (width/2 - endX) * damping;
    endY = endY + (height/2 - endY) * damping;


    // increment x and y coordinates
    x = x + (endX - x) * damping;
    y = y + (endY - y) * damping;
   r = endR; // r + (endR - r) * damping;
    
    
    
       
    if (!isHovered) {
      fill(c, 210);
    } 
    else {
      fill(c);
       // draw label
   fill(c, 255);
   textAlign(CENTER);
   //textFont(label);
   text("" + w, x, y+5);
    
    }
    noStroke();
    ellipse(x, y, r*2, r*2);
     // draw label
   fill(235);
   textAlign(CENTER);
   //textFont(label);
   text("" + w, x, y+5);
    
    
  }

  void position(float x, float y) {
    endX = x;
    endY = y;
    
  }

  void hitTest(Circle Circle) {

    float minDistance = Circle.r + r;

    // if a hit test is registered, propell Circles in the opposite direction 
    if (dist(Circle.x, Circle.y, x, y) < minDistance) {

      // first, get the difference between the two x, y coordinates
      float dx = Circle.x - x;
      float dy = Circle.y - y;

      /*
      next, calculate the angle in polar coordinates
       atan2 calculates the angle (in radians) from a specified point to the coordinate origin, 
       as measured from the positive x-axis. more info here: http://processing.org/reference/atan2_.html
       */
      float angle = atan2(dy, dx);

      // now, calculate the target coordinates of the current Circle by using the minimum distance
      float targetX = x + cos(angle) * minDistance;
      float targetY = y + sin(angle) * minDistance;

      // increment the x and y coordinates for both objects
      x = x - (targetX - Circle.x) * spring;
      y = y - (targetY - Circle.y) * spring;
      Circle.x = Circle.x + (targetX - Circle.x) * spring;
      Circle.y = Circle.y + (targetY - Circle.y) * spring;
      
    }
  }


  void propell() {

    // randomize angle relative to sketch center
    float angle = random(360);

    // increment endX and endY coordinates
    endX = x - cos(angle) * height/2;
    endY = y - sin(angle) * height/2;
  }

  void onMouseOver(float mx, float my) {
    if (dist(mx, my, x, y) < r) {
      isHovered = true;
      label.display(mx, my);
    }    else {
      isHovered = false;
    }
 
  }
  
}



