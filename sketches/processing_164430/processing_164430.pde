

int bpm = 50;                           // beats per minute, as if it were actually synced to a midi clock
int scrnw = 400;                         // screen width
int scrnh = 400;                         // screen height
float[] center = { scrnw/2, scrnh/2 };
Node n1, n2, n3, n4, n5, n6, n7;                         // nodes must be initialized here

void setup() {
  
  /* General Set Up */
  
  size( scrnw, scrnh );                  // set the screen size
  frameRate(40);                         // fix the frame rate at 40 per second
  smooth();                              // smooth drawing
  
  /* Initialization: Node(Radius, Speed, Phase[, Center]) */
  
  n1 = new Node(0.0, 0.0, 0.0, center);  // create the center node
  n2 = n1.addNode(1.0, 1.0, 0.0);        // add a child to the center nodeode
  n3 = n2.addNode(1.0, 2.0, 0.0);        // add a child to that childild
  //n4 = n2.addNode(1.0, 2.0, PI);
  //n5 = n3.addNode(1.0, 3.0, 0.0);
  //n6 = n5.addNode(1.0, 4.0, 0.0);
  
}

void draw() {
  noStroke();
  strokeWeight(0);
  stroke(0, 255, 0);
  
  //draw center
  stroke(255, 0, 0);
  float t = (float) millis();
  fill(0, 0, 255);
  stroke( random(70) );
  
  //this fires a recursive chain of finding all positions
  n1.update(t);
}

class Node
{
  float s; // speed
  float r; // radius
  float p; // phase
  float xpos; // x position
  float ypos; // y position
  float radians;
  float[] offset = { 0.0, 0.0 }; // stores the offset position (compiled) from ancestors
  ArrayList<Node> children;
  boolean isOrphan = false;
  
  float lngstChild; // for changing the scalar
  
  float scalar = 50.0;
  
  Node(float _r, float _s, float _p, float[] _o) {
    r = _r;
    s = _s;
    p = _p;
    arrayCopy(_o, offset);
    children = new ArrayList<Node>();
    isOrphan = true;
  }
  
  void update(float t) { //send the milli time in
    if ( s != 0.0 ) {
      radians = (2.0 * t * PI * s * bpm) / (240000.0 * r) + p;
    } else {
      radians = 0.0;
    }
    xpos = offset[0] + ( cos ( radians ) * r * scalar );
    ypos = offset[1] + ( sin ( radians ) * r * scalar );
    //line(offset[0], offset[1], xpos, ypos);
    if (isOrphan) {
      line(xpos, ypos, scrnw, ypos);
    }
    //fill(255);
    ellipse(xpos, ypos, 3, 3);
    
    // float rmax;
    for (int i = children.size()-1; i >= 0; i--) {
      Node c = children.get(i);
      c.offset[0] = xpos;
      c.offset[1] = ypos;
      c.update(t);
    }
  }
  
  Node addNode(float _r, float _s, float _p) {
    float[] _o = { 0.0, 0.0 };
    arrayCopy(offset, _o);
    Node n = new Node(_r, _s, _p, _o);
    n.isOrphan = false;
    children.add(n);
    return n;
  }
  
}
