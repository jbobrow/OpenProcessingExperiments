
// A Cell object

class Cell {

  // A cell object knows about its location in the grid as well as its size with the variables x, y, w, h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float startY; // initial Y position
  int time;
  float angle; // angle for oscillating brightness
  color c = color(255);
  boolean fallFlip = false;
  boolean reset = false;

  int damping = 10000; // slows down tween
  float easeDuration = 1;
  int easeType; // choose 1, 2 or 3 for different ease types

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    time = 0;
    startY = y;

    easeDuration = random(0.5, 1.5);  // randomizing duration to make more organic animation
  }

  void display(boolean _reset, int _easeType) {
    reset = _reset; 
    easeType = _easeType;
    stroke(0);
    fill(c);
    rect(x,y,w,h);
    if(fallFlip) {
      fall();
    }
  }

  void fall() {

    if(reset) {
      boolean fallFlip = false;
      startY = y;
    }

    time++;

    if(y == height+h) {
      y = height+h;
    }
    else {

      float tweenY=1;
      switch(easeType) {
      case 1:
        tweenY = (easeCubicIn(time, startY, 20, easeDuration))/damping;
        break;
      case 2:
        tweenY = (easeInOutCubic(time, startY, 20, easeDuration))/damping;
        break;
      case 3:
        tweenY = (easeInQuartic(time, startY, 20, easeDuration))/damping;
        break;
      }

      y+=tweenY;

    }
  }

  // t: current time, b: beginning value, c: change in value, d: duration
  float easeCubicIn(int t, float b, int c, float d) {
    float tc = (t/d)*t*t;
    return b+c*(tc);
  }

  float easeInOutCubic(int t, float b, int c, float d) {
    if ((t/=d/2) < 1) return c/2*t*t*t + b;
    return c/2*((t-=2)*t*t + 2) + b;
  }

  float easeInQuartic(int t, float b, int c, float d) {
    float ts =(t/d)*t;
    return b+c*(ts*ts);
  }

}


