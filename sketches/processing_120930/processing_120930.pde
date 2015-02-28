
Nodo a1, a2, a3, a4, a5, a6, a7;
Edge e1, e2, e3, e4, e5, e6, E7, E8, E9, E10, E11;
ArrayList <nodo> nodos = nuevo ArrayList <nodo> ();
ArrayList <Edge> bordes = nuevo ArrayList <Edge> ();
Dijkstra d;
void setup () {
 
  tamaño (800, 500);
  fondo (# FADC88);
  suavizar ();
  a1 = nuevo nodo (20, 40, 0);
  a2 = nuevo nodo (500, 100, 1);
  a3 = nuevo nodo (300, 300, 2);
  a4 = nuevo nodo (40, 400, 3);
  a5 = nuevo nodo (100, 250, 4);
  a6 = nuevo nodo (250, 460, 5);
  a7 = nuevo nodo (550, 400, 6);
  e1 = nuevo Edge (a1, a2, 4);
  e2 = nuevo Edge (a2, a3, 6);
  e3 = nuevo Edge (a3, a4, 5);
  e4 = nuevo Edge (a4, a5, 9);
  e5 = nuevo Edge (a1, a5, 2);
  e6 = nuevo Edge (a5, a2, 5);
  e7 = nuevo Edge (a3, a5, 2);
  e8 = nuevo Edge (A4, A6, 5);
  e9 = nuevo Edge (a3, a7, 2);
  e10 = nuevo Edge (a6, a7, 1);
  e11 = nuevo Edge (a2, a7, 3);
  nodos. añadir (a1);
  nodos. añadir (a2);
  nodos. añadir (a3);
  nodos. añadir (a4);
  nodos. añadir (a5);
  nodos. añadir (a6);
  nodos. añadir (a7);
  . bordes añaden (e1);
  . bordes añaden (e2);
  . bordes añaden (e3);
  . bordes añaden (e4);
  . bordes añaden (e5);
  . bordes añaden (e6);
  . bordes añaden (e7);
  . bordes añaden (e8);
  . bordes añaden (e9);
  . bordes añaden (e10);
  . bordes añaden (e11);
}
void keyPressed ()
{
  si ( clave == '0 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 0);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 0);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 0" , 520, 45);
  }
  si ( clave == '1 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 1);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 1);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 1" , 520, 45);
  }
  si ( clave == '2 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 2);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 2);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 2" , 520, 45);
  }
  si ( clave == '3 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 3);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 3);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 3" , 520, 45);
  }
  si ( clave == '4 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 4);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 4);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 4" , 520, 45);
  }
  si ( clave == '5 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 5);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 5);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 5" , 520, 45);
  }
  si ( clave == '6 ' )
  {
    d = nueva Dijkstra (nodos, bordes, 6);
    d.startOver ();
    fondo (# FADC88);
    d = nueva Dijkstra (nodos, bordes, 6);
    d.dijkstra ();
    d.render ();
    Tamaño del texto (30);
    accidente cerebrovascular (0);
    texto ( "Selección de Vertex: 6" , 520, 45);
  }
  si ( clave == 'c' )
  {
     
    d = nueva Dijkstra (nodos, bordes, 0);
    
    fondo (# FADC88);
    d.startOver ();
  }
  / *
  if (key == 'd') {
   fondo (# FADC88);
   imagen (img, 0,0);
   }
   * /
}
anular dibujar () {
  por (Edge d: los bordes) {
    d.render ();
  }
  por (Nodo n: nodos) {
    n.render ();
  }
 
  / *
  Nodo start = nodes.get (0);
   start.setFinalDistance (0);
   Finales Nodo = nodes.get (nodes.size () -1);
   ArrayList <nodo> CheckedNodes = new ArrayList <nodo> ();
   checkedNodes.add (start) nodos ;/ / cheque y añadirlos a los CheckedNodes;
   ArrayList <Edge> checkedEdges = new ArrayList <Edge> ();
    
   Nodo shortestDistanceNode = null;
   Nodo thisNode = null;
   shortestDistance int = 0;
   a (nodo c: CheckedNodes) {
   if (c.checkableNode () == true) {
   Nodo s = c.shortestDistanceNode ();
   s.setDistance (c);
   int d = s.getDistance ();
   if (shortestDistance == 0 | | d <shortestDistance) {
   shortestDistance = d;
   shortestDistanceNode = s;
   thisNode = c;
   }
   }
   }
    
   println (shortestDistanceNode.getConnectedEdge (thisNode) GetCheck ().);
   Edge thisEdge = shortestDistanceNode.getConnectedEdge (thisNode);
   thisEdge.edgeColor = true;
   shortestDistanceNode.setFinalDistance (shortestDistance);
   checkedEdges.add (thisEdge); / / añadir bordes facturado a los bordes marcados ArrayList
   println (thisNode.getDistance ());
   println (shortestDistanceNode.getDistance ());
    
    
    
    
   ArrayList <nodo> buena = new ArrayList <nodo> ();
   ArrayList <nodo> sogoood = new ArrayList <nodo> ();
    
   good.add (null);
   good.add (A1);
   por (Nodo n: bien) {
   if (n! = null) {
   sogoood.add (n);
   }
   }
   println (sogoood);
    
    
   * /
}
 
público de clase Nodo {
  ArrayList <Edge> connectedEdges = nuevo ArrayList <Edge> ();
  flotador x, y;
  int s, la distancia;
  booleano verificado;
 
  pública del nodo ( float x, float y, int s) {
    esta x = x.;
    este y = y.;
    este s = s.;
    checked = false ;
    distancia = Integer MAX_VALUE.;
  }
 
  pública void addEdge (Edge e) {
    . connectedEdges añadir (e);
  }
  / / Devolver todos los bordes conectados a este nodo
  pública ArrayList <Edge> getEdge () {
    volver connectedEdges;
  }
  / / Retorno distancia desde el nodo de inicio a este nodo
  pública int getDistance () {
    regresar a distancia;
  }
 
  / / Si el borde conectado a este nodo y el nodo anterior se comprueba, a continuación, establecer la distancia final de este nodo.
  pública void setFinalDistance ( int i) {
    distancia = i;
  }
 
  pública void setDistance (Nodo previousNode) {
    / / / / / / / / / / / / / / / / / / / / / / /
    por (Edge e: connectedEdges) {
      si (. e.getNode () conseguir . (0) es igual a (previousNode) | |. e.getNode () conseguir . (1) es igual a (previousNode)) {
        este . previousNode.getDistance distancia = () + e.getWeight ();
      }
    }
  }
  / / Comprobar si aún hay bordes sin control que está conectado a este nodo, si los hay, entonces es un nodo comprobable.
  pública booleano checkableNode () {
 
    por (Edge e: getEdge ()) {
      si (e.getCheck () == false ) {
        devolver cierto ;
      }
    }
    devolver false ;
  }
  / / Obtener el nodo más cercano que está conectado a este nodo si el borde que está conectado a dicho nodo no ha sido comprobado.
  / / Si los bordes se ha comprobado return null.
  pública shortestDistanceNode Nodo () {
    ArrayList <Edge> notCheckedEdges = nuevo ArrayList <Edge> ();
    por (Edge e: connectedEdges) {
      si (e.getCheck () == false ) {
        . notCheckedEdges añadir (e);
      }
    }
    si (notCheckedEdges. tamaño () == 0) {
      volver nula ;
    }
    Edge n = notCheckedEdges. llegar (0);
    por (Edge e: notCheckedEdges) {
      si (e.getWeight () <n.getWeight () && e.getCheck () == false ) {
        n = e;
      }
    }
    volver n.getPreviousNode ( este );
  }
  / / Find the Edge conectada de este nodo y otro n nodo;
  pública borde getConnectedEdge (Nodo n) {
    Edge ed = NULL ;
    por (Edge e: connectedEdges) {
      a (nodo Nodo: e.getNode ()) {
        si (node. igual a (n)) ed = e;
      }
    }
    volver ed;
  }
  pública ArrayList <nodo> destinationNodes () {
    ArrayList <nodo> destino = nuevo ArrayList <nodo> ();
    por (Edge e: getEdge ()) {
      . destino añadir (e.getPreviousNode ( este ));
    }
    volver destino;
  }
  pública void setcheck () {
    checked = cierto ;
  }
  pública booleano GetCheck () {
    volver comprobado;
  }
 
 
  pública void render () {
    si (distance! = Integer . MAX_VALUE) {
      llenar (# A231DB);
      elipse (x, y, 40, 40);
      Tamaño del texto (30);
      llenar (255);
      texto ( "" + s, x-9, y 10);
      Tamaño del texto (20);
      llenar (0);
      texto ( "Distancia más corta:" + distancia, x 30, y 25);
    }
    más {
      llenar (0, 255, 0);
      elipse (x, y, 40, 40);
      Tamaño del texto (30);
      llenar (0);
      texto ( "" + s, x-9, y 10);
    }
  }
}
público de clase Edge {
  ArrayList <nodo> nodesInEdge;
  Nodo A, B;
  int peso;
  PVector puntoMedio;
  booleano verificado;
  booleano edgeColor;
  pública Edge (nodo A, el nodo b, int w) {
    este a = a.;
    este b = b.;
    este . peso = w;
    puntoMedio getMidpoint = ();
    a.addEdge ( este );
    b.addEdge ( este );
    nodesInEdge = nuevo ArrayList <nodo> ();
    nodesInEdge. añadir (a);
    nodesInEdge. añadir (b);
    checked = false ;
    edgeColor = false ;
  }
  / / Devolver el peso de este borde
  pública int getWeight () {
    devolver el peso;
  }
  pública PVector getMidpoint () {
 
    volver nueva PVector ((a.x + bx) / 2, (a.y + by) / 2);
  }
 
  / / Devuelve los nodos en este borde
  pública ArrayList <nodo> GetNode () {
    volver nodesInEdge;
  }
  pública void setcheck () {
    checked = cierto ;
  }
  pública booleano GetCheck () {
    volver comprobado;
  }
  / / Obtener el otro nodo en este extremo;
  pública Nodo getPreviousNode (Nodo n) {
    si (nodesInEdge. get (0). igual a (n)) {
      volver nodesInEdge. conseguir (1);
    }
    más {
      volver nodesInEdge. llegar (0);
    }
  }
 
  pública void render () {
 
    si (== edgeColor verdad ) {
      accidente cerebrovascular (0);
      line (ax, ay, Bx, By);
      Tamaño del texto (20);
      texto ( "" + peso, midPoint.x-20, midPoint.y 5);
    }
    más {
      accidente cerebrovascular (# 07F524);
      line (ax, ay, Bx, By);
      llenar (255, 0, 0);
      Tamaño del texto (20);
      texto ( "" + peso, midPoint.x-20, midPoint.y 5);
    }
  }
}
 
público de clase Dijkstra {
  ArrayList nodos <nodo>;
  ArrayList bordes <Edge>;
  ArrayList <nodo> settledNodes = nuevo ArrayList <nodo> ();
  ArrayList <nodo> unsettledNodes = nuevo ArrayList <nodo> ();
  Iniciar Nodo;
  Nodo final;
  int i;
 
  pública Dijkstra ( ArrayList nodos <nodo>, ArrayList bordes <Edge>, int i) {
    estos nodos. = linfáticos;
    estos bordes. = bordes;
    este i = i.;
    iniciar los nodos =. conseguir (i);
    finales nodos =. llegar (nodes. tamaño () -1);
    start.setFinalDistance (0);
    . unsettledNodes añadir (arranque);
  }
 
  pública void render () {
    por (Edge d: los bordes) {
      d.render ();
    }
    por (Nodo n: nodos) {
      n.render ();
    }
  }
 
  pública getNodeWithLowestDistance nodo ( ArrayList <nodo> unsettledNodes) {
    Nodo no = unsettledNodes. llegar (0);
    por (Nodo n: unsettledNodes) {
      si (n.getDistance () <n.getDistance ()) {
        volver no = n;
      }
    }
    volver no;
  }
 
  públicos vacíos evaluatedNeighbors (Nodo evaluationNode) {
    a (nodo d: evaluationNode.destinationNodes ()) {
      para la (s Nodo: settledNodes) {
        si (d! = s) {
          int edgeDistance = (d.getConnectedEdge (evaluationNode)) getWeight ().;
          int newDistance = edgeDistance + evaluationNode.getDistance ();
          si (d.getDistance ()> newDistance) {
            d.setFinalDistance (newDistance);
            . unsettledNodes agregar (d);
          }
        }
      }
    }
  }
 
  pública void dijkstra () {
    mientras que (unsettledNodes. tamaño ()! = 0) {
      Nodo evaluationNode = getNodeWithLowestDistance (unsettledNodes);
      por ( int i = unsettledNodes. tamaño () -1; i> = 0; i -) {
        si (unsettledNodes. get (i) == evaluationNode) unsettledNodes.remove (i);
      }
      . settledNodes añadir (evaluationNode);
      evaluatedNeighbors (evaluationNode);
    }
  }
 
  pública void startOver () {
    por (Nodo n: nodos) {
        n.setFinalDistance ( Integer MAX_VALUE.);
       
    }
  }
}

