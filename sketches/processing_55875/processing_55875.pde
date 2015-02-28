
class Button{
  Poi poi;
  Sample sample;

  
  float x;
  float y;
  float r;
  boolean isPressed = false;


  Button(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
  }

  //display the button
  void display() {

    if (!isPressed) {
      fill(100);
    } else {
      fill(255);


    }
    noStroke();
    ellipseMode(CENTER);
    ellipse (x, y, r * 2, r * 2);
  }

  //position the button
  void position(float x_, float y_) {
    x = x_;
    y = y_;
  }
}


