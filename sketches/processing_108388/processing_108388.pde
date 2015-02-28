
/** AgentTest PJS 2013/09/06 by Peter Bosshard Schneider<br />
* Click to switch display mode of the agents<br />
*<br />
* Changes for PJS Compatibility:<br />
* new Plant which uses different svg-shapes instead of createShape()<br />
* changed velocity.heading() to velocity.heading2D()<br />
* left out PIE parameter in arc(x, y, w, h, startangle, endangle, PIE)
*/

LindaPop population;
Vegetation vegetation;
PFont afont;
boolean dmode = false;
PShape[] plantshapes;

void setup(){
  size(500,500,P2D); 
  //size(displayWidth,displayHeight,P2D);
  background(100);
  afont = createFont("Dialog",10);
  textFont(afont);
  smooth();
  plantshapes = new PShape[5];
  for(int i=0;i<5;i++){
    plantshapes[i] = loadShape("plant_00"+(i+1)+".svg");
  }
  population = new LindaPop();
  vegetation = new Vegetation(50);
}

void draw(){
  background(20,50,100);
  vegetation.run();
  population.run();
  fill(255);
  text("population: " + population.getPopulation() + " average health: " + nf(getAveragePopHealth(),0,2) + "% average age: " + nf(getAveragePopAge(),0,0) + " cyc ",10,height-10);
}

float getAveragePopHealth(){
  float avg, sum = 0;
  for(AgentLinda l : population.lindas){
    sum+= l.health;
  }
  avg = sum/population.lindas.size();
  return avg;
}
    
float getAveragePopAge(){
  float avg, sum = 0;
  for(AgentLinda l : population.lindas){
    sum+= l.age;
  }
  avg = sum/population.lindas.size();
  return avg;
}

void mouseReleased(){
  dmode = !dmode;
  for(AgentLinda al : population.lindas){
    al.use_debugdisplay = dmode;
  }
}
/* The autonomous AgentLinda is capable to maintain its health by eating Plants
 * from a Vegetation. For this purpose it has a view- and a chase-behavior with a certain range.
 * Until adulthood the agent grows to its max-size and then starts to breed eggs in certain intervals
 * for a certain time. If the health of the agent is too low or the age to high no new agents are
 * produced. All the agents are controlled by a population object instance of LindaPop.
 */
class AgentLinda {

