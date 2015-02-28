
final color BACKGROUND_COLOR = #FFFFCC;

class Phasor
{
  float magnitude = 0.0;
  float direction = 0.0;
  
  void print() {
    println(nfs(magnitude,4,1) + "<" + nfs(direction*180.0/PI,4,1)
        + "  (" + nfs(getX(),4,1) + "," + nfs(getY(),4,1) + ")");
  }
  
  Phasor() {}
  
  Phasor(float magnitude, float direction) {
    this.magnitude = magnitude;
    this.direction = direction;
  }

  float getX() {
    return magnitude * cos(direction);
  }

  float getY() {
    return magnitude * sin(direction);
  }

  void setXY(float x, float y) {
    magnitude = sqrt(x*x + y*y);
    direction = atan(y/x);
    
    if (x < 0.0) {
       direction += PI;
    } else if (y < 0.0) {
      direction += TWO_PI;
    }
  }

  void setMagDir(float magnitude, float direction) {
    this.magnitude = magnitude;
    this.direction = direction;
  }

  void add(Phasor rhs) {
    setXY(
    this.getX() + rhs.getX(), 
    this.getY() + rhs.getY());
  }
  
  void clear() {
    magnitude = 0.0;
    direction = 0.0;
  }
}

class Object
{
  float size = 1.0;
  float rotation = 0.0;
  float posX = 0.0;
  float posY = 0.0;
  Phasor linearVelocity = new Phasor();
  Phasor dampedLinearAcceleration = new Phasor();
  Phasor undampedLinearAcceleration = new Phasor();
  float angularVelocity;
  float angularAcceleration;
  float randomness = 0.0;

  void randomize()
  {
    size = random(0.5, 3.0);
    rotation = random(0.0, TWO_PI);
    posX = random(0.0, width);
    posY = random(0.0, height);

    linearVelocity.setMagDir(random(0.0, 5.0), random(0.0, TWO_PI));
    dampedLinearAcceleration.setMagDir(random(0.0, 0.1), random(0.0, TWO_PI));
    angularVelocity = random(0.0, TWO_PI/20);
    angularAcceleration = random(-0.01, 0.01);
  }

  void draw()
  {
    pushMatrix();
    translate(posX, posY);
    rotate(rotation);
    scale(size);
    doDraw();
    popMatrix();
  }

  void doDraw() {
  }

  void increment() {
//    println("(" + nfs(posX,4,1) + "," + nfs(posY,4,1) + ") + "
//        + nfs(linearVelocity.magnitude,4,1) + "<" + nfs(linearVelocity.direction*180.0/PI,4,1)
//        + "  (" 
//        + nfs(linearVelocity.getX(),4,1) + "," + nfs(linearVelocity.getY(),4,1) + ")");
    posX += linearVelocity.getX();
    posY += linearVelocity.getY();
    linearVelocity.add(dampedLinearAcceleration);
    dampedLinearAcceleration.magnitude /= 1.2;
    linearVelocity.add(undampedLinearAcceleration);
    rotation += angularVelocity;
    angularVelocity += angularAcceleration;
    angularVelocity /= 1.2;
  }
}

final char[] LETTERS = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
};
final int LETTER_COUNT = 26;
class Letter extends Object
{
  char value;

  void randomize()
  {
    super.randomize();
    value = LETTERS[int(random(0, LETTER_COUNT))];
  }

  void draw()
  {
    super.draw();
  }

  void doDraw()
  {
    textAlign(CENTER, CENTER);
    text(value, 0, 0);
  }
}


class Text extends Object
{
  String value;
  
  Text() {}
  
  Text(String value) {
    this.value = value;
  }

  void randomize()
  {
    super.randomize();
  }

  void draw()
  {
    super.draw();
  }

  void doDraw()
  {
    textAlign(CENTER, CENTER);
    text(value, 0, 0);
  }
}


class Line extends Object
{
  float startX = 0.0;
  float startY = 0.0;
  float endX = 0.0;
  float endY = 0.0;
  float thickness = 1.0;

  Line() {
  }

  Line(float startX, float startY, float endX, float endY)
  {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.thickness = thickness;
  }

  void randomize()
  {
    super.randomize();
    startX = random(-50, 50);
    startY = random(-50, 50);
    endX = random(-50, 50);
    endY = random(-50, 50);
  }


  void draw()
  {
    super.draw();
  }

  void doDraw()
  {
    line(startX, startY, endX, endY);
  }
}

