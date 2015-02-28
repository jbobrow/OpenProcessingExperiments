
class Carnivore {
  /* Carnivore object used in a-life synth */

  /* Create PVector objects to handle position, velocity and acceleration of creatures
   */
  PVector pos;
  PVector vel;
  PVector acc;

  /* Declare class variables and set default values
   */
  color c; // creature colour
  int alphaVal; // variable to hold value of calculated alpha value - expresses age in UI
  int s; // creature size expresses health in UI
  int r; // randomness to select a random sound
  int age = 600; // variable to store the current age of a creature
  int startAge = 600;
  boolean sex; // variable to store 'sex' of creature
  int health = 600; // variable to store the current health of a creature
  float maxSpeed = 5.0; // set the default maximum speed for a creature
  float avoidScale = 0.01; // set the default avoidance scale for a creature
  float runScale = 0.1; // set the default run scale for a creature
  float avoidDist = 40; // set the default avoidance distance for a creature
  float drag = 0.9; // set the default drag for a creature
  float coherenceScale = 0.01; // set the default coherence scale for a creature
  float coherenceDist = 100; // set the default coherence distance for a creature
  float alignmentScale = 0.01; // set the default alignment scale for a creature
  float alignmentDist = 100; // set the default alignment distance for a creature
  float minReproDist = 35; // set the minimun reproduction distance
  float rChance = 1; // sets the chance of a creature reproducing
  
  /* Default constructor for the Carnivore class.  Takes a PVector for position
   a colour and a size (radius of a dot).  It also assigns the velocity 
   and acceleration to the dot, randomly generates an age and generates a random 
   number (r) used to select a sound for the creature. 
   */
  Carnivore(PVector _pos, color _c, int _s) {
    pos = _pos;
    c = _c;
    s = _s;
    vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    acc = new PVector();
    age = int(random(200, 300));
    age = startAge;
    r = (int) random(3);
    sex = boolean(round(random(0,1)));
    //println(sex);
  }

  /* Master controller for the Carnivore class
   */
  void run() { 
    age(); // age creature
    alignment(); // creature alignment with others
    avoid(); // creature's avoidance of others
    bounce(); // bounce creature off the walls
    coherence(); // creature's grouping behaviour
    eatFood(); // creature's eat food behaviour
    move(); // move creature
    render(); // draw creature
    toFood(); // creature's attraction to food
  }

  /* The age() method decrements the age and health of creatures in the 
   system
   */
  void age() {
    age--; //decrement age
    health--; // decrement health
  }

  /* The alignment() method handles the alignment of creatures in the 
   system
   */
  void alignment() {
    PVector ave = new PVector();
    int count = 0;
    for(int i = 0; i < Carnivores.size(); i++) {
      Carnivore C = (Carnivore) Carnivores.get(i);
      if (pos.dist(C.pos) < alignmentDist) {
        ave.add(C.vel);
        count++;
      }
    }
    ave.div(count);
    ave.normalize();
    ave.mult(alignmentScale);
    acc.add(ave);
  }

  /* The avoid() method handles the avoidance behaviour of creatures in the 
   system
   */
  void avoid() {
    PVector av = new PVector();
    for(int i=0; i<Carnivores.size(); i++) {
      Carnivore C = (Carnivore) Carnivores.get(i);
      float dis = pos.dist(C.pos);
      if (dis < avoidDist) {
        if (sex != C.sex && pos.dist(C.pos) < minReproDist && pos.dist(C.pos) > 0 && C.age < startAge - 20) {
          float randy = random(0,rChance);
          if (randy>0.925) {
            /* sexual reproduction to spawn a creature between the reproducing
             creatures
             */
            reproduce((C.pos.x + pos.x)/2, (C.pos.y + pos.y)/2);
          }
        }
        PVector p = PVector.sub(pos, C.pos);
        float sc = avoidScale * (avoidDist - dis/avoidDist);
        p.mult(sc);
        av.add(p);
      }
    }
    acc.add(av);
  }

  /* The bounce() method handles the bounce behaviour of creatures at the 
   boundaries of the system
   */
  void bounce() {
    if(pos.x > width - (s/2)) {
      pos.x = width - (s/2);
      vel.x = vel.x * -0.9;
    }
    if(pos.x < (s/2)) {
      pos.x = (s/2);
      vel.x = vel.x * -0.9;
    }
    if(pos.y > height - (s/2)) {
      pos.y = height - (s/2);
      vel.y = vel.y * -0.9;
    }
    if(pos.y < 100 + (s/2)) {
      pos.y = 100 + (s/2);
      vel.y = vel.y * -0.9;
    }
  }

  /* The coherence() method handles the coherence behaviour of creatures in the 
   system
   */
  void coherence() {
    PVector ave = new PVector();
    int count = 0;
    for(int i = 0; i < Carnivores.size(); i++) {
      Carnivore C = (Carnivore) Carnivores.get(i);
      if (pos.dist(C.pos) < coherenceDist) {
        ave.add(C.pos);
        count++;
      }
    }
    ave.div(count);
    PVector p = PVector.sub(ave, pos);
    p.normalize();
    p.mult(coherenceScale);
    acc.add(p);
  }

  /* The eatFood() method handles the eating to food (herbivores) 
   behaviour of creatures in the system
   */
  void eatFood() {
    for (int i = 0; i < Herbivores.size(); i++) {
      Herbivore F = (Herbivore) Herbivores.get(i);
      if (pos.dist(F.pos) < F.s) {
        float val = map(pos.x, 0, width, -1, 1);
        // if a pan control is not available, this will do nothing
        carnivoreSamples[r].setPan(val); 
        carnivoreSamples[r].trigger();
        health = health + int(F.health); 
        Herbivores.remove(i);
      }
    }
  }

  /* The move() method handles the movement behaviour of creatures in the 
   system
   */
  void move() {
    vel.mult(drag); // drag - scale down velocity
    vel.limit(maxSpeed);
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  /* The render() method handles the display of creatures in the 
   system
   */
  void render() {
    fill(c);
    int bloated = s * health/600;
    ellipse(pos.x, pos.y, bloated, bloated);
  }

  /* The reproduce() method handles the reproduction behaviour of 
   creatures in the system
   */
  void reproduce(float _x, float _y) {
    //println(_x + ", " + _y);
    if(Carnivores.size() < 50){
      C = new Carnivore(new PVector(_x, _y), color(255,0,0), 5);
      Carnivores.add(C);
    }  
}

  /* The toFood() method handles the attraction to food (herbivores) 
   behaviour of creatures in the system
   */
  void toFood() {
    PVector v1 = new PVector(0, 0);
    PVector v2 = new PVector(width, height); 
    float currentMinimumDist = v1.dist(v2);
    /* Loop through food ArrayList to find nearest food (herbivores) and head 
     there
     */
    for(int i = 0; i < Herbivores.size(); i++) {
      Herbivore F = (Herbivore) Herbivores.get(i);
      if (pos.dist(F.pos) < currentMinimumDist) {
        currentMinimumDist = pos.dist(F.pos);
        PVector m = new PVector(F.pos.x, F.pos.y);  // food vector
        PVector p = PVector.sub(m,pos); // a push vector pointing to the food   
        p.mult(0.2);// scale the push vector
        acc.add(p); // add push to acceleration
      }
    }
  }
}


