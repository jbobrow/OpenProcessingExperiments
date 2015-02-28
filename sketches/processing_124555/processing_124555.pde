
Net[] district = {};

void setup() {
  
  size(400, 300);
  Net Jessica = new Net(0.25 * width, 0.25 * height, 160, 40, 5, 10, color(240, 0, 0));
  Net Fulvio =  new Net(0.25 * width, 0.25 * height, 160, 40, 5, 10, color(0, 240, 0));

  Net Luna =     new Net(0.75 * width, 0.25 * height, 160, 40, 5, 10, color(160, 0, 80));
  Net Tarcisio = new Net(0.75 * width, 0.25 * height, 160, 40, 5, 10, color(0, 160, 240));

  Net Mara =    new Net(0.25 * width, 0.75 * height, 160, 40, 5, 10, color(80, 0, 160));
  Net Raffy =    new Net(0.25 * width, 0.75 * height, 160, 40, 5, 10, color(240, 160, 0));

  Net Laura =   new Net(0.75 * width, 0.75 * height, 140, 60, 5, 10, color(0, 0, 240));
  Net Gigi = new Net(0.75 * width, 0.75 * height, 140, 60, 5, 10, color(240, 0, 0));
  
  district = (Net[]) append(district, Jessica);
  district = (Net[]) append(district, Luna);
  district = (Net[]) append(district, Mara);
  district = (Net[]) append(district, Laura);
  district = (Net[]) append(district, Fulvio);
  district = (Net[]) append(district, Gigi);
  district = (Net[]) append(district, Tarcisio);
  district = (Net[]) append(district, Raffy);
}

void draw() {
  background(0);
  for (int i=0; i < district.length; i++) {
    district[i].portray();
    district[i].move();  
  }
}

class Net {
  float x, y, wi, hi; // bounding box 
  int n, m; // nodes and edges
  color c;
  Node[] nodes;
  Edge[] edges; 
  
  Net(float _x, float _y, float _wi, float _hi, int _n, int _m, color _c) {

    x = _x;
    y = _y;
    wi = _wi;
    hi = _hi;
    n = _n;
    m = _m;
    c = _c;
    
    nodes = new Node[n];
    edges = new Edge[m];
    for (int i = 0; i < n; i++) {
      nodes[i] = new Node(i, "", x, y, c, 255, 2, x, y, wi, hi);  
    }
    
    for (int i = 0; i < m; i++) {
      edges[i] = new Edge(nodes[int(random(n))], nodes[int(random(n))], i, "", c, 120, 3);  
    }
  }
  
  void portray() {

    for (int i = 0; i < n; i++) {
      nodes[i].portray();  
    }
    
    for (int i = 0; i < m; i++) {
      edges[i].portray();  
    }
    
    
  }
  
  void move() {

    for (int i = 0; i < n; i++) {
      nodes[i].move();  
    }
    
  }
  
  
}

class Node {
  int id;       
  String label; 
  float x, y;     // positions
  color c;       
  int alpha;     
  float size;    
  float stepx;   
  float stepy;   
  float xnoise;  
  float ynoise;
  float bx, by, wi, hi; // bounding box
  
  Node(int _id, String _label, float _x, float _y, color _c, int _alpha, float _size, float _bx, float _by, float _wi, float _hi) {
    id = _id;
    label = _label;
    x =  _x;
    y = _y;
    c = _c;
    alpha = _alpha;
    size = _size;
    wi = _wi;
    hi = _hi;
    bx = _bx;
    by = _by;
    int s = 2;
    stepx = random(-s, s);
    stepy = random(-s, s);
    xnoise = random(10);
    ynoise = random(10);
  }
  
  // draw node
  void portray() {
    noStroke();
    fill(c, alpha);
    ellipse(x, y, size, size); 
  } 
  
  // move node within window
  void move() {
    x = x + stepx * (noise(xnoise) - 0.5);
    y = y + stepy * (noise(ynoise) - 0.5);
    float rad = size/2;
    if (x > (bx + wi/2) || x < (bx - wi/2))  stepx = -stepx; 
    if (y > (by + hi/2) || y < (by - hi/2))  stepy = -stepy; 
    xnoise += 0.005;
    ynoise += 0.005;
  }
}

class Edge {
  Node source;    // source node
  Node target;    // target node
  int id;         
  String label;   
  color c;        
  int alpha;
  float weight;   
  float xnoise;
  float ynoise;
  float curvature;
  
  Edge(Node _source, Node _target, int _id, String _label, color _c, int _alpha, float _weight) {
    source = _source;
    target = _target;
    id = _id;
    label = _label;
    c = _c;
    alpha = _alpha;
    weight = _weight;
    xnoise = random(10);
    ynoise = random(10);
    curvature = 100;
    
  }
  

  // draw edge
  void portray() {
    strokeWeight(weight);
    stroke(c, alpha);
    //line(source.x, source.y, target.x, target.y);
    if ((source.x != target.x) || (source.y != target.y)) {
      noFill();
      beginShape();
      curveVertex(source.x, source.y);
      curveVertex(source.x, source.y);
      float midx = (source.x + target.x) / 2 + curvature * (noise(xnoise) - 0.5);
      float midy = (source.y + target.y) / 2 + curvature * (noise(ynoise) - 0.5);
      curveVertex(midx, midy);
      curveVertex(target.x, target.y);
      curveVertex(target.x, target.y);
      endShape();
      xnoise += 0.005;
      ynoise += 0.005;
    }
  } 
  
  
  
}



