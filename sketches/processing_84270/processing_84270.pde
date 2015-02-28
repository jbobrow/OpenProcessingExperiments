
Node[] nodes;
ArrayList<Path> paths;
Search seekem;
int g = 400;  // grid size
int n = 12;   // number of nodes
int time, quickestPath, prcount, from, to;
int fr = 24;  // frame rate
float r = 200; // link radius
float minDistance, x, y;
PVector pv, m;
boolean mouseRel, route, printPath, printPaths; // mouse released?, a route calculated?
boolean firstrun = true;

void setup() {
  size(640, 480);
  frameRate(fr);
  rectMode(CENTER);
  fill(0);
  from = -1;
  to = -1;
  route = false;
  printPath = false;
  printPaths = false;
  minDistance = 10000;
  quickestPath = -1;
  textSize(18);
  smooth();

  float w = width/n;
  float h = height/n;
  nodes = new Node[n];

  for (int i=0; i<n; i++) nodes[i] = new Node(new PVector(int(random(10,width-10)), int(random(110, height-10))), i);

  for (Node c:nodes) {
    for (int i=0; i<n; i++) {
      if (c.id != i) {
        pv = PVector.sub(c.p, nodes[i].p);
        if (pv.mag() < r) c.links.add(new Link(i, pv.mag()));
      }
    }
  }
  paths = new ArrayList<Path>();
}

void draw() {
  background(20);
  m = new PVector(mouseX, mouseY);

  stroke(150);
  for (Node c:nodes) c.drawLinks();

  for (Node c:nodes) {
    c.mouse();
    c.draw();
  }

 
  if (mouseRel) {
    if (m.x >= 210 && m.x <= 260 && m.y >= 20 && m.y <= 40) {
      setup();
    }
    else if (m.x >= 275 && m.x <= 365 && m.y >= 20 && m.y <= 40) {
      printPaths = !printPaths;
      prcount = 0;
    }
  }





  if (!route && from > -1 && to > -1) calcPath();
  if (mouseRel) mouseRel = false;
  if (paths.size()>0) {
    if (printPath && !printPaths) {
      stroke(255, 0, 0);
      strokeWeight(2);
      for (int i=0; i<paths.get(quickestPath).nodes.size(); i++) {
        if (i>0) {
          int a = paths.get(quickestPath).nodes.get(i-1);
          int b = paths.get(quickestPath).nodes.get(i);
          line(nodes[a].p.x, nodes[a].p.y, nodes[b].p.x, nodes[b].p.y);
        }
      }
      strokeWeight(1);
    }
    if (printPaths && printPath) {
      if (prcount >= paths.size()) printPaths = false;
      else {
        strokeWeight(2);
        stroke(0, 0, 200);
        for (int i=0; i<paths.get(prcount).nodes.size(); i++) {
          if (i>0) {
            int a = paths.get(prcount).nodes.get(i-1);
            int b = paths.get(prcount).nodes.get(i);
            line(nodes[a].p.x, nodes[a].p.y, nodes[b].p.x, nodes[b].p.y);
          }
        }
        fill(0, 0, 255);
        text("Displaying route " + prcount, 10, 60);
        strokeWeight(1);
      }
      prcount++;
    }
    fill(172, 51, 54);
    text(paths.size() + " possible paths", 10, 20);
    text("(" + time + " milliseconds)", 10, 40);
  }
  fill(59, 134, 214);
  textAlign(RIGHT);
  text("Quickest network path finder", width-10, 20);
  text("Click on 2 connected points", width-10, 40);
  textAlign(LEFT);

  fill(40, 57, 96);
  text("geotheory.co.uk", 10, height-15);


  // Buttons
  textAlign(LEFT);
  rectMode(CORNER);
  textSize(14);
  stroke(80);
  fill(50);
  rect(210, 20, 50, 20);
  rect(275, 20, 90, 20);
  fill(59, 134, 214);
  text("Show Routes", 280, 35);
  text("Reset", 215, 35);
  textSize(18);
  rectMode(CENTER);
  
}

void calcPath() {
  ArrayList<Integer> newList = new ArrayList();
  time = millis();
  seekem = new Search(from, to, newList, -1, -1, 0.0);
  time = millis() - time;
  route = true;
  for (int i=0; i<paths.size(); i++) {
    if (paths.get(i).distance < minDistance) {
      minDistance = paths.get(i).distance;
      quickestPath = i;
    }
  }
  printPath = true;
}

class Node {
  int id, rad;
  PVector p;
  ArrayList<Link> links;
  boolean selected, routeSearched; // selected from/to?, already used in routing?

  Node(PVector P, int ID) {
    this.p = new PVector(P.x, P.y);
    this.id = ID;
    this.links = new ArrayList<Link>();
    this.selected = false;
    this.routeSearched = false;
  }

  void draw() {
    if (this.selected) {
      this.rad = 8;
      fill(255, 0, 0); 
      stroke(255, 0, 0);
    }
    else {
      this.rad = 6;
      fill(255); 
      stroke(255);
    }
    ellipse(this.p.x, this.p.y, this.rad, this.rad);
  }

  void drawLinks() {
    if (links.size() > 0) {
      for (int i=0; i<links.size(); i++) {
        line(this.p.x, this.p.y, nodes[links.get(i).id].p.x, nodes[links.get(i).id].p.y);
      }
    }
  }

  void mouse() {
    pv = PVector.sub(p, m);
    if (pv.mag() < 7 && mouseRel) {
      if (!this.selected) {
        if (from > -1 && to > -1) println("Too many selected " + frameCount);
        else {
          this.selected = true;
          if (from == -1) from = id;
          else to = id;
        }
      }
      else {
        this.selected = false;
        if (from == id) from = -1;
        if (to == id) to = -1;
      }
    }
  }
}

class Link { // class for links
  int id;  // id of linked city
  float d; // distance to city

  Link(int ID, float D) {
    this.id = ID;
    this.d = D;
  }
}

class Search {
  int id; // city ID
  int goal; // destination
  int parentRef; // parent's link index for this city
  int parent;  // parent's ID
  ArrayList<Integer> parents; // nodes of origin
  ArrayList<Search> children; // nodes to search
  float travelled;   // total distance of route so far
  float totalDist;

  Search(int ID, int GOAL, ArrayList PARENTS, int PARENT, int PARENTREF, float TRAVELLED) {
    this.id = ID;
    this.goal = GOAL;
    this.parentRef = PARENTREF;
    this.parent = PARENT;
    this.parents = new ArrayList<Integer>();
    this.parents.addAll(PARENTS);
    this.parents.add(id);
    this.travelled = TRAVELLED;
    this.children = new ArrayList();

    if (this.id == this.goal) { // route target reached
      paths.add( new Path( parents, travelled) );
    }
    else {
      int s = nodes[id].links.size();
      if (s > 0) {
        for (int i=0; i<s; i++) { // iterate through city's links
          int dest = nodes[id].links.get(i).id;         // link's city ID
          if (!this.parents.contains(dest)) {
            this.totalDist = this.travelled + nodes[id].links.get(i).d; // distance to child
            this.children.add( new Search(dest, this.goal, this.parents, this.id, i, this.totalDist) );
          }
        }
      }
    }
  }
}

class Path {
  ArrayList<Integer> nodes;
  float distance;

  Path(ArrayList NODES, float DISTANCE) {
    this.nodes = NODES;
    this.distance = DISTANCE;
  }
}

void keyPressed() {
  if (key=='r') setup();
  if (key=='p') {
    printPaths = !printPaths;
    prcount = 0;
  }
}

void mouseReleased() {
  mouseRel = true;
}
