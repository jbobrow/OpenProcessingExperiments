
class Blast {

  float x_center;
  float y_center;
  
  float u;
  float timer;
  float startTime;              // % input strength.
  private float blastTime;      // the measured time of the current ring.
  float power;

  float maxAlpha;
  
  Boolean isCollision;

  Blast( float x, float y, float powah ) {
    x_center = x;
    y_center = y;
    startTime = millis();

    isCollision = false;
    
    if(powah >= 1) {
      powah = 1;
    }

    power = powah;

    blastTime = powah * maxBlastTime;
    maxAlpha = powah * 255;
  }

  void update() {
    timer = millis();
    u = (timer - startTime) / blastTime;
    

    float newAlpha = (1-u)*maxAlpha;

    pushMatrix();
    translate(x_center, y_center);
    fill(100,100,255, newAlpha);
    ellipse(0, 0, u*blastTime, u*blastTime);
    popMatrix();
    
    // For some reason, the drawing of the ellipse and the contact with the
    // obstacles were out of sync. Correcting u by squaring it fixed it for
    // some reason.
    u = u * u;

    if(!isCollision) {
      checkScreenCollision();
      checkEnemyCollision();
    }
    
    if(u >= 0.5) {
      removeBlast(this);
    }
  }

  void checkScreenCollision() {
    if((x_center + u*blastTime) >= width) {
      println("Right hit");
      isCollision = true;
      pSpeed = (1-u)*pMaxSpeed;
      pAngle = -PI;
    }
    else if((x_center - u*blastTime) <= 0) {
      println("Left hit");
      isCollision = true;
      pSpeed = (1-u)*pMaxSpeed;
      pAngle = 0;
    }
    else if((y_center + u*blastTime) >= height) {
      println("Bottom hit");
      isCollision = true;
      pSpeed = (1-u)*pMaxSpeed;
      pAngle = 3*HALF_PI;
    }
    else if((y_center - u*blastTime) <= 0) {
      println("Top hit");
      isCollision = true;
      pSpeed = (1-u)*pMaxSpeed;
      pAngle = HALF_PI;
    }
  }

  float d = 10000;
  Enemy e;
  Enemy e0;

  void checkEnemyCollision() {
    if (enemies.size() > 0) {
      for(int i = 0; i < enemies.size(); i++) {
        float tempD;

        e = (Enemy)enemies.get(i);
        tempD = dist(this.x_center, this.y_center, e.x, e.y);

        if(tempD < d) {
          d = tempD;
          e0 = e;
        }
      }

      if (d <= u*blastTime) {
        pSpeed = (1-u)*pMaxSpeed*power;

        float tempAngle = atan2((this.y_center - e0.y),(this.x_center - e0.x));
        pAngle = tempAngle;
        
        removeBlast(this);
        removeEnemy(e0);
      }
    }
  }
}