  // movement and auto animation
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, -PI);
  PVector acceleration = new PVector(0, 0);
  float size;                   // current size
  float maxforce = 1.0;         // Maximum steering force
  float maxspeed = 1.0;         // Maximum speed
  float noiseoffset = 0;        // noise variables 
  float noiseinc = 0.001;       // for randomwalk
  float steps = 60;             // auto animation loop steps
  float currentstep = 1;        // current auto animation step
  float stepspeed = 1;          // auto animation speed

  // life factors
  float health = 100;           // health when born
  float rep_healthlimit = 10;   // if health lower no reproduction possible
  float rep_agelimit = 0.8;     // if older than this * max_age no reproduction possible
  float max_age = 3600;         // lifespan in cycles 
  float adult_age = max_age/5;  // before grow after breed
  float age = 0;                // current age
  float min_size = 10;          // size unit in pixels
  float max_size = 100;         // maximum size
  float breeding_time = adult_age/2; // how long to breed before birth
  float curr_breeding = breeding_time;// current breeding time
  float min_eggs = 1;           // minimum eggs
  float max_eggs = 5;           // maximum eggs
  int curr_eggs = 0;            // current number of eggs
  int reproduction_cycle = round((max_age - adult_age)/2.5); // (max_age - adult_age) % reproduction_cycle == 0
  boolean has_died = false;     // is the agent dead
  boolean is_breeding = false;  // is the agent breeding
  boolean is_reproducing = false; // is the agent ready for reproduction
  boolean has_eaten = false;    // has the agent eaten food recently

  boolean use_debugdisplay = dmode;// if true display lifedata as arcs else use custom display
  Plant food = null;

  AgentLinda(PVector l, float df) {
    location = l.get();
    size = df*min_size;
  }

  AgentLinda(PVector l, float ms, float mf) {
    location = l.get();
    size = min_size;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    currentstep = int(random(0.5, 1.0)*steps);
    health = 100;
  }

  public void run(ArrayList<AgentLinda> others) {
    if (food != null) {
      applyForce(chase(food.location.get()));
    }
    else {
      randomwalk();
    }
    view(vegetation.plants);
    update();
    wraparound();
    updateLifeData();
    display();
  }

  // Wander Behavior
  void randomwalk() {
    float angle = noise(noiseoffset)*TWO_PI;
    PVector target = new PVector(location.x+cos(angle)*max_size, location.y+sin(angle)*max_size);
    PVector desired = PVector.sub(target, location);
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
    noiseoffset+=noiseinc;
  }

  PVector chase(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(5);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(0.5);  // Limit to maximum steering force
    return steer;
  }

  PVector view (ArrayList<Plant> plants) {
    // How far can it see?
    float sightDistance = size*1.5;
    float periphery = PI/9;
    boolean detected = false;
    int detected_index = -1;

    for (Plant other : plants) {
      // A vector that points to plants and that angle
      PVector comparison = PVector.sub(other.location, location);

      // How far is it
      float d = PVector.dist(location, other.location);

      // What is the angle between the bruno and this one's current direction
      float diff = PVector.angleBetween(comparison, velocity);

      // If it's within the periphery and close enough to see it
      if (diff < periphery && d > 0 && d < sightDistance) {
        detected_index = plants.indexOf(other);
        // Plants must have a certain age to be eaten
        if (plants.get(detected_index).age > plants.get(detected_index).max_age*0.25) {
          detected = true;
          food = plants.get(detected_index);
        }

        // if a plant is detected eat it
        if ((food != null)&&(dist(food.location.x, food.location.y, location.x, location.y) < size*0.6)) {
          // reset the age of the plant to zero
          plants.get(detected_index).age = 0;
          if (health < 90) health += 10;
          food = null;
        }
      }
    }


    // Debug Drawing
    if (use_debugdisplay) {
      float currentHeading = velocity.heading2D();
      pushMatrix();
      translate(location.x, location.y);
      rotate(currentHeading);
      if (detected) {
        fill(255, 255, 100, 50);
        detected = false;
      }
      else {
        fill(255, 255, 100, 10);
      }
      noStroke();
      arc(0, 0, sightDistance*2, sightDistance*2, -periphery, periphery);
      popMatrix();
    }

    return new PVector();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);

    // Limit speed
    velocity.limit(maxspeed);

    // Move
    location.add(velocity);

    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {
    // moving direction
    float theta = velocity.heading2D() + radians(90);
    // auto animation step
    currentstep+=stepspeed;
    if (currentstep>=steps) {
      stepspeed*=-1;
    }
    else if (currentstep<=1) {
      stepspeed*=-1;
    }
    if (use_debugdisplay) {
      // debug display
      float trans = 255;
      float angst = -HALF_PI;
      float agh = angst + TWO_PI/100*health;
      float agd = angst + TWO_PI/max_age*age;
      float aga = angst + TWO_PI/max_age*adult_age;
      float ags = TWO_PI/steps;
      float agc = angst + currentstep*ags;
      float agb = angst + (TWO_PI/breeding_time*curr_breeding);
      float agegg = TWO_PI/max_eggs;
      float agarl = TWO_PI/max_age*rep_agelimit*max_age;
      float aghrl = TWO_PI/100*rep_healthlimit;

      pushMatrix();
      translate(location.x, location.y);
      rotate(theta);
      // body
      noStroke();
      fill(255);
      triangle(0, -size*0.6, size*0.3, 0, -size*0.3, 0);
      ellipse(0, 0, size, size);
      // animsteps
      fill(0, trans);
      arc(0, 0, size, size, agc, agc+ags);
      fill(255);
      ellipse(0, 0, size*0.9, size*0.9);
      // health
      fill(0, 255, 0, trans);
      arc(0, 0, size*0.9, size*0.9, angst, agh);
      stroke(0);
      line(0, 0, cos(angst+aghrl)*size*0.45, sin(angst+aghrl)*size*0.45);
      noStroke();
      fill(255);
      ellipse(0, 0, size*0.8, size*0.8);
      // age
      fill(0, 160, 255, trans);
      arc(0, 0, size*0.8, size*0.8, angst, agd);
      // adultness
      fill(255, 160, 0, trans);
      arc(0, 0, size*0.8, size*0.8, angst, aga);
      stroke(0);
      line(0, 0, cos(angst+agarl)*size*0.4, sin(angst+agarl)*size*0.4);
      noStroke();
      fill(255);
      ellipse(0, 0, size*0.7, size*0.7);
      // breeding
      if (is_breeding) {
        fill(255, 0, 0, trans);
        arc(0, 0, size*0.7, size*0.7, angst, agb);
        fill(50);
        ellipse(0, 0, size*0.6, size*0.6);
        if (curr_eggs > 0) {
          fill(255, 0, 0, trans);
          for (int i=0;i<curr_eggs;i++) {
            ellipse(cos(i*agegg)*size*0.2, sin(i*agegg)*size*0.2, size*0.1, size*0.1);
          }
        }
      }
      fill(100);
      ellipse(0, 0, size*0.3, size*0.3);
      popMatrix();
    }
    else {
      // custom display
      pushMatrix();
      translate(location.x, location.y);
      rotate(theta);
      float trans = 127 + 100.0/127.0*health;
      float preg = (breeding_time - curr_breeding)/breeding_time*size*0.3;
      float health_green = map(health, 0, 100, 0, 255);
      float age_blue = map(age, 0, max_age, 0, 255);
      float age_red = map(age, 0, adult_age, 0, 255);
      float preg_red = (breeding_time - curr_breeding)/breeding_time*255;
      color preg_clr = color(preg_red, health_green*0.5, age_blue*0.5, trans);
      color youth_clr = color(age_red, age_red, age_blue, trans);
      color adult_clr = color(age_blue, health_green, age_blue, trans);
      float egg_dist = size*0.4/max_eggs;
      float bone_dist = size*0.4/7/steps*currentstep;

      stroke(255, trans);
      strokeWeight(2);
      // legs left
      line(0, -size*0.2, -((size*0.1)+(size*0.1/steps*currentstep)), -size*0.4);
      line(-((size*0.1)+(size*0.1/steps*currentstep)), -size*0.4, -size*0.5, -((size*0.5)-(size*0.2/steps*currentstep)));
      line(0, -size*0.2, -size*0.3, -size*0.4+(size*0.1/steps*(steps-currentstep)));
      line( -size*0.3, -size*0.4+(size*0.1/steps*(steps-currentstep)), -(size*0.5), -((size*0.3)-(size*0.3/steps*currentstep)));
      line(0, -size*0.2, -size*0.3, -size*0.2+(size*0.1/steps*currentstep));
      line(-size*0.3, -size*0.2+(size*0.1/steps*currentstep), -((size*0.4)+(size*0.1/steps*currentstep)), ((size*0.2)+(size*0.1/steps*currentstep)));
      line(0, -size*0.2, -size*0.3, ((size*0.1)+(size*0.1/steps*(steps-currentstep))));
      line(-size*0.3, ((size*0.1)+(size*0.1/steps*(steps-currentstep))), -((size*0.2)+(size*0.3/steps*currentstep)), ((size*0.5)-(size*0.1/steps*currentstep)));
      // legs right
      line(0, -size*0.2, ((size*0.1)+(size*0.1/steps*(steps-currentstep))), -size*0.4);
      line(((size*0.1)+(size*0.1/steps*(steps-currentstep))), -size*0.4, size*0.5, -((size*0.3)+(size*0.2/steps*currentstep)));
      line(0, -size*0.2, size*0.3, -size*0.4+(size*0.1/steps*currentstep));
      line(size*0.3, -size*0.4+(size*0.1/steps*currentstep), (size*0.5), -((size*0.3)-(size*0.4/steps*currentstep)));
      line(0, -size*0.2, size*0.3, -size*0.2+(size*0.1/steps*(steps-currentstep)));
      line(size*0.3, -size*0.2+(size*0.1/steps*(steps-currentstep)), ((size*0.5)-(size*0.1/steps*currentstep)), ((size*0.3)-(size*0.1/steps*currentstep)));
      line(0, -size*0.2, size*0.3, ((size*0.1)+(size*0.1/steps*currentstep)));
      line(size*0.3, ((size*0.1)+(size*0.1/steps*currentstep)), (size*0.5)-(size*0.3/steps*currentstep), ((size*0.4)+(size*0.1/steps*currentstep)));
      strokeWeight(1);
      // body
      noStroke();
      fill(0, trans);
      ellipse(0, -size*0.2, size*0.1, size*0.4);
      stroke(255, trans);
      line(0, -size*0.4, 0, size*0.5);
      for (int i=0; i<7;i++) {
        line(-size*0.05/7.0*i, -size*0.4+i*bone_dist, size*0.05/7.0*i, -size*0.4+i*bone_dist);
      }
      noStroke();
      if (is_breeding) {
        fill(preg_clr);
        bezier(0.0, -size*0.2, size*0.2, -size*0.2, size*0.2 + preg, 0.0 + preg, 0.0, size*0.5);
        bezier(0.0, size*0.5, -(size*0.2 + preg), 0.0 + preg, -size*0.2, -size*0.2, 0.0, -size*0.2);
        fill(255, 255, 0, trans);
        for (int i=0;i<curr_eggs;i++) {
          ellipse(0, size*0.4 - i*egg_dist, size*0.2/curr_eggs*(i+1), egg_dist*0.5);
        }
      }
      else {
        if (age < adult_age) {
          fill(youth_clr);
        }
        else {
          fill(adult_clr);
        }
        bezier(0.0, -size*0.2, size*0.2, -size*0.2, size*0.2, 0.0, 0.0, size*0.5);
        bezier(0.0, size*0.5, -(size*0.2), 0.0, -size*0.2, -size*0.2, 0.0, -size*0.2);
      }
      // head
      fill(255, trans);
      ellipse(0, -size*0.4, size*0.3, size*0.2);
      // eyes
      stroke(0, trans);
      ellipse(-size*0.1, -size*0.45, size*0.1, size*0.1);
      ellipse(size*0.1, -size*0.45, size*0.1, size*0.1);
      fill(0, trans);
      noStroke();
      ellipse(-size*0.15+(size*0.1/steps*currentstep), -size*0.45, size*0.05, size*0.05);
      ellipse(size*0.05+(size*0.1/steps*currentstep), -size*0.45, size*0.05, size*0.05);
      popMatrix();
    }
  }


  void wraparound() {
    if (location.x < -size*0.5)location.x = width+size*0.5;
    if (location.x > width+size*0.5)location.x = -size*0.5;
    if (location.y < -size*0.5)location.y = height+size*0.5;
    if (location.y > height+size*0.5)location.y = -size*0.5;
  }

  // update size, health, age etc.
  void updateLifeData() {
    age++;
    // if older than maximum lifespan die
    if (age>max_age)has_died = true;

    // if older than 90% of maximal age get weaker
    if (age > max_age*0.9) {
      health *= 0.99;
    }

    // if health lower 1 percent die
    if (health < 1) has_died = true;

    // if not grown up grow
    if (age <= adult_age) {
      size = min_size+(max_size-min_size)/adult_age*age;
    }

    // mating conditions
    if ((age > adult_age)&&(age < max_age)&&(age%reproduction_cycle == 0)) {
      is_breeding = true;

      if (health < rep_healthlimit) is_breeding = false;

      if (age > max_age*rep_agelimit) is_breeding = false;

      if ((is_breeding)&&(curr_eggs == 0)) {
        curr_eggs = floor(random(min_eggs, max_eggs+1));
        curr_breeding = breeding_time;
      }
    }

    if ((is_breeding)&&(curr_breeding > 0)) {
      curr_breeding--;
    }

    if ((is_breeding)&&(curr_breeding == 0)) {
      is_reproducing = true;
    }
  }
}

