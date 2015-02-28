
import java.util.Iterator;
import java.util.LinkedList;

static class Circle {

  // The main PApplet 
  ClockworkOrange myOwner = null;

  // center coordinates
  float center_X;
  float center_Y;

  // center coordinates after one rotation
  float rotatet_center_X;
  float rotatet_center_Y;

  // the radius
  float radius;

  // the fillcolor
  int fillcolor;

  // the stroke color
  int strokeColor;

  // control attribute for the direction of the rotation; (counter-)clockwise
  int rotationdirection = 1;

  // true, if this Circle has two child circles
  boolean hasChilds = false;

  // the big child circle
  Circle bigChildCircle = null;

  // the small child circle
  Circle smallChildCircle = null;
  Circle parentCircle = null;

  // values for rotation...ROT_C = cosinus(angle), ROT_S = sinus(angle), see initialize
  static float ROT_C;
  static float ROT_S;

  // list of all circles
  static final LinkedList<Circle> circleList = new LinkedList<Circle>();

  Circle(ClockworkOrange owner, float center_x, float center_y, float radius, 
  int fillcolor) {
    center_X = center_x;
    center_Y = center_y;
    rotatet_center_X = center_X;
    rotatet_center_Y = center_Y;

    this.radius = radius;
    this.fillcolor = fillcolor;

    myOwner = owner;
    circleList.add(this);
  }

  /*
    check, wether a childless circle contains the point position
    if so, returns this (unique) circle
  */
  static Circle findHitCircle(PVector position) {
    Circle hitCircle = null;
    Iterator<Circle> iterator = circleList.iterator();
    while (iterator.hasNext ()) {
      Circle circle = iterator.next();
      if (!circle.hasChilds) {
        if (PApplet.dist(position.x, position.y, circle.center_X, 
        circle.center_Y) <= circle.radius) {
          hitCircle = circle;
          break;
        }
      }
    }// end while (iterator.hasNext()) {
    return (hitCircle);
  }

  // set parent and prepare for opposite rotation
  void setParent(Circle parent)
  {
    parentCircle = parent;
    rotationdirection = -1*parentCircle.rotationdirection;
  }

  void createChildCircles()
  {
    int colorOfChilds;
    if ( fillcolor == myOwner.initialCircleColor )
    {
      colorOfChilds = myOwner.newCircleColor;
    }
    else
    {
      colorOfChilds = myOwner.initialCircleColor;
    }
    float bigRadius = radius / ClockworkOrange.GR;
    float smallRadius = radius - bigRadius;

    // a little bit linear algebra
    PVector direction = new PVector(myOwner.mouseHit.x, myOwner.mouseHit.y);
    PVector center = new PVector(center_X, center_Y);
    direction.sub(center);
    direction.normalize();
    direction.mult(radius);
    PVector bigCenter = new PVector(center_X, center_Y);
    bigCenter.add(direction);
    direction.mult(-1.0F);
    direction.normalize();
    direction.mult(bigRadius);
    bigCenter.add(direction);

    bigChildCircle = new Circle(myOwner, bigCenter.x, bigCenter.y, bigRadius, colorOfChilds);
    bigChildCircle.setParent(this);


    direction.normalize();
    direction.mult(smallRadius + bigRadius);
    PVector smallCenter = new PVector(bigCenter.x, bigCenter.y);
    smallCenter.add(direction);

    smallChildCircle = new Circle(myOwner, smallCenter.x, smallCenter.y, smallRadius, colorOfChilds);
    smallChildCircle.setParent(this);
    hasChilds = true;
  }

  public void drawMe()
  {
    myOwner.fill(fillcolor);

    float diameter = 2*radius;

    float x = center_X;
    float y = center_Y;
    if ( parentCircle == null )
    {
      myOwner.ellipse(x, y, diameter, diameter);
    }
    else
    {
      // recalculate new rotated center
      x = center_X - parentCircle.center_X; 
      y = center_Y - parentCircle.center_Y;
      
      // again a little bit linear algebra
      rotatet_center_X = ROT_C*x - rotationdirection*ROT_S*y;
      rotatet_center_Y = rotationdirection*ROT_S*x + ROT_C*y;

      rotatet_center_X = rotatet_center_X + parentCircle.rotatet_center_X;
      rotatet_center_Y = rotatet_center_Y + parentCircle.rotatet_center_Y;
      x = rotatet_center_X; 
      y = rotatet_center_Y;

      myOwner.ellipse(x, y, diameter, diameter);
    }
  }

  static void drawAllCircles()
  {
    Iterator<Circle> iterator = circleList.iterator();
    while (iterator.hasNext ()) {
      Circle circle = iterator.next();
      circle.drawMe();
    }
  }

  static void resetCircleCenter()
  {
    Iterator<Circle> iterator = circleList.iterator();
    while (iterator.hasNext ()) {
      Circle circle = iterator.next();
      circle.resetCenter();
    }
  }

  private void resetCenter() {
    center_X = rotatet_center_X;
    center_Y = rotatet_center_Y;
  }

  static void initialize()
  {
    // calculate the required rotation constants
    int angle = ClockworkOrange.ANGLE;
    float r = PApplet.radians(angle);
    ROT_C = PApplet.cos(r);
    ROT_S = PApplet.sin(r);
  }
}


