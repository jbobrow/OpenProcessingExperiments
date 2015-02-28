
DroppingBall[] grumpybones = new DroppingBall[10];
void setup() {
  size(400, 740);
  for (int i = 0; i < grumpybones.length; i++ ) {
    grumpybones[i] = new DroppingBall( random(width) );
  }
}

void draw() {
  background(200);
  for (int i = 0; i < grumpybones.length; i++ ) {
    grumpybones[i].update();
    grumpybones[i].draw();
  }
}
class DroppingBall {
  float y;
  float x;
  float ySpeed;
  float gravity;
  //speed of drops
  int lastDrop;
  int dropRate;
  
  int redValue;
  DroppingBall(float tempx){
    y = 0;
    ySpeed = 0;
    gravity = 1.5;
    x = tempx;
    lastDrop = millis();
    dropRate = 1000 + int(random(1000));
    redValue = int(random(255));
  }
  void draw() {
    fill(redValue, 200, 103);
    ellipse(x, y, 40, 40);
  }
  void update() {
    ySpeed += gravity;
    y += ySpeed;
    if (millis()-lastDrop > dropRate) {
      reset();
      lastDrop = millis();
    }
  }
  void reset() {
      y = 0;
      ySpeed = 0;
  }
}
