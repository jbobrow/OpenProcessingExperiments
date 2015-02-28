
class Target {
  float tX;
  float tY;

  float velX;
  float velY;

  float targetSize = random(10,50);

  boolean enabled = false;

  Target() {
    tX = random(targetSize/2, width);
   tY = random(targetSize/2, height);
    velX = random(-5, 5);
    velY = random(-5, 5);
  }


  void update() {

    if (!enabled)return;
    tX+=velX;
    tY+=velY;
    fill(255, 255, 255, 200);
    noStroke();
    ellipse(tX, tY, targetSize, targetSize);
  }

  void collider() {
    if ((tX<targetSize) || ( tX> width - targetSize)) {
      velX = -velX;
    }
    if ((tY<targetSize) || ( tY > height - targetSize)) {
      velY = -velY;
    }
  }
}


