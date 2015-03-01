
Flock flock;
PlantSystem ps;
SnakeSystem ss;
import controlP5.*;
ControlP5 cp5;
ControlP5 Mcp5;
ControlP5 Bcp5;
import java.util.Iterator;
PFont f;
Buttons buttons;
MainGui mainGui;
GeneGui bGui;
SGeneGui sGui;
PGeneGui pGui;
boolean gameOn;
int psSize, ssSize, flockSize;
boolean showMenu = true;


void setup(){
  size(800,600);
  smooth();
  psSize = 6;
  ssSize = 3;
  flockSize = 25;
  cp5 = new ControlP5( this ); //system parameters
  Mcp5 = new ControlP5(this); // main parameters
  Bcp5 = new ControlP5(this); //buttons - these are always visible
  f = createFont("Georgia",16,true);
  flock = new Flock();
  ss = new SnakeSystem();
  ps = new PlantSystem();
  for (int p = 0; p < psSize; p++){
    ps.addPlant();
  }
  for (int s = 0; s < ssSize; s++){
    ss.addSnake(random(width), random(height));
  }
  for (int i = 0; i < flockSize; i++){
    flock.addBoid(random(width), random(height));
  }
  buttons = new Buttons();
  mainGui = new MainGui(flockSize, ssSize, psSize, "No of Boids", "No of Snakes", "No of Plants");
  bGui = new GeneGui("Boid");
  sGui = new SGeneGui("Snake");
  pGui = new PGeneGui("Plant");
  gameOn = false;
}

void draw(){
  //saveFrame("frames/####.");
  
  background(150);
  if (gameOn){
  cp5.hide();
  Mcp5.hide();
  flock.run();
  ps.run();
  ss.run();
  fill(0);
  textFont(f);
  float average = flock.getAverageAge();
  float snakeAve = ss.getAverageAge();
  text("Number of Boids: " + flock.boids.size(),10,20);
  text("Average Age: " + int(average),10,40);
  text("Number of Snakes: " + ss.snakes.size(),10,60); 
  text("Average Snake Age: " + int(snakeAve),10,80);
  } else {
    cp5.show();
    Mcp5.show();
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    restart();  
  }
  if (key == ' '){
    saveFrame("frames/file####.jpg");
  }
}

void restart(){
  flock = new Flock();
  ss = new SnakeSystem();
  ps = new PlantSystem();
  for (int s = 0; s < ssSize-1; s++){
    ss.addSnake(random(width), random(height));
  }
  for (int i = 0; i < flockSize-1; i++){
    flock.addBoid(random(width), random(height));
  }
  for (int p = 0; p < psSize-1; p++){
    ps.addPlant();
  }
}

void resetParams(){
  psSize = 6;
  ssSize = 3;
  flockSize = 25;
  mainGui = new MainGui(flockSize, ssSize, psSize, "No of Boids", "No of Snakes", "No of Plants");
  bGui = new GeneGui("Boid");
  sGui = new SGeneGui("Snake");
  pGui = new PGeneGui("Plant");
}

class Boid {
  PVector location;
  PVector velocity;
  PVector acceleration;
  Genetics g;
  float r;
  float wandertheta;
  String title;

  
  Boid(float x, float y){
    acceleration = new PVector(random(-1,1),random(-1,1));
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    title = "Boid";
    g = new Genetics();
    r = 3.0;
    wandertheta = 0;
  }
  
  void run(ArrayList<Boid> boids){
    update();
    borders();
    display();
    behaviour(boids);
    lifeCycle();
    learn(boids);
    g.updateGenetics();
    
  }
  
  void borders(){
    if (location.x - r*2 > width - r*2){location.x = r*2;}
    if (location.x + r*2 < 0){location.x = width-r*2;}
    if (location.y-r*2 > height){location.y = r*2;}
    if (location.y + r*2< 0){location.y = height-r*2;}
  }
  
  void update(){
    velocity.add(acceleration);
    //velocity.limit(g.speed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void wander() {
    float wanderR = 1;         // Radius for our "wander circle"
    float wanderD = 400;         // Distance for our "wander circle"
    float change = 0.3;
    wandertheta += random(-change,change);     // Randomly change wander theta

    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = velocity.get();    // Start with velocity
    circleloc.normalize();            // Normalize to get heading
    circleloc.mult(wanderD);          // Multiply by distance
    circleloc.add(location);               // Make it relative to boid's location
    
    float h = velocity.heading2D();        // We need to know the heading to offset wandertheta

    PVector circleOffSet = new PVector(wanderR*cos(wandertheta+h),wanderR*sin(wandertheta+h));
    PVector target = PVector.add(circleloc,circleOffSet);
    PVector destination = seek(target);
    destination.limit(g.speed);
    applyForce(destination);
    

  }  
  
