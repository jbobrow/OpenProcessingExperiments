
class Graph {
  // http://processing.org/reference/HashMap.html

  /*
   *  class Node {
   *  }
   *  HashMap nodes = new HashMap();
   *  nodes.put("toto", new Node(n, x, y));
   *  nodes.get("toto");
   */

  HashMap nodes;

  Graph() {
    nodes = new HashMap();
  }

  /** Ajoute ou modifie un noeud au graphe (modifie dans le cas ou meme nom employé et différentes coordonnées).
   * @param n Nom du noeud.
   * @param x Abcisse du noeud.
   * @param y Ordonnée du noeud.
   */
  void addNode(String n, int x, int y) {
    if(nodes.containsKey(n)) {
      // removeNode(n);
      // nodes.put(n, new Node(n, x, y));
      Node N_ = (Node) nodes.get(n);
      N_.moveTo(x, y);
    } else

      nodes.put(n, new Node(n, x, y));
  }
  /** Renvoie l'objet Noeud à partir de son nom.
   * @param n Nom du noeud.
   * @return objet Node.
   */
  Node getNode(String n) {
    Node N_ = (Node) nodes.get(n);

    return N_;
  }
  /** Cherche noeud plus proche d'une position.
   * @param x Abcisse position.
   * @param y Ordonnée position.
   * @return Nom du noeud.
   */
  String getClosestNode(float x, float y) {
    // println("x " + x + " // y " + y);

    float curBest = 9999;
    Node best = (Node) nodes.get(listN[0]);
    String n_ = null;
    if(nodes.size() != 0)
      for(String ni_ : (Iterable<String> )nodes.keySet()) {
        Node N_ = (Node) nodes.get(ni_);

        float d = dist(x, y, N_.x, N_.y);
        if(d < curBest) {
          curBest = d;
          best = N_;
          n_ = ni_;
        }
      }
     // println(" nom: " + best.n + " x " + best.x + " // y " + best.y);
    return n_;
  }
  /** Détruit un noeud au graphe si il existe.
   * @param n Nom du noeud.
   */
  void removeNode(String n) {
    Node N_ = (Node) nodes.get(n);
    // retire tous les liens en relation avec le noeud
    for(String ni_ : (Iterable<String> )nodes.keySet())
      removeLink(n, ni_);
       // retire le noeud en question
    nodes.remove(n);
  }
  /** Donne la liste de tous les noeuds.
   * @return La liste des noms des noeuds.
   */
  String[] getAllNodes() {
    String[] ListNodes = new String[50];
    int count = 0;
    for(String ni_ : (Iterable<String> )nodes.keySet()) {
        ListNodes[count] = ni_;
        count++;
    }
    return ListNodes;
  }
  /** Donne la liste des noeuds en lien avec un noeud donné.
   * @param n Nom du noeud dont on veut les noeuds en lien.
   * @return La liste des noms des noeuds en lien avec le noeud donné.
   */
  String[] getNodes(String n) {
    String[] ListNodes = new String[10];
    Node N_ = (Node) nodes.get(n);
    int count = 0;
    for(String ni_ : (Iterable<String> )nodes.keySet())
      if(isLink(n, ni_)) {
        ListNodes[count] = ni_;
        count++;
      }
    return ListNodes;
  }
  /** Ajoute ou modifie un lien entre deux noeuds (modifie dans le cas ou memes noeuds et différent poids attribué).
   * @param nA Premier noeud du lien.
   * @param nB Deuxième noeud du lien.
   * @param p Poids du lien. 
   */
  void addLink(String nA, String nB, double p) {
    if(!(nA.equals(nB))) {   // pas de lien de et vers un meme noeud
      Node NA_ = (Node) nodes.get(nA);
      Node NB_ = (Node) nodes.get(nB);

      NA_.links.put(nB, new Link(nA, nB, p));
      NB_.links.put(nA, new Link(nB, nA, p));
    }
  }
  /** Ajoute ou modifie un lien entre deux noeuds (modifie dans le cas ou memes noeuds et différent poids attribué).
   * @param nA Premier noeud du lien.
   * @param nB Deuxième noeud du lien.
   * ici poids du lien = distance euclidienne entre les deux noeuds
   */
  void addLink(String nA, String nB) {
    if(!(nA.equals(nB))) {   // pas de lien de et vers un meme noeud
      Node NA_ = (Node) nodes.get(nA);
      Node NB_ = (Node) nodes.get(nB);
      // ici le poids = distance euclidienne entre les deux noeuds
      double p_ = (PVector.dist(NA_.position, NB_.position)) / 100;

      NA_.links.put(nB, new Link(nA, nB, p_));
      NB_.links.put(nA, new Link(nB, nA, p_));
    }
  }
  /** Détruit un lien entre deux noeuds si il existe.
   * @param nA Premier noeud du lien.
   * @param nB Deuxième noeud du lien.
   */
  void removeLink(String nA, String nB) {
    Node NA_ = (Node) nodes.get(nA);
    Node NB_ = (Node) nodes.get(nB);
    if(isLink(nA, nB)) {
      NA_.links.remove(nB);
      NB_.links.remove(nA);
    }
  }
  /** Affirme si il y a lien entre 2 noeuds.
   * @param nA Premier noeud du lien.
   * @param nB Deuxième noeud du lien.
   * @return "vrai" ou "faux".
   */
  boolean isLink(String nA, String nB) {
    Node NA_ = (Node) nodes.get(nA);
    Node NB_ = (Node) nodes.get(nB);
    boolean a_ = false;
    for(String ni_ : (Iterable<String> )NA_.links.keySet())
      if(ni_.equals(nB))    // test si les deux string sont équivalents
        a_ = true;
       // et inverse aussi!
    for(String ni_ : (Iterable<String> )NB_.links.keySet())
      if(ni_.equals(nA))    // test si les deux string sont équivalents
        a_ = true;
    return a_;
  }
  /** Donne le poids d'un lien entre deux noeuds.
   * @param nA Premier noeud du lien.
   * @param nB Deuxième noeud du lien.
   * @return Le poids du lien où 0 si il n'y a pas de lien.
   */
  double getLink(String nA, String nB) {
    Node NA_ = (Node) nodes.get(nA);
    Link li_;
    double p_ = 0;
    if(isLink(nA, nB)) {
      li_ = (Link) NA_.links.get(nB);
      p_ = li_.p;
    }
    return p_;
  }
  /**  Cherche noeud intermédiaire entre nInit et nTarget tel que la distance entre nInit et nTarget soit minimal.
   * @param nInit Noeud initial.
   * @param nTarget Noeud cible.
   * @return Noeud intermédiaire.
   */
  /*String exploreNode(String nInit, String nTarget) {
    if(nInit == nTarget)
      return nTarget;
    String next = nInit; // initialization
    Node Ninit = (Node) nodes.get(nInit);
    Node Ntarget = (Node) nodes.get(nTarget);
    double p = 999999;
    for(String ni_ : (Iterable<String> )Ninit.links.keySet())
      if(!(ni_.equals(nInit))) {
        Node Ni_ = (Node) nodes.get(ni_);
        if((path.indexOf(ni_) == -1) && (restricted.indexOf(ni_) == -1)) { // si le noeud n'a pas été parcouru
          // double di = PVector.dist(Ni_.position, Ninit.position)+PVector.dist(Ntarget.position,Ni_.position);
          double pi = getLink(nInit, ni_) + getLink(ni_, nTarget);
          if(pi < p) {
            p = pi;
            next = ni_;
          }
        }
      }
     // println("Distance parcourue par le trajet: " + p );
    path.add(nInit);
    return next;
  }*/
 

