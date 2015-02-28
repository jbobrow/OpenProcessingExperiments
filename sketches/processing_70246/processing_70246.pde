
float rad = 250;
float inc;


void setup() {
  size(600, 600);
  smooth();
  background(0);
  frameRate(300);
}

void draw() {

  translate(width/2, height/2);

  for ( inc=0; inc < TWO_PI; inc +=30) {
    //we use the increment to add to the angle
    //every frame it will be incremented by 10
    float angle = random(TWO_PI); //converting radians to degrees
    float x1 = cos(angle) * rad;
    float y1 = sin (angle) * rad;

    float angle2 = random(TWO_PI); //converting radians to degrees
    float x2 = cos(angle2) * rad;
    float y2 = sin (angle2) * rad;

    stroke(random(255), random(255), random(255));
    line (x1, y1, x2, y2);

    rectMode(CENTER);
    fill(random(200), random(200), random(200), 10);
    noStroke();
    rect(0, 0, width, height);
  }
}


