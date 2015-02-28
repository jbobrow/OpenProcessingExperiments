
PGraphics walls = createGraphics(150, 150, P2D);

PVector startPoint = new PVector(25, 25);
PVector endPoint = new PVector(125, 100);
color BGColor = color(50);
color WallColor = color(255, 0, 0);
color LineColor = color(255);
color OpenColor = color(75);
color ClosedColor = color(40);
PFont daFont;


boolean MARCHERS = true;
int MARCHER_DISTANCE = 3;
int MARCHER_LENGTH = 1;
float MARCHER_FATNESS = 1;
boolean DEBUG = false;
boolean DIAGONAL = true; // false is a bad idea! Try a diagonal start/to and see why
int bgOpacity = 255;

float HWeight = 1.5; // 1.5 - higher = faster but results suck more
float GWeight = 1; // 1 - higher = .. slower and also sucks more :')

int marcher_step = 0;
ArrayList route = new ArrayList();
int consideredCount = 0;

Float[][] gScore;
Float[][] hScore;
Float[][] fScore;
PVector[][] cameFrom;

void setup() {
  size(150, 150, JAVA2D);
  frameRate(20);
  daFont = loadFont("Verdana-10.vlw");
  noSmooth();
  route = AStar(startPoint, endPoint);
}

void mouseReleased() {
  route = AStar(startPoint, endPoint);
}

void draw() {
  //background(BGColor);
  fill(50, bgOpacity);
  rect(0, 0, width, height);
  
  if (mousePressed) {
    walls.beginDraw();
    if (mouseButton == LEFT) {
      walls.strokeWeight(1 + (DIAGONAL ? 1 : 0) );
      walls.stroke(WallColor);
    }
    else {
      walls.strokeWeight(5 + (DIAGONAL ? 1 : 0) );
      walls.stroke(BGColor);
    }
    walls.line(pmouseX, pmouseY, mouseX, mouseY);
    walls.endDraw();
  }   

  fill(0);
  ellipse((int) startPoint.x, (int) startPoint.y, 6, 6);
  ellipse((int) endPoint.x, (int) endPoint.y, 6, 6);
  image(walls, 0, 0); 

  marcher_step++;
  if (marcher_step > MARCHER_DISTANCE + MARCHER_LENGTH) { 
    marcher_step = 0;
  } 

  noStroke();
  for (int i = 0; i < route.size(); i++) {
    if (MARCHERS) {
      if ((i + marcher_step) % (MARCHER_DISTANCE + MARCHER_LENGTH) < MARCHER_LENGTH) {
        PVector node = (PVector) route.get(i);
        if (MARCHER_FATNESS == 1) {
          set((int) node.x, (int) node.y, LineColor);
        } 
        else {
          fill(LineColor);
          ellipse((int) node.x, (int) node.y, MARCHER_FATNESS, MARCHER_FATNESS);
        }
      }
    }
    else {
      PVector node = (PVector) route.get(i);
      set((int) node.x, (int) node.y, LineColor);
    }
  }

  textFont(daFont); 
  fill(255);
  noSmooth();
  text("Length: "+route.size(), 5, 135);
  text("Considered: "+consideredCount, 5, 145);
}

