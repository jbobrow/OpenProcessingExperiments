
class Edge {
  int count;
  Vertex from, to;
  Spring spring;
  Edge(Vertex from, Vertex to) {
    this.from = from;
    this.to = to;
    count = 0;
  }
  void render() {
    Vector3D fxyz = from.particle.position();
    Vector3D txyz = to.particle.position();
    stroke(0.4, 0.1);
    line(fxyz.x(), fxyz.y(), fxyz.z(), txyz.x(), txyz.y(), txyz.z());
  }
  void resetLength() {
    spring.setRestLength(map(length(),0,1,lengthMin,lengthMax));
  }
  float length() {
    return 1.01 - (float) count / (float) from.count;
  }
  String toString() {
    return "e(" + count + "):" +
      from.toString() + ">" +
      to.toString();
  }
}

