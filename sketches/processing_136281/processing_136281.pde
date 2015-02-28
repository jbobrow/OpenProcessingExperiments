
float t;

Point[][] points;
Edge[][] hEdges, vEdges;
Face[][] faces;

float diagonal;
int cellSize;

class Point {
  float x,y;
  
  Point(float x, float y) {
    this.x = x; this.y = y;
  }
  float dist(Point q) {
   return sqrt(sq(x-q.x) + sq(y-q.y)); 
  }
}

class Edge {
  Point a,b;
  
  Edge(Point a, Point b) {
    this.a = a;
    this.b = b;
  }
  Point lerp(float phase) {
    float pt = phase+t;
    if(pt%2 < 1) {
      return _lerp(a,b,cosEase(pt%1));
    } else {
      return _lerp(b,a,cosEase(pt%1));
    }
  }
  Point _lerp(Point a, Point b, float t) {
    return new Point((b.x-a.x)*t + a.x, (b.y-a.y)*t + a.y);
  }
  void flip() {
    Point t = a; a = b; b = t;
  }
  float cosEase(float t) {
    return 0.5*(1-cos(t*PI));
  }
  Point centroid() {
    return new Point(0.5*(a.x+b.x), 0.5*(a.y+b.y)); 
  }
}

class Face {
  List<Edge> edges = new ArrayList<Edge>();
  float phase;
  float dist;
  void draw() {
    fill(0.5+dist*0.3/diagonal, .8, .9);
    beginShape();
    for(Edge e : edges) {
      _vertex(e.lerp(phase));
    }
    endShape();
  }
  Point centroid() {
    float x = 0, y = 0;
    for(Edge e : edges) {
      Point c = e.centroid();
      x += c.x;
      y += c.y;
    }
    float l = edges.size();
    return new Point(x/l, y/l);
  }
}

void _vertex(Point p) {
  vertex(p.x, p.y);
}

void mousePressed() {
  // which face arewas clicked?
  int i = floor(mouseX/cellSize),
      j = floor(mouseY/cellSize);
  float lx = (mouseX%cellSize)/(float)cellSize, ly = (mouseY%cellSize)/(float)cellSize;
  // split face along diagonals, use to pick closest edge
  boolean splitA = lx > ly, splitB = (1-lx) > ly;
  Edge e;
  if(splitA) {
    if(splitB) {
      e = hEdges[i][j]; 
    } else {
      e = vEdges[i+1][j]; 
    }
  } else {
    if(splitB) {
      e = vEdges[i][j];
    } else {
      e = hEdges[i][j+1];
    }
  }
  // flip that edge
  e.flip();
}

void keyPressed() {
  if(key == ' ') dataSetup();
}

void draw() {
  background(0);
  noStroke();
  colorMode(HSB, 1);
  for(Face[] fRow : faces) {
    for(Face f : fRow) {
      f.draw();
    }
  }
  t += 0.02f;
}

void setup() {
  size(600,600);
  dataSetup();
}

void dataSetup() {
  cellSize = 60;
  
  int w = width/cellSize, h = height/cellSize;
  diagonal = dist(0, 0, width, height)/2;
  Point center = new Point(width/2, height/2);
  
  points = new Point[w+1][h+1];
  for(int x = 0; x <= w; x++) {
    for(int y = 0; y <= h; y++) {
      Point p = points[x][y] = new Point(x*cellSize, y*cellSize);
    }
  }
  
  // staggered grid type indexes
  hEdges = new Edge[w][h+1];
  vEdges = new Edge[w+1][h];
  for(int x = 0; x < w; x++) {
    for(int y = 0; y <= h; y++) {
      Edge e = hEdges[x][y] = new Edge(points[x][y], points[x+1][y]);
      if(x%2 == y%2) e.flip(); // anti-checkerboard
    }
  }
  for(int x = 0; x <= w; x++) {
    for(int y = 0; y < h; y++) {
      Edge e = vEdges[x][y] = new Edge(points[x][y], points[x][y+1]);
      if(x%2 != y%2) e.flip(); // checkerboard
    }
  }
  
  float phasiness = 0.7f/diagonal;
  faces = new Face[w][h];
  for(int x = 0; x < w; x++) {
    for(int y = 0; y < h; y++) {
      Face f = faces[x][y] = new Face();
      f.edges.add(hEdges[x][y]);
      f.edges.add(vEdges[x+1][y]);
      f.edges.add(hEdges[x][y+1]);
      f.edges.add(vEdges[x][y]);
      
      f.dist = f.centroid().dist(center);
      f.phase = f.dist*phasiness;
    }
  }
}
