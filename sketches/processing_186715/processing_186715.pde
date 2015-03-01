
/*
  @pjs preload="vignette.png,earth.png,moon.png,sun.png";
 */

/*
 Andor Salga
 Feb 2015
 
 Demo on how to create parent/child solar system transformations. 
 art from: http://opengameart.org/users/rawdanitsu
 
 */
ArrayList<Body> bodies = new ArrayList<Body>();
StarBackground bg;

boolean easingOn = false;
float easing = 0.05;
float currPosX = 0;
float currPosY = 0;

PImage vignette;

int lastTime = 0;

void setup() {
  size(640, 480);
  imageMode(CENTER);
  smooth();

  vignette = loadImage("vignette.png");
  bg = new StarBackground();

  Body sun = new Body("sun.png", 0, 0.01, 0);

  // 
  Body earth = new Body("earth.png", 320, 1/2.0, 0.05);
  Body moon = new Body("moon.png", 140, -1/3.0, 0.4);

  bodies.add(sun);
  sun.add(earth);
  earth.add(moon);

  lastTime = millis();
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  float delta = (millis() - lastTime) / 1000.0f;

  // make the user move to the middle of the screen before making easing work,
  // otherwise, the 'camera' will just jump to the top left corner.
  if (easingOn == false) {
    if (mouseX > width/2 - 30 && mouseX < width/2 + 30) {
      easingOn = true;
    }
  }

  if (easingOn) {
    float targetX = (mouseX - width/2.0) - currPosX;
    float targetY = (mouseY - height/2.0) - currPosY;

    currPosX += targetX * easing;
    currPosY += targetY * easing;

    translate(-currPosX, -currPosY);
  }

  bg.draw();

  for (int i = 0; i < bodies.size(); i++) {
    bodies.get(i).update(delta);
    bodies.get(i).draw();
  }
  popMatrix();

  image(vignette, width/2, height/2);

  lastTime = millis();
}

/*
  
 */
class Body {
  private PImage img = null;
  private PVector pos = null;

  private float angle ;
  private float angVel;

  private float revolution;
  private float revVel;

  private float distFromParent;

  ArrayList<Body> children = new ArrayList<Body>();

  public Body(String imgPath, float distanceFromParent, float angularVel, float revolutionVel) {
    img = loadImage(imgPath);
    pos = new PVector(distanceFromParent, 0);

    angle = 0.0f;
    angVel = angularVel;

    revVel = revolutionVel;
    revolution = 0;

    distFromParent = distanceFromParent;
  }

  public void draw() {
    pushMatrix();
    
    // rotate, THEN translate to make child orbit the parent
    rotate(revolution);
    translate(distFromParent, 0);

    pushMatrix();
    // undo the revolution rotation. We don't want it changing our rotation.
    rotate(-revolution);

    rotate(angle);
    image(img, 0, 0);
    popMatrix();

    pushMatrix();
    for (int i = 0; i < children.size(); i++) {
      children.get(i).draw();
    }
    popMatrix();
    popMatrix();
  }

  public void add(Body b) {
    children.add(b);
  }

  public void update(float delta) {
    angle += (angVel * delta) * TWO_PI;
    revolution += (revVel * delta) * TWO_PI;

    for (int i = 0; i < children.size(); i++) {
      children.get(i).update(delta);
    }
  }
}

/*
*/
class StarBackground {
  ArrayList<PVector> smallStars = new ArrayList<PVector>();
  final int NUM_STARS = 1000;
  final int SCREENS = 2;

  StarBackground() {
    for (int i = 0; i < NUM_STARS; i++) {
      int randomX = (int)random(-width * SCREENS, width * SCREENS);
      int randomY = (int)random(-height * SCREENS, height * SCREENS);
      smallStars.add(new PVector(randomX, randomY));
    }
  }

  void draw() {
    stroke(255);
    strokeWeight(1);
    for (int i = 0; i < NUM_STARS; i++) {
      PVector v = smallStars.get(i); 
      point(v.x, v.y);
    }
  }
}



