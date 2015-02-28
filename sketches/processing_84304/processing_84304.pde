
class Enemy {

  int x;
  int y;
  int xSpeed;
  int ySpeed;
  int on;

  int face;

  Enemy (int tempX, int tempY, int tempOn) {

    x = tempX;
    y = tempY;

    on = tempOn;

    xSpeed = 4;
    ySpeed = 4;

    face = 1;
  }

  void walk(Girl g) {

    if (on == 1) {
      if (x < g.x) {

        x+=xSpeed;
        face = 3;
      }

      if (x > g.x) {

        x-=xSpeed;
        face = 4;
      }

      if (y < g.y) {

        y+=ySpeed;
        face = 1;
      }

      if (y > g.y) {

        y-=ySpeed;
        face = 2;
      }
    }
  }

  void display() {
    if (gameState == 3){
    face = 1;
    }
    if (on == 1) {
      
      if (gameState !=3){
      noStroke();
      }
      if (gameState == 3){
      stroke(139,21,21,enemyTran);
      }
      
      if (craziness == 0) {
        face = 1;
        fill(0,enemyTran);
        rect(x, y, 6, 15);
        rect(x, y-7, 10, 8);
        fill(255,enemyTran);
        rect(x-2, y-6, 2, 2);
        rect(x+2, y-6, 2, 2);
      }

      rectMode(CENTER);

      if (craziness == 1) {
        if (face == 1) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
          fill(0,enemyTran);
          rect(x-2, y-6, 2, 2);
          rect(x+2, y-6, 2, 2);
        }
        if (face == 2) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
        }
        if (face == 3) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
          fill(0,enemyTran);
          rect(x-1, y-6, 2, 2);
          rect(x+3, y-6, 2, 2);
        }
        if (face == 4) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
          fill(0,enemyTran);
          rect(x-3, y-6, 2, 2);
          rect(x+1, y-6, 2, 2);
        }
      }
      if (gameState == 3) {
        if (face == 1) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
          fill(0,enemyTran);
          rect(x-2, y-6, 2, 2);
          rect(x+2, y-6, 2, 2);
        }
        if (face == 2) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
        }
        if (face == 3) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
          fill(0,enemyTran);
          rect(x-1, y-6, 2, 2);
          rect(x+3, y-6, 2, 2);
        }
        if (face == 4) {
          fill(255,enemyTran);
          rect(x, y, 6, 15);
          rect(x, y-7, 10, 8);
          fill(0,enemyTran);
          rect(x-3, y-6, 2, 2);
          rect(x+1, y-6, 2, 2);
        }
      }
    }
  }
}


