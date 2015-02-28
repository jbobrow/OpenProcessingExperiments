

class Gear {

  ArrayList<Vec2D> array = new ArrayList<Vec2D>();

  float radius;
  Vec2D center = new Vec2D();
  float teethHeight = 10;
  float teeth_factor = 2;

  int numberOfTeeh = 0;
  float teethAngle;

  Gear(float radius) {
    this.radius = setRadius(radius);

    buildGear();
  }

  void buildGear() {
    numberOfTeeh = 0;
    teethAngle = 0;

    array = new ArrayList<Vec2D>();
    ArrayList<Vec2D> circle = createArc(center, radius);

    Vec2D p1 = circle.get(0);
    Vec2D p0;
    for (int i=1; i<circle.size(); i++) {
      p0 = circle.get(i);
      teeth(p1, p0);

      p1=p0;
    }
    array.add(array.get(0));
  }

  void teeth(Vec2D p1, Vec2D p0) {


    if (p1.equalsWithTolerance(p0, 0.01f)) {
      return;
    }

    this.numberOfTeeh++;

    Vec2D p4;
    Vec2D p3;
    p3 = p0.add(p1).scale(0.5f);
    Line2D l = new Line2D(center, p3);
    p4 = new Ray2D(p3, l.getDirection()).getPointAtDistance(teethHeight);

    array.add(p1);
    array.add(p4);
  }

  ArrayList<Vec2D> createArc(Vec2D center, float radius) {
    ArrayList<Vec2D> points = new ArrayList<Vec2D>();
    float theta = 0;
    float delta = PApplet.TWO_PI/(radius*(1f/teeth_factor));
    teethAngle = delta;
    for (; theta<PApplet.TWO_PI; theta+=delta) {
      Vec2D p=new Vec2D(radius, theta).toCartesian().addSelf(center);
      points.add(p);
    }
    points.add(new Vec2D(radius, PApplet.TWO_PI).toCartesian().addSelf(center));

    return points;
  }


  float setRadius(float _radius) {
    radius = _radius - _radius%teeth_factor;
    buildGear();
    return radius;
  }

  ArrayList<Vec2D> getPoints() {
    return array;
  }

  float getRadius() {
    return radius;
  }

  Vec2D getCenter() {
    return center;
  }

  void setCenter(Vec2D center) {
    this.center = center;
    this.buildGear();
  }

  float getTeethHeight() {
    return this.teethHeight;
  }

  float getTeethNumber() {
    return numberOfTeeh;
  }

  float getTeethAngle() {
    return teethAngle;
  }
}


