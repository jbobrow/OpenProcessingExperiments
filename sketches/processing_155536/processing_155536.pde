
/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

/**
 * Flow algorithm for drawing nodes in a circle
 */
class CircleFlowAlgorithm implements FlowAlgorithm
{
  // draw all nodes in a big circle,
  // without trying to find the best
  // arrangement possible.

  boolean reflow(DirectedGraph g)
  {
    float interval = 2*PI / (float)g.size();
    int cx = width/2;
    int cy = height/2;
    float vl = cx - (2*g.getNode(0).r1) - 10;
    for(int a=0; a<g.size(); a++)
    {
      int[] nc = rotateCoordinate(vl, 0, (float)a*interval);
      g.getNode(a).x = cx+nc[0];
      g.getNode(a).y = cy+nc[1];
    }
    return true;
  }
}
/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

// this class models a directed graph, consisting of any number of nodes
class DirectedGraph
{
  ArrayList<Node> nodes = new ArrayList<Node>();
  FlowAlgorithm flower = new CircleFlowAlgorithm();

  void setFlowAlgorithm(FlowAlgorithm f) {
    flower = f; }

  void addNode(Node node) {
    if(!nodes.contains(node)) {
      nodes.add(node); }}

  int size() { return nodes.size(); }

  boolean linkNodes(Node n1, Node n2) {
    if(nodes.contains(n1) && nodes.contains(n2)) {
      n1.addOutgoingLink(n2);
      n2.addIncomingLink(n1);
      return true; }
    return false; }

  Node getNode(int index) {
    return nodes.get(index); }

  ArrayList<Node> getNodes() {
    return nodes; }

  ArrayList<Node> getRoots() {
    ArrayList<Node> roots = new ArrayList<Node>();
    for(Node n: nodes) {
      if(n.getIncomingLinksCount()==0) {
        roots.add(n); }}
    return roots; }

  ArrayList<Node> getLeaves() {
    ArrayList<Node> leaves = new ArrayList<Node>();
    for(Node n: nodes) {
      if(n.getOutgoingLinksCount()==0) {
        leaves.add(n); }}
    return leaves; }

  // the method most people will care about
  boolean reflow() { return flower.reflow(this); }

  // this does nothing other than tell nodes to draw themselves.
  void draw() {
    for(Node n: nodes) {
      n.draw(); }}
}
/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

// this is the interface for graph reflowing algorithms
interface FlowAlgorithm {
  // returns "true" if done, or "false" if not done
  boolean reflow(DirectedGraph g); }
/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

// This is a generic node in a graph
class Node
{
  ArrayList<Node> inlinks = new ArrayList<Node>();
  ArrayList<Node> outlinks = new ArrayList<Node>();;
  String label;

  Node(String _label, int _x, int _y) {
    label=_label; x=_x; y=_y; r1=5; r2=5; }

  void addIncomingLink(Node n) {
    if(!inlinks.contains(n)) {
      inlinks.add(n);}}

  ArrayList<Node> getIncomingLinks(){
    return inlinks; }

  int getIncomingLinksCount() {
    return inlinks.size(); }

  void addOutgoingLink(Node n) {
    if(!outlinks.contains(n)) {
      outlinks.add(n);}}

  ArrayList<Node> getOutgoingLinks(){
    return outlinks; }

  int getOutgoingLinksCount() {
    return outlinks.size(); }

  float getShortestLinkLength() {
    if(inlinks.size()==0 && outlinks.size()==0) { return -1; }
    float l = 100;
    for(Node inode: inlinks) {
      int dx = inode.x-x;
      int dy = inode.y-y;
      float il = sqrt(dx*dx + dy*dy);
      if(il<l) { l=il; }}
    for(Node onode: outlinks) {
      int dx = onode.x-x;
      int dy = onode.y-y;
      float ol = sqrt(dx*dx + dy*dy);
      if(ol<l) { l=ol; }}
    return l; }

  boolean equals(Node other) {
    if(this==other) return true;
    return label.equals(other.label); }

  // visualisation-specific
  int x=0;
  int y=0;
  int r1=30;
  int r2=30;

  void setPosition(int _x, int _y) {
    x=_x; y=_y; }

  void setRadii(int _r1, int _r2) {
    r1=_r1; r2=_r2; }

  void draw() {
    stroke(0);
    fill(255);
    for(Node o: outlinks) {
      drawArrow(x,y,o.x,o.y); }
    ellipse(x,y,r1*2,r2*2);
    fill(50,50,255);
    text(label,x+r1*2,y+r2*2);
  }

  int[] arrowhead = {0,-4,0,4,7,0};
  void drawArrow(int x, int y, int ox, int oy)
  {
    int dx=ox-x;
    int dy=oy-y;
    float angle = getDirection(dx,dy);
    float vl = sqrt(dx*dx+dy*dy) - sqrt(r1*r1+r2*r2)*1.5;
    int[] end = rotateCoordinate(vl, 0, angle);
    line(x,y,x+end[0],y+end[1]);
    drawArrowHead(x+end[0], y+end[1], angle);
  }
  void drawArrowHead(int ox, int oy, float angle) {
    int[] rc1 = rotateCoordinate(arrowhead[0], arrowhead[1], angle);
    int[] rc2 = rotateCoordinate(arrowhead[2], arrowhead[3], angle);
    int[] rc3 = rotateCoordinate(arrowhead[4], arrowhead[5], angle);
    int[] narrow = {ox+ rc1[0], oy+ rc1[1], ox+ rc2[0], oy+ rc2[1], ox+ rc3[0], oy+ rc3[1]};
    stroke(0);
    fill(255);
    triangle(narrow[0], narrow[1], narrow[2], narrow[3], narrow[4], narrow[5]);
  }
}
/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

