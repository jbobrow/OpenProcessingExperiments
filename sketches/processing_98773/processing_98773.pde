
class BlockEnemy extends Enemy {

  PImage enemySprite=loadImage("boxEnemy.png");

  BlockEnemy(int x, int y, int w, int h) {
    super(x, y, w, h);
    enemySprite.resize(itemWidth, itemHeight);
  }

  void draw() {
    fill(255, 165, 0);
    stroke(255, 165, 0);
    pushMatrix();
    if (lastDirection.equals("LEFT")) {
      scale(-1, 1);
      image(enemySprite, -(itemX-player.itemX+width/2)-itemWidth, itemY-player.itemY+height/2);
    }
    else{
      image(enemySprite, (itemX-player.itemX+width/2), itemY-player.itemY+height/2);
    }
    popMatrix();
  }
}

