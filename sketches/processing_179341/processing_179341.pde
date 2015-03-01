
/* Triangulation and Delaunay triangulation
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */

QuadTree qt;
int bucket_size = 8; /* number of points each quadrant can hold before splitting */
int num_attempts = 1; /* describes point spacing: higher numbers for more evenly placed points */
int num_points = 400;

/* Display properties */
color bg_color = color(20, 30, 40);
color point_color = color(255);
color line_color = color(255,50);
int point_weight = 2;
int line_weight = 2;

class NDPriorityQueue {
  int len;
  ND[] things; // stored largest to smallest
  
  NDPriorityQueue(int len) {
    this.len = len;
    this.things = new ND[len];
  }
  
  /* Inserts item to queue */
  void insert(ND item) {
   /* if item less than largest, insert it */
   if (things[0] == null || item.compareTo(things[0]) < 0) {
     things[0] = item;
     for (int i = 0; i < len - 1; i++) {
       if (things[i+1] == null || things[i].compareTo(things[i+1]) < 0) {
         ND temp = things[i];
         things[i] = things[i+1];
         things[i+1] = temp;
       }
     }
   }
  }

  ND get_item(int num) {
    return this.things[num]; 
  }

  ND[] get_items() {
    return this.things;
  }  
}


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
  ArrayList<Edge> connections;
  
  Node (float x, float y) {
    this.p = new XY(x, y);
    this.connections = new ArrayList<Edge>();
  }
  
  Node (XY p) {
    this.p = p;
    this.connections = new ArrayList<Edge>();
  }
  
  /* Connects one node to another */
  Edge connect(Node other) { // this node is one, other node is two
    Edge e = this.common_edge(other);
    if (e == null) {
       e = new Edge(this, other);
       other.connections.add(e);
       this.connections.add(e);
    }
    return e;
  }
  
  /* Returns edge connecting two nodes */
  Edge common_edge(Node other) {
    if (other != null) {
      for (Edge e : this.connections) {
        if (other.connections.contains(e)) {
           return e; 
        }
      }
    }  
    return null;
  }
  
  /* Returns list of nodes connected to both this and other */
  ArrayList<Node> common_nodes(Node other) {
    ArrayList<Node> toReturn = new ArrayList<Node>();
    for (Edge e : this.connections) {
      Node third = e.other_node(this);
      if (third.is_connected(other) && third != this && third != other) {
        toReturn.add(third);
      }
    } 
    return toReturn;
  }
  
  /* Clears the node's connections */
  void clear_edges() {
    this.connections.clear();
  }
  
  /* Whether this node is connected to other node */
  boolean is_connected(Node other) {
    return (this.common_edge(other) != null);
  }
  
  /* Makes dot at location */
  void display(color c, int w) {
    stroke(c);
    strokeWeight(w);
    point(this.p.x, this.p.y);
  }

  /* Returns cross_product of vectors from this to a and this to b */
  float cross_product(Node a, Node b) {
    if (a == null || b == null) {
      println("can't find cross product of null nodes");
      return 0;
    }
    return ((a.p.x - this.p.x) * (b.p.y - this.p.y) -
            (a.p.y - this.p.y) * (b.p.x - this.p.x));
  }
  
  /* Returns slope of line from this node to other */
  float slope(Node other) {
    if (other == null || this.p.x == other.p.x) {
      return 0;
    }
    return ((other.p.y - this.p.y) / (other.p.x - this.p.x));
  }
 
  /* Returns distance between this node and other */
  float distance(Node other) {
    if (this.p.x == other.p.x && this.p.y == other.p.y) {
      return 0.;
    }
    return sqrt(sq(other.p.x - this.p.x) + sq(other.p.y - this.p.y));
  }
  
  /* Recursively displays all nodes */
  void display_connections() {
    for (Edge e : connections) {
      if (!e.drawn) {
        stroke(line_color);
        strokeWeight(line_weight);
        e.display();
        e.other_node(this).display_connections();
      } 
    }
  }
}

/* Edge
 * Connection between two Nodes */
class Edge {
 Node one;
 Node two;
 boolean drawn;
 
 Edge (Node one, Node two) {
  this.one = one;
  this.two = two;
  this.drawn = false;
 }

