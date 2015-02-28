
class Elevation {
  private int x, y, radius, depth;
  private float theta;
  ArrayList elevation = new ArrayList();

  Elevation(int d) {
    depth = d;
    // radius is some more interesting function of depth
    radius = d * d;
    float theta = TWO_PI/circlePoints;
    for (int i = 0; i < circlePoints; i++) {
      float angle = theta * i;
      PVector semilla = new PVector(cos(angle) * radius, sin(angle) * radius, depth);
      elevation.add(semilla);
    }
  }

  void render() {
    for(int i = 0; i < circlePoints; i++) {
      stroke(255);
      PVector retrieved = (PVector) elevation.get(i);
      point(retrieved.x, retrieved.y);
    }
  }
}