  void behaviour(ArrayList<Boid> boids){
    
    forget(ps.deadPlants); //forget positions of all plants that are now dead
    //Avoid predators
    PVector flee = new PVector();
    for (Snake s : ss.snakes){
      flee = avoid(s.location);
      flee.mult(1.0);
      applyForce(flee);
    }
    //hungry
    if (g.hungry && g.fearFactor < 75){
      detectFood(ps.plants);
    }
    else if (!g.hungry && g.lifespan < 60 && g.fertility >= 100){
       flock(boids);
    }
    else if (g.fearFactor >= 75){ 
      flock(boids); //safety in numbers
      } else {
        wander();
        PVector sep = separate(boids);
        sep.mult(1.0);
        applyForce(sep);
      }
     // avoid poisonous plants
    for (PVector yuk: g.inedible){
      PVector ignore = avoid(yuk);
      ignore.mult(1.0);
      applyForce(ignore);
    }
  }
    
  
  void flock(ArrayList<Boid> boids){

      PVector coh = cohesion(boids); 
      PVector sep = separate(boids);
      PVector ali = align(boids);
      
      coh.mult(g.cohStrength);
      sep.mult(g.sepStrength);
      ali.mult(g.aliStrength);
      
      applyForce(coh);
      applyForce(sep);
      applyForce(ali);
  }

  
  PVector separate(ArrayList<Boid> boids){
    int count = 0;
    float desiredSeparation = r*4;
    PVector sum = new PVector();
    PVector diff = new PVector();
    for (Boid other: boids){
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredSeparation)){
        diff.x = location.x;
        diff.y = location.y;
        diff.sub(other.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0){
      sum.div(count);
      sum.setMag(g.speed);
      sum.sub(velocity);
      sum.limit(g.force);
      return sum;
    } else {
      return new PVector(0,0);
    }
  }
  void detectFood(ArrayList<Plant> plants) {
    for (Plant p : plants){
      if (g.inedible.contains(p.location)){
        PVector flee = avoid(p.location);
        flee.mult(1.0);
        applyForce(flee);
      } else {
      if (p.active){
        float targetDist = g.senseFoodDistance; // only detect food within this distance
        float d = PVector.dist(p.location, location);
        if (d < targetDist){
          PVector desired = PVector.sub(p.location, location);
          float approach = desired.mag();
          desired.normalize();
          if (approach < 75){ //slow down as approaching food
            float m = map(approach,0,100,0,g.speed);
            desired.mult(m);
            } else {
            desired.mult(g.speed*(p.r+p.g.lifespan));
            }
          desired.sub(velocity);
          desired.limit(g.force);
          applyForce(desired);
          if (p.eaten(location)){
            eat(p.location, p.poisonous);
          }
        }
    }
    }
    }
  }
  
  PVector seek(PVector target){
    PVector desired = PVector.sub(target,location);
    float d = desired.magSq()/10;
    desired.normalize();
    if (d < 50) { //slow down when approaching
      float m = map(d,0,100,0,g.speed);
      desired.mult(m);
    } else {
      desired.mult(g.speed);
    }
    desired.sub(velocity);
    desired.limit(g.force);
    return desired;
  }
    
  PVector align(ArrayList<Boid> boids){
    float neighbourDist = 50; //only calculate average based on other boids within this distance
    PVector sum = new PVector(0,0);
    int count = 0;
    //add up all velocities and calculate average
    for (Boid other : boids){
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbourDist)){
      sum.add(other.velocity);
      count++;
      }
    }
    if (count > 0){
      sum.div(count); //only calculate average based on number of boids within distance
      sum.normalize();
      sum.mult(g.speed);
      
      sum.sub(velocity);
      sum.limit(g.force);
      return sum;
    } else {
      return new PVector(0,0);
    }
  }
  
  PVector cohesion(ArrayList<Boid> boids){
    float neighbourDist = g.cohesionDistance;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other : boids){
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbourDist)){
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0){
      sum.div(count);
      if (g.fertility >= 100){
      reproduce(boids);
      }
      return seek(sum);
    } else {
      return new PVector(0,0);
    }
  }
  
  PVector avoid(PVector predator){
    g.fearFactor = constrain(g.fearFactor,0,100);
    float targetDistance = dist(location.x, location.y, predator.x, predator.y);
    if (targetDistance < g.senseThreatDistance){
    PVector desired = PVector.sub(predator, location);
    desired.normalize();
    desired.mult(-1*g.fleeSpeed); //multiply by -1
    desired.sub(velocity);
    desired.limit(g.fleeForce);
    g.fearFactor += 10;
    return desired;

    } else {
      g.fearFactor -= 0.5;
      return new PVector(0,0);

    }
  }
  
  void learn(ArrayList<Boid> boids){ //teach other boids where poisonous plants are
    float neighbourDist = 50;
    for (Boid other : boids){
      float d = PVector.dist(location, other.location);
      if (d <= neighbourDist && d > 0){
         for (PVector yuk : g.inedible){ //learn new locations
            if (!other.g.inedible.contains(yuk)){
              other.g.inedible.add(yuk);
            }
         }

      }
    }
  }
  
  void forget(ArrayList<Plant> deadPlants){ //forget location of all dead plants
    for (Plant old: deadPlants){
      if (g.inedible.contains(old.location)){
        g.inedible.remove(old);
      }
    }
  }
  
  void eat(PVector target, boolean poison) {
    if (poison){
      g.lifespan += g.poisonAge;
      g.energy -= g.poisonEnergy;
      g.inedible.add(target);
    } else {
     g.energy += g.replenish;
     g.edible.add(target);
    }
  }
  
  void reproduce(ArrayList<Boid> boids){
    float neighbourDist = 20;
    //if (random(1)<0.40){ //only reproduce if energy levels at 75% and boid is not too old AND there is 40% chance of mating
    for (Boid other : boids){
      float d = PVector.dist(location, other.location);
      if (d <= neighbourDist && d > 0) {
        g.pregnant = true;
        g.energy -= 25; //energy taken to reproduce
        g.fertility = 0; //reset fertility to zero - boid can only give birth when this is at 100
      }

    }
    //}
    

  }

  void lifeCycle(){
    g.lifespan = constrain(g.lifespan,0,100);
    g.lifespan += g.ageSpeed;
    g.energy -= g.tireSpeed;
    g.fertility += g.fertilitySpeed;
    if (g.energy < 60){
      g.hungry = true;
    } else {
      g.hungry = false;
    }
  }
  
  void display(){
    float theta = velocity.heading() + PI/2;
    float age = map(g.lifespan, 0,100,255,0);
    fill(175,75,180,age);
    stroke(0,age);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
  boolean isDead(){
     if (g.lifespan >= 100.0 | g.energy <= 0) {
       return true;
     } else {
       return false;
     }
   }
   
  boolean eaten(PVector prey){
    if (prey.x < location.x + r*2 && prey.x > location.x - r*2 && prey.y < location.y + r*2 && prey.y > location.y - r){
      g.lifespan = 100;
      g.energy = 0;
      return true;
    } else {
      return false;
    }
  } 
}

