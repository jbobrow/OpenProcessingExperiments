
// NO ES DE MI AUTORIA, SE MODIFICA CON FINES EDUCATIVOS PARA LA MAESTRÍA EN EDUCACIÓN
/* Tomado de: OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/99816*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

Node a1, a2, a3, a4, a5, a6, a7 ,a8, a9, a10, a11;
Edge e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e21, e22;
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges=new ArrayList<Edge>();
Dijkstra d;
int punto_inicio;
int punto_final; 
int stage;

void setup() {
  punto_inicio=0;
  punto_final=4;
  
  size(800, 500);
 a1=new Node(100, 200, 0);
  a2=new Node(200, 100, 1);
  a3=new Node(300, 100, 2);
  a4=new Node(400, 100, 3);
  a5=new Node(500, 200, 4);
  a6=new Node(400, 300, 5);
  a7=new Node(300, 300, 6);
  a8=new Node(200, 300, 7);
  a9=new Node(200, 200, 8);
  a10=new Node(300, 200, 9);
  a11=new Node(400, 200, 10);
  e1=new Edge(a1, a2, 3);
  e2=new Edge(a2, a3, 2);
  e3=new Edge(a3, a4, 3);
  e4=new Edge(a4, a5, 2);
  e5=new Edge(a5, a6, 5);
  e6=new Edge(a6, a7, 6);
  e7=new Edge(a7, a8, 2);
  e8=new Edge(a1, a8, 4);
  e9=new Edge(a8, a9, 7);
  e10=new Edge(a1, a9, 5);
  e11=new Edge(a9, a10, 4);
  e12=new Edge(a10, a11, 4);
  e13=new Edge(a2, a9, 5);
  e14=new Edge(a8, a10, 5);
  e15=new Edge(a7, a10, 4);
  e16=new Edge(a6, a10, 3);  
  e17=new Edge(a2, a10, 7);
  e18=new Edge(a3, a10, 2);
  e19=new Edge(a3, a11, 6);
  e20=new Edge(a4, a11, 7);
  e21=new Edge(a6, a11, 4);
  e22=new Edge(a5, a11, 6);
   nodes.add(a1);
  nodes.add(a2);
  nodes.add(a3);
  nodes.add(a4);
  nodes.add(a5);
  nodes.add(a6);
  nodes.add(a7);
  nodes.add(a8);
  nodes.add(a9);
  nodes.add(a10);
  nodes.add(a11); 
    edges.add(e1);
  edges.add(e2);
  edges.add(e3);
  edges.add(e4);
  edges.add(e5);
  edges.add(e6);
  edges.add(e7);
  edges.add(e8);
  edges.add(e9);
  edges.add(e10);
  edges.add(e11);
   edges.add(e12);
  edges.add(e13);
  edges.add(e14);
  edges.add(e15);
  edges.add(e16);
  edges.add(e17);
  edges.add(e18);
  edges.add(e19);
  edges.add(e20);
  edges.add(e21);
  edges.add(e22);
 
}

void draw() {
  if(stage==0){
    stage++;    
    d=new Dijkstra(nodes, edges, punto_inicio,punto_final);
    d.dijkstra();
    d.render();
  }  for (Edge d: edges) {
    d.render();
  }
  for (Node n : nodes) {
    n.render();
  }
}
