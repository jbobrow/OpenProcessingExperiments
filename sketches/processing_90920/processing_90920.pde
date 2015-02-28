
ArrayList myTargets; // ArrayList to put all my targets in.
ArrayList scorePrettifiers; // ArrayList to put all the pretty +1 and -1 notices above the score
int timeStamp;
int score;
int bullets;
int ammoState = 2; // Do we have ammo? 0 means no, 1 means reloading, 2 means yes.
int reloadTS; // Reload timer
int totalTargets; // How many targets were ever spawned?
int maxTargets = 50; // How many targets before the game ends?

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  cursor(CROSS); // make the cursor look like a crosshair! :D

  myTargets = new ArrayList();
  scorePrettifiers = new ArrayList();

  timeStamp = millis();

  score = 0;
  bullets = 10;
} // end of setup()

void draw() {
  background(255);

  //////////////////////////////////////
  ////////// ADDING TARGETS ////////////
  //////////////////////////////////////
  for (int i = 0; i < myTargets.size(); i++) {
    Target t = (Target) myTargets.get(i);
    t.display();
  }

  // Display score prettifiers
  for (int i = 0; i < scorePrettifiers.size(); i++) {
    scorePrettifier s = (scorePrettifier) scorePrettifiers.get(i);
    s.display();
    if (s.y > height-40) {
      s.y--;
    }
    else {
      scorePrettifiers.remove(i);
    }
  }

  // Counter
  int passedTime = millis() - timeStamp;

  if (passedTime >= random(300, 4000) && totalTargets < maxTargets) { // If 0.5 to 2 seconds have passed since the last target was placed..
    int diameter = int(random(35, 65));
    myTargets.add(new Target(random(0, width), random(0, height), diameter, diameter, color(random(0, 255), random(0, 255), random(0, 255))));
    totalTargets++;
    timeStamp = millis(); // Reset the timer.
  }


  ////////////////////////////////
  /////// REMOVING TARGETS ///////
  ////////////////////////////////
  if (myTargets.size() == 5) { // If there's 5 targets on scene
    myTargets.remove(0); // Remove the oldest one
  }

  ////////////////////////////////
  //////////// SCORE /////////////
  ////////////////////////////////
  if (totalTargets < maxTargets) {
    noStroke();
    fill(0, 0, 0, 200);
    rect(0, height-20, width, 20);
    fill(255);
    textSize(12);
    text("SCORE: " + score, 10, height-5);

    ////////////////////////////////
    ////////// BULLETS /////////////
    ////////////////////////////////
    fill(255);
    textSize(12);
    text("BULLETS: " + bullets, 100, height-5);
  }


  ////////////////////////////////
  //////// AMMO WARNING //////////
  ////////////////////////////////
  if (ammoState == 0 && totalTargets < maxTargets) {
    textSize(50);
    fill(255, 0, 0);
    text("[R]ELOAD!", width*0.2, height*0.5);
  }
  else if (ammoState == 1 && totalTargets < maxTargets) {
    textSize(50);
    fill(255, 0, 0);
    text("Reloading..", width*0.15, height*0.5);
  }


  ////////////////////////////////
  /////////// RELOADING //////////
  ////////////////////////////////
  int timeSinceReload = millis() - reloadTS;
  if (timeSinceReload > 3000 && ammoState == 1) {
    ammoState = 2;
    bullets = 10;
  }

  ////////////////////////////////
  ////////// END GAME ////////////
  ////////////////////////////////
  if (totalTargets >= maxTargets) {
    // Remove remaining targets
    for (int i = 0; i < myTargets.size(); i++) {
      Target s = (Target) myTargets.get(i);
      myTargets.remove(i);
    }
    
    // End game text
    textSize(32);
    fill(0);
    text("Game over!", width*0.25, height*0.4);
    text("You scored: " + score, width*0.20, height*0.5);
  }
} // end of draw()



/////////////////////////////////
/////////// TARGETS /////////////
/////////////////////////////////

class Target {
  // properties
  float x, y, w, h; // position X, Y, width, height, color of each target.
  color c;

  // constructor
  Target(float posX, float posY, float tWidth, float tHeight, color tColor) {
    x = posX; // Give the object's properties the values passed as arguments.
    y = posY;
    w = tWidth;
    h = tHeight;
    c = tColor;
  }

  // functions
  void display() {

    noStroke();
    fill(c); // Fill the target with the color passed as argument.
    ellipse(x, y, w, h); // Draw the target with the properties passed as argument.
    fill(255);
    ellipse(x, y, w-(w*30/100), h-(h*30/100));    
    fill(c);
    ellipse(x, y, w-(w*60/100), h-(h*60/100));
  }
} // end of obj Target



/////////////////////////////////
/////// SCORE PRETTIFIER ////////
/////////////////////////////////
class scorePrettifier {
  // properties
  float x = 20;
  float y = height-20;
  float a = 255;

  // constructor
  scorePrettifier() {
  }

  // functions
  void display() {
    fill(0, 200, 0, a);
    textSize(12);
    text("+1", x, y);
  }
}


void mousePressed() {
  if (bullets > 0 && ammoState != 1 && ammoState != 0) {
    bullets--;
    for (int i = 0; i < myTargets.size(); i++) {
      Target t = (Target) myTargets.get(i);
      float distance = dist(mouseX, mouseY, t.x, t.y);

      if (distance < t.w*0.5) {
        myTargets.remove(i);
        score++;
        scorePrettifiers.add(new scorePrettifier());
      }
    }
  }
  else if (bullets <= 0 && ammoState != 1) {
    ammoState = 0;
  }
}

void keyPressed() {
  if (key == 'r' & ammoState != 1) {
    ammoState = 1;
    reloadTS = millis();
  }
}
