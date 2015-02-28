
int popmax;
float mutationRate;
Population population;

float m = 20;
float g = 27;
float r = 1500;
PVector camVel = new PVector(0, 0, 0);

void setup() {
  size(1024, 768, P3D);
  background(0);
  sphereDetail(1);
  popmax = 1000;
  mutationRate = 0.01;
  population = new Population(mutationRate, popmax);  
  noStroke();
}

void draw() {
  lights();
  
  //println(frameRate);

  background(0);

  float angleY = map(mouseX, 0, width, PI/4, -PI/4);
  float angleX = map(mouseY, 0, height, -PI/4, PI/4);

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateY(angleY);
  camera(0, 0, r, 0, 0, 0, 0, 1, 0);

  stroke(255, 72);
  strokeWeight(0.27);

  pushMatrix();
  
  population.update(angleX, angleY);
  //system.update(angleX, angleY);
  
  popMatrix();
  popMatrix();
  
  //draw the axis if necessary
}


class Planet {
  float mass;
  PVector loc;
  PVector vel;
  PVector acc;
  boolean alive;

  Planet(PVector l, PVector v) {
    mass = m;
    loc = new PVector(l.x, l.y, l.z);
    vel = new PVector(v.x, v.y, v.z);
    acc = new PVector(0, 0, 0);
    alive = true;
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void display() {
    if (alive) {
      pushMatrix();
      translate(loc.x, loc.y, loc.z);
      //fill(255, 0, 0, 172);
      sphere(10);
      popMatrix();
    }
  }
}

class Population {
  float mutationRate;
  System[] population;
  ArrayList<System> matingPool;
  //target?
  int generations;
  boolean dead;
  int perfectScore;
  int idx;

  Population(float m, int num) {
    mutationRate = m;
    population = new System[num];
    for (int i = 0; i < population.length; i ++) {
      population[i] = new System();
    }
    //calcFitness();
    matingPool = new ArrayList<System>();
    dead = false;
    generations = 0;

    perfectScore = 1;
  }

  void calcFitness() {
    float a = 0;
    for (int i = 0; i < population.length; i ++) {
      population[i].fitness();
      a += population[i].fitness;
    }
    a /= population.length;
    println(a/60);
    
  }
  
  void update(float a, float b) {
    int deathCount = 0;
    for (int i = 0; i < population.length; i ++) {
      population[i].update(a, b);
      if (population[i].over) {
        deathCount ++;
      }
    }
    //println(deathCount);
    if (deathCount == population.length) {
      calcFitness();
      naturalSelection();
      generate();
    }
  }

  void naturalSelection() {
    matingPool.clear();

    float maxFitness = 0;
    for (int i = 0; i < population.length; i ++) {
      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
        idx = i;
      }
    }
    println(maxFitness/60);

    for (int i = 0; i < population.length; i ++) {

      float fitness = map(population[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitness * 100);
      for (int j = 0; j < n; j ++) {
        matingPool.add(population[i]);
      }
    }
  }
  
  //generate a new population
  void generate() {
    //population[0] = population[idx].crossover(population[idx]);

    for (int i =0; i < population.length; i ++) {
      int a = int(random(matingPool.size()));
      int b;
      for (b = int(random(matingPool.size())); b == a; b = int(random(matingPool.size())));
      System partnerA = matingPool.get(a);
      System partnerB = matingPool.get(b);
      System child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
    }
    idx = 0;
    generations ++;
  }
  
  boolean dead() {
    return dead;
  }
  
  int getGenerations() {
    return generations;
  }
  
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i ++) {
      total += population[i].fitness;
    }
    return total/(population.length);
  }
  
  
}

class Star {
  float mass;
  PVector loc;
  PVector vel;
  PVector acc;
  boolean dead;
  
  Star(PVector l, PVector v) {
    mass = random(m, m);
    loc = new PVector(l.x, l.y, l.z);
    vel = new PVector(v.x, v.y, v.z);
    acc = new PVector(0, 0, 0);
    dead = false;
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    //println(vel.mag());
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
    float val = f.mag();
  }
  
