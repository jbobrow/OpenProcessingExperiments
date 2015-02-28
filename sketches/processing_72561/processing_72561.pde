
class Eye {
  float x, y, s, f;  //posx, posy, size, blink frequency
  color c;
  float eyeDistance = 60;

  //constructor. It receives values from outside the class
  Eye(float _x, float _y, float _s, color _c, float _f) {
    //we copy the values coming from outside to our global variables
    x = _x;
    y = _y;
    s = _s;
    c = _c;
    f = _f;
  }

  //draw
  void display() {

    if (frameCount % f < 20 ) {
      fill(0);
      ellipse (x-eyeDistance, y, s, 2);
      ellipse (x+eyeDistance, y, s, 2);
    }

    else {

      //left eye
      fill(c);
      ellipse (x-eyeDistance, y, s, s-10); 


      //right eye
      fill(c);
      ellipse (x+eyeDistance, y, s, s-10);
    }
  }
}


