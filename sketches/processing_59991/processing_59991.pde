
/*

  orbit game where you launch off a planet and try to 
  leverage graviational forces and limited thrusters
  to escape the solar system and avoid obstacles along the way
  
*/

Level level;

void setup(){

  size(900,400);
  background(0);
  smooth();
  frameRate(30);
  
  level = new Level(50);
  noStroke();

}

void draw(){
  background(0);  
  level.Tick();
  level.Display();
}

void keyPressed(){
  
    if(key == ' ') { level = new Level(50);}
    
    float boosterMultiplier = 0.1;        
    if(key == 'w') { level.player.velocity.add(new PVector(0.0, -boosterMultiplier, 0.0)); }
    if(key == 'a') { level.player.velocity.add(new PVector(-boosterMultiplier, 0.0, 0.0)); }
    if(key == 's') { level.player.velocity.add(new PVector(0.0, boosterMultiplier, 0.0)); }
    if(key == 'd') { level.player.velocity.add(new PVector(boosterMultiplier, 0.0, 0.0)); }    
  
}

class Planet {

  PVector position;
  float mass;
  float displayRadius;
  boolean bVisited;

  Planet() {  
    float initRange = 1000.0;
    position = new PVector(random(-initRange, initRange), random(-initRange, initRange));
    mass = random(400.0, 1300.0);  
    displayRadius = mass * 0.1;
    bVisited = false;
  }  
  void Display(float _zoom, Ship _player) {
    noStroke();
    pushMatrix();
    translate(width*0.5, height*0.5);
    translate((position.x - _player.position.x) * _zoom, (position.y - _player.position.y) * _zoom);
    if(bVisited)fill( 255, 0, 0, 32 );
    else fill( 0, 255, 0, 32);
    ellipse( 0, 0, displayRadius * _zoom, displayRadius * _zoom );          
    popMatrix();
  }
}

float GRAVITY_MULTIPLIER = 1.0;

class Ship {

  ArrayList futurePath;  

  ArrayList planets;  // passed in from the level at creation so that it does not need to be

  PVector position;
  PVector velocity;
  float mass;
  float fuel;

  Ship(ArrayList _planets) {  
    mass = 1.0;
    position = new PVector(width*0.5, height*0.5);
    velocity = new PVector(0.0, 0.0);  
    futurePath = new ArrayList();

    planets = _planets;
    fuel = 1000.0;
  }

  // Draws the ship to the screen      
  void Display(float _zoom) {  
    fill( 255, 196 );
    ellipse( width * 0.5, height * 0.5, 10, 10);  
    strokeWeight(3);
    stroke(255, 255, 255, 196);
    DisplayPossiblePath(_zoom, futurePath);
  }  

  // Calculates the gravitational forces of all the planets for an input position
  // returns a vector of the sum of the forces
  PVector NBody(PVector pos) {

    PVector returnVector = new PVector(0.0, 0.0, 0.0);    
    for (int i = 0; i < planets.size(); i++) {
      Planet thisPlanet = (Planet) planets.get(i);            
      float distance = PVector.dist(pos, thisPlanet.position);
      float force = ((mass * thisPlanet.mass) / (distance*distance)) * GRAVITY_MULTIPLIER;
      PVector distanceVector = PVector.sub(thisPlanet.position, pos);
      distanceVector.normalize(); 
      distanceVector.mult(force);
      returnVector.add(distanceVector);
    }
    return returnVector;
  } 

  void Tick() {
    velocity.add(NBody(position));        
    position.add(velocity);
    PredictPath(futurePath, position, velocity);
    CorrectPath();
    CheckPlanetVisit();
    fuel += 10.0;
   //println(fuel);
  }    

  void CheckPlanetVisit() {

    for (int i = 0; i < planets.size(); i++) {
      Planet testPlanet = (Planet) planets.get(i);
      if (position.dist(testPlanet.position) < testPlanet.displayRadius *0.5) { 
        testPlanet.bVisited = true;
      }
    }
  }

