
int xPos;
int yPos;
int velocity;

void setup() {
  size(400, 400);
  background(177, 4, 203);
  xPos=int(random(200, 200));
  yPos=int(random(20, height-20));
  velocity=4;
}

void draw() {
  background(177, 4, 203);
  yPos=yPos+velocity;
  if (yPos<=20||yPos>=width-20) { 
    velocity=velocity*(-1);
  }

  fill(250, 255, 0);
  noStroke();
  smooth();
  ellipse(xPos, yPos, 50, 50);
}
