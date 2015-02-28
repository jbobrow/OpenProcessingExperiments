


PImage img;
SineGraph s;
CosineGraph c;
TangentGraph t;
CscGraph S;                 // Sinusoidal objects
SecGraph C;
CotGraph T;
float amplitude = .2; //arbitrarily assigned amplitude
float frequency = .72;//arbitrarily assigned frequency
float hShift = 0; //initial x-shift(normal sinusoidal has initial x-shift of 0)
float vShift = 0; //initial y-shift(normal sinusoidal has initial y-shift of 0)

//creates the window, paints background, draws axes, and marks intervals. Called everytime
//key is pressed in keyPressed().
void setup() {
  size(1000, 800);
  background(255);
  line(width/2, 0, width/2, height);//draws x-axis
  line(0, height/2, width, height/2); //draws y-axis  
  for (int i = 0, j = -4;  i <= width; i += width/8, j++) { //ticks the x-axis
    line(i, height/2 - 5, i, height/2 + 5); 
    fill(0, 0, 255);   
    text("" + (j/2.0) + "π",  i, height/2 - 5); //labels tick
  }
  for (int i = 0, j = 5; i <= height; i+=height/10, j--) { //ticks the y-axis
    line (width/2 - 5, i, width/2 + 5, i);
    fill(0, 0, 255);
    text(j, width/2 - 15, i); //labels tick
  }
  //img = loadImage("Feromax Face.jpg"); (uncomment to see a picture of feromax)
  //image(img, 5, 700, 40, 40);
  fill(0, 0, 255); 
  text("Amplitude:" +  amplitude*5, 90, 15);
  text("Frequency: " + frequency/.72, width/4 + 50, 15);
  text("Horizontal Shift: " + radians(hShift), width/2 + 90, 15);
  text("Vertical Shift: " + ((int)(55 * vShift)/10.0), 3*width/4 + 65, 15);
  text("'s' for Sine, 'c' for Cosine, 't' for Tangent.", 5, 45);
  text("'S' for Cosecant, 'C' for Secant, 'T' for Cotangent.", 5, 60);
  text("amplitudeMod: 'a' increases, 'A' decreases.", 5, 75);
  text("frequencyMod: 'f' increases, 'F' decreases.", 5, 90);
  text("horizontalShiftMod: 'h' increases, 'H' decreases.", 5, 105);
  text("verticalShiftMod: 'v' increases, 'V' decreases.", 5, 120);
  text("'r' to reset variables.", 5, 135);
  fill(542, 102, 132);
  text("feromax power", 5, 750);
  fill(0, 0, 255); 
  text("(Correlation of graph):" + ((amplitude*5) + frequency/.72 + radians(hShift) + ((int)(55*vShift)/10.0)), 100, 750);
 
 

}

