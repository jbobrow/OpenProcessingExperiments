
//Processing: Group Collab HW
//by Andrew, Leiah, Orien
//Big thank you to Rafi for helping out with the rotations!

PVector centerPos;

int numClicks = 0;

PImage sun;
PImage mercury; 
PImage venus;
PImage earth;
PImage moon;
PImage mars;
PImage jupiter;
PImage saturn;
PImage uranus;
PImage neptune;


boolean starsOn;
boolean sunOn;
boolean mercuryOn; 
boolean venusOn;
boolean earthOn;
boolean marsOn;
boolean jupiterOn;
boolean saturnOn;
boolean uranusOn;
boolean neptuneOn;

float mercurySpeed;
float mercuryAngle;
float venusSpeed;
float venusAngle;
float earthSpeed;
float earthAngle;
float moonSpeed;
float moonAngle;
float marsSpeed;
float marsAngle;
float jupiterSpeed;
float jupiterAngle;
float saturnSpeed;
float saturnAngle;
float uranusSpeed;
float uranusAngle;
float neptuneSpeed;
float neptuneAngle;

float aForce = 0;
float  asteroidAngle;

PImage asteroid;
boolean asteroidIs = false;


starGen [] starArray = new starGen [3000];
float shootXPos;
float shootYPos;

void setup() {
  size(800, 800);
  background(30, 4, 44);

  sun = loadImage("sun.png");
  mercury = loadImage("mercury.png");
  venus = loadImage("venus.png");
  earth = loadImage("earth.png");
  moon = loadImage("moon.png");
  mars = loadImage("mars.png");
  jupiter = loadImage("jupiter.png");
  saturn = loadImage("saturn.png");
  uranus = loadImage("uranus.png");
  neptune = loadImage("neptune.png");
  asteroid = loadImage("asteroid.png");

  mercurySpeed = .02;
  mercuryAngle = 0;
  venusSpeed = mercurySpeed/2;
  venusAngle = 0;
  earthSpeed = venusSpeed/2;
  earthAngle = 0;
  moonSpeed = earthSpeed * 10;
  moonAngle = 0;
  marsSpeed = earthSpeed/2;
  marsAngle = 0;
  jupiterSpeed = marsSpeed/2;
  jupiterAngle = 0;
  saturnSpeed = jupiterSpeed/2;
  saturnAngle = 0;
  uranusSpeed = saturnSpeed/2;
  uranusAngle = 0;
  neptuneSpeed = uranusSpeed/2;
  neptuneAngle = 0;



  centerPos = new PVector (width/2, height/2);

  shootXPos = 0;
  shootYPos = random(0, height);

  //Initialize b/g star generation
  print("starsExist = false. ");
  for (int i=0; i<starArray.length; i++) {
    starArray[i] = new starGen();
    starArray[i].starGenPrime(int(random(0, width)), int(random(0, height)));
  }
}

void draw() {


  background(30, 4, 44);

  

  //shooting star movement
  shootStarMove();
  //  shootXPos++;
  //  shootYPos = shootYPos + random(-2f, 2f);
  //  if (shootXPos >= width) {
  //    shootXPos = 0;
  //    shootYPos = random(0, height);
  //  }
  if (starsOn) {
    bigBang();
  }
  if (sunOn) {
    spawnSun();
  }
  if (mercuryOn) {

    //1st Circle
    noFill();
    strokeWeight(1);
    ellipse (centerPos.x, centerPos.y, 50, 50);

    spawnMercury();
  }
  if (venusOn) {
    //2nd Circle
    noFill();
    strokeWeight(1);
    ellipse (centerPos.x, centerPos.y, 150, 150);
    spawnVenus();
  }
  if (earthOn) {

    //3rd Circle
    noFill();
    strokeWeight(1);
    ellipse (centerPos.x, centerPos.y, 250, 250);
    spawnEarth();
  }
  if (marsOn) {
    //4th Circle
    noFill();
    strokeWeight(1);
    ellipse (centerPos.x, centerPos.y, 350, 350);
    spawnMars();
  }
  if (jupiterOn) {
    //5th Circle
    noFill();
    strokeWeight(1);
    ellipse (centerPos.x, centerPos.y, 450, 450);
    spawnJupiter();
  }

  if (saturnOn) {
    //6th Circle
    noFill();
    strokeWeight(1);
    ellipse (centerPos.x, centerPos.y, 550, 550);
    spawnSaturn();
  }

  if (uranusOn) {
    //7th Circle
    noFill();
    strokeWeight(1);
    ellipse(centerPos.x, centerPos.y, 650, 650);
    spawnUranusHehe();
  }

  if (neptuneOn) {
    //8th Circle
    noFill();
    strokeWeight(1);
    ellipse(centerPos.x, centerPos.y, 750, 750);
    spawnNeptune();
  }
  hurlAsteroid();
}

void mousePressed() {
  numClicks++;

  //spawn bg stars
  if (numClicks == 1) {
    starsOn = true;
  }

  //sun/planets
  if (numClicks == 2) {
    sunOn = true;
  }

  if (numClicks == 3) {
    mercuryOn = true;
  }

  if (numClicks == 4) {
    venusOn = true;
  }

  if (numClicks == 5) {
    earthOn = true;
  }

  if (numClicks == 6) {
    marsOn = true;
  }

  if (numClicks == 7) {
    jupiterOn = true;
  }

  if (numClicks == 8) {
    saturnOn = true;
  }

  if (numClicks == 9) {
    uranusOn = true;
  }

  if (numClicks == 10) {
    neptuneOn = true;
  }
}