DirectedGraph g=null;
int padding=30;

void setup()
{
  size(300,300);
  frameRate(24);
  noLoop();
}

void draw()
{
  background(255);
  if(g==null)
  {
    fill(0);
    String s = "Click on this canvas, and type";
    float tw = textWidth(s);
    text(s, (width-tw)/2, height/2 - 50);
/**
    s = "Press \"t\" for a tree,";
    tw = textWidth(s);
    text(s, (width-tw)/2, height/2 - 20);
**/
    s = "\"c\" for a circle graph,";
    tw = textWidth(s);
    text(s, (width-tw)/2, height/2);
/**
    s = "and \"f\" for an FD graph";
    tw = textWidth(s);
    text(s, (width-tw)/2, height/2 + 20);
    **/
  }
  else
  {
    boolean done = g.reflow();
    g.draw();
    if(!done) { loop(); } else { noLoop(); }
  }
}

void keyPressed()
{
  /**
  // tree
  if(key=='t' || key==116) {
    makeTree();
    redraw(); }
    **/
  // circular graph
  if(key=='c' || key==99) {
    makeGraph();
    redraw();  }
    /**
  // force-directed graph
  else if(key=='f' || key==102) {
    makeGraph();
    g.setFlowAlgorithm(new ForceDirectedFlowAlgorithm());
    redraw(); }
    **/
}


void makeGraph()
{
  // define a graph
  g = new DirectedGraph();

  // define some nodes
  Node n1 = new Node("1",padding,padding);
  Node n2 = new Node("2",padding,height-padding);
  Node n3 = new Node("3",width-padding,height-padding);

  // add nodes to graph
  g.addNode(n1);
  g.addNode(n2);
  g.addNode(n3);

  // link nodes
  g.linkNodes(n1,n2);
  g.linkNodes(n1,n3);
  g.linkNodes(n2,n1);
  g.linkNodes(n2,n3);
  g.linkNodes(n3,n1);
  g.linkNodes(n3,n2);
  
}
/**
void makeTree()
{
  // define a root node
  Node root = new Node("root",0,0);

  // define a Tree
  g = new Tree(root);

  // techincall g is of type DirectedGraph, so build a Tree alias:
  Tree t = (Tree) g;

  // define some children
  Node ca = new Node("a",0,0);
  Node caa = new Node("aa",0,0);
  Node cab = new Node("ab",0,0);
  Node cb = new Node("b",0,0);
  Node cba = new Node("ba",0,0);
  Node cbb = new Node("bb",0,0);
  Node cbba = new Node("bba",0,0);
  Node cbbb = new Node("bbb",0,0);
  Node cbbba = new Node("bbba",0,0);
  Node cbbbb = new Node("bbbb",0,0);

  // add all nodes to tree
  t.addChild(root, ca);
  t.addChild(root, cb);
  t.addChild(ca, caa);
  t.addChild(ca, cab);
  t.addChild(cb, cba);
  t.addChild(cb, cbb);
  t.addChild(cbb, cbba);
  t.addChild(cbb, cbbb);
  t.addChild(cbbb, cbbba);
  t.addChild(cbbb, cbbbb);
}
**/
/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

// =============================================
//      Some universal helper functions
// =============================================

// universal helper function: get the angle (in radians) for a particular dx/dy
float getDirection(double dx, double dy) {
  // quadrant offsets
  double d1 = 0.0;
  double d2 = PI/2.0;
  double d3 = PI;
  double d4 = 3.0*PI/2.0;
  // compute angle basd on dx and dy values
  double angle = 0;
  float adx = abs((float)dx);
  float ady = abs((float)dy);
  // Vertical lines are one of two angles
  if(dx==0) { angle = (dy>=0? d2 : d4); }
  // Horizontal lines are also one of two angles
  else if(dy==0) { angle = (dx>=0? d1 : d3); }
  // The rest requires trigonometry (note: two use dx/dy and two use dy/dx!)
  else if(dx>0 && dy>0) { angle = d1 + atan(ady/adx); }    // direction: X+, Y+
  else if(dx<0 && dy>0) { angle = d2 + atan(adx/ady); }    // direction: X-, Y+
  else if(dx<0 && dy<0) { angle = d3 + atan(ady/adx); }    // direction: X-, Y-
  else if(dx>0 && dy<0) { angle = d4 + atan(adx/ady); }    // direction: X+, Y-
  // return directionality in positive radians
  return (float)(angle + 2*PI)%(2*PI); }

// universal helper function: rotate a coordinate over (0,0) by [angle] radians
int[] rotateCoordinate(float x, float y, float angle) {
  int[] rc = {0,0};
  rc[0] = (int)(x*cos(angle) - y*sin(angle));
  rc[1] = (int)(x*sin(angle) + y*cos(angle));
  return rc; }

// universal helper function for Processing.js - 1.1 does not support ArrayList.addAll yet
void addAll(ArrayList a, ArrayList b) { for(Object o: b) { a.add(o); }}


