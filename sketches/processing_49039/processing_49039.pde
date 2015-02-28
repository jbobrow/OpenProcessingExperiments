
public class Particle {
  PVector pos;
  PVector vel;
  float dampening = 0.995; // .996;
  PVector acc;
  float dt = .60;
  float R = 2.8; //1.4; //radius
  int age = 0;
  int maxAge = 100;
  color col = color(255);
  color colTmp;
  float grow = 0;
  float rotation = 0; // roation per frame in radians
  float angle = 0;
  
//  /* 
//   * enum is supported by java used by Processing, but the preprocessor for the IDE
//   * is based partly on java 1.4 and doen't reconize the feature
//   */
//  public enum Shape { CIRCLE, SQUARE, TRIANGLE }
//  //private 
//  final Shape shape = CIRCLE;
//
//  setType(Shape shape) {
//    this.shape = shape;
//  }
  // int Enum Pattern - has severe problems!
  public static final int CIRCLE = 0;
  public static final int SQUARE = 1;
  public static final int TRIANGLE = 2;
  int shape = CIRCLE;

  public Particle(float x, float y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector();
    this.acc = new PVector(); 
  }

  public Particle(float x, float y, float rad, color col, int shape) {
    this.pos = new PVector(x, y);
    this.vel = new PVector();
    this.acc = new PVector();
    this.R = rad;
    this.age = 0;
    this.col = col;
    this.shape = shape;
  }


  void draw() {
    fill(col);

    //regularTriangleLines(pos.x, pos.y, R, angle);
    regularTriangle(pos.x, pos.y, R*2, angle);
    
//    switch(shape) {
//      default:
//      case CIRCLE:
//        ellipse(pos.x, pos.y, R, R);
//        break;
//      case SQUARE:
//        rect(pos.x, pos.y, R/2, R/2);
//        break;
//      case TRIANGLE:
//        regularTriangle(pos.x, pos.y, R);
//        break;
//    }


  }

  void tick() {
    PVector dv = acc.get();
    dv.mult(dt);
    vel.add(dv);
    vel.mult(dampening);    

    PVector ds = vel.get();
    ds.mult(dt);
    pos.add(ds);
    age++;
    
    R = R * sqrt(grow);
    
    angle = (angle + rotation) % TWO_PI;
    
    //wrap X
    if (pos.x > width)
    pos.x -= width;
    else if (pos.x < 0)
    pos.x += width;
  }

//  void draw() {
//    fill(col);
//    noStroke();
//    ellipseMode(CENTER);
//    ellipse(pos.x, pos.y, 2*R, 2*R);
//    //openGL likes quads...
//    //rectMode(CENTER);
//    //rect(pos.x, pos.y, 2*R, 2*R);
//  }

  //borrowed from Daniel Shiftman
  void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x, y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0, 0, len, 0);
    line(len, 0, len-arrowsize, +arrowsize/2);
    line(len, 0, len-arrowsize, -arrowsize/2);
    popMatrix();
  }

  void reflect(PVector N) {
    PVector tmp = N.get();
    tmp.mult(2 * N.dot(vel));
    vel.sub(tmp);
  }

  void  displayVector() {
    displayVector(vel, pos.x, pos.y, R);
  }

  void setColor(color col) {
    this.col = col;
  }
  



  color applyAlpha(color c, float a) {
    colorMode(HSB);
    return color(hue(c), saturation(c), brightness(c), a);
  }

}







