
class FieldLine {
  float x, y, xm, ym;
  FieldLine(float x, float y) {
    this.x = x;
    this.y = y;
  }
  FieldLine(float x, float y, float xm, float ym) {
    this(x, y);
    this.xm = xm;
    this.ym = ym;
  }
  float distance(FieldLine fieldLine) {
    return dist(x, y, fieldLine.x, fieldLine.y);
  }
  void update(Vector control) {
    if(control.size() > 0) {
      float[] weights = new float[control.size()];
      float sum = 0;
      for(int i = 0; i < control.size(); i++) {
        FieldLine cur = ((FieldLine) control.get(i));
        weights[i] = distance(cur);
        weights[i] = 1 / weights[i]; // inverse
        weights[i] *= weights[i]; // square
        sum += weights[i];
      }
      xm = 0;
      ym = 0;
      for(int i = 0; i < weights.length; i++) {
        weights[i] /= sum;
        FieldLine cur = (FieldLine) control.get(i);
        xm += cur.xm * weights[i];
        ym += cur.ym * weights[i];
      }
    }
  }
  void draw() {
    line(x, y, x + xm, y + ym);
  }
}