// A Population of AgentLinda objects

class LindaPop {
  //population constants
  int criticalsize = 10;     // if population reaches this number
  int minimumrate = 1;        // if this species tends to vanish this number of creatures are made by "nature"

  ArrayList<AgentLinda> lindas; // An ArrayList for all the lindas
  AgentLinda toremove = null;
  int toadd = 0;
  PVector where = null;

  LindaPop() {
    lindas = new ArrayList<AgentLinda>(); // Initialize the ArrayList
  }

  void run() {
    if (lindas.size() < 1) {
      toadd = minimumrate;
      where = new PVector(random(width), random(height));
    }

    if (toremove != null) {
      removeLinda(toremove);
      toremove = null;
    }
    if ((toadd > 0)&&(where != null)) {
      for (int i=0;i<toadd;i++) {
        addLinda(new AgentLinda(new PVector(where.x, where.y), random(1.0, 3.0), random(0.05, 0.09)));
      }
      toadd = 0;
    }
    for (AgentLinda a : lindas) {
      if (lindas.size() > criticalsize){
        float diseasefactor = 1.0 - (criticalsize/1000.0*(lindas.size() - criticalsize));
        a.health *= diseasefactor; // overpopulation results in diseases
      }

      if (a.has_died) {
        toremove = a;
      }
      if (a.is_reproducing) {
        toadd = a.curr_eggs;
        where = a.location.get();
        where.add(new PVector(random(-1.0, 1.0), random(-1.0, 1.0)));
        a.is_reproducing = false;
        a.is_breeding = false;
        a.curr_eggs = 0;
      }
      a.run(lindas);  // Passing the entire list of lindas to each linda individually
    }
  }

