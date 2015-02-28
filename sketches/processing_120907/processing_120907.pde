
DroppingBall[] eatingballs = new DroppingBall[10];

void setup() {
  size(600, 600);
  for (int i = 0; i < eatingballs.length; i++ ) {
    eatingballs[i] = new DroppingBall( random(width) );  
  }
}
 
void draw() {
  background(0);
  fill(255, 255, 0);
  arc(mouseX, mouseY, 60, 60, 0, PI+1.5);
  fill(0);
  ellipse(mouseX+20, mouseY+5, 10, 10);
  if 
  
  for (int i = 0; i < eatingballs.length; i++ ) {
    eatingballs[i].update();
    eatingballs[i].draw();
  }
}

class DroppingBall {
  float y;
  float x;
  float ySpeed;
  float gravity;
   
  int lastDrop;
  int dropRate;
   
  int redValue;

  DroppingBall(float tempx){
    y = 0;
    ySpeed = 0;
    gravity = .2;
    x = tempx;
    lastDrop = millis();
    dropRate = 1000 + int(random(1000));
    redValue = int(random(255));
  }
  void draw() {
    fill(255);
    noStroke();
    ellipse(x, y, 20, 20);
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