//SPAWN PLANETS

void bigBang() {
  //on click, explode/randomly generate stars/particles
  //call b/g star generation
  for (int i=0; i<starArray.length; i++) {
    starArray[i].starGenUpdate();
  }
  print("starsExist = true. ");
}

void spawnSun() {

  //Sun
  imageMode(CENTER);
  image(sun, centerPos.x, centerPos.y, 45, 45);
}

void spawnMercury() {
  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation Mercury
  if (mercuryAngle <= PI * 2) {
    mercuryAngle += mercurySpeed;
  } else {
    mercuryAngle = 0;
  }
  rotate(mercuryAngle);


  //Mercury
  imageMode(CENTER);
  image(mercury, 0, 25, 10, 10);

  popMatrix();
}

void spawnVenus() {

  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (venusAngle <= PI * 2) {
    venusAngle += venusSpeed;
  } else {
    venusAngle = 0;
  }
  rotate(venusAngle);

  //Venus
  imageMode(CENTER);
  image(venus, 0, 75, 15, 15);


  popMatrix();
}

void spawnEarth() {
  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (earthAngle <= PI * 2) {
    earthAngle += earthSpeed;
  } else {
    earthAngle = 0;
  }
  rotate(earthAngle);

  //Earth
  imageMode (CENTER);
  image(earth, 0, 125, 15, 15);

  //MOON
  pushMatrix();
  translate(0, 125);

  //Rotation
  if (moonAngle <= PI * 2) {
    moonAngle += moonSpeed;
  } else {
    moonAngle = 0;
  }
  rotate(moonAngle);

  //Moon
  imageMode (CENTER);
  image(moon, 0, 15, 7, 7);


  popMatrix();
  //MOON

  popMatrix();
}

void spawnMars() {
  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (marsAngle <= PI * 2) {
    marsAngle += marsSpeed;
  } else {
    marsAngle = 0;
  }
  rotate(marsAngle);

  //Mars
  imageMode(CENTER);
  image(mars, 0, 175, 12, 12);


  popMatrix();
}

void spawnJupiter() {
  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (jupiterAngle <= PI * 2) {
    jupiterAngle += jupiterSpeed;
  } else {
    jupiterAngle = 0;
  }
  rotate(jupiterAngle);

  //Jupiter
  imageMode(CENTER);
  image(jupiter, 0, 225, 50, 60);


  popMatrix();
}

void spawnSaturn() {

  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (saturnAngle <= PI * 2) {
    saturnAngle += saturnSpeed;
  } else {
    saturnAngle = 0;
  }
  rotate(saturnAngle);

  //Saturn
  imageMode(CENTER);
  image(saturn, 0, 275, 80, 50);


  popMatrix();
}

void spawnUranusHehe() {

  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (saturnAngle <= PI * 2) {
    uranusAngle += uranusSpeed;
  } else {
    uranusAngle = 0;
  }
  rotate(uranusAngle);

  //Uranus
  imageMode(CENTER);
  image(uranus, 0, 325, 20, 35);


  popMatrix();
}

void spawnNeptune() {
  pushMatrix();
  translate(centerPos.x, centerPos.y);

  //Rotation
  if (saturnAngle <= PI * 2) {
    neptuneAngle += uranusSpeed;
  } else {
    neptuneAngle = 0;
  }
  rotate(neptuneAngle);

  //Neptune
  imageMode(CENTER);
  image(neptune, 0, 375, 20, 20);


  popMatrix();
}

void hurlAsteroid(){

  rotate(asteroidAngle);
  image(asteroid,width - aForce, height/2 - aForce, 50, 50);
  aForce = aForce+10;
}
void shootingStar() {
  float shootStarSize = 3f;

  noStroke();
  fill(255);
  ellipse(shootXPos, shootYPos, shootStarSize, shootStarSize);
}

void shootStarMove() {
  shootXPos++;
  shootYPos = shootYPos + random(-3f, 3f);
  if (shootXPos >= width) {
    shootXPos = 0;
    shootYPos = random(0, height);
  }
  if (shootYPos >= height) {
    shootXPos = random(0, width);
    shootYPos = 0;
  }
  if (shootYPos < 0) {
    shootXPos = random(0, width);
    shootYPos = height;
  }
}

void keyPressed() {
  //'shooting' stars...
  float starShine = random(5, 10);
  if (key == ' ' && numClicks >= 1 ) {
    noStroke();
    fill(85, 175, 255, 80);
    ellipse(shootXPos, shootYPos, starShine, starShine);
    fill(255);
    ellipse(shootXPos, shootYPos, 2, 2);
  }
}

class starGen {

  float xPos;
  float yPos;
  //float xStart = mouseX;
  //float yStart = mouseY;
  PVector starGenPos;

  void starGenPrime(int _xPos, int _yPos) {
    xPos = _xPos;
    yPos = _yPos;
    starGenPos = new PVector (xPos, yPos);
  }

  void starGenUpdate() {
    stroke (255);
    point (xPos,yPos);
    //point (xPos, yPos);
  }
}



