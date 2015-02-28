
float radius = 55;
ArrayList explosionArray;
int maxGenerations = 3;
int initialSize = 40; // in pixels
int initialLifespan = 200; // frames

PVector previousMouseLocation;

void setup() {
  size(512, 160);
  background(0);
  frameRate(8);
  smooth();
  explosionArray = new ArrayList();
  previousMouseLocation = new PVector(0,0);
} // end setup

void draw() {
  fill(0, 3);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  stroke(255, 0, 0);

  for (int i = 0; i < explosionArray.size(); i++) {
    ((Explosion)explosionArray.get(i)).update();
    ((Explosion)explosionArray.get(i)).display();
  } // end i for

  for (int i = explosionArray.size()-1; i >= 0 ; i--) {
    if (((Explosion)explosionArray.get(i)).okToDie) {
      explosionArray.remove(i);
    } // end if
  } // end i for to remove old things
  
  if (frameCount % 50 == 0){
 makeNewExplosion(new PVector(random(width), random(height)), new PVector(random(-1, 1), random(-1, 1)), initialSize, initialLifespan,0);     
  } // end if auto ddd
} // end draw

void makeNewExplosion(PVector newLocation, PVector newDirection, int previousRadius, int previousLifeSpan, int generation) {
  if (generation < maxGenerations) {

    for (int i = 0; i < 1; i++) {
      Explosion newExplosion = new Explosion(newLocation, newDirection, color(random(10, 30), random(20, 35), 0), previousRadius, previousLifeSpan, generation + 1);
      newExplosion.explosionRadius *= .6;
      newExplosion.lifeSpan *= .5;
      explosionArray.add(newExplosion);
    } // end i for
  } // end if
} // end makeNewExplosion




class Explosion {
  PVector location = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  PVector accel    = new PVector(0,0);
  int inception = 0;
  int lifeSpan = 200; // frames to live
  int deathFrame = 0;
  boolean okToDie = false;
  float velocityLimit = 15.0;
  int explosionRadius = 20; // max size of the thing
  int drawnExplosionRadius = 0;
  float explosionRadiusDecrement = 0.99999999999; // multiplies the explosion radius
  color explosionColor;
  int redIntensity, greenIntensity, blueIntensity;
  int generationCount;

  Explosion(PVector location_, PVector velocity_, color explosionColor_, int newRadius_, int newLifespan_, int generationCount_) {
    location = location_;
    velocity = velocity_;
    explosionColor = explosionColor_;
    generationCount = generationCount_;
    explosionRadius = newRadius_;
    lifeSpan = newLifespan_;
    redIntensity = int(100 * (red(explosionColor) / 255));
    greenIntensity = int(100 * (green(explosionColor) / 255));
    blueIntensity = int(100 * (blue(explosionColor) / 255));    
    inception = frameCount;
    deathFrame = inception + lifeSpan;
    accel = new PVector(random(-.01, .01), random(-.01, .01));
  } // end constructor

  void update() {
    checkForDeath();
    velocity.add(accel);
    velocity.limit(velocityLimit);
    location.add(velocity);
    int quarterCount      = inception + int(.25 * (deathFrame - inception));
    int threeQuarterCount = inception + int(.75 * (deathFrame - inception));
    int halfCount         = inception + int(.5  * (deathFrame - inception));
    drawnExplosionRadius = int (explosionRadius * sin (map(float(abs(frameCount - halfCount)), 0.0, (deathFrame - halfCount), PI/2, 0.0))); // using sin to control size
    if (explosionRadius < 0) explosionRadius = 0;

    // make the next generation:
    if (((frameCount + 1) - inception) % 20 == 0){
      makeNewExplosion(new PVector (location.x, location.y), new PVector(velocity.x + random(-.25, .25), velocity.y + random(-.25, .25)), explosionRadius, lifeSpan, generationCount);
    } // end if to add a subBranch
  } // end update

  void display() {
    loadPixels();
    for (int i = int(location.x) - drawnExplosionRadius; i < int(location.x) +drawnExplosionRadius; i++) {
      for (int j = int(location.y) - drawnExplosionRadius; j < int(location.y) + drawnExplosionRadius; j++) {
        if ((i < width) && (i > 0) && (j > 0) && (j < height)) {
          if ((i + j * width) < width * height) {
            int addIntensity = 2;
            color tempColor = pixels[i + j * width];
            addIntensity = int(map(dist(i, j, location.x, location.y), float(drawnExplosionRadius), 0, 0, float(addIntensity)));
            if (addIntensity < 0) addIntensity = 0;
            pixels[i + j * width] = color (red(tempColor) + addIntensity * redIntensity, 0, 0);
          } // end if for general bounds exception
        } // end if boundary check
      } // end j for vertical
    } // end i for horizontal    
    updatePixels();
  } // end display

  void checkForDeath() {
    if (frameCount > deathFrame) okToDie = true;
    if ((location.x > width + explosionRadius) || (location.x < 0 - explosionRadius) || (location.y < 0 - explosionRadius) || (location.y > height + explosionRadius)) okToDie = true;
  } // end checkForDeath
  
} // end class Explosion
                                
