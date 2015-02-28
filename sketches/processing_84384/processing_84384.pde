
Walker walker;

void setup() {
  size(800, 800);
  frameRate(3000);
  smooth();

  String src = loadStrings("PI125MDP.TXT")[0];
  Way way = new Way(src);
  walker = new Walker(700, 200, way);

  background(0);

  // for (int i = 0; i < src.length(); i++) {
  //   walker.walk();
  //   walker.display();
  // }
}

void draw() {
  println(frameRate);
  println(frameCount);

  // colorMode(RGB);
  // fill(0, 1);
  // noStroke();
  // rect(0, 0, width, height);

  for (int i = 0; i < 32; i++) {
    walker.walk();
    walker.display();
  }
}
class Walker {

  private float x, y;
  private Way way;

  Walker(float x, float y, Way way) {
    this.x = x;
    this.y = y;
    this.way = way;
  }

  void display() {
    colorMode(HSB, 360, 100, 100);
    stroke((frameCount/60)%360, 100, 100, 63);
    strokeWeight(0.8);
    point(x, y);
  }
  
  void walk() {
    PVector v = way.getDirection();

    x += v.x;
    y += v.y;
  }
}
class Way {

  // for 'ascii digit' -> 'int digit'
  static final int OFFSET = 48;

  private PVector[] direction;
  private int count;
  

  Way(String source) {
    direction = new PVector[source.length()];
    for (int i = 0; i < direction.length; i++) {
      int n = source.charAt(i) - OFFSET;
      direction[i] = directionMap(n);
    }
  }

  private PVector directionMap(int n) {
    final float r = 0.8;
    float rad = TWO_PI * (n/10.0);

    float x = r * cos(rad);
    float y = r * sin(rad);

    return new PVector(x, y);      
  }

  PVector getDirection() {
    PVector d = direction[count++];
    if (count >= direction.length)
      count = 0;

    return d;
  }
}


