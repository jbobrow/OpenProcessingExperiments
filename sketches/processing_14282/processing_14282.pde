

class cCatcher {
  float r; // radius
  color col; // color
  float x,y; // location
  PImage Open;
  PImage bite;
//  Open = loadImage ("open.png");
  
  cCatcher(float r_) {
    r = r_;
    col = color(50,10,10,150);
    x = 0;
    y = 0;
  }
  
  void setLocation(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void display() {
    fill(col);
    noStroke();
//    if (cDrop.caughtit){
//      bite = loadImage ("snap.gif");
//    ellipse(x,y,r,r);
//    image (bite, x-160,y-115);
//    } else{
      Open = loadImage ("Open.gif");
      image (Open, x-160,y-115);
//    }
  }
  
  // A function that returns true or false based on if the catcher intersects a raindrop
  boolean intersect(cDrop d) {
    float distance = dist(x,y,d.x,d.y); // Calculate
    if (distance < r + d.r) { // Compare distance
      return true;
    }
    else {
      return false;
    }
  }
}


