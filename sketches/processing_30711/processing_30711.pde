
class Point {
  float timeIncrement;
  float range;
  float x,xOrigin,xtime;
  float y,yOrigin,ytime;
  Point(float xOriginInput,float yOriginInput) {
    xOrigin = xOriginInput;
    yOrigin = yOriginInput;
    xtime = random(100);
    ytime = random(100);
    timeIncrement = random(0.005,0.01);
    range = random(100);
  }
  void move() {
    x = xOrigin+(noise(xtime)-0.5)*range;
    y = yOrigin+(noise(ytime)-0.5)*range;
    xtime += timeIncrement;
    ytime += timeIncrement;
  }
}



