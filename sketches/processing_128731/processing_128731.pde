
ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Line> lines = new ArrayList<Line>();
ArrayList<Triangle> triangles = new ArrayList<Triangle>();
ArrayList<Tetrahedron> tetrahedrons= new ArrayList<Tetrahedron>();
 
float rotX = 0;
float rotY = 0;

float N = 10;
boolean circ = true;
 
void setup() {
  size(700, 500, P3D);
  smooth();
  reset();
}
 
float R = 0;
 
void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  
 
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
      
  for (int k = 0; k < tetrahedrons.size(); k++)
    if (R > tetrahedrons.get(k).dk)
      tetrahedrons.get(k).display();
 
  //R = R + 0.1;
  R = mouseX/3;
  popMatrix();
}
 
void keyPressed() {
  if (key == 's')
    circ = !circ;
    if (key == CODED)
  {
    if (keyCode == UP)
    rotX += 0.05;
    else if (keyCode == DOWN)
    rotX -= 0.05;
    else if (keyCode == LEFT)
    rotY -= 0.05;
    else if (keyCode == RIGHT)
    rotY += 0.05;
  }
}
 
void mouseClicked(){
 reset();
}
 
void reset(){
  points.clear();
  lines.clear();
  triangles.clear();
  tetrahedrons.clear();
  float p = 0.1;
   
  for (int k = 0; k < N; k++)
    points.add(new Point(random(-width/3, width/3),random(-height/3, height/3),random(-height/3, height/3)));
 
  for (int i = 0; i < points.size() - 1; i++)
    for (int j = i + 1; j < points.size(); j++)
      lines.add(new Line(points.get(i), points.get(j)));
 
  for (int i = 0; i < points.size() - 2; i++)
    for (int j = i + 1; j < points.size() - 1; j++)
      for (int k = j + 1; k < points.size(); k++)
        triangles.add(new Triangle(points.get(i), points.get(j), points.get(k))); 
        
  for (int i = 0; i < points.size() - 3; i++)
    for (int j = i + 1; j < points.size() - 2; j++)
      for (int k = j + 1; k < points.size() - 1; k++)
      for (int l = k + 1; l < points.size(); l++)
        tetrahedrons.add(new Tetrahedron(points.get(i), points.get(j), points.get(k), points.get(l))); 
}
 
class Point {
  float x, y, z;
 
  Point(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
 
  void display() {
    noStroke();
    fill(255);
    //ellipse(x, y, z, 3, 3);
     pushMatrix();
translate(x, y, z);
noFill();
stroke(255);
sphere(3);
popMatrix();
  }
   
  void displayCirc() {
    noFill();
    stroke(255, 140);
    pushMatrix();
translate(x, y, z);
  rotateY(-rotY);
  rotateX(-rotX);
    ellipse(0,0, R*2, R*2);
    popMatrix();
    pushMatrix();
translate(x, y, z);
noFill();
stroke(255);
sphere(3);
popMatrix();
  }
 
  void displayCircStroke() {
    noFill();
    stroke(200);
    strokeWeight(4);
    //ellipse(x, y, R*2, R*2);
    pushMatrix();
translate(x, y, z);
noFill();
stroke(255);
sphere(3);
popMatrix();
  }
 
  void displayCircFill() {
    noStroke();
    fill(100, 0, 0);
    //ellipse(x, y, R*2, R*2);
    pushMatrix();
translate(x, y, z);
noFill();
stroke(255);
sphere(3);
popMatrix();
  }
}
 
class Line {
  Point p1, p2;
  float dk;
 
  Line(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
    dk = dist((p1.x + p2.x)/2, (p1.y + p2.y)/2, (p1.z + p2.z)/2, p1.x, p1.y, p1.z);
  }
 
  void display() {
    stroke(255);
    strokeWeight(1);
    line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
  }
}
 
class Triangle {
  Point p1, p2, p3;
  float dk;
 
  Triangle(Point p1, Point p2, Point p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
 
    PVector P1 = new PVector(p1.x, p1.y, p1.z);
    PVector P2 = new PVector(p2.x, p2.y, p2.z);
    PVector P3 = new PVector(p3.x, p3.y, p3.z);
 
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
    fill(100);
    beginShape();
    //vertex(p1.x, p1.y, p1.z);
    //vertex(p2.x, p2.y, p2.z);
    //vertex(p3.x, p3.y, p3.z);
    endShape();
  }
}

class Tetrahedron {
  Point p1, p2, p3, p4;
  float dk;

  Tetrahedron(Point p1, Point p2, Point p3, Point p4) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.p4 = p4;

    PVector P1 = new PVector(p1.x, p1.y, p1.z);
    PVector P2 = new PVector(p2.x, p2.y, p2.z);
    PVector P3 = new PVector(p3.x, p3.y, p3.z);
    PVector P4 = new PVector(p4.x, p4.y, p4.z);

    //PVector pom = PVector.sub(P1, P2);
    PVector pom = new PVector(0, 0);
    //pom.cross(PVector.sub(P2, P3));
    //PVector.cross(PVector.sub(P1, P2), PVector.sub(P2, P3), pom);
    pom = PVector.sub(P1, P2).cross(PVector.sub(P2, P3));
    //fill(255);
    //text(PVector.sub(P2, P3),width/2,height/2);
    dk = (PVector.sub(P1, P2).mag() * PVector.sub(P2, P3).mag() * PVector.sub(P3, P1).mag()) / (2 * pom.mag());
  }

  void display() {
    noStroke();
    fill(255, 0,0);
  beginShape(TRIANGLE_STRIP)
    vertex(p1.x, p1.y, p1.z);
    vertex(p2.x, p2.y, p2.z);
    vertex(p3.x, p3.y, p3.z);
    vertex(p4.x, p4.y, p4.z);
    vertex(p1.x, p1.y, p1.z);
    vertex(p2.x, p2.y, p2.z);
    endShape();
  }
}