//empty draw() to allow program to run
void draw() {
 
}
//draws graph according to key pressed. Ex: when 's' is pressed, draws a normal Sine Graph.
//**calling setup() in every if() statement re-draws the axes everytime a key is pressed. A hack..**
//After type of graph is chosen, allows user to alter amplitude, frequency, hShift, and vShift.
//lower-case increases, upper-case decreases the variables
//To prevent other graphs than wanted graph from being drawn, all other graphs are set to null.
void keyPressed() {
  if (key == 's') {
    s = new SineGraph(amplitude, frequency, hShift, vShift);
    c = null;
    t = null;
    S = null;
    C = null;
    T = null;
    setup();
    s.draw();
  }
  else if (key == 'c') {
    s = null;
    c = new CosineGraph(amplitude, frequency, hShift, vShift);
    t = null;
    S = null;
    C = null;
    T = null;
    setup();
    c.draw();
  }
  else if (key == 't') {
    s = null;
    c = null;
    t = new TangentGraph(amplitude, frequency, hShift, vShift);
    S = null;
    C = null;
    T = null;
    setup();
    t.draw();
  }
  else if (key == 'S') {
    s = null;
    c = null;
    t = null;
    S = new CscGraph(amplitude, frequency, hShift, vShift);
    C = null;
    T = null;
    setup();
    S.draw();
  }
  else if (key == 'C') {
    s = null;
    c = null;
    t = null;
    S = null;
    C = new SecGraph(amplitude, frequency, hShift, vShift);
    T = null;
    setup();
    C.draw();
  }
  else if (key == 'T') {
    s = null;
    c = null;
    t = null;
    S = null;
    C = null;
    T = new CotGraph(amplitude, frequency, hShift, vShift);
    setup();
    T.draw();
  }
  else if (key == 'a') {
    if (amplitude < 1) {
    amplitude += .1;
    }
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'A') {
    if (amplitude > -1) {
    amplitude -= .1;
    }
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'f') {
    frequency += .5;
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'F') {
    frequency -= .1;
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'h') {
    hShift += 100;
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'H') {
    hShift -= 100;
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'v') {
    if (vShift < .7) {
    vShift += .1;
    }
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'V') {
    if (vShift > -.7) {
    vShift -= .1;
    }
    setup();
    if (s != null) {
      s = new SineGraph(amplitude, frequency, hShift, vShift);
      s.draw();
    }
    if (c != null) {
      c = new CosineGraph(amplitude, frequency, hShift, vShift);
      c.draw();
    }
    if (t != null) {
      t = new TangentGraph(amplitude, frequency, hShift, vShift);
      t.draw();
    }
    if (S != null) {
      S = new CscGraph(amplitude, frequency, hShift, vShift);
      S.draw();
    }
    if (C != null) {
      C = new SecGraph(amplitude, frequency, hShift, vShift);
      C.draw();
    }
    if (T != null) {
      T = new CotGraph(amplitude, frequency, hShift, vShift);
      T.draw();
    }
  }
  else if (key == 'r') {
    amplitude = .2;
    frequency = .72;
    hShift = 0;
    vShift = 0;
    setup();
  }
}





//super-class that has methods that sinusoidal graph objects inherit and use
public class SinusoidalGraph {
  float x1; //x-point right before current x-point. Connected to x2.
  float y1;//y-point right before current y-point. Connected to y2.
  float x2; //current x-point
  float y2; //current y-point
  float angle;//angle generated based on position on x-axis to calculate the y-value
  float amplitude = 1; //amplitude of regular sinusoidal graph
  float frequency = 1; //frequency of regular sinusoidal graph
  float horizontalShift = 0;//x-shift of regular sinusoidal graph
  float verticalShift = 0;//y-shift of regular sinusoidal graph


