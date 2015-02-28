
void init_circles() {
  for (int i=0; i<numcircles; i++) {
    circles[i] = new Circle(20, (i+1)*0.8, (i+1)*20);
  }
}

void complete_graph_between_circles() {
  Circle c1=circles[0], c2;
  PVector p1, p2;
  for (int c=1; c<numcircles; c++) { // per tutti i cerchi prendine due
    c1 = circles[c-1];
    c2 = circles[c];

    for (int i=0; i<c1.numpoints; i++) {
      for (int j=0; j<c2.numpoints; j++) { // per tutti i punti di questi confronta quelli del primo con quelli del secondo
        p1 = c1.points[i];
        p2 = c2.points[j];
        //p2 = c2.points[i];

        float distance = PVector.dist(p1, p2);
        stroke(0, 0, 0, map(distance, 0, height, 50, 0));

        line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
      } // j
    } // i
  } // c
}

class Circle {
  float radius = 0;
  int numpoints = 20;
  
  float height = 50;
  float velocity = 2;

  PVector center = new PVector();
  PVector points[] = new PVector[numpoints];

  Circle(int numpoints, float velocity, float radius) {
    this.velocity = velocity;
    this.radius = radius;
    this.numpoints = numpoints;

    points = new PVector[this.numpoints];
    for (int i=0; i<this.numpoints; i++) {
      points[i] = new PVector();
    }
  }

  void update() {
    center.y = sin(theta+velocity) * this.height;
  }

  void draw() {

    float a = 0;
    float delta = TWO_PI/(numpoints-1);
    float x, y, z;
    beginShape();
    for (int i=0; i<numpoints; i++) {
      x = cos(a)*radius + center.x;
      y = center.y;
      z = sin(a)*radius + center.z;

      points[i].x = x;
      points[i].y = y;
      points[i].z = z;

      vertex( x, y, z );
      a += delta;
    }
    endShape();
  }
}

