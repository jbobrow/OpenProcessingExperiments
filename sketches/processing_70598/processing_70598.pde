
// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList movers; // An arraylist for all the boids

    Flock() {
    movers = new ArrayList(); // Initialize the arraylist
  }

  void run() {
    for (int i = movers.size()-1 ; i >= 0 ; i--) {
      Mover m = (Mover) movers.get(i);  
      m.run(movers);  // Passing the entire list of boids to each boid individually
    }
  }

  void addMover(Mover m) {
    movers.add(m);
  }
}


