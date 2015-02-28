
class Asteroid {

  //Properties
  float posX;
  float posY;
  float velX;
  float velY;
  float increment1;
  float increment2;
  int angle;
  int hitCounter;

  //Constructor
  Asteroid(float _posX, float _posY, float _velX, float _velY, int _angle) {
    this.posX = _posX;
    this.posY = _posY;
    this.velX = _velX;
    this.velY = _velY;
    this.angle = _angle;
    this.increment1 = 0;
    this.increment2 = 0;
  }

  //Functions
  void updateAsteroid() {  
    ellipse(this.posX, this.posY, 30, 30);
    this.posX = this.posX + this.velX + this.increment1;
    this.posY = this.posY + this.velY + this.increment2;
    
    if (this.angle == 1) {
      if (this.posX < 0 || this.posY > 500) {
        this.posX = random(250, 650);
        this.posY = random(-400, 0);
        this.velX = random(-1, -.5);
        this.velY = random(.5, 1);
        this.increment1 -= .15;
        this.increment2 += .15;
      }
    }

    if (this.angle == 2) {
      if (this.posX < 0 || this.posY > 500) {
        this.posX = random(500, 900);
        this.posY = random(-150, 250);
        this.velX = random(-1, -.5);
        this.velY = random(.5, 1);
        this.increment1 -= .15;
        this.increment2 += .15;
      }
    }

    if (this.angle == 3) {
      if (this.posX < 0 || this.posY < 0) {
        this.posX = random(500, 900);
        this.posY = random(250, 650);
        this.velX = random(-1, -.5);
        this.velY = random(-1, -.5);
        this.increment1 -= .15;
        this.increment2 -= .15;
      }
    }

    if (this.angle == 4) {
      if (this.posX < 0 || this.posY < 0) {
        this.posX = random(250, 650);
        this.posY = random(500, 900);
        this.velX = random(-1, -.5);
        this.velY = random(-1, -.5);
        this.increment1 -= .15;
        this.increment2 -= .15;
      }
    }
  }

  void collisionDetection() {
    for (int i = 0; i < 4; i++) {
      if ((lasers[i].posX + lasers[i].offsetX) > (this.posX - 15) 
        && (lasers[i].posX + lasers[i].offsetX) < (this.posX + 15) 
        && (lasers[i].posY + lasers[i].offsetY) > (this.posY - 15) 
        && (lasers[i].posY + lasers[i].offsetY) < (this.posY + 15)) {
        this.posX = 0;
        this.posY = 500;
        lasers[i].posX = 0;
        lasers[i].posY = 0;
        lasers[i].posLocked = false;
        
        hit.trigger(); 
              

        addPoints();
      }
    }

    if (this.posX > xMod - 15 && this.posX < xMod + 15 && this.posY > yMod - 15 && this.posY < yMod + 15) {
      gameOver = true;
    }
  }
  
  void addPoints(){
    pointScore = 50 - (pointArray[0] + pointArray[1] + pointArray[2] + pointArray[3]);
    blood += pointScore;
    pointTotal += pointScore;
     
  }
}


