
thing [] allthings = new thing [50];

void setup() {
  size (800, 800);
  smooth ();
  background (255);


  for (int i = 0; i < 49; i ++) {
    allthings [i] = new thing ();
    allthings [i].prime ();
  }
} 

void draw () {
  for (int i = 1; i < 49; i ++) {
    allthings[i].update ();
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
    xSpeed = 5;
    ySpeed = 10;
    direction = 1;
    size = random (50, 150);
  } 

  void update () {

    xPosition += direction * xSpeed;
    yPosition += direction * ySpeed;

    noStroke ();
    fill (random(0, 255), random (0, 255), random (0, 255), random (0, 255));
    ellipse (xPosition *random(0, 5), yPosition*random(0, 5), size, size);

    if (xPosition > width || xPosition < 0) {
      direction = -direction;
    }

    if (yPosition > height || yPosition < 0) {
      direction = -direction;
    }
  }
} 