  void PredictPath(ArrayList possiblePath, PVector pos, PVector vel) {
    int pathRange = 128;
    possiblePath.clear();
    PVector futurePosition = new PVector(pos.x, pos.y, pos.z);    
    PVector futureVelocity = new PVector(vel.x, vel.y, vel.z);
    for (int i = 0; i < pathRange; i++) {
      futureVelocity.add(NBody(futurePosition));
      futurePosition.add(futureVelocity);
      possiblePath.add(new PVector(futurePosition.x, futurePosition.y, futurePosition.z));
    }
  }

  void CorrectPath() {
    float currentPlanetHit = CalculatePlanetHit(futurePath);    
   //println("Current Hit Rating :: "+currentPlanetHit);

    int numberOfPathsToCheck = 1;

    float[] pathScores;
    pathScores = new float[5];

    float mutationRange = 0.5;

    for (int i = 0; i < numberOfPathsToCheck; i++) {
      ArrayList testPath = new ArrayList();

      PVector testVelocity = new PVector(velocity.x + random(-mutationRange, mutationRange), velocity.y + random(-mutationRange, mutationRange), 0.0);
      PredictPath(testPath, position, testVelocity);
      strokeWeight(3);
      stroke(random(255), random(255), 255, 96);      
      DisplayPossiblePath(1.0, testPath);
      if (CalculatePlanetHit(testPath) > currentPlanetHit && fuel > 0.0) { 
       //println("better");
        fuel -= 100.0;
        velocity.set(testVelocity.x, testVelocity.y, testVelocity.z);
      }
    }
  } 

  // checks a predicted path for planet collision and returns a rating value
  float CalculatePlanetHit(ArrayList pathToCheck) {
    float returnValue = 0.0;
    int planetHits = 0;
    for (int i = 0; i < planets.size(); i++) {
      Planet testPlanet = (Planet) planets.get(i);
      if (!testPlanet.bVisited) {
        for (int j = 0; j < pathToCheck.size(); j++) {
          PVector testPosition = (PVector) pathToCheck.get(j);

          returnValue += (1.0 / testPosition.dist(testPlanet.position));
          if (testPosition.dist(new PVector(0.0, 0.0, 0.0)) > 10000.0) { 
            returnValue *= 0.01;
          }
          if (testPosition.dist(testPlanet.position) < testPlanet.displayRadius*0.1) { 
            returnValue *= 0.0001;
          }
        }
      }
    }  
    return returnValue;
  }

  void DisplayPossiblePath(float _zoom, ArrayList pathToDisplay) {
    PVector futurePosition0 = new PVector();
    PVector futurePosition1 = new PVector();
    for (int i = 0; i < pathToDisplay.size()-1; i++) {
      pushMatrix();
      translate(width * 0.5, height * 0.5);

      futurePosition0 = (PVector) pathToDisplay.get(i);        
      futurePosition1 = (PVector) pathToDisplay.get(i+1);
      line((futurePosition0.x - position.x) * _zoom, (futurePosition0.y - position.y) * _zoom, (futurePosition1.x - position.x) * _zoom, (futurePosition1.y - position.y) * _zoom);                        

      popMatrix();
    }
  }
}

class Level {
   
  // Faux global scope object  
  ArrayList planets;  
  Ship player;
  
  // display variables
  float displayZoomScale;
  
  Level(int numberOfPlanets){  
    planets = new ArrayList();    
    CreatePlanets(numberOfPlanets);
    player = new Ship(planets);
  }    

  void CreatePlanets(int _numberOfPlanets){
    planets.clear();
    for(int i = 0; i < _numberOfPlanets; i++){    
      planets.add(new Planet());    
    }  
  }
  void Tick(){
    player.Tick();  
    player.CorrectPath();
    //println(player.velocity.mag());    
  }
  void Display(){  
    
    PVector lastPointInFuturePath = (PVector) player.futurePath.get(player.futurePath.size()-1);
    float distanceToFuturePath = player.position.dist(lastPointInFuturePath);
    //println("Distance To Center: "+distanceToFuturePath);
    
    displayZoomScale = 1.0;
    
    player.Display(1.0);
    
    for(int i = 0; i < planets.size(); i++){
      Planet thisPlanet = (Planet)planets.get(i);
      thisPlanet.Display(displayZoomScale, player);
    }
    
  }

}
