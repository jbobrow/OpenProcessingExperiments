
class BG {
  float square1x, square1y;
  float square2x, square2y;
  float square3x, square3y;
  float square1v, square2v, square3v;

  float rColor;
  float gColor;
  float bColor;
  color bgColor;
  color bgLowColor;
  int rCMin;
  int rCMax;
  int gCMin;
  int gCMax;
  int bCMin;
  int bCMax;

  float bgPartSpawn;
  ArrayList bgParticles;

  BG () {
    rColor = 0;
    gColor = 0;
    bColor = 0;

    rCMin = 30;
    rCMax = 255;
    gCMin = 30;
    gCMax = 225;
    bCMin = 30;
    bCMax = 225;

    square1x = 30;
    square2x = 10;
    square3x = 800;

    square1y = 300;
    square2y = 325;
    square3y = 335;

    square1v = -0.4;
    square2v = -0.2;
    square3v = -0.1;

    bgParticles = new ArrayList();
  }

  void update() {
    if (gameMode == "coop") {
      rColor = map(player.x, 0, width, rCMin, rCMax);
      gColor = map(player2.x, 0, width, gCMin, gCMax);
      bColor = map(sqrt(sq(player.y)+sq(player2.y)), 0, height, bCMin, bCMax);

      square1x += square1v;
      square2x += square2v;
      square3x += square3v;

      if (square1x < -200) {
        square1x = width;
      }
      if (square2x < -400) {
        square2x = width;
      }
      if (square3x < -600) {
        square3x = width;
      }

      bgPartSpawn = random(0, 60);
      if (bgPartSpawn <= 5) {
        BGParticle bgPart = new BGParticle(bgPartSpawn);
        bgParticles.add(bgPart);
      }
    }

    bgColor = color(rColor, gColor, bColor);
    bgLowColor = color(rColor/2, gColor/2, bColor/2);
  }

  void sketch() {
    if (gameMode == "coop") {
      rectMode(CORNER);
      background(rColor, gColor, bColor);
      fill(rColor/2, gColor/2, bColor/2);

      rect(0, 350, 800, 50);
      rect(square1x, square1y, 200, 100);
      rect(square2x, square2y, 400, 50);
      rect(square3x, square3y, 600, 150);

      if (bgParticles.size() > 0) {
        for (int i = 0; i < bgParticles.size(); i++) {
          BGParticle partTemp = (BGParticle)bgParticles.get(i);
          partTemp.update();
          partTemp.sketch();
        }
      }
    }
    else if (gameMode == "comp") {
      rectMode(CORNER);
      fill(rColor, gColor, bColor, 1);
      rect(0, 0, width, height);
      fill(rColor/2, gColor/2, bColor/2);
      rect(0, 350, 800, 50);
      rect(square1x, square1y, 200, 100);
      rect(square2x, square2y, 400, 50);
      rect(square3x, square3y, 600, 150);
      
      rectMode(CENTER);
      textAlign(CENTER);
      pushMatrix();
      fill(rColor, gColor, bColor);
      translate(width/2, height - 20);
      text("paint the sky", 0, 0, 600, 20);
      popMatrix();
      rectMode(CORNER);
    }
  }

  void removeParticle(BGParticle particle) {
    int index = bgParticles.indexOf(particle);
    bgParticles.remove(index);
  }
}

class BGParticle {
  float speed;
  float y;

  float x;
  float partSize;

  BGParticle(float depth) {
    this.x = width+10;
    this.y = random(150-30*depth, 350);
    speed = (10 - depth)/2;
    partSize = depth;
  }

  void update() {
    this.x -= speed;
    if (this.x < -10) {
      bg.removeParticle(this);
    }
  }

  void sketch() {
    rectMode(CENTER);
    pushMatrix();
    fill(bg.rColor/2, bg.gColor/2, bg.bColor/2);
    translate(this.x, this.y);
    rect(0, 0, partSize, partSize);
    popMatrix();
    rectMode(CORNER);
  }
}