ArrayList AStar(PVector start, PVector end) {

  consideredCount = 0;
  ArrayList closedSet = new ArrayList(); //list of processing nodes
  ArrayList openSet = new ArrayList(); //list of nodes to be processed. starts with startpoint

    //weird indentation
  gScore = new Float[width + 1][height + 1]; //contains the cost along the best known path
  hScore = new Float[width + 1][height + 1]; //contains the estimated cost to get to the end
  fScore = new Float[width + 1][height + 1]; //final score (g + h)  
  cameFrom = new PVector[width + 1][height + 1]; //keeps track of where every node came from, based on best path found

  //add the start point to openset and cameFrom
  openSet.add(start);
  came(start, start);

  //"calculate" the scores for the startpoint
  score("g", start, 0);
  score("h", start, getH(start, end));
  score("f", start, score("g", start) + score("h", start));

  while (openSet.size () > 0 && consideredCount < 50000) {
    //for (int loopy = 0; loopy < 1000; loopy++) { 

    //get the node from openset with the lowest F value
    float lowestScore = 0;
    PVector lowestScoreNode = null;
    int lowestScoreIndex = -1;
    for (int i = 0; i < openSet.size(); i++) {
      PVector node = (PVector) openSet.get(i); 
      if (lowestScoreIndex == -1 || score("f", node) < lowestScore) {
        lowestScoreNode = node;
        lowestScoreIndex = i;
        lowestScore = score("f", node);
      }
    }

    //print(lowestScore+"\n");
    //print(lowestScoreIndex+"\n");

    //easy reference
    PVector curNode = lowestScoreNode;

    //are we there? return the route
    if (curNode.dist(end) == 0) { //or dist?
      //build the route and return it
      ArrayList route = new ArrayList();
      PVector lastNode = end;
      while (true) {
        lastNode = came(lastNode);
        route.add(lastNode);
        if (lastNode == start) {
          break;
        }
      }
      return route;
    }

    //remove the curNode from openset and add it to closed
    openSet.remove(lowestScoreIndex);
    closedSet.add(curNode);

    //print("Removing "+lowestScoreIndex+"\n");

    //show a dot
    if (DEBUG) {
      set((int) curNode.x, (int) curNode.y, OpenColor);
    }
    //get neighbours (PVectors)
    ArrayList neighbours = new ArrayList();    
    neighbours.add(new PVector(curNode.x, curNode.y - 1));
    neighbours.add(new PVector(curNode.x + 1, curNode.y));
    neighbours.add(new PVector(curNode.x, curNode.y + 1));
    neighbours.add(new PVector(curNode.x - 1, curNode.y));

    if (DIAGONAL) {
      neighbours.add(new PVector(curNode.x - 1, curNode.y - 1));
      neighbours.add(new PVector(curNode.x + 1, curNode.y - 1));
      neighbours.add(new PVector(curNode.x + 1, curNode.y + 1));
      neighbours.add(new PVector(curNode.x - 1, curNode.y + 1));
    }

    //for each neighbour..
    for (int i = 0; i < neighbours.size(); i++) {
      PVector neNode = (PVector) neighbours.get(i);

      //check if neighbour is already in closedset, if so -> continue
      if (closedSet.indexOf(neNode) != -1) {
        continue;
      }

      consideredCount++;
      //print("cur: "+curNode.x+"."+curNode.y+" ne: "+neNode.x+"."+neNode.y+"\n");

      //wall or out of bounds? piss off, continue with next neighbour
      if (neNode.x < 0 || neNode.x > width - 1 || neNode.y < 0 || neNode.y > height - 1 || walls.get((int) neNode.x, (int) neNode.y) == WallColor) {
        continue;
      }

      //show a dot
      if (DEBUG) {
        set((int) neNode.x, (int) neNode.y, ClosedColor);
      }

      //calculate new total g score (start to here)
      float handicap = 0;
      float totalG = score("g", curNode) + curNode.dist(neNode) + (handicap * 1000);

      //if it's NOT in openset, add it, and calculate GHF scores for it + came
      if (openSet.indexOf(neNode) == -1) {
        openSet.add(neNode);
        score("h", neNode, getH(neNode, end));
        score("g", neNode, totalG);
        score("f", neNode, totalG + score("h", neNode));
        came(neNode, curNode);
      }

      //if it is, check if the total gscore (start to curnode to nenode) is smaller then the old gscore, if so - update G and F + came
      else if (totalG < score("g", neNode)) {
        score("g", neNode, totalG);
        score("f", neNode, totalG + score("h", neNode));
        came(neNode, curNode);
      }
    }
  }

  //print("FAILURE");
  return new ArrayList();
}

String index(PVector pos) {
  return pos.x + "." + pos.y;
}

float getH(PVector pos, PVector end) {
  return pos.dist(end);
}

void score(String which, PVector pos, float val) {
  if (which == "g") {
    gScore[(int) pos.x][(int) pos.y] = val;
  }
  if (which == "h") {
    hScore[(int) pos.x][(int) pos.y] = val;
  }
  if (which == "f") {
    fScore[(int) pos.x][(int) pos.y] = val;
  }
}

float score(String which, PVector pos) {
  if (which == "g") {
    return gScore[(int) pos.x][(int) pos.y] * GWeight;
  }
  if (which == "h") {
    return hScore[(int) pos.x][(int) pos.y] * HWeight;
  }
  if (which == "f") {
    return fScore[(int) pos.x][(int) pos.y];
  }

  return 0;
}

void came(PVector pos, PVector from) {  
  cameFrom[(int) pos.x][(int) pos.y] = from;
}

PVector came(PVector pos) {  
  return cameFrom[(int) pos.x][(int) pos.y];
}


