

int prePhase;
int nodeCount;
PFont font;

int _posx, _posy;


Node[] nodes = new Node[100];
Node selection;
HashMap nodeTable = new HashMap();

int edgeCount;
Edge[] edges = new Edge[500];
String canditates[];
Integrator[] _radius;


class Cell {

  Cell(int posx, int posy) {

    this.loadData();
    font = createFont("SansSerif", 10);
    textFont(font);

    _posx = posx;
    _posy = posy;


    canditates = new String[31];

    canditates[0] = "0";
    canditates[1] = "11";
    canditates[2] = "222";
    canditates[3] = "3333";
    canditates[4] = "44444";
    canditates[5] = "555555";
    canditates[6] = "6";
    canditates[7] = "77";
    canditates[8] = "888";
    canditates[9] = "9999";
    canditates[10] = "10";
    canditates[11] = "11";
    canditates[12] = "121";
    canditates[13] = "13131";
    canditates[14] = "1414";
    canditates[15] = "151515";
    canditates[16] = "11";
    canditates[17] = "121";
    canditates[18] = "131";
    canditates[19] = "1919";
    canditates[20] = "21";
    canditates[21] = "11";

    _radius = new Integrator[5];
      _radius[0] = new Integrator(10.0, 0.05, 0.15);
      _radius[1] = new Integrator(7.0, 0.25, 0.25);
      _radius[2] = new Integrator(5.0, 0.35, 0.35);
      _radius[3] = new Integrator(5.0, 0.45, 0.45);
      _radius[4] = new Integrator(3.0, 0.5, 0.55);
  }

  void loadData() {
    addEdge("11", "5");
    nodes[0].fixed = true;
  }  

  void addEdge(String fromLabel, String toLabel) {
    Node from = findNode(fromLabel);
    Node to = findNode(toLabel);


    Edge e = new Edge(from, to);
    if (edgeCount == edges.length) {
      edges = (Edge[]) expand(edges);
    }
    edges[edgeCount++] = e;
  }


  Node findNode(String label) {
    label = label.toLowerCase();
    Node n = (Node) nodeTable.get(label);
    if (n == null) {
      return addNode(label);
    }
    return n;
  }

  Node addNode(String label) {
    Node n = new Node(label);
    if (nodeCount == nodes.length) {
      nodes = (Node[]) expand(nodes);
    }
    nodeTable.put(label, n);
    nodes[nodeCount++] = n;


    return n;
  }


  void draw() {
    
    if (timePassage.getCurrentPhase() != -1) {

      for (int i = 0; i < edgeCount ; i++) {
        //      edges[i].len = 5*exp(1.5*sin(radians(timePassage.getTimePassage()/5))) ;
        edges[i].len = timePassage.getCurrentPhase()*8 
          +3*exp(1.2*sin(radians(timePassage.getTimePassage()/5))) ;
        edges[i].relax();
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].relax();
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].update();
      }


      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(10*exp(sin(radians(timePassage.getTimePassage()/5))) + 12, color(222, 10));
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(7*exp(sin(radians(timePassage.getTimePassage()/5))) + 10, color(#D6C6F0));//#B7A6D3//#A6C8D3
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(5*exp(sin(radians(timePassage.getTimePassage()/5))) + 10, color(#E6E873));//#B1B421
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(5*exp(sin(radians(timePassage.getTimePassage()/5)))+4, color(#F4F750));
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(3*exp(sin(radians(timePassage.getTimePassage()/5)))+4, color(#F3F5A3));
      }



      if (prePhase != timePassage.getCurrentPhase()) {
        for (int k = 0; k<2; k++) {  
          addEdge(canditates[int(random(0, 20))], canditates[int(random(0, 20))]);
        }
            _radius[0].set(50+10*exp(sin(radians(timePassage.getTimePassage()/5))));
            _radius[1].set(50+7*exp(sin(radians(timePassage.getTimePassage()/5))));
            _radius[2].set(50+5*exp(sin(radians(timePassage.getTimePassage()/5))));
            _radius[3].set(50+5*exp(sin(radians(timePassage.getTimePassage()/5))));
            _radius[4].set(50+3*exp(sin(radians(timePassage.getTimePassage()/5))));
      }
    }
      else {
        this.die();

      }


    prePhase = timePassage.getCurrentPhase();
  }

  void die() {
      for(int i=0;i < 5;i++){
        _radius[i].target(0.0);
        _radius[i].update();
      }


      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(_radius[0].value, color(222, 10));
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(_radius[1].value, color(#D6C6F0));//#B7A6D3//#A6C8D3
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(_radius[2].value, color(#E6E873));//#B1B421
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(_radius[3].value, color(#F4F750));
      }
      for (int i = 0; i < nodeCount ; i++) {
        nodes[i].draw(_radius[4].value, color(#F3F5A3));
      }
      
  }

  void init() {

    for (int tmp=0;tmp<nodeCount;tmp++) {
      nodes[tmp].label = null;
    }
    for (int tmp=0;tmp<edgeCount;tmp++) {
      edges[tmp] = null;
    }
    for (int tmp=0;tmp<nodeCount;tmp++) {
      nodes[tmp] = null;
    }
    nodeCount = 0;
    edgeCount = 0;

    nodeTable.clear();
  }
}


