
boolean firstObjCreated = false;
int projectileCount = 0, maxNumProjectiles = 20, ballSize = 20;
Projectile[] projectile = new Projectile[maxNumProjectiles];

void setup() {
  size(600, 600);
  background(255);
  fill(255,0,0);
}

void mousePressed() {
  float xPos = mouseX, yPos = mouseY;
  firstObjCreated = true;

  if (projectileCount < maxNumProjectiles) {
    float startYspeed = map(yPos, 0, height, 45, 10);
    projectile[projectileCount] = new Projectile(xPos, yPos, startYspeed);

    projectileCount++;
  }
}

void keyPressed() {
  if (firstObjCreated) {
    if (key == ' ') {
      for (int i=0; i<projectileCount; i++) {
        projectile[i].stopProjectile();
      }
      projectileCount = 0;
    }
  }
}

void draw() {
  if (firstObjCreated==true) {
    background(255);

    for (int i=0; i<projectileCount; i++) {
      projectile[i].animateProjectile();
    }
  }
}

class Projectile
{
  boolean active, bounced;
  float startYspeed, ySpeed, gravity, xPos, yPos;

  Projectile(float tempXpos, float tempYpos, float tempStartYspeed) {
    active = true;
    bounced = false;

    startYspeed = tempStartYspeed;
    ySpeed = startYspeed;
    gravity = -1.65;

    xPos = tempXpos;
    yPos = tempYpos;
  }

  void animateProjectile() {
    if (active) {
      if (yPos <= height) {
        if (bounced) {
          yPos -= ySpeed;
          ellipse(xPos, yPos, ballSize, ballSize);
          ySpeed += gravity;
        }
        else {
          yPos += ySpeed;
          ellipse(xPos, yPos, ballSize, ballSize);
          ySpeed -= gravity;

          if (yPos >= height)
            bounced = true;
        }
      }
      else {
        yPos = height;
        ySpeed = startYspeed;
      }
    }
  }

  void stopProjectile() {
    background(255);
    active = false;
  }
}


