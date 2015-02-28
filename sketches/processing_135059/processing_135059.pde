
int elements = 150;
int elementLength = 2;
int tentacles = 5;
int seed = 0;
float startX = 0;
float startY = 0;
float endX;
float endY;
float lineWidth = 20;
float angle;
float angleChange=0.0;
float angleIncrement = 0.1;
float effectMultiplier = 10;
float noiseOffset = 0.0;
float tentacleNoiseOffset;
boolean symmetry = true;


void setup() {
  size(550, 550);
  //smooth();
  drawEkkiNoDerm();
}

void draw() {
}

void drawTentacle(float initialAngle, float tentacleNoiseOffset) {
  fill(0);
  startY = height/2;
  startX = width/2;
  angle = initialAngle;
  angleChange = 0 + noiseOffset;
  for (int i = 0; i < elements; i = i+1) {
    endX = startX + sin(radians(angle)) * elementLength;
    endY = startY + cos(radians(angle)) * elementLength; 
    strokeWeight(lineWidth - lineWidth / elements * i);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
    angle += (noise(angleChange + tentacleNoiseOffset) - 0.5) * effectMultiplier;
    angleChange += angleIncrement;
  }
}

void drawEkkiNoDerm() {
  background(255);
  float initialAngle = 180;
  for (int i = 0; i < tentacles; i = i+1) {
    if (symmetry) {
      tentacleNoiseOffset = 0;
    }
    else {
      tentacleNoiseOffset = 1000 * i;
    }
    drawTentacle(initialAngle, tentacleNoiseOffset);
    initialAngle = initialAngle + (360 / tentacles);
  }
}

void mouseMoved() {
  noiseOffset = map(mouseX, 0, width, 0, 50);
  effectMultiplier = map(mouseY, 0, height, 1, 90);
  drawEkkiNoDerm();
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    symmetry = !symmetry;
  }
  if (mouseButton == LEFT) {
    noiseSeed(random());
    drawEkkiNoDerm();
  }
}

//void keyReleased() {
//  if (key == 's' || key == 'S') saveFrame("##.png");
//}

