
/* Nearest-neighbor search using QuadTrees
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */

QuadTree qt;
int bucket_size = 3; /* number of points each quadrant can hold before splitting */

/* Display properties */
color bg_color = color(0, 0, 32);
color quad_color = color(255, 215, 203, 10);
color point_color = color(255, 229, 229);
color possible_color = color(255, 200, 200, 20);
color line_color = color(133, 174, 180, 80);
color target_color = color(255, 255, 255, 20);
int point_weight = 2;
int line_weight = 2;
boolean quad_display = false;

/* XY
 * Represents a position */
class XY {
  float x;
  float y;
  
  XY (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  String toString() {
    return ("(" + x + ", " + y + ")");
  }
}

/* Node
 * Represents a node in the quadtree */
class Node {
  XY p;
  
  Node (float x, float y) {
    this.p = new XY(x, y);
  }
  
  Node (XY p) {
    this.p = p;
  }
  
  void display(color c, int w) {
    stroke(c);
    strokeWeight(w);
    point(this.p.x, this.p.y);
  }

  float distance(Node other) {
    return sqrt(sq(other.p.x - this.p.x) + sq(other.p.y - this.p.y));
  }
}

/* ND
 * Pair containing a node and a distance */
class ND {
  Node n;
  float d;
  
  ND() { /* creates an empty node */
  }
  
  ND(Node n, float d) {
    this.n = n;
    this.d = d;
  } 
  
  boolean isEmpty() {
    return this.n == null || this.d == 0;
  }
  
  /* Returns minimum of two ND pairs */
  ND min_distance(ND other) {
    this.circle_display(possible_color);
    other.circle_display(possible_color);
    if (this.isEmpty() || (!other.isEmpty() && other.d < this.d)) {
      return other;
    } 
    else {
      return this;
    }
  }
  
  /* Displays ND */
  void circle_display(color c) {
    strokeWeight(point_weight);
    stroke(c);
    if (this.n != null) {
        ellipse(this.n.p.x, this.n.p.y, 5, 5);
    }
  }
}

/* QuadTree
 * Represents a tree of nodes. */
class QuadTree {
  XY center; /* center of quadrant */
  float half; /* half the dimensions of the quadrant */
  ArrayList<Node> nodes; /* empty if tree is not leaf */
  int size; /* number of nodes it contains */
  boolean leaf; /* whether tree is leaf */
  
  /* four child quadtrees (null if leaf) */
  QuadTree northWest;
  QuadTree northEast;
  QuadTree southEast;
  QuadTree southWest;

  QuadTree(XY center, float half) {
    this.center = center;
    this.half = half;
    this.size = 0;
    this.nodes = new ArrayList<Node>();
    this.leaf = true;
  }
  
  /* Whether node is inside the quadtree */
  boolean contains(Node n) {
    return (n.p.x < this.center.x + half &&
      n.p.x >= this.center.x - half &&
      n.p.y < this.center.y + half &&
      n.p.y >= this.center.y - half);
  }

  /* Returns north, east, south, and west edges */
  float[] get_edges() {
      float[] toReturn = {this.center.y - this.half, this.center.x + this.half, 
              this.center.y + this.half, this.center.x - this.half};  
      return toReturn;
  }
  
  /* Returns quadrant containing node (non-recursive search) */
  QuadTree find_once(Node n) {
    if (n.p.x >= this.center.x && n.p.y < this.center.y) {
      return northEast;
    } else if (n.p.x < this.center.x && n.p.y < this.center.y) {
      return northWest;
    } else if (n.p.x < this.center.x && n.p.y >= this.center.y) {
      return southWest;
    } else if (n.p.x >= this.center.x && n.p.y >= this.center.y) {
      return southEast;
    }
    return null;
  }
  
  /* Returns leaf containing node (recursive search) */
  QuadTree find(Node n) {
    if (this.leaf) {
      return this;
    } 
    if (n.p.x >= this.center.x && n.p.y < this.center.y) {
      return northEast.find(n);
    } else if (n.p.x < this.center.x && n.p.y < this.center.y) {
      return northWest.find(n);
    } else if (n.p.x < this.center.x && n.p.y >= this.center.y) {
      return southWest.find(n);
    } else if (n.p.x >= this.center.x && n.p.y >= this.center.y) {
      return southEast.find(n);
    }
    return null;
  }

  /* Returns true if ranges overlap */
  boolean do_ranges_overlap(float a1, float a2, float b1, float b2) {
    return !(max(a1, a2) < min(b1, b2) || max(b1, b2) < min(a1, a2));
  }