class Flock {
  ArrayList<Boid> boids;
  int newBoids;
  
  Flock(){
    boids = new ArrayList<Boid>();
    newBoids = 0;
  }
  
  void run(){
    giveBirth(random(width),random(height));
    Iterator<Boid> it = boids.iterator();
    while(it.hasNext()){
      Boid b = it.next();
      b.run(boids);
      if (b.isDead()){
        it.remove();
      }
    }
    for (Boid b: boids){
      if (b.g.pregnant){
        newBoids += 1;
        b.g.pregnant = false;
      }
    }
  }
  
  void giveBirth(float x, float y){
    for (int i = 0; i <= newBoids; i++){
      boids.add(new Boid(x,y));
      newBoids -= 1;
    }
  }
  
  void addBoid(float x, float y){
      boids.add(new Boid(x,y));
  }
  
  float getAverageAge(){
    float totalAge = 0;
    float averageAge = 0;
    for (Boid b: boids){
      totalAge += b.g.lifespan;
      
    }
    averageAge = totalAge / boids.size();
   return averageAge; 
  }
}
class PDefault {
  float ageSpeed, poisonProb;
  
  PDefault() {
    ageSpeed = 0.05;
    poisonProb = 0.20; //20% chance of being poisonous
    
  }
}


class PGenetics {
  float lifespan;
  float ageSpeed;
  float poisonProb;
  
  PGenetics() {
    lifespan = 0;
    ageSpeed = 0.05;
    poisonProb = 0.20;
  }
  
  void updateGenetics(){
    updateParameters();
  }
  
  void updateParameters(){
    ageSpeed = pGui.pAgeSpeed;
    ps.poisonProb = pGui.poisonProb;
  }
  
}
    
class BDefault {
    float tireSpeed, ageSpeed, speed, force, fleeSpeed, fleeForce,fertilitySpeed, replenish, cohStrength,sepStrength, aliStrength;
    
    BDefault(){
      speed = 1.0;
      force = 0.1;
      fleeSpeed = 3.0;
      fleeForce = 0.5;
      ageSpeed = 0.02;
      tireSpeed = 0.04;
      fertilitySpeed = 0.1;
      replenish = 1.5;
      cohStrength = 1.5;
      sepStrength = 1.0;
      aliStrength = 1.0;     
    }
}    

class Genetics {
  float speed, force;
  float fleeSpeed, fleeForce; //speed to flee threats
  float lifespan;
  float energy;
  float tireSpeed, ageSpeed, fertilitySpeed, replenish;
  float poisonAge, poisonEnergy;
  boolean pregnant, hungry;
  float fertility;
  float cohesionDistance;
  float senseFoodDistance; 
  float senseThreatDistance;
  float cohStrength,sepStrength, aliStrength;
  ArrayList<PVector> inedible = new ArrayList();
  ArrayList<PVector> edible = new ArrayList();
  float fearFactor; //fear level
  BDefault bd;

  
  