  void display() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    sphere(mass);
    popMatrix();
    
  }
  
  PVector attract(Star s) {
    PVector force = new PVector(loc.x-s.loc.x, loc.y-s.loc.y, loc.z-s.loc.z);
    pushStyle();
    stroke(255, 0, 0, 127);
    strokeWeight(1);
    //line(loc.x, loc.y, loc.z, s.loc.x, s.loc.y, s.loc.z);
    popStyle();
    float distance = force.mag();
    if (distance < m) {
      vel = new PVector(0, 0, 0);
      s.vel = new PVector(0, 0, 0);
      dead = true;
    }
    //println(distance);
    //distance = constrain(distance, 5, 100);
    //distance = distance+1;
    force.normalize();
    float strength = (g*mass*s.mass) / (distance*distance);
    if (dead == false) //println(strength);
    if (strength == 0) {
      dead = true;
    }
    //println(strength);
    force.mult(strength);
    if (vel.mag() == 0 && frameCount > 30) {
      force = new PVector(0, 0, 0);
    }
    return force;
  }
  
  PVector attract(Planet p) {
    PVector force = new PVector(loc.x-p.loc.x, loc.y-p.loc.y, loc.z-p.loc.z);
    pushStyle();
    stroke(0, 255, 0, 127);
    strokeWeight(1);
    //line(loc.x, loc.y, loc.z, p.loc.x, p.loc.y, p.loc.z);
    popStyle();
    //PVector force = PVector.sub(loc, p.loc);
    float distance = force.mag();
    if (distance<m/2) {
      p.alive = false;
      dead = true;
    }
    
    //distance = constrain(distance, 1, 272);
    //distance = distance+1;
    force.normalize();
    
    float strength = (g*mass*p.mass) / (distance*distance);
    if (strength<0.001) dead = true;
    force.mult(strength);
    return force;
  }
}
//the DNA class

class System {
  int starNum;
  int plaNum;
  Star[] stars;
  Planet[] planets;
  boolean over;
  float col;
  float fitness;
  PVector[] genes;
  float life;

  System( ) {
    starNum = 3;
    plaNum = 1;
    stars = new Star[starNum];
    planets = new Planet[plaNum];
    col = random(0, 255);
    over = false;
    life = 0;

    //initialize speed and location
    for (int i = 0; i < stars.length; i ++) {
      PVector location = new PVector(random(-100, 100), random(-100, 100), random(-100, 100));
      location.normalize();
      location.mult(random(0, 720));
      PVector velocity = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
      velocity.normalize();
      velocity.mult(random(0, 2.7));
      stars[i] = new Star(location, velocity);
    }

    PVector sysVel = new PVector(0, 0, 0);
    for (int i = 0; i < stars.length; i ++) {
      sysVel.add(stars[i].vel);
    }
    sysVel.div(stars.length);
    for (int i = 0; i < stars.length; i ++) {
      stars[i].vel.sub(sysVel);
    }

    //initializing the planets
    for (int i = 0; i < planets.length; i ++) {
      PVector location = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
      location.normalize();
      location.mult(random(0, 27));
      PVector velocity = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
      velocity.normalize();
      velocity.mult(random(0, 0));
      planets[i] = new Planet(location, velocity);
    }

    genes = new PVector[(stars.length+planets.length)*2];

    for (int i = 0; i <stars.length; i ++) {
      genes[i] = new PVector(0, 0, 0);
      genes[i].add(stars[i].loc);
    }
    for (int i = stars.length; i < stars.length*2; i ++) {
      genes[i] = new PVector(0, 0, 0);
      genes[i].add(stars[i-stars.length].vel);
    }
    for (int i = stars.length*2; i < stars.length*2+planets.length; i ++) {
      genes[i] = new PVector(0, 0, 0);
      genes[i].add(planets[i-stars.length*2].loc);
    }
    for (int i = stars.length*2+planets.length; i < genes.length; i ++) {
      genes[i] = new PVector(0, 0, 0);
      genes[i].add(planets[i-stars.length*2-planets.length].vel);
    }
  }


