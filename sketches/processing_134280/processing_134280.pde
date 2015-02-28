
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
    planeRotationX = radians(random(-5, -4.95));
    planeRotationY = radians(random(-5, -4.95));
    planeRotationZ = radians(random(-5, -4.95));

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


