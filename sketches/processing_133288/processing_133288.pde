
int resolution = 500;
float radius = 100;
float circleX;
float circleY;
float rotation = 0;
float myColor;
int offset;


void setup() {
  size(500, 500);
  background(0);
  circleX = 0;
  circleY = 0;
}

void draw() {
  offset++;
  translate(width/2, height/2);
  
  myColor = map(sin(float(offset)*.05),-1,1,0,255);
  fill(myColor, myColor/4, myColor/4);

  rotate(radians(rotation));
  rotation += 3;

  beginShape();
  for (int i = 0; i < resolution; i++) {

    int scale = 80;

    float waveAngle = map(i, 0, resolution, 0, TWO_PI * 15); //number of petals
    float waveOffset = sin(waveAngle) * scale;  //scale the -1 to 1 up

    float angle = map(i, 0, resolution, 0, TWO_PI * 14); //multiply for weirdness

    float circleOffsetX = cos(angle) * (radius + waveOffset); //xposition
    float circleOffsetY = sin(angle) * (radius + waveOffset); //yposition

    float x = circleX + circleOffsetX;
    float y = circleY + circleOffsetY;

    vertex(x, y);

  }
  endShape(CLOSE);
}