ArrayList<Object> objects = new ArrayList<Object>();
final float SCREEN_HEIGHT_IN_METERS = 10;
final float TIME_PER_FRAME_IN_MSEC = 50;
final float G_EARTH_IN_METERS_PER_SECOND = 9.8;
float gInPixelsPerFrame = 0.0;

class GravitationalAcceleration
{
  float asPixelsPerFrame = 0.0;
  float asMetersPerSecond = 0.0;
  float screenHeightInMeters = 0.0;
  float timePerFrameInMsec = 0.0;
  
  GravitationalAcceleration(float screenHeightInMeters, float timePerFrameInMsec) {
    this.screenHeightInMeters = screenHeightInMeters;
    this.timePerFrameInMsec = timePerFrameInMsec;
  }
  
  void setInMetersPerSecond(float gInMetersPerSecond) {
    asMetersPerSecond = gInMetersPerSecond;
    asPixelsPerFrame = asMetersPerSecond * height / screenHeightInMeters / timePerFrameInMsec / 1000.0;
  }
  
  void setScreenHeightInMeters(float screenHeightInMeters) {
    this.screenHeightInMeters = screenHeightInMeters;
    setInMetersPerSecond(asMetersPerSecond);
  }

  void setTimePerFrameInMsec(float timePerFrameInMsec) {
    this.timePerFrameInMsec = timePerFrameInMsec;
    setInMetersPerSecond(asMetersPerSecond);
  }
  
}

GravitationalAcceleration g;
boolean gravityOn = true;
boolean observerIsFalling = false;
float zoomLevel = 9.0;

void setup()
{
  size(800, 800);
  background(BACKGROUND_COLOR);
  fill(#0000FF, 127);
  stroke(#00FF00, 127);

  randomize(true);  
  frameRate(24);
  
  g = new GravitationalAcceleration(zoomLevel * SCREEN_HEIGHT_IN_METERS, TIME_PER_FRAME_IN_MSEC);
  g.setInMetersPerSecond(G_EARTH_IN_METERS_PER_SECOND);
 
}


final String[] INSTRUCTIONS = {
  "Click anywhere to reset the screen.",
  "SHIFT-Click to add to the collection of objects.",
  "R to reset the screen.",
  "A to add to the collection of objects.",
  "G to turn gravity off or on",
  "F to change perspective (falling objects or falling observer)",
  "1-9 to zoom in or out",
};
final int INSTRUCTIONS_COUNT = 7;

void randomize(boolean clearFirst)
{
  if (clearFirst)
  {
    objects.clear();

    // Add the instructions
    for (int item = 0; item < INSTRUCTIONS_COUNT; ++item)
    {
      Text instructions = new Text();
      instructions.value = INSTRUCTIONS[item];
      instructions.randomize();
      // Don't want it to be totally random.  It should start at the top.
      instructions.posX = width/2.0;
      instructions.posY = height/10.0 + item*20;
      objects.add(instructions);
    }
  }
  
  for (int iter = 0; iter < 50; ++iter)
  {
    Letter letter = new Letter();
    letter.randomize();
    objects.add(letter);

    Line aLine = new Line();
    aLine.randomize();
    objects.add(aLine);
  }
  
}


void draw()
{
  background(BACKGROUND_COLOR);
  Phasor gravity = new Phasor(g.asPixelsPerFrame, observerIsFalling ? 3.0*PI/2.0 : PI/2.0);
  for (int item = 0; item < objects.size(); ++item)
  {
    Object object = objects.get(item);
    object.draw();
    object.increment();
    if (gravityOn) {
      object.undampedLinearAcceleration.add(gravity);
    } else {
      object.undampedLinearAcceleration.clear();
    }
    if (object.posY > 2*height) {
      object.posY -= 2*height;
    } else if (object.posY < -height) {
      object.posY += 2*height;
    }
  }
}


void keyPressed()
{
  if (key >= '1' && key <= '9') {
    zoomLevel = key - '1' + 1.0;
    g.setScreenHeightInMeters(zoomLevel * SCREEN_HEIGHT_IN_METERS);
  } else {
    switch (key)
    {
      case 'a':
        randomize(false);
        break;
      case 'r':
        randomize(true);
        break;
      case 'g':
        gravityOn = !gravityOn;
        break;
      case 'f':
        observerIsFalling = !observerIsFalling;
        break;
    }
  }
}


void mousePressed()
{
  boolean addTo = keyPressed && key == CODED && keyCode == SHIFT;
  randomize(!addTo);
}


