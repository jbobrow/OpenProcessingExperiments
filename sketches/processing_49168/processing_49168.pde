
ArrayList nodes; //the structure is composed of a bunch of connected "nodes"
float boundary; //the radius of the boundary (limiting the area where new nodes grow)
int overallHue; //hold the color

//================================================================

void setup() {
  //some basic display settings
  size(600,400);
  smooth();
  textSize(9);
  textAlign(CENTER, CENTER);
  background(0);
  colorMode(HSB, 360, 100, 255);
  
  //create the initial root node
  nodes = new ArrayList();
  nodes.add(new node(width/2, height/2, -1));
  boundary = 6.0;
  overallHue = int(random(360));
}

//================================================================

void draw() {
  //draw all the nodes that have already been added
  background(0);
  for (int i=0; i<nodes.size(); i++) {
    node n = (node) nodes.get(i);
    n.show();
  }
  
  //try to add a new node to the structure
  throwNode();
  
  //text stuff
  fill(255);
  text("Click to reset...", width>>1, height-20);
  text(nodes.size(), 30, 20);
  
}

//================================================================

class node {
  float x, y; //position in 2D
  int pID; //parent ID (as stored in nodes ArrayList)
  int strength; //the more upstream nodes connected, the stronger the node
  //--------------------------------------------
  node(float posX, float posY, int parentID) {
    //initialize the new node
    x = posX;
    y = posY;
    pID = parentID;
    strength = 1;
  }
  //--------------------------------------------
  void show() {
    if (pID >= 0) { //every node except the root node has a pID greater than zero
      //float w = log(strength)/log(50)*50 + 50; //
      float w = log(strength) * 20 + 50; //get a nice gradient based on node's strength
      strokeWeight(w/128); //stronger nodes are thicker...
      stroke(overallHue,100,w);  //...and brighter, too
      node parent = (node) nodes.get(pID); //get this node's parent
      line(x, y, parent.x, parent.y); //connect the dots
    }
    else {
      //this is the root node, so we'll just show a dot
      fill(overallHue,100, 255);
      ellipse(x, y, 3, 3);
    }
  }
  //--------------------------------------------
  boolean inRange(float posX, float posY) {
    //checks if the coodinates are next to this node (will be used by new nodes looking for a home)
    float range = 2;
    return sqrt(sq(posX - x) + sq(posY - y)) < range;
  }
  //--------------------------------------------
  void strengthen() {
    //increases strength of this node and all the recursive parents back to the root
    strength++;
    if (pID >= 0) {
      node pn = (node) nodes.get(pID);
      pn.strengthen();
    } 
  }
}

//================================================================

void reset() {
  //clear out all the nodes and start over
  nodes.clear();
  nodes.add(new node(mouseX, mouseY, -1));
  boundary = 6.0;
  overallHue = int(random(360));
}

//================================================================

void mouseReleased() {
  //reset on a mouse clicks
  reset();
}

//================================================================

void throwNode() {
  node n = (node) nodes.get(0); //need to reference the root node since the boundary is achored to it
  PVector pos = getBoundaryPos(true); //the position of the new node - starts on the boundary...
  PVector endPos = getBoundaryPos(false); //...and heads toward this random position (also on the boundary)
  PVector dir = PVector.sub(endPos, pos); //...this vector is the direction it will go
  dir.normalize(); //...one pixel at a time
  float oldBoundry = boundary; //boundry values may get changed so we need to keep track of what it was
  boolean bDone = false; //need to know when to jump out of our while loop
  
  while(!bDone) {
    float dst = sqrt(sq(pos.x - n.x) + sq(pos.y - n.y)); //get the new node's current distance from the root node
    for (int i=0; i<nodes.size(); i++) { //we'll go through each node in the structure to see if our new node is close enough to stick
      node t = (node) nodes.get(i); //load a node
      if (t.inRange(pos.x, pos.y)) { //check if it's close enough - if so we have a winner!
        node winner = new node(pos.x, pos.y, i); //define the new node
        winner.strengthen(); //strengthen it and all it's parents by one
        nodes.add(winner); //add it to the array list
        if (dst >= boundary) //check if the new node falls outside the boundaries...
          boundary = dst + 5; //bump it the boundaries out a bit if it is
        fill(255); ellipse(pos.x, pos.y, 2, 2); //show a sparkly dot
        bDone = true; //end the while-loop
        break; //break out of the for-loop
      }
    }
    if (dst >= oldBoundry) bDone = true; //end the while-loop if the node falls outside the boundaries
    pos.add(dir); //move the node one spot closer toward the endPos
    }
}

//================================================================

PVector getBoundaryPos(boolean bOnScreenOnly) {
  //pick a spot on the boundry
  node n = (node) nodes.get(0); //the boundary is achored to root node
  float angle = random(TWO_PI); //the boundry is circular, so we can just pick an angle to get our spot
  PVector pos = new PVector(sin(angle)*boundary + n.x, cos(angle)*boundary + n.y);  //geometry rocks
  if (bOnScreenOnly) { //the boundary may extend off the screen and we sometimes only want points on-screen
    while (pos.x < 0 || pos.y < 0 || pos.x >= width || pos.y >= height) { //boundry checking
      angle = random(TWO_PI); //pick another angle...
      pos = new PVector(cos(angle)*boundary + n.x, sin(angle)*boundary + n.y); //...set up the PVector again
    }
  }
  return pos;
}