  void removeLinda(AgentLinda a) {
    lindas.remove(a);
  }

  // add a bruno to the population
  void addLinda(AgentLinda a) {
    lindas.add(a);
  }

  // return population size
  int getPopulation() {
    return lindas.size();
  }
}

/* A Plant with a loaded random shape
*  requires the renderer P2D as parameter in the size()-function of your sketch
*/

class Plant {
  PVector location;
  float radius;
  float min_size = 0.0005;
  float max_size = 0.05;
  float age = 0;
  float max_age = 5000;
  float health = 100;
  PShape myshape;

  Plant(PVector loc, PShape shp) {
    location = loc;
    radius = min_size;
    myshape = shp;
  }

  void display() {
    pushStyle();
    pushMatrix();
    translate(location.x, location.y);
    scale(radius/max_size,radius/max_size);
    myshape.disableStyle(); // use processing styles
    stroke(20,25,10);
    fill(200, 255, 100, 100);
    shapeMode(CENTER);
    shape(myshape);
    popMatrix();
    popStyle();
  }

  void grow() {
    age++;
    if (age < max_age) {
      radius = min_size + (max_size - min_size)/max_age*age;
    }
  }
}

/*A Vegetation class 
* creates, arranges and maintains plants
*/

class Vegetation {
  ArrayList<Plant> plants;
  int num_plants;
  float noise_inc = 0.9967;
  float noff = 123;
  float radius = 2;