  /**   Construit le trajet avec tous les noeuds - appel à exploreNode
   * @param nStart Noeud départ.
   * @param nEnd Noeud final.
   */
  /*void findPath(String nStart, String nEnd) {
    path.clear();
    restricted.clear();
    println(" " + nStart + " à " + nEnd);
    String next = nStart;
    int its = 0;
    int tests = 0;
    while(next != nEnd && tests < 100) {
      next = exploreNode(next, nEnd);
      // next = exploreNode(nStart,next,nEnd);
      its++;
      if(its > 500) {
        its = 0;
        tests++;
        restricted.add(path.get(path.size() - 1));
        next = (String) path.get(0);
        path.clear();
        // println(tests);
      }
    }
    if(tests < 100)
      path.add(nEnd);
    else
      background(255, 0, 0);
  }*/
  
  /**   Algorithme de Dijkstra
   * @param nStart Noeud départ.
   * @param nEnd Noeud final.
   */
  void dijkstra(String nStart, String nEnd) {
    path.clear();
    for(String ni_ : (Iterable<String> )nodes.keySet()) {
      Node N_ = (Node) nodes.get(ni_);
      N_.init();
    }
    opened.clear();
    closed.clear();
    opened.add(nStart);
    Node Ns = (Node) nodes.get(nStart);
    Ns.g = 0;
    while(opened.size() > 0) {
      String nCurrent = (String) opened.remove(0);
      // println("nCurrent: " + nCurrent);
      closed.add(nCurrent);
      if(nCurrent == nEnd)
        break;
      Node Nc = (Node) nodes.get(nCurrent);
      for(String ni_ : (Iterable<String> )Nc.links.keySet()) {
        // println("ni_: " + ni_);
        Node adjacent = (Node) nodes.get(ni_);
        Link a = (Link) Nc.links.get(ni_);
        if(adjacent.walkable && !arrayListContains(closed, ni_)) {
          if(!arrayListContains(opened, ni_)) {
            opened.add(ni_);
            adjacent.parent = Nc;
            adjacent.setG(a);
            // println("g ds open: " + adjacent.g);
          } else if(adjacent.g > Nc.g + a.p) {
            adjacent.parent = Nc;
            adjacent.setG(a);
            // println("g hors open: " + adjacent.g);
          }
        }
      }
    }
    // Path generation
    String pathNode = nEnd;
    // println(pathNode);
    double di = 0;
    while(!(pathNode.equals(nStart))) {
      path.add(pathNode);
      Node Np = (Node) nodes.get(pathNode);
      di += Np.g;
      println(di);
      Np = Np.parent;

      pathNode = Np.n;
    }
    path.add(nStart);
    Node Np = (Node) nodes.get(nStart);
    di += Np.g;
    println(di);
  }
  // Utilities

  boolean arrayListContains(ArrayList c, String nA) {
    for(int i = 0; i < c.size(); i++) {
      String o = (String) c.get(i);
      if(o == nA)
        return true;
    }
    return false;
  }
}

// Taille pour l'insertion dans JavaScool
public static final int WIDTH = 900, HEIGHT = 500;




