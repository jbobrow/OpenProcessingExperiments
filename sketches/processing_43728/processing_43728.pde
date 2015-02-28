
import de.looksgood.ani.*;
import controlP5.*;

ControlP5 controlP5;
DropdownList algs, dir, gtypes;
DirectedGraph graph;
AniSequence seq;

ArrayList<Node> path;
LinkedList<ArrayList<Node>> frontier;
LinkedList<Node> explored;

void setup() {
  size(600,400);
  smooth();
  colorMode(RGB);
  
  controlP5 = new ControlP5(this);
  
  createAlgs();
  createDirections();
  createGraphTypes();

  Ani.init(this);
  setupAlg();
}

void createGraphTypes(){
  gtypes = controlP5.addDropdownList("graphList",230,25,100,120);
  gtypes.setItemHeight(20);
  gtypes.setBarHeight(15);
  gtypes.captionLabel().set("GraphTypes");
  gtypes.captionLabel().style().marginTop = 3;
  gtypes.captionLabel().style().marginLeft = 3;
  gtypes.valueLabel().style().marginTop = 3;
  gtypes.addItem("Simple Tree", 0);
  gtypes.addItem("Extended Tree", 1);
  gtypes.addItem("Graph", 2);
  gtypes.scroll(0);
  gtypes.setColorActive(color(255, 128));
  gtypes.setValue(0);
}

void createAlgs(){
  algs = controlP5.addDropdownList("algList",10,25,100,120);
  algs.setItemHeight(20);
  algs.setBarHeight(15);
  algs.captionLabel().set("Algorithms");
  algs.captionLabel().style().marginTop = 3;
  algs.captionLabel().style().marginLeft = 3;
  algs.valueLabel().style().marginTop = 3;
  algs.addItem("BFS", 0);
  algs.addItem("DFS", 1);
  algs.scroll(0);
  algs.setColorActive(color(255, 128));
  algs.setValue(0);
}

void createDirections(){
  dir = controlP5.addDropdownList("dirList",120,25,100,120);
  dir.setItemHeight(20);
  dir.setBarHeight(15);
  dir.captionLabel().set("Directions");
  dir.captionLabel().style().marginTop = 3;
  dir.captionLabel().style().marginLeft = 3;
  dir.valueLabel().style().marginTop = 3;
  dir.addItem("Left to right", 0);
  dir.addItem("Right to left", 1);
  dir.scroll(0);
  dir.setColorActive(color(255, 128));
  dir.setValue(0);
}

void setupAlg(){
  seq = new AniSequence(this);

  switch(int(gtypes.getValue())){
    case 0: { // Simple Tree
      graph = makeTreeTypeA();
      break;
    }
    case 1: { // Extended Tree
      graph = makeTreeTypeB();
      break;
    }
    case 2: { // Graph
      graph = makeGraphTypeA();
      break;
    }
  }
  
  boolean rtl = int(dir.getValue()) == 1;
  switch(int(algs.getValue())){
    case 0: { // BFS
      path = algBFS((GoalTree)graph, rtl);
      break;
    }
    case 1: {
      path = algDFS((GoalTree)graph, rtl);
      break;
    }
  }
  
  graph.reflow();
  addDrawers();
  
  println("_________________________");
  for (Node n : path){
    print(n.label + "; ");
  }
  
  seq.start();
}

void draw() {
  background(255);
  fill(0);

  graph.draw();
}

ArrayList<Node> algDFS(GoalTree tree, boolean rtl){
  Node root = tree.getRoot();
  path = new ArrayList<Node>();
  frontier = new LinkedList<ArrayList<Node>>();
  explored = new LinkedList<Node>();

  path.add(root);
  frontier.offer(path);

  seq.beginSequence();
  while (!frontier.isEmpty()){
    println();
    // -------------
    path = removeChoice(frontier);
    Node s = path.get(path.size()-1); // get last node from the path

    if (!explored.contains(s)){
      println("exploring "+s.label);
      explored.offer(s);

      if (tree.isGoal(s)) break;
      ArrayList<Node> links = new ArrayList<Node>(s.getOutgoingLinks());
      if (!rtl){
        Collections.reverse(links);
      }

      for (Node n : links){
        if (!explored.contains(n)){
          ArrayList<Node> newPath = new ArrayList<Node>(path);
          newPath.add(n);
          frontier.addFirst(newPath);
        }
      }
      // -------------
      printFrontier(frontier);
      addAnimationForPath(tree);
    }
  }
  
  addAnimationForPath(tree);
  seq.endSequence();
  println("Nodes expanded: "+explored.size());
  return path;
}

