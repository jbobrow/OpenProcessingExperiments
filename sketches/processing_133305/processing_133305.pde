
//look how cool this is!

int resolution = 500;
float radius = 100;
float circleX;
float circleY;
float rotation = 0;
float myColor;
int offset;
float petals;
float opacity = 255;


void setup() {
  size(700, 700);
  //background(255);
  circleX = 0;
  circleY = 0;
}

void draw() {

  background(0);
  offset++;

  translate(width/2, height/2);

  fill(255);
  stroke(0);

  rotate(radians(rotation));
  rotation += 1;

  petals = map(sin(offset*0.0002), -1, 1, 1, 100); //slow down petals!
 

  beginShape();
  for (int i = 0; i < resolution; i++) {

    float scale = 200;

    float waveAngle = map(i, 0, resolution, 0, TWO_PI * petals); //number of petals
    float waveOffset = sin(waveAngle) * scale;  //scale the -1 to 1 up

    float angle = map(i, 0, resolution, 0, TWO_PI * 156); //multiply for weirdness

    float circleOffsetX = cos(angle) * (radius + waveOffset); //xposition
    float circleOffsetY = sin(angle) * (radius + waveOffset); //yposition

    float x = circleX + circleOffsetX;
    float y = circleY + circleOffsetY;

    vertex(x, y);
  }
  endShape(CLOSE);
}