  void fitness () {
    fitness = life;
  }

  System crossover(System partner) {
    System child = new System();

    for (int i = 0; i < genes.length; i ++) {
      if (random(0, 1) >0.5) child.genes[i] = genes[i];
      else                  child.genes[i] = partner.genes[i];
    }
    
    for (int i = 0; i <stars.length; i ++) {
      child.stars[i].loc = new PVector(0, 0, 0);
      child.stars[i].loc.add(child.genes[i]);
      child.stars[i].vel = new PVector(0, 0, 0);
      child.stars[i].vel.add(child.genes[i+stars.length]);
    }
    
    for (int i = 0; i < planets.length; i ++) {
      child.planets[i].loc = new PVector(0, 0, 0);
      child.planets[i].loc.add(child.genes[i+stars.length*2]);
      child.planets[i].vel = new PVector(0, 0, 0);
      child.planets[i].vel.add(child.genes[i+stars.length*2+planets.length]);
    }
    
    return child;
  }

  void mutate(float mutationRate) {
    for (int i = 0; i <stars.length; i ++) {
      if (random(1) < mutationRate) {
        genes[i] = new PVector(1, 1, 1);
        genes[i].normalize();
        genes[i].mult(random(0, 720));
        stars[i].loc = new PVector(0, 0, 0);
        stars[i].loc.add(genes[i]);
      }
    }
    for (int i = stars.length; i < stars.length*2; i ++) {
      if (random(1) < mutationRate) {
        genes[i] = new PVector(1, 1, 1);
        genes[i].normalize();
        genes[i].mult(random(0, 2.7));
        stars[i-stars.length].vel = new PVector(0, 0, 0);
        stars[i-stars.length].vel.add(genes[i]);
      }
    }
    for (int i = stars.length*2; i < stars.length*2+planets.length; i ++) {
      if (random(1) < mutationRate) {
        genes[i] = new PVector(1, 1, 1);
        genes[i].normalize();
        genes[i].mult(random(0, 720));
        planets[i-stars.length*2].loc = new PVector(0, 0, 0);
        planets[i-stars.length*2].loc.add(genes[i]);
      }
    }
    for (int i = stars.length*2+planets.length; i < genes.length; i ++) {
      if (random(1) < mutationRate) {
        genes[i] = new PVector(1, 1, 1);
        genes[i].normalize();
        genes[i].mult(random(0, 0.27));
        planets[i-stars.length*2-planets.length].vel = new PVector(0, 0, 0);
        planets[i-stars.length*2-planets.length].vel.add(genes[i]);
      }
    }
  } 

  void update(float a, float b) {
    if (over == false) {
      life ++;
    }

    rotateX(-a);
    rotateY(-b);
    noStroke();

    for (int i = 0; i < stars.length; i ++) {
      for (int j = 0; j < stars.length; j ++) {
        if (stars[j].dead) {
          over = true;
        }
        if (i != j) {
          PVector force = stars[j].attract(stars[i]);
          stars[i].applyForce(force);
        }
      }

      stars[i].update();
      pushStyle();
      colorMode(HSB, 255, 100, 100);

      fill(col, 72, 72);
      if (over == false) {
        stars[i].display();
      }
      popStyle();
    }

    for (int i = 0; i < planets.length; i ++) {
      for (int j = 0; j < stars.length; j ++) {
        PVector force = stars[j].attract(planets[i]);
        planets[i].applyForce(force);
      }
      pushStyle();
      colorMode(HSB, 255, 100, 100, 255);
      fill(col, 100, 100);
      if (over) {
        fill(0, 0, 0);
      }
      planets[i].update();
      if (over == false) {
        planets[i].display();
      }
      popStyle();
    }
  }
}