  Genetics(){
    bd = new BDefault();
    speed = bd.speed;
    force = bd.force;
    fleeSpeed = bd.fleeSpeed;
    fleeForce = bd.fleeForce;
    lifespan = 0;
    energy = 100;
    ageSpeed = bd.ageSpeed;
    tireSpeed = bd.tireSpeed;
    poisonAge = 20;
    poisonEnergy = 40;
    fertilitySpeed = bd.fertilitySpeed;
    pregnant = false;
    fertility = 0;
    inedible = new ArrayList<PVector>();
    edible = new ArrayList<PVector>();
    hungry = false;
    senseFoodDistance = 150;
    senseThreatDistance = 50;
    cohesionDistance = 50;
    fearFactor = 0;
    replenish = bd.replenish;
    cohStrength = bd.cohStrength;
    sepStrength = bd.sepStrength;
    aliStrength = bd.aliStrength;

  }
  
  void updateGenetics(){
    if (lifespan > 60){
      speed = 0.5;
      fleeSpeed = 0.5;
      fleeForce = 0.01;
      fearFactor += 75;
    }
    if (energy < 20){
      speed = 0.5;
      fleeSpeed = 0.5;
      fleeForce = 0.01;
      fearFactor += 75;
    }
    if (fearFactor > 75){ //heighten awareness of danger
      senseThreatDistance = 150;
      cohesionDistance = 500;
    } else {
      senseThreatDistance = 50;
      cohesionDistance = 50;
    }
    
    updateParameters();
  }
  
  void updateParameters(){
    speed = bGui.bSpeed;
    force = bGui.bForce;
    fleeSpeed = bGui.bFleeSpeed;
    fleeForce = bGui.bFleeForce;
    tireSpeed = bGui.bTireSpeed;
    ageSpeed = bGui.bAgeSpeed;
    fertilitySpeed = bGui.bFertilitySpeed;
    replenish = bGui.bReplenish;
    cohStrength = bGui.bCohStrength;
    sepStrength = bGui.bSepStrength;
    aliStrength = bGui.bAliStrength;    
  }

}

class SDefault {
  float speed, force, fleeSpeed, fleeForce, tireSpeed, ageSpeed, fertilitySpeed, replenish;
  
  SDefault() {
    speed = 1.0;
    force = 0.1;
    fleeSpeed = 4.0;
    fleeForce = 1.0;
    ageSpeed = 0.01;
    tireSpeed = 0.04;
    fertilitySpeed = 0.1;
    replenish = 12.0;
  }
}

class SGenetics {
  float speed, force;
  float fleeSpeed, fleeForce; //speed to flee threats
  float lifespan;
  float energy;
  float tireSpeed, ageSpeed, fertilitySpeed, replenish;
  float poisonAge, poisonEnergy;
  boolean pregnant, hungry;
  float fertility;
  float cohesionDistance;
  float senseFoodDistance; 
  float senseThreatDistance;
  ArrayList<PVector> inedible = new ArrayList();
  ArrayList<PVector> edible = new ArrayList();
  float fearFactor; //fear level
  SDefault sd;

  
  SGenetics(){
    sd = new SDefault();
    speed = sd.speed;
    force = sd.force;
    fleeSpeed = sd.fleeSpeed;
    fleeForce = sd.fleeForce;
    lifespan = 0;
    energy = 100;
    ageSpeed = sd.ageSpeed;
    tireSpeed = sd.tireSpeed;
    fertilitySpeed = sd.fertilitySpeed;
    pregnant = false;
    fertility = 0;
    inedible = new ArrayList<PVector>(); //not using at moment but may do in future
    edible = new ArrayList<PVector>();
    hungry = false;
    senseFoodDistance = 150;
    senseThreatDistance = 50;
    cohesionDistance = 400;
    fearFactor = 0;
    replenish = sd.replenish;

  }
  
  
  void updateGenetics(){
    if (lifespan > 90){
      speed = 0.5;
      fleeSpeed = 3.0;
      fleeForce = 0.01;
    }
    if (energy < 10){
      speed = 0.5;
      fleeSpeed = 3.0;
      fleeForce = 0.01;
    }    
    updateParameters();
  
  }
  
  
  void updateParameters(){
    tireSpeed = sGui.sTireSpeed;
    ageSpeed = sGui.sAgeSpeed;
    fertilitySpeed = sGui.sFertilitySpeed;
    replenish = sGui.sReplenish;
  }
  
}


class MainGui {

  int value1;
  int value2;
  int value3;

