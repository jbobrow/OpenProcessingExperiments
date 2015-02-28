
int time;
int wait = 7000;

int nodeCount;
Node[] nodes = new Node[120];
HashMap nodeTable = new HashMap();

int labelCount;                        
Label[] labels = new Label[120];
HashMap labelTable = new HashMap();


int edgeCount;
Edge[] edges = new Edge[500];

int edgeLabelCount;
Edge[] edgeLabels = new Edge[120];    
HashMap edgeLabelTable = new HashMap();

static final color nodeColor   = #FFFFFF;
static final color selectColor = #0FF2D2;
static final color edgeColor   = #FFFFFF;

PFont font;

void setup() {
  background(0);
  size(780, 600);
  time = millis();  
  loadData();
}


void loadData() {
  
 String[] connection = loadStrings("edges.txt");
 for(int c = 0; c < connection.length; c++){
   String[] node = splitTokens(connection[c],",");
   for(int n = 0; n < node.length-1; n++){
       addEdge(node[n],node[n+1]);
   }
 }
addEdge("Embodying the Other: Human Beings, Speech, Gesture","Conversation, Cooperation, Collaboration");
addEdge("Embodying the Other: Human Beings, Speech, Gesture","Fandom: Pop Subcultures in a Digital Age");
addEdge("Embodying the Other: Human Beings, Speech, Gesture","When Strangers Meet");
addEdge("Conversation, Cooperation, Collaboration","Fandom: Pop Subcultures in a Digital Age");
addEdge("Conversation, Cooperation, Collaboration","When Strangers Meet");
addEdge("Fandom: Pop Subcultures in a Digital Age","When Strangers Meet");

addEdge("Animals, People and Those In Between","ReNatured");
addEdge("Animals, People and Those In Between","Wildlife Observation Tools: Interaction in the Wild");
addEdge("ReNatured","Wildlife Observation Tools: Interaction in the Wild");

addEdge("Evolution as a Creative Tool","DNA, Genes and Genomes");
addEdge("Evolution as a Creative Tool","Germline: DIY IGM Arts");
addEdge("DNA, Genes and Genomes","Germline: DIY IGM Arts");

}


void addEdge(String fromLabel, String toLabel) {

  Node from = findNode(fromLabel);
  Node to = findNode(toLabel);
  from.increment();
  to.increment();
  
  for (int i = 0; i < edgeCount; i++) {
    if ((edges[i].from == from && edges[i].to == to)||(edges[i].from == to && edges[i].to == from)) {
      edges[i].increment();
      return;
    }
  } 
  
  Edge e = new Edge(from, to);
  e.increment();
  e.select = true;
  if (edgeCount == edges.length) {
    edges = (Edge[]) expand(edges);
  }
  edges[edgeCount++] = e;
}



