
class Line {
  Point a, b;
  Line(Point a, Point b) {
    this.a = a;
    this.b = b;
  }
  Point pointAt(float t) {
    float x =  interp(a.x, b.x, t);
    float y =  interp(a.y, b.y, t);
    float z =  interp(a.z, b.z, t);
    return new Point(x, y, z);
  }
  void render() {
    line(a.x,a.y,a.z,b.x,b.y,b.z);
  }
}

