

thing [] allthings = new thing [50];
thing [] allthings2 = new thing [30];
creature [] mickey = new creature [40];


void setup() {
  size (800, 800);
  smooth ();

 if (millis() < 5000) {
    for (int k = 0; k < 39; k++) {
      mickey[k] = new creature();
      mickey [k].prime2 ();
    }
} else if (millis() > 5000 && millis() < 30000) {
    for (int i = 0; i < 49; i ++) {
      for (int j = 1; j < 29; j ++) {
        allthings [i] = new thing ();
        allthings [i].prime ();
        allthings2 [j] = new thing ();
        allthings2 [j].prime ();
      }
    }
  }
}

void draw () {
  background (random (200, 255), random (0, 50), random (200, 255));

if (millis() < 5000) {
    for (int k = 0; k < 39; k++) {
      mickey[k].update2 ();
 }
} else if (millis() > 5000 && millis () < 30000){
    for (int i = 1; i < 49; i ++) {
      for (int j = 1; j < 29; j ++) {
        allthings[i].update ();
        allthings2[j].update ();
     }
    }
  }
}

class creature {

  float eyepositionX;
  float eyepositionY;

  float eyeposition2X;
  float eyeposition2Y;

  float headpositionX;
  float headpositionY;

  float nosepositionX;
  float nosepositionY;

  float eyesizeX;
  float eyesizeY;

  float eyesize2X;
  float eyesize2Y;

  float headsizeX;
  float headsizeY;

  float nosesizeX;
  float nosesizeY;

  float xspeed;
  float yspeed;
  float direction2;

  void prime2 () {

    xspeed = 5;
    yspeed = 5;
    direction2 = 1;

    headpositionX = random (0, width);
    headpositionY = random (0, height);

    nosepositionX = headpositionX;
    nosepositionY = headpositionY + 10;

    eyepositionX = headpositionX - 30; 
    eyepositionY = headpositionY - 45;

    eyeposition2X = headpositionX + 30;
    eyeposition2Y= headpositionX - 45;

    headsizeX = random(0, 100) ;
    headsizeY = random(0, 100);

    eyesizeX= headsizeX/2;
    eyesizeY= headsizeY/2;

    eyesize2X = headsizeX/2;
    eyesize2Y= headsizeY/2;

    nosesizeX = headsizeX/4;
    nosesizeY= headsizeY/4;
  }

  void update2 () {

    headpositionX += xspeed * direction2;
    headpositionY += yspeed * direction2;


    fill (random(0, 255), random(0, 255), random(0, 255));
    ellipse (headpositionX, headpositionY, headsizeX, headsizeY);
    fill (random(0, 255), 0, random(0, 255));
    ellipse(eyepositionX, eyepositionY, eyesizeX, eyesizeY);
    ellipse(eyeposition2X, eyeposition2Y, eyesize2X, eyesize2Y);
    fill (0, random(0, 255), 0);
    ellipse(nosepositionX, nosepositionY, nosesizeX, nosesizeY);
  }
}

class thing {

  float xPosition; 
  float yPosition;
  float xSpeed;
  float ySpeed;
  float direction;
  float size; 

  void prime () {
    xPosition = random (0, width);
    yPosition = random (0, height);
    xSpeed = random (1, 5);
    ySpeed = random (1, 5);
    direction = 1;
    size = random (50, 150);
  } 

  void update () {

    xPosition += direction  * xSpeed ;
    yPosition += direction * ySpeed;


    noStroke ();
    fill (random(0, 100), random (0, 100), random (0, 100), random (0, 50));
    ellipse (xPosition + random(0, 5), yPosition - random(0, 5), size, size);

    if (xPosition > width || xPosition < 0) {
      direction = -direction;
    }

    if (yPosition > height || yPosition < 0) {
      direction = -direction;
    }
  }
}