  MainGui(int _value1, int _value2, int _value3, String s1, String s2, String s3) {
    value1 = _value1;
    value2 = _value2;
    value3 = _value3;

    Mcp5.addTextlabel("Mlabel")
       .setText("Main Parameters")
       .setPosition(560, 5)
       .setColorValue(000)
       .setFont(createFont("Georgia",20))
       ;   

   
    Mcp5.addSlider("value1")
       .setColorCaptionLabel(0)
       .setPosition(560,35)
       .setRange( 1, 50 )
       .plugTo( this, "value1" )
       .setValue( value1 )
       .setLabel(s1)
       .setNumberOfTickMarks(50)
       ;
       
    Mcp5.addSlider("value2")
       .setColorCaptionLabel(0)
       .setPosition(560,55)
       .setRange( 1, 25 )
       .plugTo( this, "value2" )
       .setValue(value2)
       .setLabel(s2)
       .setNumberOfTickMarks(25)
       ;
       
    Mcp5.addSlider("value3")
       .setColorCaptionLabel(0)
       .setPosition(560,75)
       .setRange( 1, 25 )
       .plugTo( this, "value3" )
       .setValue( value3)
       .setLabel(s3)
       .setNumberOfTickMarks(25)
       ;
 
    Mcp5.addTextlabel("label")
       .setText("The God Delusion")
       .setPosition(175,50)
       .setColorValue(0xffffff00)
       .setFont(createFont("Georgia",28))
       ;

    Mcp5.addTextarea("txt")
       .setPosition(75,100)
       .setSize(450,445)
       .setFont(createFont("arial",14))
       .setLineHeight(14)
       .setColor(color(0))
       .setColorBackground(color(255,100))
       .setColorForeground(color(255,100))
       .setText("Ever wondered what it would be like to be a God? This simulation will sort of allow you to play out that fantasy."
       + " By modifying the parameters on the right, can you make everything coexist? Can you produce other real world trends like famine or population explosions and how does the simulation cope with these events?"
       + " There is no right or wrong way to play this game/simulation and you might be surprised at the varying outcomes by only slightly changing just one parameter by the smallest value."
       + " This simulation is based on an exercise from 'The Nature of Code' by Daniel Shiffman and also Craig Reynolds' studies in developing autonomous objects."
       + " There is currently no scoring system or a way to 'win'. Simply see how long you can make all creatures coexist. The Boids eat the plants and try to evade being eaten by the Snakes"
       + " as well as trying to reproduce. Some plants can be poisonous to Boids but they have enough intelligence to remember where the poisonous plants are (after first having eaten them and becoming ill)"
       + " and to not eat them again. They also have the ability to tell other boids (in close proximity) about the location of the poisonous plants so that they will not try to eat them."
       + " They will also flee any snakes that get too close. Boids will also flock together when they want to reproduce or when they are scared. As they get older, the slower they get and the propensity to flock together increases."
       + " Only the fitter, healthy boids can reproduce and flee prey."
       + " The Snakes eat the Boids and try to reproduce but if there are aren't enough boids for the snakes to feed off or they can't catch them, they will not be able to reproduce and therefore will die. Snakes also only have a 10% chance of"
       + " reproducing with each fertility cycle and also hunt better in a pack"
       + " They will eat the older, weaker boids first." 
       + " Plants will always be able to grow no matter if they are all eaten and die. They can however be poisonous to Boids."
       + " In future versions of this simulation, I hope to introduce disease, weather systems and other species to influence the eco system and the outcome further."
       );
      
  }
  
}

class Buttons{
  
  Buttons(){         
    Bcp5.addButton("Go")
     .setValue(0)
     .setPosition(560,550)
     .setSize(60,40)
     .plugTo( this, "Go" )
     ;

    Bcp5.addButton("Stop")
     .setValue(0)
     .setPosition(630,550)
     .setSize(60,40)
     .plugTo( this, "Stop" )
     ;
     
    Bcp5.addButton("Reset")
     .setValue(0)
     .setPosition(700,550)
     .setSize(60,40)
     .plugTo(this,"Reset")
     .setLabel("Reset")
     ; 
  }
  
  void controlEvent(ControlEvent theEvent) {
    println("control event from : "+theEvent.controller().name());
      if(theEvent.isController()) { 
        if(theEvent.controller().name()=="Go") {
          gameOn = true;
          flockSize = mainGui.value1;
          ssSize = mainGui.value2;
          psSize = mainGui.value3;
          restart();
        }
        if(theEvent.controller().name()=="Stop") {
          gameOn = false;

        }
        if(theEvent.controller().name()=="Reset") {
          resetParams();
          restart();

        }
      }
      
  }
}

class GeneGui {
  float bSpeed, bForce, bFleeSpeed, bFleeForce, bTireSpeed, bAgeSpeed, bFertilitySpeed;
  float bReplenish;
  String bTitle;
  float bCohStrength, bAliStrength, bSepStrength;
  BDefault bd; //default values
  
