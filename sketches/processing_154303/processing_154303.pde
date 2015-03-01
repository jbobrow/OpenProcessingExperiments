
int state = 0;
int numStars = 500;
float[] dotX = new float [numStars];
float[] dotY = new float [numStars];
float[] velocity = new float [numStars];
float blackHoleX;
float blackHoleY;
float blackHoleVelocity;
void setup() {
  size(640, 480);
  background(255, 0, 200);
  for (int i=0; i<numStars; i++) {
    dotX[i] = random(width);
    dotY[i] = random(height);
    velocity[i] = random(10.0);
  }
  blackHoleX = random(width);
  blackHoleY = random(height);
  blackHoleVelocity = ;
}
void draw() {
  if (state == 0) {
    background(255, 0, 200);
    textSize(32);
    fill(100, 255, 255);
    textAlign(CENTER);
    text("Press Spacebar to begin", width/2, height/2);
  } else if (state == 1) {
    background(255, 0, 200);
    stroke(100, 255, 100);
    strokeWeight(10);

    for (int i=0; i<numStars; i++) {
      point(dotX[i], dotY[i]);

      dotX[i] += velocity[i];
      if (dotX[i] > width) {
        dotX[i] = 0;
      }
    }
    stroke(0);
    strokeWeight(25);
    point(blackHoleX, blackHoleY);
    for (int i=0; i<numStars; i++) {

      if (dist(dotX[i], dotY[i], blackHoleX, blackHoleY) < 75){
        dotX[i] = blackHoleX;
        dotY[i] = blackHoleY;
      }
    }