ArrayList<Node> algBFS(GoalTree tree, boolean rtl){
  Node root = tree.getRoot();
  seq.beginSequence();
  
  path = new ArrayList<Node>();
  frontier = new LinkedList<ArrayList<Node>>();
  explored = new LinkedList<Node>();
  
  path.add(root);
  frontier.offer(path);
  
  while (!frontier.isEmpty()){

    path = removeChoice(frontier);
    Node s = path.get(path.size()-1); // get last node from the path

    if (!explored.contains(s)){
      
      println("exploring "+s.label);
      explored.offer(s);
    
      if (tree.isGoal(s)) break;
      ArrayList<Node> links = new ArrayList<Node>(s.getOutgoingLinks());
      if (rtl){
        Collections.reverse(links);
      }

     for (Node n : links){
        if (!explored.contains(n)){
          ArrayList<Node> newPath = new ArrayList<Node>(path);
          newPath.add(n);
          frontier.addLast(newPath);
        }
      }
  
      printFrontier(frontier);
      addAnimationForPath(tree);
    } // not explored
  } // frontier exhausted
  addAnimationForPath(tree);
  seq.endSequence();
  println("Nodes expanded: "+explored.size());
  return path;
}

void addAnimationForPath(GoalTree tree){
  if (path != null && !path.isEmpty()){
    
    Node s = path.get(path.size()-1); // exploring
    float delay = (s == tree.getRoot()) ? 1 : 0;
    seq.add(Ani.to(s, .5, delay, "r1:20,r2:20"));
    seq.add(Ani.to(s, .5, "r1:5,r2:5,fcr:216,fcg:112,fcb:200"));
    
    // frontier nodes
    LinkedList<Node> fns = new LinkedList<Node>();
    for (ArrayList<Node> p : frontier){
      fns.add(p.get(p.size()-1));
    }
    
    seq.beginStep();
    for (Node n : tree.nodes){
      if (path.contains(n)){
        seq.add(Ani.to(n, .3, "fcr:216,fcg:112,fcb:200"));
        for (Node i : n.getIncomingLinks()){
          if (path.contains(i)){
            NodeEdge ne = n.getEdgeForNode(i);
            seq.add(Ani.to(ne, .3, "ecr:216,ecg:112,ecb:200"));
            break;
          }
        }
      } else if (explored != null && !explored.isEmpty() && explored.contains(n)) {
        seq.add(Ani.to(n, .1, "fcr:232,fcg:200,fcb:216"));
        for (Node i : n.getIncomingLinks()){
          NodeEdge ne = n.getEdgeForNode(i);
          seq.add(Ani.to(ne, .1, "ecr:196,ecg:196,ecb:196"));
        }
      } else if (!fns.isEmpty() && fns.contains(n)){
        for (Node i : n.getIncomingLinks()){
          if (explored.contains(i)){
            NodeEdge ne = n.getEdgeForNode(i);
            seq.add(Ani.to(ne, .3, "ecr:0,ecg:0,ecb:0"));
          }
        }
      } else {
        for (Node i : n.getIncomingLinks()){
          NodeEdge ne = n.getEdgeForNode(i);
          seq.add(Ani.to(ne, 0, "ecr:99,ecg:99,ecb:99"));
        }
      }
    }
    seq.endStep();
  }
}

ArrayList<Node> removeChoice(LinkedList<ArrayList<Node>> frontier){
  return frontier.poll();
  //return frontier.removeLast();
}

void addDrawers(){
  NodeDrawer defaultDrawer = new NodeDrawer(){
    int tr=11,tg=11,tb=11;
    Node n = null;
    color fc;
    public void draw(Node n){
      this.n = n;
      fc = color(n.fcr, n.fcg, n.fcb);
      
      if (((graph instanceof Tree) && (((Tree)graph).getRoot().equals(n))) || ((graph instanceof GoalTree) && ((GoalTree)graph).isGoal(n))){
        tr = 255;
      } else {
        tr = 11;
      }
      
      strokeWeight(1);

      fill(255);
      for(Node i: n.getIncomingLinks()){
        color c = n.getEdgeForNode(i).getEdgeColor();
        stroke(c);
        drawLine(i.x,i.y,n.x,n.y,i.r1,i.r2,n.r1,n.r2, true);
      }

      stroke(99);
      fill(fc);
      ellipse(n.x,n.y,n.r1*2,n.r2*2);
      
      fill(tr,tg,tb);
      text(n.label,n.x+n.r1+3,n.y+n.r2+3);
    }
  };
  
  graph.addNodeDrawer(defaultDrawer);
}

