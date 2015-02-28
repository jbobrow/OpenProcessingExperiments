
void setup()
{
  size(400, 300);
  background(128);
  smooth();
}
 
void draw() {
  randomSeed(5);
  fill(128, map(mouseX, 0, width, 255, 0));
  rect(-1, -1, width, height);
  float r = 10;
 
 delta = 100
  for (int x = delta/2; x < width; x += delta/2) {
    for (int y =delta/2; y < height; y += delta/2) {
      pushMatrix();
      translate(x, y);
      noStroke();
      angle = radians(random(map(mouseY, 0, height, -10, 10)*frameCount)) % TWO_PI;
      rotate(angle);
      stroke(126, 0, 0);
      line(0, -1.5*(r+angle), 1.5*(r+angle), 0);
      line(1.5*(r+angle), 0, 0, 1.5*(r+angle));
      line(0, 1.5*(r+angle), -1.5*(r+angle), 0);
      line(-1.5*(r+angle), 0, 0, -1.5*(r+angle));
      fill(255);
      r2 = random(5)
      ellipse(0, -1.5*(r+angle), r+angle, r+angle);
      fill(0);
      ellipse(0, 1.5*(r+angle), r+angle, r+angle);
      fill(255, 0, 0);
      ellipse(-1.5*(r+angle), 0, r+angle, r+angle);
      fill(0, 0, 255);
      ellipse(1.5*(r+angle), 0, r+angle, r+angle);
      popMatrix();
    }
  }
}