 /* Given node in edge, returns other */
 Node other_node(Node n) {
   if (n == one) {
     return this.two;
   } else {
     return this.one;
   }
 }
 
 /* Swaps nodes one and two */
 void swap() {
   Node temp = this.one;
   this.one = this.two;
   this.two = temp;
 }
 
 /* Returns node in common with another edge */
 Node node_in_common(Edge other) {
   if (other == null) {
     println("other edge is null");
     return null;
   }
   if (this.one == other.one || this.one == other.two) {
     return this.one;
   }
   if (this.two == other.one || this.two == other.two) {
     return this.two;
   }
   println("no edge in common");
   return null;
 }
 
 /* Connects node with both endpoints, returns the two created edges */
 Edge[] connect_to_node(Node third) { //one > third, third > two
   Edge[] toReturn = new Edge[2];
   if (third != null) {
     if (!this.one.is_connected(third)) {
       toReturn[0] = this.one.connect(third);
     } else {
       toReturn[0] = this.one.common_edge(third);
       if (toReturn[0].one == third) {
         toReturn[0].swap();
       }
     }
     if (!this.two.is_connected(third)) {
       toReturn[1] = third.connect(this.two);
     } else {
       toReturn[1] = this.two.common_edge(third);
       if (toReturn[1].two == third) {
         toReturn[1].swap();
       }
     }
   }
   return toReturn;
 }

 /* Returns angle formed at n */
 float angle_with(Node n) {
   float a = this.one.distance(n);
   float b = this.two.distance(n);
   float c = this.one.distance(this.two);
   return acos((sq(a) + sq(b) - sq(c)) / (2 * a * b));
 }
 
  /* Adjusts edge if necessary */
  void delaunay() {
    this.drawn = false;
    ArrayList<Node> common = this.one.common_nodes(this.two);
    Node n1 = null;
    Node n2 = null;
    for (Node n : common) {
      if (this.one.cross_product(n, this.two) < 0 && (n1 == null || this.angle_with(n1) < this.angle_with(n))) {
        n1 = n;
      }
      if (this.one.cross_product(n, this.two) > 0 && (n2 == null || this.angle_with(n2) < this.angle_with(n))) {
        n2 = n;
      }
    }
    if (n1 == null || n2 == null) { // edge is not a diagonal of a quadrilateral
      return;
    }
    if (this.angle_with(n1) + this.angle_with(n2) > PI) { // switch edge to other node pair
      this.one.connections.remove(this);
      this.two.connections.remove(this);
      this.one = n1;
      this.two = n2;
      n1.connections.add(this);
      n2.connections.add(this);
    }
  }

