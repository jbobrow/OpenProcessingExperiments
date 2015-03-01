
int finalGeneration;
int noOfChildren;
float cellSeperation;
float nucleusSize;
boolean organismViable;

ArrayList<Breeder> organism;
ArrayList<Attractor> attractors;

void setup() {
  size(500, 500);

  randomSeed(hour()+minute()+second()+millis());

  finalGeneration = (int)random(75, 150);
  noOfChildren = (int)random(finalGeneration, finalGeneration*2);
  cellSeperation = width/finalGeneration/2;
  nucleusSize = cellSeperation/5; 

  organism = new ArrayList<Breeder> ();  
  organism.add(new Breeder(width/2, height/2, noOfChildren, 0));
  organismViable = true;

  attractors = new ArrayList<Attractor> ();
  attractors.add(new Attractor(width/2, height/2, 0));

  background(255);
}

void draw() {
  int endOfGeneration = organism.size();
  boolean allStagnant = true;

  if (organismViable) {
    for (int i=0; i<endOfGeneration; i++) {
      Breeder candidate = organism.get(i);
      if (candidate.breed()) {
        allStagnant = false;
      }
    }
    organismViable = !allStagnant;
  }
}

void keyReleased() {
  if (key == 's' || key == 'p') {
    saveFrame("Whitelaw.jpg");
    println("File Whitelaw.jpg saved at ", hour(), ":", minute(), ":", second());
  }
  if (key == 'a') {
    attractors.clear();
    attractors.add(new Attractor(width/2, height/2, 0));
  }
  if (key == ' ') {
    organism.clear();
    background(255);
    finalGeneration = (int)random(25, 75);
    noOfChildren = (int)random(finalGeneration, finalGeneration*2); 
    cellSeperation = width/finalGeneration/2;
    nucleusSize = cellSeperation/5; 

    organism = new ArrayList<Breeder> ();  
    organism.add(new Breeder(width/2, height/2, noOfChildren, 0));
    organismViable = true;
  }
} 

void mouseReleased() {
  attractors.add(new Attractor(mouseX, mouseY, random(1, 5)));
}

Attractor nearestAttractor(float x_, float y_) {
  Attractor nearest = attractors.get(0);
  float strongestAttraction = 0;
  for (int i=0; i<attractors.size (); i++) { 
    Attractor other = attractors.get(i);
    float otherAttraction = other.strength/dist(other.x, other.y, x_, y_);
    if (otherAttraction > strongestAttraction) {
      nearest = other;
      strongestAttraction = otherAttraction;
    }
  }
  return nearest;
}

class Attractor {
  float x;
  float y;
  float strength;
  
  Attractor(float x_, float y_, float strength_) {
    x = x_;
    y = y_;
    strength = strength_;
  }
}
class Breeder {
  float x;
  float y;
  int max_children;
  int first_child;
  int current_child;
  int generation;
  boolean stagnant;

  Breeder(float x_, float y_, int offspring, int generation_) {
    x = x_;
    y = y_;
    max_children = offspring-(int)random(2);
    generation = generation_;
    current_child = 0;
    if (generation == 0) {
      first_child = (int)random(max_children);
      println("Final Generation =", finalGeneration, ",Directions =", noOfChildren, ": Initial Direction =", first_child+1);
    } else {
      Attractor firstAttractor = nearestAttractor(x, y);
      first_child = ((int)dist(firstAttractor.x, firstAttractor.y, x, y) + generation) % max_children;
    }
    stagnant = (generation >= finalGeneration);
    display();
  }

  boolean breed() {
    if (stagnant) {
      display();
      return false;
    } else {
      current_child++;
      stagnant = current_child >= max_children;

      float childAngle = (first_child+current_child) * TWO_PI / max_children;
      float childX = x + cellSeperation * sin(childAngle);
      float childY = y + cellSeperation * cos(childAngle);
      boolean canBreed = true;

      for (int i=0; i < organism.size (); i++) {
        Breeder other = organism.get(i);
        if (other != this) {
          float otherDistance = dist(childX, childY, other.x, other.y);
          if (otherDistance <= cellSeperation) canBreed = false;
        }
      }

      if (canBreed) {
        organism.add(new Breeder(childX, childY, max_children, generation+1));
        noFill();
        stroke(0);
        line(x, y, childX, childY);
      }

      display();

      return canBreed || !stagnant;
    }
  }

  void display() {
    noStroke();
    if (stagnant) {
      fill(0);
    } else {
      fill(255, 0, 0);
    }
    ellipse(x, y, nucleusSize, nucleusSize);
  }
}



