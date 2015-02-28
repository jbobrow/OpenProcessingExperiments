
/**
* Population class
*
* Maintains the environment and manages the critters
*/

class Population {
  ArrayList herbivores; // An arraylist for all the herbivores people
  ArrayList carnivores; //An arraylist for the carnivores

  boolean paused=false;

  //Universe Parameters
  int carryingCapacity = 150;

  //Display parameters
  boolean displayVision = false;
  boolean colorize = false;
  
  //Extinction Reset
  int timeSinceLastHerbivore = 0; // Tracks how long it has been since the last herbivore was destroyed
  int timeUntilHerbivoreImport = 1000; // This starves carnivores, removing the least successful first by hunger. Successful ones may die of old age during this period.
  int numberOfHerbivoresToImport = 50;

  //Carnivore Import
  int timeSinceLastImport = 0;
  int timeUntilImport = 2000;
  
  //Breeding
  float mutationRate = 0.2;

  Population() {
    herbivores = new ArrayList(); // Initialize the arraylists
    carnivores = new ArrayList(); 
  }
  
  void run() {
    //Extinction check
    if(herbivores.size() < 1){
      timeSinceLastHerbivore++;
      if (timeSinceLastHerbivore > 1000){
        timeSinceLastHerbivore = 0;
        if(numberOfHerbivoresToImport % 2 > 0){
          // Splits the herbivores to come in from different edges of the screen
          for (int i = 0; i < ((numberOfHerbivoresToImport-1)/2); i++) {
            addPrey(new PVector(random(width),0)); 
          }
          for (int i = 0; i < (((numberOfHerbivoresToImport-1)/2)+1); i++) {
            addPrey(new PVector(0,random(height)));          
          }
        } else{
          for (int i = 0; i < (numberOfHerbivoresToImport)/2; i++) {
            addPrey(new PVector(random(width),0)); 
            addPrey(new PVector(0,random(height)));          
          }
       }
      }
    }
    timeSinceLastImport++; // Random predator wanders in from nearby
    if(timeSinceLastImport > timeUntilImport){
        addPredator();
        timeSinceLastImport = 0;
        timeUntilImport = 2000 + int(random(-500,500));
    }
    //Prey
    for (int i = 0; i < herbivores.size(); i++) {
      Prey p = (Prey) herbivores.get(i);  
      if(!paused){
        p.run(herbivores, carnivores);  // Passing the entire list of people to each prey individually
        if(p.reproduce() && herbivores.size() < carryingCapacity){
          population.addPrey(new PVector(p.locx(),p.locy()), p.breed(mutationRate)); // clones itself with mutation
        }
        if(p.tooOld()){ herbivores.remove(p); }
      }
      p.render(displayVision, colorize);
    }
    //Predators
    for (int i = 0; i < carnivores.size(); i++) {
      Predator z = (Predator) carnivores.get(i);  //carnivores use z instead of p.
      if(!paused){
        z.run(carnivores, herbivores);  // Passing the entire list of carnivores to each boid individually
        if(z.reproduce()){
          addPredator(new PVector(z.locx(), z.locy()), z.breed(mutationRate)); //clones itself with mutation
        }
        if(z.tooOld()){
          carnivores.remove(z);
        }
      }
      z.render(displayVision, colorize);
    }
    //Collision Detection
    for (int i = 0; i < carnivores.size(); i++){
      Predator z = (Predator) carnivores.get(i);
      int dying = z.eat(herbivores); //Who, if anyone, is getting eaten?
      if (dying >= 0){
        Prey beingEaten = (Prey) herbivores.get(dying);
        herbivores.remove(dying);
        z.animalConsumed();
      }  
    }
   }
   
// Methods for adding new critters w. convenience wrappers

  void addPrey(Prey p) {
    herbivores.add(p);
  }
  
  void addPrey(PVector h, int[] chrome) {
    Prey p = new Prey(h, chrome);
    herbivores.add(p);
  }
  
  void addPrey(PVector h) {
    int[] chrome = {int(random(10)),int(random(10)),int(random(10)),int(random(10)),int(random(10)),int(random(10)),int(random(10))};
    addPrey(h, chrome);
  }
  
  void addPrey() {
    addPrey(new PVector(random(width),random(height)));
  }
  
  void addPredator(PVector p, int[] chrome) {
    Predator z = new Predator(p,chrome);
    carnivores.add(z);
  }
  
  void addPredator(PVector p) {
    int[] chrome = {int(random(10)),int(random(10)),int(random(10)),int(random(10)),int(random(10)),int(random(10)),int(random(10))};
    addPredator(p, chrome);
  }
  
  void addPredator() {
    addPredator(new PVector(random(width),random(height)));
  }

// Methods for changing the render and visualization options
  void vision(){
    if (displayVision){displayVision=false;}else{displayVision=true;}
  }
  
  void colorize(){
    if (colorize){colorize=false;}else{colorize=true;}
  }

  void pause(){
    if (paused){paused=false;}else{paused=true;}
  }

}

