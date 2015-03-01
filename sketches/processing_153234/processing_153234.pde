
class Point2D {
  public float x;
  public float y;
  public Point2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class AABB {
  public Point2D center;
  public Point2D halfDimension;
  public AABB(Point2D center, Point2D halfDimension) {
    this.center = center;
    this.halfDimension = halfDimension;
  }
  public boolean containsPoint(Point2D p) {
    return Math.abs(p.x-center.x)<halfDimension.x && 
      Math.abs(p.y-center.y)<halfDimension.y;
  }
  public boolean intersectsAABB(AABB other) {
    return Math.abs(other.center.x - center.x)<(other.halfDimension.x + halfDimension.x) &&
      Math.abs(other.center.y - center.y)<(other.halfDimension.y + halfDimension.y);
  }
}

class QuadTree {
  private AABB boundary;
  private QuadTree northWest;
  private QuadTree northEast;
  private QuadTree southWest;
  private QuadTree southEast;
  private ArrayList<Point2D> points;
  public QuadTree(AABB boundary) {
    this.boundary = boundary;
    points = new ArrayList<Point2D>();
  }

  public boolean insert(Point2D p) {
    if (!boundary.containsPoint(p))
      return false;

    if (points.size()<4) {
      points.add(p);
      return true;
    }

    if (northWest==null)
      subdivide();

    if (northWest.insert(p)) return true;
    if (northEast.insert(p)) return true;
    if (southWest.insert(p)) return true;
    if (southEast.insert(p)) return true;

    return false;
  }

  protected void subdivide() {
    northWest = new QuadTree(new AABB(    
    new Point2D(boundary.center.x - boundary.halfDimension.x/2, boundary.center.y - boundary.halfDimension.y/2), 
    new Point2D(boundary.halfDimension.x/2, boundary.halfDimension.y/2)));

    northEast = new QuadTree(new AABB(    
    new Point2D(boundary.center.x + boundary.halfDimension.x/2, boundary.center.y - boundary.halfDimension.y/2), 
    new Point2D(boundary.halfDimension.x/2, boundary.halfDimension.y/2)));

    southWest = new QuadTree(new AABB(    
    new Point2D(boundary.center.x - boundary.halfDimension.x/2, boundary.center.y + boundary.halfDimension.y/2), 
    new Point2D(boundary.halfDimension.x/2, boundary.halfDimension.y/2)));

    southEast = new QuadTree(new AABB(    
    new Point2D(boundary.center.x + boundary.halfDimension.x/2, boundary.center.y + boundary.halfDimension.y/2), 
    new Point2D(boundary.halfDimension.x/2, boundary.halfDimension.y/2)));
  }

  public ArrayList<Point2D> queryRange(AABB range) {
    ArrayList<Point2D> result = new ArrayList<Point2D>();
    if (!boundary.intersectsAABB(range))
      return result;

    for (Point2D p: points)
      if (range.containsPoint(p))
        result.add(p);

    if (northWest == null)
      return result;

    result.addAll(northWest.queryRange(range));
    result.addAll(northEast.queryRange(range));
    result.addAll(southWest.queryRange(range));
    result.addAll(southEast.queryRange(range));

    return result;
  }
}

QuadTree qt;

void setup() {
  size(512, 512);
  qt = new QuadTree(new AABB(new Point2D(width/2, height/2), new Point2D(width/2, height/2)));

  for (int i=0; i<10000;i++) {
    Point2D newPoint = new Point2D(random(width), random(height));
    point(newPoint.x, newPoint.y);
    qt.insert(newPoint );
  }  
}

void draw(){
}

void mouseMoved() {
  background(200);
  
  for(Point2D p: qt.queryRange(new AABB(new Point2D(mouseX, mouseY),new Point2D(64,64)))){
    ellipse(p.x, p.y, 3, 3);
  }
}

