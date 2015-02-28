
int value = 0;

void setup(){
  size(640,480);
  frameRate(5);
  background(255,100,0);
}

void draw() {
  //background(0);
  float posX = random(width);
  float posY = random(height);
  float distance_top = random(height/4);
  stroke(255);
  strokeWeight(3);
  if (value == 0) {
    fill(random(255), random(255), random(255));
    posX = mouseX;
    posY = mouseY;
    value = 1;
  }
  ellipse(posX, posY ,distance_top, distance_top);
}

void mouseClicked() {
  value = 0;
}
