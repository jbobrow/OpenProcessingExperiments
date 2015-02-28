
class Enemy_ship {
  
  int lwsize = 8;
  int gsX = lwsize;
  int gsY = lwsize;
  
  PImage enemy;
  PImage eshot;

  int ex;
  int ey;
  int ev;
  float shiprot = 0;
  boolean alive;
  
  Enemy_ship(int x, int y){
    enemy = loadImage("enemy.png");
    eshot = loadImage("eshot.png");
    ex=x;
    ey=y;
    ev=2;
    alive = true;
}
  
  
  boolean collision (int bX, int bY) {
    if ( (alive )  &&   ( (dist ( ex, ey, bX, bY ) ) < 18) ) {
      alive = false;    
      return (true);
    }
    return (false);
  }
  
  void position() {
    if (alive) {
          if (ex > player001.keyX){
            ex = ex - ev;
          } else if (ex < player001.keyX){
            ex = ex + ev;
          }
          
          if (ey > player001.keyY){
            ey = ey - ev;
          } else if (ey < player001.keyY){
            ey = ey + ev;
          }
    }
  }
  void drawShip (int x, int y) {
    if (alive) {
      shiprot = atan2(player001.keyY-(y+ey), player001.keyX - (x+ex));
      pushMatrix();
        noStroke();
        pushMatrix();
          fill( 0,255,0 ); //status
          pushMatrix();
            translate(x+ex, y+ey); //movement
            pushMatrix();
              rotate(shiprot);
              pushMatrix();
                image(enemy,0,0); // object
              popMatrix();
            popMatrix();
          popMatrix();
        popMatrix();
      popMatrix();
    }
  }
  
    void drawShot () {
      noStroke();
      for ( int i=0; i<NUM_TARGETS; i++ ) {
        pushMatrix();
          translate(gX[i], gY[i]);
          pushMatrix();
            rotate(shotrot[i]);
            pushMatrix();
              image(eshot,0,0);
            popMatrix();
          popMatrix();
        popMatrix();
      }
    }
  
    void moveShot () {
    for (int i=0; i<NUM_BURSTS; i++ ) {
      gX[i] += gVx[i];
      gY[i] += gVy[i];
      constrain( gY[i], 0, 800 );
      constrain( gX[i], 0, 800 );
    }
  }
  
}