  Vegetation(int np) {
    num_plants = np;
    generate();
  }

  void generate() {
    plants = new ArrayList<Plant>();
    // generate 5 different origins
    PVector[] origins = new PVector[5];
    origins[0] = new PVector(random(width/2), random(height/2));
    origins[1] = new PVector(random(width/2, width), random(height/2));
    origins[2] = new PVector(random(width/2), random(height/2, height));
    origins[3] = new PVector(random(width/2, width), random(height/2, height));
    origins[4] = new PVector(random(width), random(height));
    // generate a number of random points inside the window as vectors
    int curr_plant = 0;             // set array index to 0
    while (curr_plant<num_plants) {
      int shapeidx =int(random(5));
      int orgidx = int(random(5));  // choose a origin randomly
      noff += noise_inc;            // increase nois offset
      float x = origins[orgidx].x + noise(noff)*random(-width/2, width/2);             // x position proposal
      float y = origins[orgidx].y + noise(noff+noise_inc)*random(-height/2, height/2); // y position proposal
      if ((x > radius)&&(x < width-radius)&&(y > radius)&&(y < height-radius)) {       // if inside window
        plants.add(new Plant(new PVector(x, y), plantshapes[shapeidx]));                                // add point to vector array
        curr_plant++;                                                                  // increase array index
      }
    }
  }

  void run() {
    for (Plant p : plants) {
      p.grow();
      p.display();
    }
  }
}



