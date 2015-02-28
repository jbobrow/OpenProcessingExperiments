
class Honker {
  float x;
  float y;

  int w;
  int h;

  //  float r, g, b;

  float xSpeed = 0.5;
  float ySpeed = 0.5;

  int sound;

  boolean alive;
  boolean xPause;
  boolean yPause;

  int timeMouthOpen; // length of time the mouth should stay open; will vary per sound
  int timeMouthShut; // length of time the mouth should stay shut afterwards; will space out sounds
  int timeOpenCurrent; // how long the mouth has been open
  int timeShutCurrent; // how long the mouth has been shut
  int lastSavedTime; // last time mouth changed between open and shut
  boolean mouthOpen;

  Honker() {
  }

  void setupHonker() {
    lastSavedTime = millis();
    x=int(random(10, 630));
    y=int(random(10, 200));
    xPause = false;
    yPause = false;

    w = 40;
    h = 40;

    //    r = random(255);
    //    g = random(255);
    //    b = random(255);

    sound = int(random(1, 4)); //each Honker gets random sound 1 through 3 (will maybe be more)

    //then parameters set according to what sound was assigned
    //silence between sounds (when mouth shut) randomized so that all sounds not in sync
    //[consider assigning generic variable here to cover all sounds]

    //sound 1 is the honk
    if (sound == 1) {
      timeMouthOpen = 400;
      timeMouthShut = int(random(1300, 1700));
    }

    //sound 2 is the boing
    if (sound == 2) {
      timeMouthOpen = 1070;
      timeMouthShut = int(random(900, 2000));
    }

    //sound 3 is the noisemaker
    if (sound == 3) {
      timeMouthOpen = 750;
      timeMouthShut = int(random(1300, 2300));
    }

    alive = true;

    mouthOpen = false;
  }

  //the honkers will be drawn only if they're still alive
  //otherwise their coordinates will be reset to 0,0 so Richie can't reach them

  void display() {
    if (alive && sound == 1) {
      if (mouthOpen) {
        image(honkOpen, x, y, w, h);
        soundHonk.play(); //plays the sound
        timeOpenCurrent = millis() - lastSavedTime;

        if (timeOpenCurrent > timeMouthOpen) { // test if mouth has been open long enough
          mouthOpen = false; // if so, shuts mouth
          lastSavedTime = millis(); // resets timer to current time
        }
      }
      else { //if mouth is shut;
        image(honkShut, x, y, w, h);
        timeShutCurrent = millis() - lastSavedTime; // how long mouth has been shut
        if (timeShutCurrent > timeMouthShut) {
          mouthOpen = true; //opens the mouth back up
          lastSavedTime = millis();
          soundHonk.rewind(); //resets the sound
        }
      }
    }

    if (alive && sound == 2) {
      if (mouthOpen) {
        image(honkOpen, x, y, w, h);
        soundBoing.play(); //plays the sound
        timeOpenCurrent = millis() - lastSavedTime;

        if (timeOpenCurrent > timeMouthOpen) { // test if mouth has been open long enough
          mouthOpen = false; // if so, shuts mouth
          lastSavedTime = millis(); // resets timer to current time
        }
      }
      else { //if mouth is shut;
        image(honkShut, x, y, w, h);
        timeShutCurrent = millis() - lastSavedTime; // how long mouth has been shut
        if (timeShutCurrent > timeMouthShut) {
          mouthOpen = true; //opens the mouth back up
          lastSavedTime = millis();
          soundBoing.rewind(); //resets the sound
        }
      }
    }

    if (alive && sound == 3) {
      if (mouthOpen) {
        image(honkOpen, x, y, w, h);
        soundNoisemaker.play(); //plays the sound
        timeOpenCurrent = millis() - lastSavedTime;

        if (timeOpenCurrent > timeMouthOpen) { // test if mouth has been open long enough
          mouthOpen = false; // if so, shuts mouth
          lastSavedTime = millis(); // resets timer to current time
        }
      }
      else { //if mouth is shut;
        image(honkShut, x, y, w, h);
        timeShutCurrent = millis() - lastSavedTime; // how long mouth has been shut
        if (timeShutCurrent > timeMouthShut) {
          mouthOpen = true; //opens the mouth back up
          lastSavedTime = millis();
          soundNoisemaker.rewind(); //resets the sound
        }
      }
    }

    if (!alive) { //if the Honker is dead, it become black and moves to the corner out of gameplay
      fill(0);
      x=0;
      y=0;
    }
  }

  // making the honkers move:
  // they will chase Richie
  // main game window will prevent their overlapping each other

  void moveX() {
    if (alive && !xPause) {
      if (x < richie.x) {
        x += xSpeed;
      }
      if (x > richie.x) {
        x -= xSpeed;
      }
    }
  }

  void moveY() {
    if (alive && !yPause) {
      if (y < richie.y) {
        y += ySpeed;
      }
      if (y > richie.y) {
        y -= ySpeed;
      }
    }
  }
}


