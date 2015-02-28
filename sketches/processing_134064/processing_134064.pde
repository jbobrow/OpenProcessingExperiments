
/*
Made by Simon Herzog in February 2014
http://herzog.io
*/


Planet[] myPlanets;
Asteroid[] myAsteroids;
PShape sun;
int planetCount = 10;
int asteroidCount = 100;

void setup() {
  size(800, 800, P3D);

  sun = createShape(SPHERE, 100);
  sun.setFill(color(#ffcc33));
  sun.setStroke(false);

  myPlanets = new Planet[planetCount]; //number of planets
  for (int i=0; i < myPlanets.length; i++)
  {
    //fill myPlanets array
    myPlanets[i] = new Planet();
  }
  
  myAsteroids = new Asteroid[asteroidCount]; //number of asteroids
  for (int i=0; i < myAsteroids.length; i++)
  {
    //fill myAsteroids array
    myAsteroids[i] = new Asteroid();
  }
  
}

void draw() {
  background(0);

  //move camera
  camera(width/2, mouseY, mouseX, width/2, height/2, 0, 0, 1, 0);
  
  //sun and light
  pushMatrix();
  translate(width/2, height/2, 0);
  sphereDetail(100);
  shape(sun);

  //light source
  pointLight(255, 255, 255, 0, 0, 0); //light from the sun
  ambientLight(40, 40, 40); //adds a little ambient light 
  popMatrix();

  sphereDetail(10);
  //draw planets
  for (int i = 0; i < myPlanets.length; i++) {
    myPlanets[i].updatePlanet();
    myPlanets[i].drawPlanet();
  }
  
  //draw asteroids
  for (int j = 0; j < myAsteroids.length; j++) {
     myAsteroids[j].updateAsteroids();
     myAsteroids[j].drawAsteroids();
  }
}

class Asteroid {
  PShape asteroid;
  float asteroidRadius = random(0.5, 3);;
  float beltDistance = 425; //radius around sun
  float counter;
  float planetDistance;
  float planeRotationX;
  float planeRotationY;
  float planeRotationZ;
  float positionX;
  float positionY;
  float positionZ;
  float randomPos;

  Asteroid() {
    //asteroid belt range
    planeRotationX = random( radians( random(-5, -4.95)));
    planeRotationY = random( radians( random(-5, -4.95)));
    planeRotationZ = random( radians( random(-5, -4.95)));

    //starting point for asteroids 
    randomPos = random(0, TWO_PI);

    asteroid = createShape(SPHERE, asteroidRadius);
    asteroid.setFill(color(120));
    asteroid.setStroke(false);
  }

  void updateAsteroids() {

    counter+=0.008; //orbital speed
    //calculate asteroid position
    positionX = sin(counter + randomPos) * beltDistance;
    positionY = cos(counter + randomPos) * beltDistance;
  }

  void drawAsteroids() {

    pushMatrix(); 
    translate(width/2, height/2, 0); //center around sun
    //orbital plane
    rotateX(planeRotationX);
    rotateY(planeRotationY);
    rotateZ(planeRotationZ);
    //orbital distance
    translate(positionX, 0, positionY);

    shape(asteroid);

    popMatrix();
  }
}

class Moon {

  PShape moon;
  float moonRadius;
  float moonDistance;
  float counter;
  float planetRadius;
  float planetDistance;
  float planeRotationX;
  float planeRotationY;
  float planeRotationZ;
  float positionX;
  float positionY;
  float positionZ;
  float randomPos;

  Moon(float in_moonRadius, float in_orbitDistance) {
    
    moonRadius = in_moonRadius;
    moonDistance = in_orbitDistance;

    //plane of rotation for moons
    planeRotationX = random( radians( random(-180, 180)));
    planeRotationY = random( radians( random(-180, 180)));
    planeRotationZ = random( radians( random(-180, 180)));
    
    //starting point for moons
    randomPos = random(0, TWO_PI);

    moon = createShape(SPHERE, moonRadius);
    moon.setFill(color(#47697E));
    moon.setStroke(false);
  }

  void updateMoon() {

    counter+=0.04; //orbital speed
    //calculate moon position
    positionX = sin(counter + randomPos) * moonDistance;
    positionY = cos(counter + randomPos) * moonDistance;
  }

  void drawMoon() {

    pushMatrix(); 
      //orbital plane
      rotateX(planeRotationX);
      rotateY(planeRotationY);
      rotateZ(planeRotationZ);
      //orbital distance
      translate(positionX, 0, positionY);

      shape(moon);
    
    popMatrix();
  }
}

class Planet {

  PShape planet;
  float counter;
  float planetRadius;
  float planetDistance;
  float planeRotationX;
  float planeRotationY;
  float planeRotationZ;
  float positionX;
  float positionY;
  float positionZ;
  float randomPos;
  float rotationRange = 180; //set range of planet rotation
  
  Moon[] myMoons; //create moons for each planet

  Planet() {
    
    //plane of rotation for planets
    planeRotationX = random( radians( random(-rotationRange, rotationRange)));
    planeRotationY = random( radians( random(-rotationRange, rotationRange)));
    planeRotationZ = random( radians( random(-rotationRange, rotationRange)));
    
    planetRadius = random(5, 25);
    planetDistance = random(150, 400);
    randomPos = random(0, TWO_PI);

    planet = createShape(SPHERE, planetRadius);
    planet.setFill(color(#5B7444));
    planet.setStroke(false);

    myMoons = new Moon[int(random(0, 4))]; //number of moons per planet
    for (int i=0; i < myMoons.length; i++)
    {
      //Passing planet radius and moon orbit radius to Moon class
      float moonRadius = random(2.5, planetRadius / 2); //moon size
      float orbitDistance = random(planetRadius * 1.5, planetRadius * 3.0); //moon orbit
      myMoons[i] = new Moon(moonRadius, orbitDistance); 
    }
  }

  void updatePlanet() {
    //calculate planet position
    counter+=0.01; //speed of planet rotation
    positionX = sin(counter + randomPos) * planetDistance;
    positionY = cos(counter + randomPos) * planetDistance;
    
    //update each moon for each planet
    for (int j = 0; j < myMoons.length; j++) {
      myMoons[j].updateMoon();
    }
  }

  void drawPlanet() {

    pushMatrix();   
    translate(width/2, height/2, 0); //center around sun
    rotateX(planeRotationX);
    rotateY(planeRotationY);
    rotateZ(planeRotationZ);
    translate(positionX, 0, positionY); //orbital distance

    shape(planet);
    
    //draw each planet's moons
    for (int j = 0; j < myMoons.length; j++) {
      myMoons[j].drawMoon();
    }
    popMatrix();
  }
}

class Planet {

  PShape planet;
  float counter;
  float planetRadius;
  float planetDistance;
  float planeRotationX;
  float planeRotationY;
  float planeRotationZ;
  float positionX;
  float positionY;
  float positionZ;
  float randomPos;
  float rotationRange = 180; //set range of planet rotation
  
  Moon[] myMoons; //create moons for each planet

  Planet() {
    
    //plane of rotation for planets
    planeRotationX = random( radians( random(-rotationRange, rotationRange)));
    planeRotationY = random( radians( random(-rotationRange, rotationRange)));
    planeRotationZ = random( radians( random(-rotationRange, rotationRange)));
    
    planetRadius = random(5, 25);
    planetDistance = random(150, 400);
    randomPos = random(0, TWO_PI);

    planet = createShape(SPHERE, planetRadius);
    planet.setFill(color(#5B7444));
    planet.setStroke(false);

    myMoons = new Moon[int(random(0, 4))]; //number of moons per planet
    for (int i=0; i < myMoons.length; i++)
    {
      //Passing planet radius and moon orbit radius to Moon class
      float moonRadius = random(2.5, planetRadius / 2); //moon size
      float orbitDistance = random(planetRadius * 1.5, planetRadius * 3.0); //moon orbit
      myMoons[i] = new Moon(moonRadius, orbitDistance); 
    }
  }

  void updatePlanet() {
    //calculate planet position
    counter+=0.01; //speed of planet rotation
    positionX = sin(counter + randomPos) * planetDistance;
    positionY = cos(counter + randomPos) * planetDistance;
    
    //update each moon for each planet
    for (int j = 0; j < myMoons.length; j++) {
      myMoons[j].updateMoon();
    }
  }

  void drawPlanet() {

    pushMatrix();   
    translate(width/2, height/2, 0); //center around sun
    rotateX(planeRotationX);
    rotateY(planeRotationY);
    rotateZ(planeRotationZ);
    translate(positionX, 0, positionY); //orbital distance

    shape(planet);
    
    //draw each planet's moons
    for (int j = 0; j < myMoons.length; j++) {
      myMoons[j].drawMoon();
    }
    popMatrix();
  }
}

class Moon {

  PShape moon;
  float moonRadius;
  float moonDistance;
  float counter;
  float planetRadius;
  float planetDistance;
  float planeRotationX;
  float planeRotationY;
  float planeRotationZ;
  float positionX;
  float positionY;
  float positionZ;
  float randomPos;

  Moon(float in_moonRadius, float in_orbitDistance) {
    
    moonRadius = in_moonRadius;
    moonDistance = in_orbitDistance;

    //plane of rotation for moons
    planeRotationX = random( radians( random(-180, 180)));
    planeRotationY = random( radians( random(-180, 180)));
    planeRotationZ = random( radians( random(-180, 180)));
    
    //starting point for moons
    randomPos = random(0, TWO_PI);

    moon = createShape(SPHERE, moonRadius);
    moon.setFill(color(#47697E));
    moon.setStroke(false);
  }

  void updateMoon() {

    counter+=0.04; //orbital speed
    //calculate moon position
    positionX = sin(counter + randomPos) * moonDistance;
    positionY = cos(counter + randomPos) * moonDistance;
  }

  void drawMoon() {

    pushMatrix(); 
      //orbital plane
      rotateX(planeRotationX);
      rotateY(planeRotationY);
      rotateZ(planeRotationZ);
      //orbital distance
      translate(positionX, 0, positionY);

      shape(moon);
    
    popMatrix();
  }
}

class Asteroid {
  PShape asteroid;
  float asteroidRadius = random(0.5, 3);;
  float beltDistance = 425; //radius around sun
  float counter;
  float planetDistance;
  float planeRotationX;
  float planeRotationY;
  float planeRotationZ;
  float positionX;
  float positionY;
  float positionZ;
  float randomPos;

  Asteroid() {
    //asteroid belt range
    planeRotationX = random( radians( random(-5, -4.95)));
    planeRotationY = random( radians( random(-5, -4.95)));
    planeRotationZ = random( radians( random(-5, -4.95)));

    //starting point for asteroids 
    randomPos = random(0, TWO_PI);

    asteroid = createShape(SPHERE, asteroidRadius);
    asteroid.setFill(color(120));
    asteroid.setStroke(false);
  }

  void updateAsteroids() {

    counter+=0.008; //orbital speed
    //calculate asteroid position
    positionX = sin(counter + randomPos) * beltDistance;
    positionY = cos(counter + randomPos) * beltDistance;
  }

  void drawAsteroids() {

    pushMatrix(); 
    translate(width/2, height/2, 0); //center around sun
    //orbital plane
    rotateX(planeRotationX);
    rotateY(planeRotationY);
    rotateZ(planeRotationZ);
    //orbital distance
    translate(positionX, 0, positionY);

    shape(asteroid);

    popMatrix();
  }
}



