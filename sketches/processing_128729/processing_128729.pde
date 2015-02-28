
ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Line> lines = new ArrayList<Line>();
ArrayList<Triangle> triangles = new ArrayList<Triangle>();

float N = 10;
boolean circ = true;

void setup() {
  size(700, 500);
  float p = 0.1;

  for (int k = 0; k < N; k++)
    points.add(new Point(random(width*p, width*(1-p)), random(height*p, height*(1-p))));

  for (int i = 0; i < points.size() - 1; i++)
    for (int j = i + 1; j < points.size(); j++)
      lines.add(new Line(points.get(i), points.get(j)));

  for (int i = 0; i < points.size() - 2; i++)
    for (int j = i + 1; j < points.size() - 1; j++)
      for (int k = j + 1; k < points.size(); k++)
        triangles.add(new Triangle(points.get(i), points.get(j), points.get(k)));
}

float R = 0;

void draw() {
  background(0);

  for (int k = 0; k < points.size(); k++) {
    points.get(k).display();
    if (circ)
      points.get(k).displayCirc();
  }

  for (int k = 0; k < lines.size(); k++)
    if (R > lines.get(k).dk)
      lines.get(k).display();

  for (int k = 0; k < triangles.size(); k++)
    if (R > triangles.get(k).dk)
      triangles.get(k).display();

  //R = R + 0.1;
  R = mouseX/3;
}

void keyPressed() {
  if (key == 's')
    circ = !circ;
}

void mouseClicked(){
 reset(); 
}

void reset(){
  points.clear();
  lines.clear();
  triangles.clear();
  float p = 0.1;
  
  for (int k = 0; k < N; k++)
    points.add(new Point(random(width*p, width*(1-p)), random(height*p, height*(1-p))));

  for (int i = 0; i < points.size() - 1; i++)
    for (int j = i + 1; j < points.size(); j++)
      lines.add(new Line(points.get(i), points.get(j)));

  for (int i = 0; i < points.size() - 2; i++)
    for (int j = i + 1; j < points.size() - 1; j++)
      for (int k = j + 1; k < points.size(); k++)
        triangles.add(new Triangle(points.get(i), points.get(j), points.get(k)));  
}

class Point {
  float x, y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, 3, 3);
  }
  
  void displayCirc() {
    noFill();
    stroke(255, 140);
    ellipse(x, y, R*2, R*2);
  }

  void displayCircStroke() {
    noFill();
    stroke(200);
    strokeWeight(4);
    ellipse(x, y, R*2, R*2);
  }

  void displayCircFill() {
    noStroke();
    fill(100, 0, 0);
    ellipse(x, y, R*2, R*2);
  }
}

class Line {
  Point p1, p2;
  float dk;

  Line(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
    dk = dist((p1.x + p2.x)/2, (p1.y + p2.y)/2, p1.x, p1.y);
  }

  void display() {
    stroke(255);
    strokeWeight(1);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

class Triangle {
  Point p1, p2, p3;
  float dk;

  Triangle(Point p1, Point p2, Point p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;

    PVector P1 = new PVector(p1.x, p1.y);
    PVector P2 = new PVector(p2.x, p2.y);
    PVector P3 = new PVector(p3.x, p3.y);

    //PVector pom = PVector.sub(P1, P2);
    PVector pom = new PVector(0,0);
    //pom.cross(PVector.sub(P2, P3));
    //PVector.cross(PVector.sub(P1, P2), PVector.sub(P2, P3), pom);
    pom = PVector.sub(P1, P2).cross(PVector.sub(P2, P3));
    //fill(255);
    //text(PVector.sub(P2, P3),width/2,height/2);
    dk = (PVector.sub(P1, P2).mag() * PVector.sub(P2, P3).mag() * PVector.sub(P3, P1).mag()) / (2 * pom.mag());
  }

  void display() {
    noStroke();
    fill(255, 90);
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p2.x, p2.y);
    vertex(p3.x, p3.y);
    endShape();
  }
}