Node findNode(String label) {
  
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

void addLabel(String label){
  Label l = (Label) labelTable.get(label);
  if (l == null){
  
    l = new Label(label); 
    if(labelCount == labels.length){
      labels = (Label[]) expand(labels);
    }
    labelTable.put(label, l);
    labels[labelCount++] = l;
 
    Node n = findNode(label); 
    Edge e = new Edge(l, n);
    e.select = true;
    
    if(edgeLabelCount == edgeLabels.length){
      edgeLabels = (Edge[]) expand(edgeLabels);
    }
    edgeLabels[edgeLabelCount++] = e;
    edgeLabelTable.put(l.label, e);
    addEdgeLabel(l);
  }
  
  else
    l.select = true;
}


void removeLabel(String label){
  
  Label l = (Label) labelTable.get(label);
  l.select = false;
  removeEdgeLabel(label);
}


void addEdgeLabel(Label l){
  
  for(int i = 0; i<labels.length; i++){
     Edge e = new Edge(l,labels[i]); 
     
  }


}
void removeEdgeLabel(String label){
  Edge e = (Edge) edgeLabelTable.get(label);
  e.select = false; 
}

void draw() {
  
  background(0);
  String s = "Left click to select Right click to deselect";
//fill(50);
text(s, 10, 10, 300, 300);

  for (int i = 0 ; i < edgeCount ; i++) {
    edges[i].relax();
  }
  for (int i = 0; i < nodeCount; i++) {
    nodes[i].relax();
  }
  for (int i = 0; i < nodeCount; i++) {
    nodes[i].update();
  }
  for (int i = 0 ; i < edgeCount ; i++) {
    edges[i].draw();
  }
  for (int i = 0 ; i < nodeCount ; i++) {
    nodes[i].draw();    
  }
  

  for (int i = 0 ; i < labelCount ; i++) {
    edgeLabels[i].relax();
  }
  for (int i = 0; i < labelCount; i++) {
    labels[i].relax();
  }
  for (int i = 0; i < labelCount; i++) {
    labels[i].update();
  }
  for (int i = 0 ; i < labelCount ; i++) {
    edgeLabels[i].draw();
  }
  for (int i = 0 ; i < labelCount ; i++) {
    labels[i].draw();    
  }
  
 if(millis() - time >= wait){
   for (int i = 0 ; i < nodeCount ; i++) {
     nodes[i].fixed = true;
   }
 } 
   
}

Node selection; 

void mousePressed() {
  // Ignore anything greater than this distance

  float closest = 10;
  for (int i = 0; i < nodeCount; i++) {
    Node n = nodes[i];
    float d = dist(mouseX, mouseY, n.x, n.y);
    if (d < closest) {
      selection = n;
      closest = d;
    }

  if (selection != null) {
    if (mouseButton == LEFT) {
       selection.select = true; 
       addLabel(selection.label);                  
    } else if (mouseButton == RIGHT) {
       selection.select = false;
       removeLabel(selection.label);     
    }
  }
 }
}

void mouseDragged() {
  if (selection != null) {
    selection.x = mouseX;
    selection.y = mouseY;
  }
}


void mouseReleased() {
  selection = null;
}


class Edge {
  Node from;
  Node to;
  float len;
  int count;
  boolean select;

  Edge(Node from, Node to) {
    this.from = from;
    this.to = to;
    this.len = 50;
  }
  
  
  void increment() {
    count++;
  }
  
  
  void relax() {
    float vx = to.x - from.x;
    float vy = to.y - from.y;
    float d = mag(vx, vy);
    if (d > 0) {
      float f = (len - d) / (d * 3);
      float dx = f * vx;
      float dy = f * vy;
      to.dx += dx;
      to.dy += dy;
      from.dx -= dx;
      from.dy -= dy;
    }
  }


  void draw() {
    if(select){  
      stroke(edgeColor);
      strokeWeight(0.35);
      line(from.x, from.y, to.x, to.y);
    }
  }
}




class Node {
  float x, y;
  float dx, dy;
  boolean fixed;
  boolean select;
  String label;
  int count;
  

  Node(String label) {
    this.label = label;
    x = random(width);
    y = random(height);
  }
  
  
  void increment() {
    count++;
  }
  
  
  void relax() {
    float ddx = 0;
    float ddy = 0;

    for (int j = 0; j < nodeCount; j++) {
      Node n = nodes[j];
      if (n != this) {
        float vx = x - n.x;
        float vy = y - n.y;
        float lensq = vx * vx + vy * vy;
        if (lensq == 0) {
          ddx += random(1);
          ddy += random(1);
        } else if (lensq < 100*100) {
          ddx += vx / lensq;
          ddy += vy / lensq;
        }
      }
    }
    float dlen = mag(ddx, ddy) / 2;
    if (dlen > 0) {
      dx += ddx / dlen;
      dy += ddy / dlen;
    }
  }


  void update() {
    if (!fixed) {      
      x += constrain(dx, -5, 5);
      y += constrain(dy, -5, 5);
      
      x = constrain(x, 0, width);
      y = constrain(y, 0, height);
    }
    dx /= 2;
    dy /= 2;
  }


  void draw() {
    fill(nodeColor);
    if(select){  

      fill(selectColor);      
  }
    stroke(0);
    strokeWeight(2);
    
    ellipse(x, y, count+5, count+5);
   }
}





class Label extends Node{
Label(String label){
  super(label);
  select = true;
}


void draw(){
  if(select){
    fill(#0FF2D2);
    textSize(15);
    textAlign(CENTER);
    //if(x<width-25||x>25||y<height-25||y>25){
    //  text(label, x-25, y-25);
   // }
   // else
      text(label, x, y);  
  }
}


}