  //constructor that sets field variables equal to parameters
  public SinusoidalGraph(float amplitude, float frequency, float horizontalShift, float verticalShift) {
    this.amplitude = amplitude;
    this.frequency = frequency;
    this.horizontalShift = horizontalShift;
    this.verticalShift = verticalShift;
  }
}
//creates SineGraph object with random amplitude, frequency, horizontalShift, and verticalShift
class SineGraph extends SinusoidalGraph {
  public SineGraph(float amplitude, float frequency, float horizontalShift,
  float verticalShift) {
    super(amplitude , frequency , horizontalShift , verticalShift );
  }
  void draw() {
    for (int i = -width/2; i <= width/2; i++) {
      x2 = i + width/2;
      angle = radians(frequency * (i + horizontalShift)); //angle generated based on position on x-axis
      y2 = -(sin(angle) * amplitude + verticalShift);//y-coordinate generated based on previously generated angle
      y2 = map(y2, -1, 1, -height/2, height/2) + height/2;//scales y-coordinate appropriately with size of window
      line(x1, y1, x2, y2);
      x1 = x2;//ensures x-points are continuously drawn
      y1 = y2;//ensures y-points are continuously drawn
    }
  }
}
//creates CosineGraph object with random amplitude, frequency, horizontalShift, and verticalShift
class CosineGraph extends SinusoidalGraph {
  public CosineGraph(float amplitude, float frequency, float horizontalShift,
  float verticalShift) {
    super(amplitude , frequency , horizontalShift , verticalShift);
  }
  void draw() {
    for (int i = -width/2; i <= width/2; i++) {
      x2 = i + width/2;
      angle = radians(frequency * (i + horizontalShift));//angle generated based on position on x-axis
      y2 = -(cos(angle) * amplitude + verticalShift);//y-coordinate generated based on previously generated angle
      y2 = map(y2, -1, 1, -height/2, height/2) + height/2;//scales y-coordinate appropriately with size of window
      line(x1, y1, x2, y2);
      x1 = x2;//ensures x-points are continuously drawn
      y1 = y2;//ensures y-points are continuously drawn
    }
  }
}
//creates TangentGraph object with random amplitude, frequency, horizontalShift, and verticalShift
class TangentGraph extends SinusoidalGraph {
  public TangentGraph(float amplitude, float frequency, float horizontalShift,
  float verticalShift) {
    super(amplitude , frequency , horizontalShift , verticalShift );
  }
  void draw() {
    for (int i = -width/2; i <= width/2; i++) {
      x2 = i + width/2;
      angle = radians(frequency * (i + horizontalShift));//angle generated based on position on x-axis
      y2 = -(tan(angle) * amplitude + verticalShift);//y-coordinate generated based on previously generated angle
      y2 = map(y2, -1, 1, -height/2, height/2) + height/2;//scales y-coordinate appropriately with size of window
      line(x1, y1, x2, y2);
      x1 = x2;//ensures x-points are continuously drawn
      y1 = y2;//ensures y-points are continuously drawn
    }
  }
}
//creates CscGraph object with random amplitude, frequency, horizontalShift, and verticalShift
public class CscGraph extends SinusoidalGraph {
  public CscGraph(float amplitude, float frequency, float horizontalShift,
  float verticalShift) {
    super(amplitude , frequency , horizontalShift , verticalShift );
  }
  void draw() {
    for (int i = -width/2; i <= width/2; i++) {
      x2 = i + width/2;
      angle = radians(frequency * (i + horizontalShift));//angle generated based on position on x-axis
      y2 = -(1/sin(angle) * amplitude + verticalShift);//y-coordinate generated based on previously generated angle
      y2 = map(y2, -1, 1, -height/2, height/2) + height/2;//scales y-coordinate appropriately with size of window
      line(x1, y1, x2, y2);
      x1 = x2;//ensures x-points are continuously drawn
      y1 = y2;//ensures y-points are continuously drawn
    }
  }
}
//creates SecGraph object with random amplitude, frequency, horizontalShift, and verticalShift
class SecGraph extends SinusoidalGraph {
  public SecGraph(float amplitude, float frequency, float horizontalShift,
  float verticalShift) {
    super(amplitude , frequency , horizontalShift , verticalShift );
  }
  void draw() {
    for (int i = -width/2; i <= width/2; i++) {
      x2 = i + width/2;
      angle = radians(frequency * (i + horizontalShift)); //angle generated based on position on x-axis
      y2 = -(1/cos(angle) * amplitude + verticalShift);//y-coordinate generated based on previously generated angle
      y2 = map(y2, -1, 1, -height/2, height/2) + height/2;//scales y-coordinate appropriately with size of window
      line(x1, y1, x2, y2);
      x1 = x2;//ensures x-points are continuously drawn
      y1 = y2;//ensures y-points are continuously drawn
    }
  }
}
//creates CotGraph object with random amplitude, frequency, horizontalShift, and verticalShift
class CotGraph extends SinusoidalGraph {
  public CotGraph(float amplitude, float frequency, float horizontalShift,
  float verticalShift) {
    super(amplitude , frequency , horizontalShift , verticalShift );
  }
  void draw() {
    for (int i = -width/2; i <= width/2; i++) {
      x2 = i + width/2;
      angle = radians(frequency * (i + horizontalShift));//angle generated based on position on x-axis
      y2 = -(1/tan(angle) * amplitude + verticalShift);//y-coordinate generated based on previously generated angle
      y2 = map(y2, -1, 1, -height/2, height/2) + height/2; //scales y-coordinate appropriately with size of window
      line(x1, y1, x2, y2);
      x1 = x2;//ensures x-points are continuously drawn
      y1 = y2;//ensures y-points are continuously drawn
    }
  }
}


