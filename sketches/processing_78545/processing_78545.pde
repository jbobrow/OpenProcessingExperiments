
/*
#####################################
##           Evolution Sim         ##
##      Created by: Dr. Bacon      ##
#####################################

This simulation was designed to simulate the 
basic ideas behind natural selection and
outline them with organisms with a very simple genome.
Once the simulation is run, there are no controls. One
of the main flaws of this project is that there is no
graphical user interface for fiddling with the starting
values, and it must be tinkered with from within the code.
Do with the code what you will.

Also, thanks very much to Daniel Shiffman for providing me with Zoog,
it strangely improves the way I feel about the whole sketch.*/

int savedTime = millis(); //Saves the time at the start
static final int foodNum = 50; //How much food is created initially
static final int foodInterval = 500; //The at which food is created after the start
static final int orgNum = 10; //How many organisms are initially created
static final int startingEnergyLevel = 10000; //The energy each organism starts with
int i;
int passedTime;
static final ArrayList<Food> food = new ArrayList(); //Where every instance of the Food class is stored
static final ArrayList<Organism> organism = new ArrayList(); //Where every instance of the Organism class is stored
void setup() {
  size(700, 500);
  smooth();
  for (i = 0; i < orgNum; i++) {
    organism.add(new Organism(100, random(-8, 8), random(-8, 8), 50, 1));
  }
  for (i = 0; i < foodNum; i++) {
    food.add(new Food(12, 10));
  }
  for (Food foodie : food) {
    foodie.place(); //Assign each organism a randomized loaction
  }
  for (Organism org : organism) {
    org.place(); //Assign each organism a randomized location before movement begins
  }
}
void draw() {
  background(255);
  passedTime = millis() - savedTime;
  if (passedTime >= foodInterval) {
    savedTime = millis();
    food.add(new Food(12, 10));
    Food foodie = (Food) food.get(food.size() - 1);
    foodie.place();
  }
  for (Food foodie : food) {
    foodie.display(); //Display each food
  }
  for (Organism org : organism) {
    org.display(); //Display each organism
  }
  for (Organism org : organism) {
    org.move(); //Move each organism
    org.bounce(); //Bounce the other way if touching a wall
  }
  for (i = 0; i < organism.size(); i++) {
    Organism org = (Organism) organism.get(i); 
    if (org.alive()) { //Tests if the organism is alive
      //println(org.elevel);
    } else {
      //organism.remove(i);
    }
  }
}
class Food {
  int x, y;
  int r;
  int energy;
  Food (int rad, int ie) {
    r = rad;
    energy = ie;
  }
  final void place() {
    x = (int) random(r, width-r); //Random X
    y = (int) random(r, height-r); //Random Y
  }
  final void display() {
    ellipse(x,y,r,r);
  }
}
class Organism {
  int x;
  int y;
  int w; //Width
  int h; //Height
  int elevel; //Energy level
  int xspeed; //Speed at which it moves
  int yspeed; //towards x or y (in pixels/frame)
  int eLevelRep; //Energy level required to reproduce
  int eSurvive; //Energy level required to survive
  int eConsumed; //Energy that is consumed with each frame of movement
  Organism (int ielevel, float ixspeed, float iyspeed, int irepe, int ietosurv) {
    if (ixspeed == 0) {
      if (random(0, 1) == 0) {
        ixspeed = random(-8, -1);
      } else {
        ixspeed = random(1, 8);
      }
    }
    if (iyspeed == 0) {
      if (random(0, 1) == 0) {
        iyspeed = random(-8, -1);
      } else {
        iyspeed = random(1, 8);
      }
    }
    elevel = ielevel;
    xspeed = int(ixspeed);
    yspeed = int(iyspeed);
    eLevelRep = irepe;
    eSurvive = ietosurv;
    eConsumed = (xspeed + yspeed) / 8;
    if (eConsumed < 0) {
      eConsumed *= -1;
    }
  }
  final void place() {
    //Makes sure that the creatures do not go over the edges
    h = 120;
    w = 40;
    x = (int) random(w, width-w/2);
    y = (int) random(h, height-h/2);
  }
  final void display() {
    //For lack of creativity to synthesize a new type
    //of organism, I just used "Zoog" from Daniel Shiffman's
    //"Learning Processing"
    ellipseMode(CENTER); 
    rectMode(CENTER); 
    stroke(0); 
    fill(150); 
    rect(x, y, 20/2, 100/2); //Body
    fill(255); 
    ellipse(x, y-30/2, 60/2, 60/2); //Head
    fill(0); 
    ellipse(x-19/2, y-30/2, 16/2, 32/2); //Eyes
    ellipse(x+19/2, y-30/2, 16/2, 32/2); 
    stroke(0); 
    line(x-10/2, y+50/2, x-20/2, y+60/2); //Legs
    line(x+10/2, y+50/2, x+20/2, y+60/2);
  }
  final void move() {
    x += xspeed;
    y += yspeed;
    elevel -= eConsumed;
  }
  final void bounce() {
    if (x+10 >= width || x-10 <= 0) {
      xspeed *= -1;
    }
    if (y+30 >= height || y-30 <= 0) {
      yspeed *= -1;
    }
  }
  boolean alive() {
    if (elevel < eSurvive) { //If the organism has enough energy,
      return false;          //it's alive.
    } else {                 //Otherwise, it's dead.
      return true;
    }
  }
}
