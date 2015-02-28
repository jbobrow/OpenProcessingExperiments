
SineGraph s;
CosineGraph c;
TangentGraph t;
CscGraph p;
SecGraph o;
CotGraph i;
float amp = 1;
float period = 1;
float hShift = 0;
float vShift = 0;


void setup() {
  size(800, 400);
  background(200);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}

void draw() {
}
void keyPressed() {
  if (key == 's') {
    s = new SineGraph(amp, period, hShift, vShift);
    setup();
    s.draw();
  }
  else if (key == 'c') {
    c = new CosineGraph(amp, period, hShift, vShift);
    setup();
    c.draw();
  }
  else if (key == 't') {
    t = new TangentGraph(amp, period, hShift, vShift);
    setup();
    t.draw();
  }
  else if (key == 'p') {
    p = new CscGraph(amp, period, hShift, vShift);
    setup();
    p.draw();
  }
  else if (key == 'o') {
    o = new SecGraph(amp, period, hShift, vShift);
    setup();
    o.draw();
  }
  else if (key == 'i') {
    i = new CotGraph(amp, period, hShift, vShift);
    setup();
    i.draw();
  }
}


public class SinusoidalGraph {

  float x;
  float y;
  float initX = -width/2;
  float initY;
  float angle;
  float amplitude = 1;
  float periodMod = 1;
  float horizontalShift = 0;
  float verticalShift = 0;

  public SinusoidalGraph() {
  }

  public SinusoidalGraph(float amp, float period, float hshift, float vshift) {
    amplitude = amp;
    periodMod = period;
    horizontalShift = hshift;
    verticalShift = vshift;
  }
}

class CosineGraph extends SinusoidalGraph {

  public CosineGraph() {
  }

  public CosineGraph(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);

    initY = 1;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      x = a + width/2;
      angle = radians(periodMod * (a + horizontalShift));
      y = -(cos(angle) * amplitude + verticalShift);
      y = map(y, -1, 1, -height/2, height/2) + height/2;
      line(initX, initY, x, y);
      initX = x;
      initY = y;
    }
  }
}

class SineGraph extends SinusoidalGraph {

  public SineGraph() {
  }

  public SineGraph(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);
    initY = 0;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      x = a + width/2;
      angle = radians(periodMod * (a + horizontalShift));
      y = -(sin(angle) * amplitude + verticalShift);
      y = map(y, -1, 1, -height/2, height/2) + height/2;
      line(initX, initY, x, y);
      initX = x;
      initY = y;
    }
  }
}

class TangentGraph extends SinusoidalGraph {

  public TangentGraph() {
  }

  public TangentGraph(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);
    initY = 0;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      x = a + width/2;
      float myX = periodMod * (a + horizontalShift);

      angle = radians(periodMod * (a + horizontalShift));
      y = -(tan(angle) * amplitude + verticalShift);
      y = map(y, -1, 1, -height/2, height/2) + height/2;
      line(initX, initY, x, y);
      initX = x;
      initY = y;
    }
  }
}
public class CscGraph extends SinusoidalGraph {

  public CscGraph() {
  }

  public CscGraph(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);
    initY = 0;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      x = a + width/2;
      float myX = periodMod * (a + horizontalShift);

      angle = radians(periodMod * (a + horizontalShift));
      y = -(1/sin(angle) * amplitude + verticalShift);
      y = map(y, -1, 1, -height/2, height/2) + height/2;
      line(initX, initY, x, y);
      initX = x;
      initY = y;
    }
  }
}
  class SecGraph extends SinusoidalGraph {

    public SecGraph() {
    }

    public SecGraph(float amp, float period, float hshift, 
    float vshift) {
      super(amp, period, hshift, vshift);
    }

    void draw() {
      fill(0);
      initY = 0;
      smooth();
      for (int a = -width/2; a <= width/2; a++) {
        x = a + width/2;
        float myX = periodMod * (a + horizontalShift);

        angle = radians(periodMod * (a + horizontalShift));
        y = -(1/cos(angle) * amplitude + verticalShift);
        y = map(y, -1, 1, -height/2, height/2) + height/2;
        line(initX, initY, x, y);
        initX = x;
        initY = y;
      }
    }
  }
    class CotGraph extends SinusoidalGraph {

      public CotGraph() {
      }

      public CotGraph(float amp, float period, float hshift, 
      float vshift) {
        super(amp, period, hshift, vshift);
      }

      void draw() {
        fill(0);
        initY = 0;
        smooth();
        for (int a = -width/2; a <= width/2; a++) {
          x = a + width/2;
          float myX = periodMod * (a + horizontalShift);

          angle = radians(periodMod * (a + horizontalShift));
          y = -(1/tan(angle) * amplitude + verticalShift);
          y = map(y, -1, 1, -height/2, height/2) + height/2;
          line(initX, initY, x, y);
          initX = x;
          initY = y;
        }
      }
    }
  



