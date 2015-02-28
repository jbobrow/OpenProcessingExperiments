
Sine s;
Cosine c;
Tangent t;
float amp = 0.2;
float period = 1;
float hShift = 0;
float vShift = 0;
PFont font;

void setup() {
  size(720, 400);
  background(255);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  for (int a = 0, y = 5; a <= height; a+= height/10, y--) {
    line(width/2 - 5, a, width/2 + 5, a); // marks y-axis
    fill(0);
    text(y, width/2 - 15, a);
  }
  for (int b = 0, x = -4; b <= width; b+= width/8, x++) {
    line(b, height/2 - 5, b, height/2 + 5); // marks x-axis
    fill(0);
    if (x != 0) {
      text("" + (x/2.0) + "pi", b, height/2 - 5);
    }
  }
  fill(0);
  text("amplitude:" +  ((int)(50 * amp)/10.0), 10, 15);
  text("period: " + period, width/4, 15);
  text("horizontal shift: " + radians(hShift), width/2 + 20, 15);
  text("vertical shift: " + ((int)(50 * vShift)/10.0), 3*width/4 + 20, 15);
}

void draw() {
}

/* modifications to the graphs based on the key pressed*/
void keyPressed() {
  if (key == 's' || key == 'S') {
    s = new Sine(amp, period, hShift, vShift);
    c = null;
    t = null;
    setup();
    s.draw();
  }
  else if (key == 'c' || key == 'C') {
    c = new Cosine(amp, period, hShift, vShift);
    s = null;
    t = null;
    setup();
    c.draw();
  }
  else if (key == 't' || key == 'T') {
    t = new Tangent(amp, period, hShift, vShift);
    c = null;
    s = null;
    setup();
    t.draw();
  }
  else if (key == 'A') {
    if (amp > -1) {
      amp -= .1;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  } 
  else if (key == 'a') {
    if (amp < 1) {
      amp += .1;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  }
  else if (key == 'P') {
    if (period >= -9) {
      period--;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  } 
  else if (key == 'p') {
    if (period <= 9) {
      period++;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  }
  else if (key == 'H') {
    if (hShift > -width/2) {
      hShift -= 15;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  } 
  else if (key == 'h') {
    if (hShift < width/2) {
      hShift +=15;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  } 
  else if (key == 'V') {
    if (vShift > -1 ) {
      vShift -= .1;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  } 
  else if (key == 'v') {
    if (vShift < 1 ) {
      vShift += .1;
    }
    setup();
    if (s != null) {
      s = new Sine(amp, period, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new Cosine(amp, period, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new Tangent(amp, period, hShift, vShift);
      t.draw();
    }
  }
  else if (key == ' ') {
    amp = 0.2;
    period = 1;
    hShift = 0;
    vShift = 0;
    s = null;
    c = null;
    t = null;
    setup();
  }
  else {
  }
}

/*Sinusoid class holds the fields that each graph shares in common.
 class is abstact; objects should only be made out of the 
 respective graphs. Each class has its own specific draw() method
 */
abstract class Sinusoid {

  /*Useage of the first four fields extends from an example
    on making sine graphs by Satish Goda; a link to the exact
    project is on the description; parts of the draw method is
    also based on his example.
  */
  float xCoord; //next x-coordinate for the line to be drawn to
  float yCoord; //next y-coordinate for the line to be drawn to
  float initX = -width/2; //previous x-coord, default -360, always starts at -360
  float initY; //previous y-coord, modified depending on graph
  float angle; //placer, angle calculated to radians in method
  float amplitude = .2; //default amplitude for a graph
  float periodMod = 1; //modification that alters the period
  float horizontalShift = 0; //changes starting point on the x, shifts graph left/right
  float verticalShift = 0; //changes starting value for y, moves graph up/down

  public Sinusoid() {
  }

  public Sinusoid(float amp, float period, float hshift, float vshift) {
    amplitude = amp;
    periodMod = period;
    horizontalShift = hshift;
    verticalShift = vshift;
  }
}

class Cosine extends Sinusoid {

  public Cosine() {
  }

  public Cosine(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);
    text("f(x) = " + ((int)(50 * amplitude)/10.0) + "cos(" + period + "x + "
      + radians(horizontalShift) + ") + " + ((int)(50 * verticalShift)/10.0), 20, height - 20);
    initY = 1;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      xCoord = a + width/2;
      angle = radians(periodMod * (a + horizontalShift));
      yCoord = -(cos(angle) * amplitude + verticalShift);
      yCoord = map(yCoord, -1, 1, -height/2, height/2) + height/2;
      line(initX, initY, xCoord, yCoord);
      initX = xCoord;
      initY = yCoord;
    }
    initX = -width/2;

    initY = 1;
  }
}

class Sine extends Sinusoid {

  public Sine() {
  }

  public Sine(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);
    text("f(x) = " + ((int)(50 * amplitude)/10.0) + "sin(" + period + "x + "
      + radians(horizontalShift) + ") + " + ((int)(50 * verticalShift)/10.0), 20, height - 20);
    initY = 0;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      xCoord = a + width/2;
      angle = radians(periodMod * (a + horizontalShift));
      yCoord = -(sin(angle) * amplitude + verticalShift);
      yCoord = map(yCoord, -1, 1, -height/2, height/2) + height/2;
      line(initX, initY, xCoord, yCoord);
      initX = xCoord;
      initY = yCoord;
    }
    initX = -width/2;
  }
}

class Tangent extends Sinusoid {

  public Tangent() {
  }

  public Tangent(float amp, float period, float hshift, 
  float vshift) {
    super(amp, period, hshift, vshift);
  }

  void draw() {
    fill(0);
    text("f(x) = " + ((int)(50 * amplitude)/10.0) + "tan(" + period + "x + "
      + radians(horizontalShift) + ") + " + ((int)(50 * verticalShift)/10.0), 20, height - 20);
    initY = 0;
    smooth();
    for (int a = -width/2; a <= width/2; a++) {
      xCoord = a + width/2;
      float myX = periodMod * (a + horizontalShift);
      if (myX % 180 == 90 || myX % 180 == -90) {
      } 
      else {
        angle = radians(periodMod * (a + horizontalShift));
        yCoord = -(tan(angle) * amplitude + verticalShift);
        yCoord = map(yCoord, -1, 1, -height/2, height/2) + height/2;
        line(initX, initY, xCoord, yCoord);
        initX = xCoord;
        initY = yCoord;
      }
    }
    initX = -width/2;
  }
}


