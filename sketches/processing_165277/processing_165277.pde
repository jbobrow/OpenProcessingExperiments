

thing [] allthings = new thing [50];
thing [] allthings2 = new thing [30];


void setup() {
  size (800, 800);
  smooth ();

    for (int i = 0; i < 49; i ++) {
      for (int j = 1; j < 29; j ++) {
        allthings [i] = new thing ();
        allthings [i].prime ();
        allthings2 [j] = new thing ();
        allthings2 [j].prime ();
      }
    }
  }


void draw () {
  background (random (200, 255), random (0, 50), random (200, 255));

    for (int i = 1; i < 49; i ++) {
      for (int j = 1; j < 29; j ++) {
        allthings[i].update ();
        allthings2[j].update ();
     }
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
    fill (random(0, 100), random (0, 50), random (0, 100), random (0, 5));
    ellipse (xPosition + random(0, 5), yPosition - random(0, 5), size, size);

    if (xPosition > width || xPosition < 0) {
      direction = -direction;
    }

    if (yPosition > height || yPosition < 0) {
      direction = -direction;
    }
  }
}

