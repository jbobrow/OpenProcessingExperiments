
class Electrode {
  float x, y, z;
  boolean polarity;
  Electrode() {
    this(
      random(-width/2, width/2),
      random(-height/2, height/2),
      random(-height/2, height/2),
      (random(1) > .5));
  }
  Electrode(float x, float y, float z, boolean polarity) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.polarity = polarity;
  }
  void flip() {
    polarity = polarity ? false : true;
  }
  void rotateY(float a) {
    float nx = cos(a) * x - sin(a) * z;
    z = sin(a) * x + cos(a) * z;
    x = nx;
  }
  void rotateZ(float a) {
    float nx = cos(a) * x - sin(a) * y;
    y = sin(a) * x + cos(a) * y;
    x = nx;
  }
}

