
PriorityQueue pts;
PriorityQueue init_pts;
float x_axis;
color leaf = color(120, 160, 100);
color branch = color(200, 150, 110);

void setup() {
  size(350, 700);
  background(255);
  noFill();
  noLoop();
  init_pts = new PriorityQueue();
  pts = new PriorityQueue();
  strokeWeight(2);
  x_axis = width/2;
  init_pts.insertP(new PVector(width/2, 200));
}

void draw() {
  background(255);
  pts = new PriorityQueue(init_pts.get_items());
  for (Node n : init_pts.get_items()) {
    fill(leaf);
    noStroke();
    ellipse(n.pt.x, n.pt.y, 10, 10);    
  }
  noFill();
  stroke(branch);
  reduce_pts();
}

void mousePressed() {
  init_pts.insertP(new PVector(mouseX, mouseY));
  redraw();
}

void keyPressed() {
  if (key == ' ') {
    init_pts = new PriorityQueue();
    init_pts.insertP(new PVector(width/2, 200));
    redraw(); 
  }
}

void reduce_pts() {
  while (pts.len() > 1) {
    int[] pair = closest_pair();
    Node midpt = join(pts.get_item(pair[0]), pts.get_item(pair[1]));
    pts.remove(pair[1]);
    pts.remove(pair[0]);
    pts.insertN(midpt); 
  }
  line(pts.get_item(0).pt.x, pts.get_item(0).pt.y, pts.get_item(0).pt.x, pts.get_item(0).pt.y + 100);
}

int[] closest_pair() {
  float min_distance = width; 
  int[] toReturn = new int[2];
  for (int i = 0; i < pts.len() - 1; i++) {
    if (pts.get_item(i).pt.dist(pts.get_item(i + 1).pt) < min_distance) {
      min_distance = pts.get_item(0).pt.dist(pts.get_item(1).pt);
      toReturn[0] = i;
      toReturn[1] = i + 1;
    }
  }
  return toReturn;
}

Node join(Node np1, Node np2) {
  PVector p1 = new PVector(np1.pt.x, np1.pt.y);
  PVector p2 = new PVector(np2.pt.x, np2.pt.y);
  if (p1.y < p2.y) {
    line(p1.x, p1.y, p1.x, p2.y);
    p1.y = p2.y;
  } else if (p1.y > p2.y) {
    line(p2.x, p2.y, p2.x, p1.y);
    p2.y = p1.y;
  }
  float x_dist = ((p1.x + p2.x)/2) / width;
  PVector midpt;
  if (x_dist < 1.0/3) {
    midpt = new PVector(p2.x, (p1.y + p2.y)/2 + (p2.x - p1.x));
    curveBranch(midpt, p1);
    line(midpt.x, midpt.y, p2.x, p2.y);
  } else if (x_dist < 2.0/3) {
    midpt = new PVector((p1.x + p2.x)/2, (p1.y + p2.y)/2 + (p2.x - p1.x) );
    curveBranch(midpt, p1);
    curveBranch(midpt, p2);
  } else {
    midpt = new PVector(p1.x, (p1.y + p2.y)/2 + (p2.x - p1.x) );
    curveBranch(midpt, p2);
    line(midpt.x, midpt.y, p1.x, p1.y);
  } 
  Node to_return = new Node(midpt);
  to_return.l = np1;
  to_return.r = np2;
  return to_return;
}

void curveBranch(PVector from, PVector to) {
  bezier(from.x, from.y, to.x, from.y, to.x, from.y, to.x, to.y);
}



class Node {
  PVector pt;
  Node l;
  Node r;
  
  Node(PVector pt) {
    this.pt = pt;
  }
  
  Node most_left() {
    if (this.l != null) {
      return l.most_left();
    } else {
      return this;
    }
  }
  
  Node most_right() {
    if (this.r != null) {
      return r.most_right();
    } else {
      return this;
    }
  }
}



class PriorityQueue {
  ArrayList<Node> things; // stored largest to smallest
  
  PriorityQueue() {
    this.things = new ArrayList<Node>();
  }
  
  PriorityQueue(ArrayList<Node> pts) {
    this.things = (ArrayList<Node>) pts.clone();
  }
  
  void insertP(PVector item) {
    insertN(new Node(item));
  }
  
  /* Inserts item to queue */
  void insertN(Node n) {
    int index = 0;
    if (things.size() > 0) {
      while (index < things.size() && things.get(index).pt.x < n.pt.x) {
        index++; 
      }
    }
    things.add(index, n);
  }

  int len() {
    return this.things.size();
  }
  
  Node get_item(int num) {
    return this.things.get(num); 
  }

  ArrayList<Node> get_items() {
    return this.things;
  }  
  
  void remove(int i) {
    things.remove(i);
  }
}

