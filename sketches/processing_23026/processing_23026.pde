
// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Toxiclibs example: http://toxiclibs.org/

// Force directed graph
// Heavily based on: http://code.google.com/p/fidgen/

class Cluster {

  // A cluster is a grouping of nodes
  ArrayList nodes;

  float diameter;
  
  int r = int(random(0,255));
 //int g = int(random(0,255));
  //int b = int(random(0,255));

  // We initialize a Cluster with a number of nodes, a diameter, and centerpoint
  Cluster(int n, float d, Vec2D center) {

    // Initialize the ArrayList
    nodes = new ArrayList();

    // Set the diameter
    diameter = d;

    // Create the nodes
    for (int i = 0; i < n; i++) {
      // We can't put them right on top of each other
      //nodes.add(new Node(center.add(Vec2D.randomVector())));
      nodes.add(new Node(center.add(Vec2D.randomVector())));
    }

    // Connect all the nodes with a Spring
    for (int i = 1; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = 0; j < i; j++) {
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j);
        // A Spring needs two particles, a resting length, and a strength
        physics.addSpring(new VerletSpring2D(pi,pj,diameter,0.02));
      }
    }
  }



  // This functons connects one cluster to another
  // Each point of one cluster connects to each point of the other cluster
  // The connection is a "VerletMinDistanceSpring"
  // A VerletMinDistanceSpring is a string which only enforces its rest length if the 
  // current distance is less than its rest length. This is handy if you just want to
  // ensure objects are at least a certain distance from each other, but don't
  // care if it's bigger than the enforced minimum.
  void connect(Cluster other) {
    ArrayList otherNodes = other.getNodes();
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = 0; j < otherNodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) otherNodes.get(j);
        // Create the spring
        //physics.addSpring(new VerletMinDistanceSpring2D(pi,pj,(diameter+other.diameter)*0.5,0.05));
        physics.addSpring(new VerletMinDistanceSpring2D(pi,pj,(diameter+other.diameter)*.4,0.05));
      }
    }
  }


  // Draw all the internal connections
  void showConnections() {

    stroke(r,0,0);
    
    VerletParticle2D pi = (VerletParticle2D) nodes.get(0);
     VerletParticle2D pj = (VerletParticle2D) nodes.get(1);
     line(pi.x,pi.y,pj.x,pj.y);    
   
  }


  
  void showConnections(Cluster other) {
    stroke(r,0,0);
    
    
    
    ArrayList otherNodes = other.getNodes();
     VerletParticle2D pi = (VerletParticle2D) nodes.get(0);
     VerletParticle2D pj = (VerletParticle2D) otherNodes.get(0);
     line(pi.x,pi.y,pj.x,pj.y);
     
    
  }
  
  

  ArrayList getNodes() {
    return nodes;
  }
}


