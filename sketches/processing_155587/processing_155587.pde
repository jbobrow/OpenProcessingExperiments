
Structure hexNet;
Atom agent;
int count;

void setup() {
  size(800, 800);
  smooth();
  frameRate(50);

  strokeWeight(3);

  count = 200;
  hexNet = new Structure(width/2, height/2, 30);
  agent = hexNet.atoms.get(0);
}

void draw() {
  background(255);

  if (count > 0) {

    int tryDir = floor(random(6));
    int newDir = hexNet.linkAtoms(agent, tryDir, color(0));

    agent = hexNet.getAtom(agent, newDir);
    //if(agent == null) count = 0;

    count--;
  }
  hexNet.display();

  //noLoop();
}

void mousePressed() {
  hexNet.atoms.clear();
  hexNet.links.clear();
  hexNet.atoms.add(new Atom(0, width/2, height/2, hexNet.hexagonSize));
  agent = hexNet.atoms.get(0);
  count = 200;
}

class Atom {

  float x, y;
  float size;
  color fillC, strokeC;
  int index;
  int[] neighbors;

  Atom(int _index, float _x, float _y, float _size ) {
    index = _index;
    x = _x;
    y = _y;
    size = _size/3;
    strokeC = color(0);
    fillC = color(255);
    
    neighbors = new int[6];
  }

  void display() {
    fill(fillC);
    stroke(strokeC);
    ellipse(x, y, size, size);
    
    fill(255,0,0);
    textSize(8);
    text(index ,x+8,y+3);
  }
}

class Link {

  Atom a, b;
  color strokeC;

  Link(Atom _a, Atom _b, color _strokeC) {
    a = _a;
    b = _b;
    strokeC = _strokeC;
  }

  void display() {

    stroke(strokeC);
    line(a.x, a.y, b.x, b.y);
  }
}

class Structure {

  ArrayList<Atom> atoms;
  ArrayList<Link> links;

  float hexagonSize;
  float a, b, c;
  float[][] dir;

  Structure(float originX, float originY, float _hexagonSize) {
    hexagonSize = _hexagonSize;
    c = hexagonSize;
    b = hexagonSize/2;
    a = sqrt((c*c) - (b*b));

    atoms = new ArrayList();
    atoms.add(new Atom(0, originX, originY, hexagonSize));

    links = new ArrayList();

    dir = new float[6][2];
    dir[0][0] = 0;
    dir[0][1] = -c;
    dir[1][0] = -a;
    dir[1][1] = -b;
    dir[2][0] = a;
    dir[2][1] = -b;
    dir[3][0] = -a;
    dir[3][1] = b;
    dir[4][0] = a;
    dir[4][1] = b;
    dir[5][0] = 0;
    dir[5][1] = c;
  }

  void display() {
    for (int j=0; j<links.size (); j++) {
      Link l = links.get(j);
      l.display();
    }

    for (int i=0; i<atoms.size (); i++) {
      Atom a = atoms.get(i);
      a.display();
    }
  }

  int linkAtoms(Atom self, int otherDir, color linkC) {
    /*
Neighborhood:
     ___0___
     1_____2
     ___A___
     3_____4
     ___5___
     */

    int selfDir = flipDir(otherDir);

    float otherX = self.x + dir[otherDir][0];
    float otherY = self.y + dir[otherDir][1];

    boolean outside = borders(otherX, otherY);
    if (outside) {
      otherDir = flipDir(otherDir);
      otherX = self.x + dir[otherDir][0];
      otherY = self.y + dir[otherDir][1];
      selfDir = flipDir(otherDir);
    }

    if (isLinked(self, otherDir) == false) {

      Atom other = getAtom(self, otherDir); // apply Atom if already there

      if (other == null) { // if no Atom is there, create one
        atoms.add(new Atom(atoms.size(), otherX, otherY, hexagonSize));
        other = atoms.get(atoms.size()-1);
      }

      self.neighbors[otherDir] = 1;
      other.neighbors[selfDir] = 1;

      links.add(new Link(self, other, linkC));
    }
   
    return otherDir;
  }

  boolean borders(float x, float y) {
    if (x <= 0 || x >= width) return true;
    if (y <= 0 || y >= height) return true;
    return false;
  }

  Atom getAtom(Atom self, int otherDir) { 
    // get atom from another atoms neighbors (their position)
    float otherX = self.x + dir[otherDir][0];
    float otherY = self.y + dir[otherDir][1];

    for (int i=0; i<atoms.size (); i++) {
      Atom a = atoms.get(i);
      if (a.x == otherX && a.y == otherY) return a;
    }

    return null;
  }

  boolean isLinked(Atom self, int otherDir) { 
    // check if Atoms are already linked

    for (int i=0; i<self.neighbors.length; i++) {
      if (self.neighbors[i] == 1 && otherDir == i) return true;
    }

    return false;
  }

  int flipDir(int dir) {
    int flippedDir = 0;
    if (dir == 0) flippedDir = 5;
    if (dir == 1) flippedDir = 4;
    if (dir == 2) flippedDir = 3;
    if (dir == 3) flippedDir = 2;
    if (dir == 4) flippedDir = 1;
    if (dir == 5) flippedDir = 0;
    return flippedDir;
  }
}



