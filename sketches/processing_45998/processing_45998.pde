
//flink - behäbig

float xPos = 100;
float yPos = 100;

float xPos1 = 300;
float yPos1 = 100;

int ySpeed = 1;
int ySpeed1 = 8;

void setup() {

  size( 400, 400 );
  smooth();
  noStroke();
}

void draw() {
  background( 200 );
  ellipse( xPos, yPos, 100, 100);
  ellipse( xPos1, yPos1, 40, 40 );

  if ( yPos > height || yPos < 0 ) {
    ySpeed = ySpeed * -1;
  }

  if ( yPos1 > height || yPos1 < 0) {
    ySpeed1 = ySpeed1 * -1;
  }

  yPos = yPos + ySpeed;
  yPos1 = yPos1 + ySpeed1;
}

