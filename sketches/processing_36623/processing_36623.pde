
PVector center;
float rotation = 0;

void setup() {
  size(800,800);
  rectMode(RADIUS);
  noFill();
  stroke(255);
  center = new PVector(width/2, height/2);//center of the screen
}

void draw() {
  background(0);
  drawFractal(center, width/2 - 20, rotation);
  rotation += .002;
}

void drawFractal(PVector center_coor, float side, float rot) {
  pushMatrix();
  translate(center_coor.x, center_coor.x);
  rotate(rot);
  rect(0, 0, side, side);
  if (side > 1)
    drawFractal(new PVector(0, 0), sqrt(2)*side/2, rot);
  popMatrix();
  
}
