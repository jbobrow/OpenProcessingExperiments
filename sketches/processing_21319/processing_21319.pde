
//One layer of a tunnel. Keeps a list of Areas(represented as list of points), and centers of each CirclesShape.
public class CircleLayer {
  private List<List<PVector>> list = new ArrayList<List<PVector>>();
  private PVector[] centers;

  public CircleLayer(int numCenters) {
    centers = new PVector[numCenters];
  }

  public void initCenter(int num, PVector center) {
    this.centers[num] = new PVector(center.x, center.y, center.z);
  }

  public PVector getCenter() {
    return centers[0];
  }

  public PVector getOneCenter(int num) {
    return centers[num];
  }

  public void addShape() {
    list.add(new ArrayList<PVector>());
  }

  public List<List<PVector>> getLayer() {
    return list;
  }

  public void addPoint(PVector p) {
    list.get(list.size() - 1).add(p);
  }

  public void finalize() throws Throwable {
    list.clear();
    super.finalize();
  }
};