  GeneGui(String _s){
    bTitle = _s;
    bd = new BDefault();
    bSpeed = bd.speed;
    bForce = bd.force;
    bFleeSpeed = bd.fleeSpeed;
    bFleeForce = bd.fleeForce;
    bTireSpeed = bd.tireSpeed;
    bAgeSpeed = bd.ageSpeed;
    bFertilitySpeed = bd.fertilitySpeed;
    bReplenish = bd.replenish;
    bCohStrength = bd.cohStrength;
    bAliStrength = bd.aliStrength;
    bSepStrength = bd.sepStrength;
    
    cp5.addTextlabel("bTitle")
       .setText(bTitle + " Parameters")
       .setPosition(560, 100)
       .setColorValue(000)
       .setFont(createFont("Georgia",20))
       ;
    
    cp5.addSlider("bSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,130)
       .setRange(0, 5 )
       .plugTo( this, "bSpeed" )
       .setValue( bSpeed )
       .setLabel("Normal Speed")
       ;
   
    cp5.addSlider("bForce")
       .setColorCaptionLabel(0)
       .setPosition(560,150)
       .setRange(0.1, 0.5 )
       .plugTo( this, "bForce" )
       .setValue( bForce )
       .setLabel("Normal Reaction Speed")
       ;      

    cp5.addSlider("bFleeSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,170)
       .setRange(1, 8 )
       .plugTo( this, "bFleeSpeed" )
       .setValue( bFleeSpeed )
       .setLabel("Speed when Fleeing")
       ;
       
    cp5.addSlider("bFleeForce")
       .setColorCaptionLabel(0)
       .setPosition(560,190)
       .setRange(0.1, 3 )
       .plugTo( this, "bFleeForce" )
       .setValue( bFleeForce )
       .setLabel("Reaction Speed when Fleeing")
       ;  

    cp5.addSlider("bTireSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,210)
       .setRange( 0.01, 0.1 )
       .plugTo( this, "bTireSpeed" )
       .setValue( bTireSpeed )
       .setLabel("Tire Speed")
       ;
       
    cp5.addSlider("bAgeSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,230)
       .setRange( 0.01, 0.06 )
       .plugTo( this, "bAgeSpeed" )
       .setValue( bAgeSpeed)
       .setLabel("Speed of Ageing")
       ;
       
    cp5.addSlider("bFertilitySpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,250)
       .setRange( 0.01, 0.5 )
       .plugTo( this, "bFertilitySpeed" )
       .setValue( bFertilitySpeed)
       .setLabel("Fertility Cycle Speed")
       ;    
       
    cp5.addSlider("bReplenish")
       .setColorCaptionLabel(0)
       .setPosition(560,270)
       .setRange( 1, 25 )
       .plugTo( this, "bReplenish" )
       .setValue( bReplenish)
       .setLabel("Energy from Feeding")
       ;    

    cp5.addSlider("bCohStrength")
       .setColorCaptionLabel(0)
       .setPosition(560,290)
       .setRange( 0, 10 )
       .plugTo( this, "bCohStrength" )
       .setValue( bCohStrength)
       .setLabel("Cohesion Strength")
       ;    
    cp5.addSlider("bAliStrength")
       .setColorCaptionLabel(0)
       .setPosition(560,310)
       .setRange( 0, 10 )
       .plugTo( this, "bAliStrength" )
       .setValue( bAliStrength)
       .setLabel("Alignment Strength")
       ;    
    cp5.addSlider("bSepStrength")
       .setColorCaptionLabel(0)
       .setPosition(560,330)
       .setRange( 0, 10 )
       .plugTo( this, "bSepStrength" )
       .setValue( bSepStrength)
       .setLabel("Separation Strength")
       ;    
  }
  
} 

class SGeneGui {
  float sTireSpeed, sAgeSpeed, sFertilitySpeed;
  float sReplenish;
  String stitle;  
  SDefault sd;
  
  
  SGeneGui(String _s){
    
    stitle = _s;
    sd = new SDefault();
    
    sTireSpeed = sd.tireSpeed;
    sAgeSpeed = sd.ageSpeed;
    sFertilitySpeed = sd.fertilitySpeed;
    sReplenish = sd.replenish;
    
    cp5.addTextlabel("stitle")
       .setText(stitle + " Parameters")
       .setPosition(560, 350)
       .setColorValue(000)
       .setFont(createFont("Georgia",20))
       ;   

    cp5.addSlider("sTireSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,380)
       .setRange( 0.01, 0.1 )
       .plugTo( this, "sTireSpeed" )
       .setValue( sTireSpeed )
       .setLabel("Tire Speed")
       ;
       
    cp5.addSlider("sAgeSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,400)
       .setRange( 0.01, 0.05 )
       .plugTo( this, "sAgeSpeed" )
       .setValue( sAgeSpeed)
       .setLabel("Ageing Speed")
       ;
       
    cp5.addSlider("sFertilitySpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,420)
       .setRange( 0.01, 1 )
       .plugTo( this, "sFertilitySpeed" )
       .setValue( sFertilitySpeed)
       .setLabel("Fertility Cycle Speed")
       ;    
       
    cp5.addSlider("sReplenish")
       .setColorCaptionLabel(0)
       .setPosition(560,440)
       .setRange( 1, 25 )
       .plugTo( this, "sReplenish" )
       .setValue( sReplenish)
       .setLabel("Energy from Feeding")
       ;    
  }
  
}
   
class PGeneGui{
  String pTitle;
  float pAgeSpeed;
  float poisonProb;
  PDefault pd;
      
  PGeneGui(String _s){
    pTitle = _s;
    pd = new PDefault();
    pAgeSpeed = pd.ageSpeed;
    poisonProb = pd.poisonProb;   

    cp5.addTextlabel("pTitle")
       .setText(pTitle + " Parameters")
       .setPosition(560, 460)
       .setColorValue(000)
       .setFont(createFont("Georgia",20))
       ;  
       
    cp5.addSlider("pAgeSpeed")
       .setColorCaptionLabel(0)
       .setPosition(560,490)
       .setRange( 0.01, 0.1 )
       .plugTo( this, "pAgeSpeed" )
       .setValue(pAgeSpeed)
       .setLabel("Ageing Speed")
       ; 
    
    cp5.addSlider("poisonProb")
       .setColorCaptionLabel(0)
       .setPosition(560,510)
       .setRange( 0.01, 0.5 )
       .plugTo( this, "poisonProb" )
       .setValue(poisonProb)
       .setLabel("Poison Probability")
       ;   
      
  }
}
class Plant{
  PVector location;
  float r;
  boolean active;
  boolean poisonous;
  PGenetics g;
  
   Plant(float x, float y, boolean p_){
    location = new PVector(x,y);
    r = 3;
    g = new PGenetics();
    active = false;
    poisonous = p_;
  }
  
  void run(){
    if (r > 5 || g.lifespan > 25){
      active = true;
    } else {
      active = false;
    }
    lifecycle();
    display();
    g.updateGenetics();
  }
  
  void display(){
    stroke(0,255,50);
    if (poisonous){
      fill(150,0,0,200);
    } else {
      fill(0,150,50,200);
    }
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }
  
  boolean eaten(PVector prey){
    if (prey.x < location.x + r*2 && prey.x > location.x - r*2 && prey.y < location.y + r*2 && prey.y > location.y - r){
      r -= 0.01;
      g.lifespan += 0.05;
      return true;
    } else {
      return false;
    }
  }
  
  void lifecycle(){
    r = constrain(r,0,25);
    if (poisonous){
      g.lifespan += g.ageSpeed;
      r+= 0.05;
    } else {
      g.lifespan += g.ageSpeed;
      r += 0.05;
    }
  }
  
  Boolean isDead(){
   if (g.lifespan >= 100.0 || r < 3){
     return true;
     } else {
       return false;
     }
   }   
  
}
class PlantSystem {
  ArrayList<Plant> plants;
  ArrayList<Plant> deadPlants;
  int limit; 
  boolean poisonous;
  float poisonProb;
  
  PlantSystem(){
    plants = new ArrayList<Plant>();
    deadPlants = new ArrayList<Plant>();
    limit = 0;
    
  }
  
  void run(){
    addPlant();
    Iterator<Plant> pit = plants.iterator();
    while(pit.hasNext()){
      Plant p = pit.next();
      p.run();
      if (p.isDead()){
        pit.remove();
        limit -= 1;
        deadPlants.add(p);
      }
    }
  }
  void addPlant(){
    if (limit < psSize){
      float r = random(1);
      if (r < poisonProb){ // % chance of plant being poisonous to boids
        plants.add(new Plant(random(width), random(height), true));
      } else {
        plants.add(new Plant(random(width), random(height),false));
      }
      limit += 1;
    }
  }
  
  
}
class Snake {
  PVector location;
  PVector velocity;
  PVector acceleration;
  SGenetics g;
  float r;
  float wandertheta;
  float[] xpos = new float[50];
  float[] ypos = new float[50];
  
  
  Snake(float x,float y){
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 6;
    g = new SGenetics();
    for (int i = 0; i < xpos.length; i++){
      xpos[i] = 0;
      ypos[i] = 0;
    }
  }
  
  void run(ArrayList<Snake> snakes){
    lifeCycle();
    update();
    borders();
    display();
    if (g.hungry) {
      g.speed = g.fleeSpeed;
      g.force = g.fleeForce;
      detect(flock.boids);
    }
    else if (g.fertility >= 100 && g.lifespan < 60){
        flock(snakes);
   } else {
      g.speed = 1;
      g.force = 0.1;
      wander();
    }
    PVector sep = separate(snakes);
    sep.mult(1.0);
    applyForce(sep);
    g.updateGenetics();
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void wander() {
    float wanderR = 1;         // Radius for our "wander circle"
    float wanderD = 400;         // Distance for our "wander circle"
    float change = 0.3;
    wandertheta += random(-change,change);     // Randomly change wander theta

    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = velocity.get();    // Start with velocity
    circleloc.normalize();            // Normalize to get heading
    circleloc.mult(wanderD);          // Multiply by distance
    circleloc.add(location);               // Make it relative to boid's location
    
    float h = velocity.heading2D();        // We need to know the heading to offset wandertheta

    PVector circleOffSet = new PVector(wanderR*cos(wandertheta+h),wanderR*sin(wandertheta+h));
    PVector target = PVector.add(circleloc,circleOffSet);
    PVector destination = seek(target);
    destination.limit(g.speed);
    applyForce(destination);
  }  
  
  
  void flock(ArrayList<Snake> snakes){
    PVector sep = separate(snakes);
    sep.mult(1.0);
    applyForce(sep);

    PVector coh = cohesion(snakes);
    coh.mult(5.0);
    applyForce(coh);
    
    PVector ali = align(snakes);
    ali.mult(1.0);
    applyForce(ali);    
  }
  
 
  void detect(ArrayList<Boid> boids) {
    for (Boid b : boids){
        float targetDist = g.senseFoodDistance; // only detect food within this distance
        float d = PVector.dist(b.location, location);
        if (d < targetDist){
          PVector desired = PVector.sub(b.location, location);
          desired.normalize();
          desired.mult(g.speed*(b.g.energy+b.g.lifespan)); //pick off the most vulnerable boids first
          desired.sub(velocity);
          desired.limit(g.force);
          applyForce(desired);
          if (b.eaten(location)){
            eat(b.location);
          }
    }
    }
  } 
  
  PVector seek(PVector target){
    PVector desired = PVector.sub(target,location);
    float d = desired.magSq()/10;
    desired.normalize();
    if (d < 50) { //slow down when approaching
      float m = map(d,0,100,0,g.speed);
      desired.mult(m);
    } else {
      desired.mult(g.speed);
    }
    desired.sub(velocity);
    desired.limit(g.force);
    return desired;
  }

  PVector cohesion(ArrayList<Snake> snakes){
    float neighbourDist = g.cohesionDistance;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Snake other : snakes){
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbourDist)){
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0){
      sum.div(count);
      //reproduce if fertility is at 100
    if (g.fertility >= 100){
        reproduce(snakes);
      }
      return seek(sum);
    } else {
      return new PVector(0,0);
    }
  }
  
  PVector separate(ArrayList<Snake> snakes){
    int count = 0;
    float desiredSeparation = r*2;
    PVector sum = new PVector();
    PVector diff = new PVector();
    for (Snake other: snakes){
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredSeparation)){
        diff.x = location.x;
        diff.y = location.y;
        diff.sub(other.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0){
      sum.div(count);
      sum.setMag(g.speed);
      sum.sub(velocity);
      sum.limit(g.force);
      return sum;
    } else {
      return new PVector(0,0);
    }
  }
  
  PVector align(ArrayList<Snake> snakes){
    float neighbourDist = 50; //only calculate average based on other boids within this distance
    PVector sum = new PVector(0,0);
    int count = 0;
    //add up all velocities and calculate average
    for (Snake other : snakes){
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbourDist)){
      sum.add(other.velocity);
      count++;
      }
    }
    if (count > 0){
      sum.div(count); //only calculate average based on number of boids within distance
      sum.normalize();
      sum.mult(g.speed);
      
      sum.sub(velocity);
      sum.limit(g.force);
      return sum;
    } else {
      return new PVector(0,0);
    }
  }
  
  void lifeCycle(){
    g.lifespan = constrain(g.lifespan,0,100);
    g.lifespan += g.ageSpeed;
    g.energy -= g.tireSpeed;
    g.fertility += g.fertilitySpeed;
    if (g.energy < 60){
      g.hungry = true;
    } else {
      g.hungry = false;
    }
  }
  
  void eat(PVector target) {
     g.energy += g.replenish;
  }
  
  void reproduce(ArrayList<Snake> snakes){
    float neighbourDist = 50;
    if (random(1)<0.10){ //There is a 10% chance of mating
    for (Snake other : snakes){
      float d = PVector.dist(location, other.location);
      if (d <= neighbourDist && d > 0) {
        g.pregnant = true;
        g.energy -= 15; //energy taken to reproduce
      }

    }
      g.fertility = 0;
    }

  }
  
  void borders(){
    if (location.x - r*2 > width - r*2){location.x = r*2;}
    if (location.x + r*2 < 0){location.x = width-r*2;}
    if (location.y-r*2 > height){location.y = r*2;}
    if (location.y + r*2< 0){location.y = height-r*2;}
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(g.speed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    for(int i = 0; i < xpos.length-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }
    xpos[xpos.length-1] = location.x;
    ypos[ypos.length-1] = location.y;
    float age = map(g.lifespan, 0,100,255,0);
    fill(175,25,0,age);
    stroke(0,age);
    pushMatrix();

    for (int i = 0; i < xpos.length; i++){
    ellipse(xpos[i],ypos[i],r*2,r*2);
    }
    popMatrix();
  }
  
  boolean isDead(){
     if (g.lifespan >= 100.0 | g.energy <= 0) {
       return true;
     } else {
       return false;
     }
   }
    
    
}

class SnakeSystem extends Flock {
  ArrayList<Snake> snakes;
  int newSnakes;
  
  SnakeSystem(){
    snakes = new ArrayList<Snake>();
    newSnakes = 0;
  }
  
  void run(){
    giveBirth(random(width),random(height));
    Iterator<Snake> it = snakes.iterator();
    while(it.hasNext()){
      Snake s = it.next();
      s.run(snakes);
      if (s.isDead()){
        it.remove();
        println("Snake died!");
      }
    }
    for (Snake s: snakes){
      if (s.g.pregnant){
        newSnakes += 1;
        s.g.pregnant = false;
      }
    }
  }
  
  void giveBirth(float x, float y){
    for (int i = 0; i <= newSnakes; i++){
      snakes.add(new Snake(x,y));
      newSnakes -= 1;
    }
  }
  
  void addSnake(float x, float y){
      snakes.add(new Snake(x,y));
  }
  
  float getAverageAge(){
    float totalAge = 0;
    float averageAge = 0;
    for (Snake s: snakes){
      totalAge += s.g.lifespan;
      
    }
    averageAge = totalAge / snakes.size();
   return averageAge; 
  }
}



