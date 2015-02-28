
class Boss {
  int x, y;
  int hp, maxHp;
  PImage img;
  boolean moveUp, moveLeft, isDead;
  List<Bullet> bossBullets = new ArrayList<Bullet>();
  int lastAttack;

  Boss(int x, int y, int hp, PImage img) {
    this.x = x;
    this.y = y;
    this.hp = hp;
    this.maxHp = hp;
    this.img = img;
    isDead = false;
  }
  
  boolean isBossAlive() {
    return !isDead;
  }

  int hpPercentage() {
    return (int) Math.ceil((hp * 100) / maxHp);
  }

  void loseHP(int hpLoss) {
    hp -= hpLoss;
    if (hp < 1)
      isDead = true;
  }
  
  void show() {
    if (lastAttack + 500 <= millis()) {
      bossBullets.add(new Bullet(x - 100, y + 40, true));
      lastAttack = millis();
    }
    if (moveLeft) {
      if (x < 120) {
        moveLeft = false;
        y += moveUp ? -5 : 5;
        if (moveUp && y < 80)
          moveUp = false;
        if (y > 550)
          moveUp = true;
      } 
      else
        x -= 3;
    } 
    else {
      if (x > width - 120) {
        moveLeft = true;
        y += moveUp ? -5 : 5;
        if (moveUp && y < 80)
          moveUp = false;
        if (y > 300)
          moveUp = true;
      } 
      else
        x += 3;
    }
    for (Iterator iterator = bullets.iterator(); iterator.hasNext();) {
      Bullet s = (Bullet) iterator.next();
      if (dist(x, y, s.x, s.y) < 120) {
        loseHP(1);
        iterator.remove();
      }
    }
    image(img, x, y);
  }
}