  /* Returns true if quadtrees are neighbors (on edge or corner) or if they overlap */
  boolean is_neighbor(QuadTree other) {
    float[] s1 = other.get_edges();
    float[] s2 = this.get_edges();
    for (int i = 0; i < 4; i++) {
      if (s1[i] == s2[(i + 2) % 4] || // shares an edge
          do_ranges_overlap(s1[i], s1[(i + 2) % 4], s2[i], s2[(i + 2) % 4])) { // ranges overlap
        return do_ranges_overlap(s1[(i + 1) % 4], s1[(i + 3) % 4],
                                 s2[(i + 1) % 4], s2[(i + 3) % 4]); 
      }
    }
    return false;
  }

  /* Makes descendent quadtree containing appropriate nodes from original quadtree */
  QuadTree descend(int x, int y) {
    XY newCenter = new XY(this.center.x + x * half/2, this.center.y + y * half/2);
    QuadTree toReturn = new QuadTree(newCenter, this.half/2);
    toReturn.size = 0;
    for (Node n : this.nodes) {
      if (toReturn.contains(n)) {
        toReturn.insert(n);
      }
    }
    return toReturn;
  }

  /* Inserts node into quadtree */
  void insert(Node n) {
    if (this.leaf) { // add to nodes list
      this.nodes.add(n);
      this.size++;
      if (this.size >= bucket_size) { // need to split bucket
        this.northWest = this.descend(-1, -1);
        this.southWest = this.descend(-1, 1);
        this.northEast = this.descend(1, -1);
        this.southEast = this.descend(1, 1);
        this.nodes.clear();
        this.leaf = false;
      }
      return;
    } else { // keep looking
      this.size++;
      QuadTree next = find_once(n);
      next.insert(n);
    }
  }
  
  /* Recursively searches for nearest neighbor, using containing quadtree as goal */
  ND _find_closest(QuadTree goal, Node n) {
    if (quad_display) {
      this.displayfill(quad_color);
    }
    ND toReturn = new ND();
    if (this.leaf) { // if leaf, finds min of its nodes */
      for (Node other : this.nodes) {
        if (toReturn.d == 0 || n.distance(other) < toReturn.d) {
          toReturn = toReturn.min_distance(new ND(other, n.distance(other)));
        }
      }
      return toReturn; 
    } else { // if not leaf, finds min of recursive results */
      QuadTree[] quads = {
        this.northEast, this.northWest, this.southWest, this.southEast
      };
      for (QuadTree q : quads) {
        if (q.is_neighbor(goal)) {
          toReturn = toReturn.min_distance(q._find_closest(goal, n));
        }
      }
      return toReturn;
    }
  } 
    
  /* Returns nearest neighbor to node */
  ND closest(Node n) {
    if (quad_display) {
      find(n).displayfill(target_color);
    }
    return _find_closest(find(n), n);
  }
    
  /* Displays all nodes in quadtree */
  void display(color c, int w) {
    if (this.leaf) {
      for (Node n : nodes) {
        n.display(c, w);
      }
    } 
    else {
      this.northWest.display(c, w);
      this.northEast.display(c, w);
      this.southWest.display(c, w);
      this.southEast.display(c, w);
    }
  }
 
  /* Displays quadrant */
  void displayfill(color c) {
    fill(c);
    noStroke();
    rect(center.x, center.y, half * 2, half * 2);
  }

  /* Prints String representation of tree for testing purposes */
  void printout() {
    String toprint = "";
    for (int i = 0; i < width/(2*half); i++) {
      toprint += " ";
    }
    println(toprint + size);
    if (!this.leaf) {
      northWest.printout(); 
      northEast.printout(); 
      southWest.printout(); 
      southEast.printout(); 
    }
  }
}


void setup() {
  size(600, 600);
  background(bg_color);
  noLoop();
  noFill();
  rectMode(CENTER);
  setuptree(1);
}


/* Fills tree with specified number of random points */
void setuptree(int j) {
  qt = new QuadTree(new XY(width/2, height/2), width/2);
  for (int i = 0; i < j; i++) {
    Node toInsert = new Node(new XY(random(width), random(height)));
    qt.insert(toInsert);
  }
  qt.display(point_color, point_weight);
}


void draw() {
  
}


void keyPressed() {
  if (key == ' ') { // space bar clears quadtree
    qt = new QuadTree(new XY(width/2, height/2), width/2);
  } else if (key == 'd') { // d key toggles display
    quad_display = !quad_display;
  } else if (key == 'r') {
    setuptree(100);
  }
  background(bg_color);
  qt.display(point_color, point_weight);  
  redraw();
}


void mouseMoved() { // finds closest node to mouse position
  background(bg_color);
  qt.display(point_color, point_weight);
  redraw();
  
  Node again = new Node(new XY(mouseX, mouseY));
  Node c = qt.closest(again).n;
  if (c != null) {
    stroke(line_color);
    strokeWeight(line_weight);
    line(again.p.x, again.p.y, c.p.x, c.p.y);
  }
}


void mouseClicked() { // adds new node
  qt.insert(new Node(new XY(mouseX, mouseY)));
}

