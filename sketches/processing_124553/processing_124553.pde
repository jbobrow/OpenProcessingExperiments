
Net rhi;
int n = 25;
int m = 2*n;

void setup() {
  
  size(400, 400);
  rhi = new Net();
}

void draw() {
  background(0);
  rhi.portray();
  rhi.move();
}

class Net {
  Node[] nodes;
  Edge[] edges;  
  
  Net() {
    
    nodes = new Node[n];
    edges = new Edge[m];

    for (int i = 0; i < n; i++) {
      nodes[i] = new Node(i, "", width/2, height/2, 255, 255, 2);  
    }
    
    for (int i = 0; i < m; i++) {
      edges[i] = new Edge(nodes[int(random(n))], nodes[int(random(n))], i, "", 255, 255, 3);  
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
  
  Node(int _id, String _label, float _x, float _y, color _c, int _alpha, float _size) {
    id = _id;
    label = _label;
    x =  _x;
    y = _y;
    c = _c;
    alpha = _alpha;
    size = _size;
    stepx = random(-8, 8);
    stepy = random(-8, 8);
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
    if (x > (1.05 * width) || x < 0.05 * width)  stepx = -stepx; 
    if (y > (1.05 * height) || y < 0.05 * height) stepy = -stepy; 
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
    curvature = 300;
    
  }
  

  // draw edge
  void portray() {
    strokeWeight(weight);
    stroke(c, alpha);
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