 /* Displays edge */
 void display() {
  stroke(line_color);
  line(this.one.p.x, this.one.p.y, this.two.p.x, this.two.p.y);
  this.drawn = true;
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
  
  int compareTo(ND other) {
   if (other == null || this.d < other.d) {
     return -1;
   } else if (this.d == other.d) {
     return 0;
   } else {
     return 1;
   }
  }
   
  boolean less_than(ND other) {
    return (!this.isEmpty() || other.isEmpty() || (this.d < other.d));
  }
  
  boolean greater_than(ND other) {
    return (!this.isEmpty() || other.isEmpty() || (this.d < other.d));
  }
  
  /* Returns minimum of two ND pairs */
  ND max_distance(ND other) {
    if (this.isEmpty() || (!other.isEmpty() && other.d > this.d)) {
      return other;
    } 
    else {
      return this;
    }
  }
  
  /* Returns minimum of two ND pairs */
  ND min_distance(ND other) {
    if (this.isEmpty() || (!other.isEmpty() && other.d < this.d)) {
      return other;
    } 
    else {
      return this;
    }
  }
   
  String toString() {
    if (this.isEmpty()) {
      return "null ND";
    }
    return n.p.toString() + "\t" + d;
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
  
  /* Finds the leftmost node in the quadtree */
  Node find_leftmost() {
    Node toReturn = null;
    if (this.leaf) {
      for (Node n : this.nodes) {
        if (toReturn == null || n.p.x < toReturn.p.x) {
          toReturn = n; 
        }
      }
      return toReturn;
    }
    Node n1 = this.northWest.find_leftmost();
    Node n2 = this.southWest.find_leftmost();
    if (n1 == null) {
      return n2;
    } else if (n2 == null) {
      return n1;
    }
    return ((n1.p.x < n2.p.x) ? n1 : n2);
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
    ND toReturn = new ND();
    if (this.leaf) { // if leaf, finds min of its nodes */
      for (Node other : this.nodes) {
        if (toReturn.d == 0 || other == null || n.distance(other) < toReturn.d) {
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
  
  /* Recursively searches for n nearest neighbors, using containing quadtree as goal */
  NDPriorityQueue _find_nclosest(QuadTree goal, Node n, int num, NDPriorityQueue toReturn) {
    ND connected;
    if (this.leaf) { /* if leaf, finds min of its nodes */
      for (Node other : this.nodes) {
          connected = new ND(other, n.distance(other));
          toReturn.insert(connected);
          //toReturn = toReturn.min_distance(new ND(other, n.distance(other)));
      }
      return toReturn; 
    } else { // if not leaf, finds min of recursive results */
      QuadTree[] quads = {
        this.northEast, this.northWest, this.southWest, this.southEast
      };
      for (QuadTree q : quads) {
        toReturn = q._find_nclosest(goal, n, num, toReturn);
      }
      return toReturn;
    }
  } 
    
  /* Returns nearest neighbor to node */
  ND closest(Node n) {
    return _find_closest(find(n), n);
  }
  
  /* Returns num nearest neighbors to node */
  NDPriorityQueue nclosest(Node n, int num) {
    NDPriorityQueue toReturn = new NDPriorityQueue(num);
    return _find_nclosest(find(n), n, num, toReturn);
  }

  /* Returns all nodes, sorted by their angle to an origin node */
  NDPriorityQueue all_slopes(NDPriorityQueue pq, Node origin) {
    if (this.leaf) {
      for (Node n : this.nodes) {
        pq.insert(new ND(n, origin.slope(n))); 
      }
      return pq;
    } 
    pq = this.southWest.all_slopes(pq, origin);
    pq = this.southEast.all_slopes(pq, origin);
    pq = this.northEast.all_slopes(pq, origin);
    pq = this.northWest.all_slopes(pq, origin);
    return pq;
  }
  
  /* Returns nodes on the point set's convex hull */
  ArrayList<Node> convex_hull() {
    Node leftmost = this.find_leftmost();
    NDPriorityQueue pq = new NDPriorityQueue(this.size);
    pq = this.all_slopes(pq, leftmost);
    
    ArrayList<Node> toReturn = new ArrayList<Node>();
    toReturn.add(leftmost);
    int len = 1;
    int i = 0;
    while (i <= this.size) {
      if (len > 2) {
         if (toReturn.get(len - 2).cross_product(toReturn.get(len-1), toReturn.get(len-3)) >= 0) {
           toReturn.remove(len-2);
           len--; 
           continue;
         }
      }
      if (i < this.size) {
        toReturn.add(pq.get_item(i).n);
        len++;
      }
      i++;
    }
    for (int j = 0; j < len; j++) {
      Edge e = toReturn.get(j).connect(toReturn.get((j+1) % len));
    }
    return toReturn;
  } 
  
  /* Returns list of edges of point set's convex hull */
  ArrayList<Edge> connect_hull_edges(Node n, ArrayList<Edge> hull, float dir) {
    ArrayList<Edge> toReturn = (ArrayList<Edge>) hull.clone();
    Edge e;
    for (int i = 0; i < hull.size(); i++) {
      e = hull.get(i);
      Node e1 = e.one;
      Node e2 = e.two;
      if (dir * e1.cross_product(n, e2) >= 0) { // connect to edge's endpoints
        toReturn.remove(e);
        Edge[] e_pair = e.connect_to_node(n);
        for (int j = 0; j <= 1; j++) {
          if (toReturn.contains(e_pair[j])) {
            toReturn.remove(e_pair[j]);
          } else {
            toReturn.add(e_pair[j]);
          }
        }
      }
    }
    return toReturn;
  }
  
  /* Deletes all edges of all nodes */
  void clear_edges() {
   if (this.leaf) {
    for (Node n : this.nodes) {
     n.clear_edges();
    }
   } else {
    this.northEast.clear_edges();
    this.northWest.clear_edges();
    this.southEast.clear_edges();
    this.southWest.clear_edges();
   } 
  }
  
  /* Triangulates points by connecting each node to convex hull of previously connected nodes */
  void triangulate(float x, float y) {
    Node origin = this.closest(new Node(new XY(x, y))).n;
    NDPriorityQueue nodes = this.nclosest(origin, this.size);
    ArrayList<Edge> hull = new ArrayList<Edge>();
    hull.add(nodes.get_item(this.size - 1).n.connect(nodes.get_item(this.size - 2).n));
    hull.add(nodes.get_item(this.size - 2).n.connect(nodes.get_item(this.size - 3).n));
    hull.add(nodes.get_item(this.size - 3).n.connect(nodes.get_item(this.size - 1).n));

    float dir = (hull.get(0).one.cross_product(hull.get(1).one, hull.get(2).one) >= 0) ? 1 : -1;
    for (int i = this.size - 4; i >= 0; i--) {
      hull = connect_hull_edges(nodes.get_item(i).n, hull, dir);
    }
  }
  
  /* Returns list of all edges in the tree */
  ArrayList<Edge> get_all_edges(ArrayList<Edge> acc) {
    if (this.leaf) {
      for (Node n : this.nodes) {
        for (Edge e : n.connections) {
          if (!acc.contains(e)) {
            acc.add(e);
          }
        }
      }
    } else {
      acc = this.northEast.get_all_edges(acc);
      acc = this.northWest.get_all_edges(acc);
      acc = this.southEast.get_all_edges(acc);
      acc = this.southWest.get_all_edges(acc);
    }
    return acc;
  }
  
  /* Cleans up a naive triangulation, producing Delaunay triangulation of points */
  void delaunay_triangulate() {
    ArrayList<Edge> edges = new ArrayList<Edge>();
    edges = this.get_all_edges(edges);
    //edges.get(0).delaunay();
    for (Edge e : edges) {
      e.delaunay();
    }    
  }
    
  /* Displays all nodes in quadtree */
  void display(color c, int w) {
    if (this.leaf) {
      for (Node n : nodes) {
        n.display(c, w);
        n.display_connections();
      }
    } 
    else {
      this.northWest.display(c, w);
      this.northEast.display(c, w);
      this.southWest.display(c, w);
      this.southEast.display(c, w);
    }
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
  setuptree_scatter(num_points);
  qt.triangulate(width/2, height/2);
  qt.display(point_color, point_weight);
}

void draw() {

}

/* Fills tree with specified number of random points */
void setuptree(int j) {
  randomSeed(1);
  qt = new QuadTree(new XY(width/2, height/2), width/2);
  for (int i = 0; i < j; i++) {
    Node toInsert = new Node(new XY(random(width), random(height)));
    qt.insert(toInsert);
  }
}

/* Finds optimal location for a new node */
ND farthest_guess() {
  ND best = new ND();
  Node guess = null;
  for (int j = 0; j < num_attempts; j++) {
    guess = new Node(new XY(random(width), random(height)));
    best = best.max_distance(new ND(guess, qt.closest(guess).d));
  }
  return best;
}

/* Initializes qtree with scattered points */
void setuptree_scatter(int p) {
  qt = new QuadTree(new XY(width/2, height/2), width/2);
  Node node1 = new Node(new XY(random(width), random(height)));
  qt.insert(node1); // first node
  for (int i = 0; i < p; i++) {
    ND farthest = farthest_guess();
    qt.insert(farthest.n);
  } 
}

/* Changes origin node of naive triangulation */
void mouseClicked() {
  background(bg_color);
  qt.clear_edges();
  qt.triangulate(mouseX, mouseY);
  qt.display(point_color, point_weight);
  redraw();
}

void keyPressed() {
  if (key == ' ') { // space bar clears quadtree
    qt = new QuadTree(new XY(width/2, height/2), width/2);
    background(bg_color);
    setuptree_scatter(num_points);
    qt.triangulate(width/2, height/2);
    qt.display(point_color, point_weight);  
    redraw();
  } else { // any other key cleans up the triangulation
    background(bg_color);
    qt.delaunay_triangulate();
    qt.display(point_color, point_weight);  
    redraw();
  }
}