DirectedGraph makeGraphTypeA(){
  Node n11,n12,n13,n14,n21,n22,n23,n24,n31,n32,n33,n34,n41,n42,n43,n44;
  
  int pad = 0;
  
  n11 = new Node("start", pad, pad);
  n12 = new Node("n12",pad, pad);
  n13 = new Node("n13",pad, pad);
  n14 = new Node("n14",pad, pad);
  n21 = new Node("n21",pad, pad);
  n22 = new Node("n22",pad, pad);
  n23 = new Node("n23",pad, pad);
  n24 = new Node("n24",pad, pad);
  n31 = new Node("n31",pad, pad);
  n32 = new Node("n32",pad, pad);
  n33 = new Node("n33",pad, pad);
  n34 = new Node("n34",pad, pad);
  n41 = new Node("n41",pad, pad);
  n42 = new Node("n42",pad, pad);
  n43 = new Node("n43",pad, pad);
  n44 = new Node("n44",pad, pad);
  
  // Composing
  GoalTree tree = new GoalTree(n11);

  tree.addChild(n11,n12);
  tree.addChild(n11,n21);
  tree.addChild(n12,n13);
  tree.addChild(n12,n22);
  tree.addChild(n13,n14);
  tree.addChild(n13,n23);
  tree.addChild(n14,n24);
  
  tree.addChild(n21,n22);
  tree.addChild(n21,n31);
  tree.addChild(n22,n23);
  tree.addChild(n22,n32);
  tree.addChild(n23,n24);
  tree.addChild(n23,n33);
  tree.addChild(n24,n34);
  
  tree.addChild(n31,n32);
  tree.addChild(n31,n41);
  tree.addChild(n32,n33);
  tree.addChild(n32,n42);
  tree.addChild(n33,n34);
  tree.addChild(n33,n43);
  tree.addChild(n34,n44);
  
  tree.addChild(n41,n42);
  tree.addChild(n42,n43);
  tree.addChild(n43,n44);
  
  tree.setGoal(n23);
  
  tree.setFlowAlgorithm(new RombFlowAlgorithm(4,4));
  return tree;
}

DirectedGraph makeTreeTypeA(){
  // Root
  Node root = new Node("start", 0, 0);

  // First Level
  Node na = new Node("a", 0, 0);
  Node nb = new Node("b", 0, 0);
  Node nc = new Node("c", 0, 0);

  // Second Level
  Node naa = new Node("aa", 0, 0);
  Node nab = new Node("ab", 0, 0);
  
  Node nba = new Node("ba", 0, 0);
  Node nbb = new Node("bb", 0, 0);

  Node nca = new Node("ca", 0, 0);
  Node ncb = new Node("cb", 0, 0);
  
  // Composing
  GoalTree tree = new GoalTree(root);
  
  tree.addChild(root, na);
  tree.addChild(root, nb);
  tree.addChild(root, nc);
  
  tree.addChild(na, naa);
  tree.addChild(na, nab);
  tree.setGoal(nab);
  
  tree.addChild(nb, nba);
  tree.addChild(nb, nbb);

  tree.addChild(nc, nca);
  tree.addChild(nc, ncb);

  return tree;
}

DirectedGraph makeTreeTypeB(){
  // Root
  Node root = new Node("start", 0, 0);

  // First Level
  Node na = new Node("a", 0, 0);
  Node nb = new Node("b", 0, 0);
  Node nc = new Node("c", 0, 0);

  // Second Level
  Node naa = new Node("aa", 0, 0);
  Node nab = new Node("ab", 0, 0);
  
  Node nba = new Node("ba", 0, 0);
  Node nbb = new Node("bb", 0, 0);

  Node nca = new Node("ca", 0, 0);
  Node ncb = new Node("cb", 0, 0);
  
  Node nbaa = new Node("baa", 0, 0);
  Node nbab = new Node("bab", 0, 0);
  Node nbbb = new Node("bbb", 0, 0);
  
  // Composing
  GoalTree tree = new GoalTree(root);
  
  tree.addChild(root, na);
  tree.addChild(root, nb);
  tree.addChild(root, nc);
  
  tree.addChild(na, naa);
  tree.addChild(na, nab);
  
  tree.addChild(nb, nba);
  tree.addChild(nb, nbb);

  tree.addChild(nc, nca);
  tree.addChild(nc, ncb);
  
  tree.addChild(nba, nbaa);
  tree.addChild(nba, nbab);
  tree.addChild(nbb, nbbb);
  
  tree.setGoal(nbbb);

  return tree;
}

void printFrontier(LinkedList<ArrayList<Node>> front){
  for (ArrayList<Node> p : front){
    for (Node n : p){
      print(n.label + "; ");
    }
    print("|");
  }
  println();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    setupAlg();
  }
}

