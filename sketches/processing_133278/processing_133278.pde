



void setup() {
  size(1000, 500);
  background(255, 0, 0);
  smooth();
  stroke(255, 255, 255);
}

void draw() {

  int resolution = 40;
  float radius = 5;
  float circleX = mouseX;
  float circleY = mouseY;


  radius = 20;
  fill(0, 0, 255);
  noStroke();

  beginShape();
  for (int i=0; i<resolution; i=i+1 ) {

    float waveAngle = map( i, 0, resolution, 0, TWO_PI*15 );
    float waveOffset = sin(waveAngle) * 5;

    float angle = map( i, 0, resolution, 0, TWO_PI );
    float circleOffX = cos(angle) * (radius + waveOffset);
    float circleOffY = sin(angle) * (radius + waveOffset);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    vertex( x, y );
  }

  endShape(CLOSE);
}

