
class Asteroid {
  // Fields
  float rotation = 0;
  float xPos, yPos;
  float velocityX, velocityY;
  long lastDrawMillis = 0;
  int aSize;

  //Constructor
  Asteroid() {
    xPos = random(0, 500);
    yPos = random(0, 500);
    rotation = random(0, TWO_PI);
    velocityX = sin(rotation) * 10;
    velocityY = -cos(rotation) * 10;
    aSize = 2;
  }

  //Another Constructor
  Asteroid(int initSize, float initX, float initY, long lastMillis) {
    xPos = initX;
    yPos = initY;
    lastDrawMillis = lastMillis;
    rotation = random(0, TWO_PI);
    velocityX = sin(rotation) * 10;
    velocityY = -cos(rotation) * 10;
    aSize = initSize;
  }

  //Methods
  void drawMe() {
    fill(180);
    long currentMillis = millis();
    float timeSinceLastDraw = ((float)currentMillis - (float)lastDrawMillis) / 1000;
    lastDrawMillis = currentMillis;
    xPos = xPos + velocityX * timeSinceLastDraw * 5;
    yPos = yPos + velocityY * timeSinceLastDraw * 5;
    if(xPos > 500) {
      xPos -= 500;
    }
    else if(xPos < 0) {
      xPos += 500;
    }
    if(yPos > 500) {
      yPos -= 500;
    }
    else if(yPos < 0) {
      yPos += 500;
    }

    pushMatrix();
    translate(xPos, yPos);
    rotate(rotation);
    if(aSize == 1) {
      scale(0.7);
    }
    else if(aSize == 0) {
      scale(0.3);
    }
    int[] xpts = {
      -20, -20, 20, 20
    };
    int[] ypts = {
       20, -20, -20, 20
    };
    beginShape();
    for(int i = 0; i < 4; i++) {
      vertex(xpts[i], ypts[i]);
    }
    endShape();
    popMatrix();
  }

  void destroy(ArrayList asteroids) {
    asteroids.remove(this);
    if(aSize == 2) {
      asteroids.add(new Asteroid(aSize-1, xPos + 20, yPos + 20, lastDrawMillis));
      asteroids.add(new Asteroid(aSize-1, xPos - 20, yPos - 20, lastDrawMillis));
    }
    else if(aSize == 1) {
      asteroids.add(new Asteroid(aSize-1, xPos + 10, yPos + 10, lastDrawMillis));
      asteroids.add(new Asteroid(aSize-1, xPos - 10, yPos - 10, lastDrawMillis));
    }
  }
}

