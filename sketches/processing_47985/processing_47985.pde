
//based on Shiffman's Flock

class Flock {
  ArrayList flies; // An arraylist for all the boids

  Flock() {
    flies = new ArrayList(); // Initialize the arraylist
  }

  void run() {
    for (int i = 0; i < flies.size(); i++) {
      Fly b = (Fly) flies.get(i);  
      b.run(flies);  // Passing the entire list of boids to each boid individually
    }
  }

  void addFly(Fly b) {
    flies.add(b);
  }

}

