
class Elevation {
  private int x, y, radius, depth;
  private float theta;
  ArrayList elevation = new ArrayList();

  Elevation(int d) {
    depth = (int)(d + exp(2));
    // radius is some more interesting function of depth
    radius = d * d;
    float theta = TWO_PI/circlePoints;
    for (int i = 0; i < circlePoints; i++) {
      float angle = theta * i;
      PVector vert = new PVector(cos(angle) * radius, depth*10, sin(angle) * radius); // add vertex
      elevation.add(vert);
    }
  }

  void render() {
    for(int i = 0; i < circlePoints; i++) {
      stroke(255);
      PVector retrieved = (PVector) elevation.get(i);
      point(retrieved.x, retrieved.y);
      
      // start drawing shapes with points
    }
  }
}


