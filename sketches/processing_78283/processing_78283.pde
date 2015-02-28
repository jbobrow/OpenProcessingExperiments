
class Enemy_ship {

  int ex;
  int ey;
  int ev;
  color enemy;
  
  Enemy_ship(int x, int y){
    ex=x;
    ey=y;
    ev=1;
    enemy = alive;
}
  
  void drawEnemy () {
    position();
    drawShip();
  }
  boolean collision (int bX, int bY) {
    if ( ( enemy == alive )  &&   
               ((dist( ex, ey, bX, bY )) < 18)) {
            enemy = dead;    
println( "Enemy_ship.collision(): " + ex + ", " + ey + "   " + bX + ", " + bY );
//            score++;
            return (true);
          }
          return (false);


  }
  void position() {
    if (enemy == alive) {
          if (ex > keyX){
            ex = ex - ev;
          } else if (ex < keyX){
            ex = ex + ev;
          } 
          
          if (ey > keyY){
            ey = ey - ev;
          } else if (ey < keyY){
            ey = ey + ev;
          }
    }
  }
  void drawShip () {
    if (enemy == alive) {
      noStroke();
      fill(enemy);
      image(bop,ex,ey);
//      rect(ex, ey, 20,20);
    }
  }
}



