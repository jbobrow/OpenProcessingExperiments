
class Enemy {

  float enemyX=0;
  float enemyY=0;
  float velX = 0;
  float velY = 0;
  int eSize = 20;
  float vel = 3;

  void update() {
    enemyY+= .1;
    enemyX=enemyX+velX;
    enemyY=enemyY+velY;
  }

  void draw() {
    fill(255, 0, 0);
    ellipse ( enemyX, enemyY, eSize, eSize);
    



      
    
  
  if(dist( enemyX,enemyY, player_pos[0],player_pos[1]) < 15) {
    loseScreen = true;
  }


  }
}

















