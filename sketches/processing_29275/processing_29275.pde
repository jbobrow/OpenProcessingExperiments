
int score;
int speedConstant;
int timeCount;
final int KEY_SPACE = 32;
double x = 10;
double y = 10;
int startX;
int startY;
int rectWidth;
int rectHeight;
Player player;
int passCount;
Controller controller;
GameSetup gS;
int colorValue;
int bulletRadius;
Character s;
boolean collected ;
boolean stop;
boolean delayed;
int count = 0;
int enemyCount = 0;
int addRedValue = 0;
boolean enter;
boolean boss;
int timer = 0;
int bossRad = rectWidth;
int width1;
int height1;
int hitCount = 0;
boolean hit;
int playerCount = 0;
boolean gameOver;
boolean startGame;
 
public void setup() {
  size(400, 400);
  set();
 
  frameRate(60);
}
 
public void set() {
 
  width1 = width;
  height1 = height;
 
  //changes
  colorValue = 0;
  bulletRadius = (int)(((width + height) / 2) / ((x + y) / 2)) / 2 / 2;
  startX = (int) (width / 2);
  startY = (int) ((height / 2) + height / y / 2);
  speedConstant = (int)((height + width) / 80 / x);
  player = new Player(new Location(startX, startY), speedConstant);
  gS = new GameSetup(x, y, width, height, player);
  controller = new Controller(player, gS);
  stroke(10, 100, 40);
 
  gS.setSquares(0);
  gS.setupTokens();
  gS.setEnemies(4);
 
  score = 0;
  gameOver = false;
  startGame = true;
  hit = false;
  enter = true;
  boss = false;
  collected = false;
  stop = false;
  delayed = false;
  s = null;
  timer = 0;
}
 
public void draw() {
  if (startGame) {
    background(255);
    fill(0);
    textAlign(CENTER);
    text("Press any key to begin", width / 2, height / 2);
    if (keyPressed) {
      startGame = false;
    }
  }
  else if (!startGame && !gameOver) {
    if (width1 != width || height1 != height) {
      gS.resetLocations(width, height, width1, height1);
      width1 = width;
      height1 = height;
    }
    timer = 0;
    controller.resetPlayer(player);
    gS.setPlayer(player);
    speedConstant = (int)((height + width) / 80 / x);
    rectWidth = (int) (width / x);
    rectHeight = (int) (height / y);
 
    gridDraw();
    if (!delayed) {
      controller.checkKeyboard((int)x, (int)y, width, height);
      player = controller.setPlayer();
      tokenDraw();
      bulletDraw();
      enemyDraw();
      bossDraw();
    }
    playerDraw();
    if (!stop) {
      collected = checkUnlock();
    }
    if (gS.getMapLoc() == 3 && enter) {
      gS.resetEnemies();
      enter = false;
    }
    if (collected) {
      gS.changeMapBoolean(2, 4, 0);
      gS.changeMapBoolean(2, 5, 0);
      stop = true;
      collected = false;
    }
    if (gS.getMapLoc() == 3 && ((player.getLocation().convertToGrid(player.getLocation().getRow(), width, x) == 4  && player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y) == 8) || (player.getLocation().convertToGrid(player.getLocation().getRow(), width, x) == 5  && player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y) == 8))) {     
      delayed = true;
    }
    if (delayed && count <= 180) {
      count++;
    }
    if (delayed && count == 90) {
      player.changeNumBullets(player.getNumBullets());
      gS.changeMapBoolean(3, 4, 9);
      gS.changeMapBoolean(3, 5, 9);
    }
    if (delayed && count == 150) {
      gS.setBoss();
      boss = true;
    }
    if (count >= 180) {
      delayed = false;
    }
 
    if (checkEnemyRespawn()) {
      gS.setEnemies(3);
    }
 
    if (colorValue > 255) {
      colorValue = 0;
    }
    else {
      colorValue += 4;
    }
    if (hit) {
      hitCount++;
    }
    if (hitCount == 60) {
      hitCount = 0;
      hit = false;
    }
    timeCount++;
    textAlign(LEFT);
    text("Score: " + score, rectWidth / 9, height - rectHeight / 9);
    textAlign(RIGHT);
    text("Bullet: " + player.getNumBullets(), (int)(width / x * 10 - rectWidth / 9), (int)(height - rectHeight / 9));
  }
  else {
    background(0);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 2);
    text("Score: " + score, width/2, height/2 + 20);
 
    if (timer <= 120) {
      timer++;
    }
    if (keyPressed && timer >= 60) {
      timer = 0;
      set();
      gameOver = false;
    }
  }
}
 
public boolean checkEnemyRespawn() {
 
  if (timer >= 1200 && boss) {
    timer = 0;
    return true;
  }
  timer++;
  return false;
}
 
public boolean checkUnlock() {
  int count = 0;
  for (Token t: gS.getTokens()) {
    if (t instanceof MainToken) {
      count++;
    }
  }
  return count == 0;
}
 
public void bossDraw() {
  if (gS.getBoss().size() > 0) {
    Character b = gS.getBoss().get(0).collisionCheck(player, rectWidth, rectWidth, rectHeight);
    if (b instanceof Player) {
      hit = true;
      if (gS.getBoss().get(0).getDirection() == 0) {
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() + gS.getBoss().get(0).getSpeed());
        controller.downMethod(1);
      }
      else if (gS.getBoss().get(0).getDirection() == 1) {
        player.moveTo(player.getLocation().getRow() + gS.getBoss().get(0).getSpeed(), player.getLocation().getCol());
        controller.rightMethod(1);
      }
      else if (gS.getBoss().get(0).getDirection() == 2) {
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() - gS.getBoss().get(0).getSpeed());
 
        controller.upMethod(1);
      }
      else if (gS.getBoss().get(0).getDirection() == 3) {
        player.moveTo(player.getLocation().getRow() - gS.getBoss().get(0).getSpeed(), player.getLocation().getCol());
        controller.leftMethod(1);
      }
      //System.out.println(s.getHealth());
      //decrease player health
      if (hitCount == 0) {
        player.changeHealth(-1 * gS.getBoss().get(0).getDamage());
      }
      //move player back in enemy direction by certain enemy speed
      //check boundaries by using the statements in the controller
      //
    }
 
    if (gS.getBoss().get(0).getHealth() <= 0) {
      score += 500;
      gameOver = true;
    }
 
    if (!gameOver) {
      fill(255);
      textAlign(CENTER);
      text(gS.getBoss().get(0).getHealth(), gS.getBoss().get(0).getLocation().getRow(), gS.getBoss().get(0).getLocation().getCol() + rectHeight * 4 / 3);
    }
    if (gS.getBoss().get(0).getCollision()) {
      enemyCount++;
 
      if (enemyCount <= 120) {
        if (addRedValue <= 180) {
          addRedValue += 6;
        }
        else {
          addRedValue = 0;
        }
      }
      else {
        gS.getBoss().get(0).changeCollision();
        enemyCount = 0;
        addRedValue = 0;
      }
    }
    fill(addRedValue);
 
 
    ellipse(gS.getBoss().get(0).getLocation().getRow(), gS.getBoss().get(0).getLocation().getCol(), rectWidth * 2, rectHeight * 2);
    gS.getBoss().get(0).setPlayerLoc(player.getLocation());
 
    gS.getBoss().get(0).move();
  }
}
 
public void gridDraw() {
  for (int row = 0; row < x; row++) {
    for (int col = 0; col < y; col++) {
      rectMode(CORNER);
      if (gS.getMaps()[gS.getMapLoc()][row][col]) {
        fill(0, 140, 100);
      }
      else {
        fill(0);
      }
      if (gS.getMapLoc() == 2) {
        if (row == 4 && col == 0 || row == 5 && col == 0) {
          if (!gS.getMaps()[2][4][0] && !gS.getMaps()[2][5][0]) {
            fill(140, 0, 10);
          }
          else {
            fill(255);
          }
        }
      }
      rect((int) ((row) * (width / x)), (int) ((col) * (height / y)),
      (int) ((width / x)), (int) ((height / y)));
      // rect((int)((row) * (width / x)), (int)((col) * (height / y)),
      // rectWidth, rectHeight);
    }
  }
}
 
public void bulletDraw() {
  for (int a = gS.getBullets().size() - 1; a >= 0; a--) {
    Bullet b = gS.getBullets().get(a);
    //changes
    if (!bulletCollisionCheck(b, a)) {
 
      b.move();
      //draw bullet
      fill(255 - colorValue);
      ellipse(b.getLocation().getRow(), b.getLocation().getCol(), bulletRadius * 2, bulletRadius * 2);
    }
  }
}
 
public void tokenDraw() {
  for (int a = gS.getTokens().size() - 1; a >= 0; a--) {
    Token t = gS.tokens.get(a);
    if (t.getMapLoc() == gS.getMapLoc()) {
      //draw token
      if (t.getTokenType().equals("MainToken")) {
        //changes
        fill(colorValue);
      }
      if (t.getTokenType().equals("BulletToken")) {
        fill(15);
      }
      if (t.getTokenType().equals("HealthToken")) {
        fill(60, 240, 240);
      }
      //changes
      Character s = t.collisionCheck(player, (rectWidth / 2 + rectHeight / 2) / 2, rectWidth, rectHeight);
      if (s instanceof Player) {
        //check type and act
        if (t.getTokenType().equals("MainToken")) {
          score += player.getLevel() * 30;
        }
        if (t.getTokenType().equals("BulletToken")) {
          player.changeNumBullets(10);
        }
        if (t.getTokenType().equals("HealthToken")) {
          player.changeHealth(50);
        }
        //removeToken
        gS.removeToken(a);
      }
      ellipse(t.getLocation().getRow(), t.getLocation().getCol(), rectWidth / 2, rectHeight / 2);
    }
  }
}
 
public void enemyDraw() {
  int makeShiftRad = 5;
  for (int e = gS.getEnemies().size() - 1; e >= 0; e--) {
    if (e < gS.getEnemies().size()) {
 
      Enemy a = gS.getEnemies().get(e);
      a.setPlayerLoc(player.getLocation());
      if (a.getCollision()) {
        enemyCount++;
        if (enemyCount <= 120) {
          if (addRedValue <= 60) {
            addRedValue += 2;
          }
          else {
            addRedValue = 0;
          }
        }
        else {
          a.changeCollision();
          enemyCount = 0;
          addRedValue = 0;
        }
      }
      if (a.getHealth() <= 0) {
        int rand = (int)(Math.random() * 100);
        if (rand <= 30) {
          gS.addToken(new BulletToken(a.getLocation(), player, gS.getMapLoc()));
        }
        else if (rand <= 45) {
          gS.addToken(new HealthToken(a.getLocation(), player, gS.getMapLoc()));
        }
        gS.removeEnemy(e);
        player.gainExp(a.getLevel());
        if (player.checkLevelUp()) {
          player.levelUp();
        }
        score += (a.getLevel() * 10);
 
        //System.out.println(player.getLevel());
      }
 
      if (a.getHealth() > 0) {
        fill(255);
        textAlign(CENTER);
        text(a.getHealth(), a.getLocation().getRow(), a.getLocation().getCol() + makeShiftRad + rectHeight / 2);
      }
      //System.out.println(a.getLevel());
      //System.out.println(player.getLevel() + "   player" );
      if (a.getLevel() == player.getLevel() + 1) {
        if (a.getCollision()) {
          fill(200 + addRedValue, 220, 240);
        }
        else {
          fill(190, 220, 240);
        }
      }
      else if (a.getLevel() == player.getLevel() + 2) {
        if (a.getCollision()) {
          fill(30 + addRedValue, 40, 150);
        }
        else {
          fill(30, 40, 150);
        }
      }
      else if (a.getLevel() == player.getLevel() + 3) {
        if (a.getCollision()) {
          fill(140 + addRedValue, 20, 40);
        }
        else {
          fill(140, 20, 40);
        }
      }
      else {
        fill(190, 220, 240);
      }
      if (!a.collisionCheck(a.getLocation(), makeShiftRad, gS.getMaps(), gS.getMapLoc(), width, height, x, y) ) {
        a.move();
      }
      else {
        a.reverseMove(a.getLocation(), makeShiftRad, gS.getMaps(), gS.getMapLoc(), width, height, x, y);
      }
 
      //temporary
      int enRadius = rectWidth / 4;
      triangle(a.getLocation().getRow(), a.getLocation().getCol() - rectHeight / 3,
      a.getLocation().getRow() - rectWidth / 3, a.getLocation().getCol() + rectHeight / 4,
      a.getLocation().getRow() + rectWidth / 3, a.getLocation().getCol() + rectHeight / 4);
      //ellipse(a.getLocation().getRow(),a.getLocation().getCol(), rectWidth / 2, rectHeight / 2);
 
      //changes
      s = a.collisionCheck(player, enRadius, rectWidth, rectHeight);
      if (s instanceof Player) {
        hit = true;
        if (a.getDirection() == 0) {
          player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() + a.getSpeed());
          if (player.getLocation().getCol() >= 382) {
            player.moveTo(player.getLocation().getRow(), height + 1);
          }
          controller.downMethod(1);
        }
        else if (a.getDirection() == 1) {
          player.moveTo(player.getLocation().getRow() + a.getSpeed(), player.getLocation().getCol());
          if (player.getLocation().getRow() >= 382) {
            player.moveTo(width + 1, player.getLocation().getCol());
          }
          controller.rightMethod(1);
        }
        else if (a.getDirection() == 2) {
          player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() - a.getSpeed());
          controller.upMethod(1);
        }
        else if (a.getDirection() == 3) {
          player.moveTo(player.getLocation().getRow() - a.getSpeed(), player.getLocation().getCol());
          controller.leftMethod(1);
        }
        //System.out.println(s.getHealth());
        //decrease player health
 
        if (hitCount == 0) {
          player.changeHealth(-1 * a.getDamage());
        }
        //move player back in enemy direction by certain enemy speed
        //check boundaries by using the statements in the controller
        //
      }
    }
  }
  }
 
  public void playerDraw() {
 
    if (hit) {
      playerCount += 5;
      if (playerCount > 100) {
        playerCount = 0;
      }
    }
    else {
      playerCount = 0;
    }
    //player color
    fill(30 + playerCount, 100 - playerCount, 200 - playerCount * 2);
    rectMode(CENTER);
    rect(player.getLocation().getRow(), player.getLocation().getCol(),
    rectWidth / 2, rectHeight / 2);
    if (player.getHealth() > 0) {
      fill(255);
      textAlign(CENTER);
      text(player.getHealth(), player.getLocation().getRow(), player.getLocation().getCol() + rectHeight / 2 + 4);
    }
    else {
      gameOver = true;
    }
  }
  public void keyPressed() {
    if (!delayed) {
      if (keyCode == KEY_SPACE && !controller.getKeys()[keyCode]) {
        player.changeNumBullets(-1);
        Location bulletLocation = new Location(player.getLocation().row, player.getLocation().getCol());
        //fire
        if (player.getNumBullets() > 0) {
          gS.addBullet((new Bullet(bulletLocation, controller.getAngle(), player.getLevel(), speedConstant)));
        }
        /*
            else {
                        System.out.println("require");
                    }
                    */
        //System.out.println(gS.getBullets().size());
      }
 
      if (keyCode < controller.getKeys().length) {
        // println("Key pressed == " + keyCode);
        controller.setKeys(keyCode, true);
      }
    }
  }
 
  public void keyReleased() {
    if (keyCode < controller.getKeys().length) {
      // println("Key released == " + keyCode);
      controller.setKeys(keyCode, false);
    }
  }
  /*
    //use mapLoc to check which map and use if statements to decide where to go
    public void boundaryCheck() {
        int xLoc;
        int yLoc;
        if(player.getLocation().getRow() - rectWidth / 4 < 0) {
            println("out left");
            xLoc = (int)((width - rectWidth / 4) / (width / x)) ;
            yLoc = (int)(player.getLocation().getCol() / (height / y));
            if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
            }
            else {
                player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
            }
        }
         
        if(player.getLocation().getRow() + rectWidth / 4 > width) {
            println("out right");
            xLoc = (int)((0 + rectWidth / 4) / (width / x));
            yLoc = (int)(player.getLocation().getCol() / (height / y));
            if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
            }
            else {
                player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
            }
        }
         
        if(player.getLocation().getCol() - rectHeight / 4 < 0) {
            println("out up");
            if (gS.getMapLoc() == 0) {
                gS.setSquares(1);
                gS.setEnemies(4);
            }
            xLoc = (int)(player.getLocation().getRow() / (width / x));
            yLoc = (int)((height - rectHeight / 4) / (height / y));
            if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
            }
            else {
                player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
            }
        }
         
        if(player.getLocation().getCol() + rectHeight / 4 > height) {
            if (gS.getMapLoc() == 1) {
                gS.setSquares(0);
                gS.setEnemies(3);
            }
            xLoc = (int)(player.getLocation().getRow() / (width / x));
            yLoc = (int)((0 + rectHeight / 4) / (height / y));
            if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
            }
            else {
                player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
            }
        }
   }
    }
    */
 
  //changes
  public boolean bulletCollisionCheck(Bullet b, int a) {
 
    boolean collision = false;
    if (gS.getBoss().size() > 0) {
      s = b.collisionCheck(gS.getBoss().get(0), bulletRadius, rectWidth, rectHeight);
      if (s instanceof Boss) {
        gS.getBoss().get(0).setCollision();
        gS.getBoss().get(0).changeHealth(-b.getDamage());
        gS.removeBullet(a);
        collision = true;
        return collision;
      }
    }
 
    for (int c = 0; c < gS.getEnemies().size(); c++) {
      //checks enemies
      s = b.collisionCheck(gS.getEnemies().get(c), bulletRadius, rectWidth, rectHeight);
 
      if (s instanceof Enemy) {
        gS.getEnemies().get(c).setCollision();
        gS.getEnemies().get(c).changeHealth(-b.getDamage());
        gS.removeBullet(a);
        collision = true;
        return collision;
      }
    }
    //checks walls
    if (b.collisionCheck(b.getLocation(), bulletRadius, gS.getMaps(), gS.getMapLoc(), width, height, x, y)) {
      gS.removeBullet(a);
      collision = true;
    }
    return collision;
  }
 
 
 
  public class Boss extends Enemy {
    public Boss(Location loc, int l, int sc, Player p) {
      super(loc, l, sc, p);
      setHealth(calculateHP(l) * 3);
    }
  }
 
 
  public class Bullet extends Character {
    int direction;
    int damage;
    int speed;
    final int limit = 30;
    int x;
    int y;
 
 
    public Bullet(Location loc, int dir, int lev, int sc) {
      super(loc, lev, sc);
      direction = dir;
      setSpeed(8 * getSpeedConstant());
      damage = lev * 20;
    }
 
    public void move() {
      x = 0;
      y = 0;
      if (direction > 0 && direction < 180) {
        x = 1;
      }
      if (direction > 180 && direction < 360) {
        x = -1;
      }
      if (direction > 90 && direction < 270) {
        y = 1;
      }
      if (direction > 270 || direction < 90) {
        y = -1;
      }
      //System.out.println(x + "  " + y);
      moveTo(getLocation().getRow() + getSpeed() * x, getLocation().getCol() + getSpeed() * y);
    }
    public int getDamage() {
      return damage;
    }
  }
 
 
  public class BulletToken extends Token {
    public BulletToken (Location loc, Player p, int m) {
      super(loc, p, m, "BulletToken");
    }
  }
 
 
  public class Character {
    private Location loc;
    private int health;
    private int speed;
    //level of enemy does not change with character
    private int fullHealth;
    private int level;
    private int speedConstant;
    private int healthLimit;
    private boolean collision;
 
    public Character(Location loc1) {
      loc = loc1;
    }
 
    public Character(Location loc1, int l, int s) {
      loc = loc1;
      level = l;
      speedConstant = s;
      if (this instanceof Player) {
        healthLimit = calculateHP(l) * 4;
      }
      else {
        if (this instanceof Enemy) {
          healthLimit = calculateHP(l);
        }
        else {
          healthLimit = calculateHP(l * 5);
        }
      }
    }
 
    public Character(Location loc1, int l, int h, int s) {
      loc = loc1;
      level = l;
      health = h;
      fullHealth = h;
      speedConstant = s;
    }
    public void setCollision(boolean a) {
      collision = a;
    }
 
    public boolean getCollision() {
      return collision;
    }
    //changes
 
    //other character
    //havent been able to get outer points of bullet and token
    public Character collisionCheck(Character a, int rad, int rectWidth, int rectHeight) {
      int xLoc = -10;
      int yLoc = -10;
      int xLoc2 = -10;
      int yLoc2 = -10;
      if (a instanceof Player) {
        xLoc = (a.getLocation().getRow() + rectWidth/ 4);
        xLoc2 = (a.getLocation().getRow() - rectWidth / 4);
        yLoc = (a.getLocation().getCol() + rectHeight / 4);
        yLoc2 = (a.getLocation().getCol() - rectHeight / 4);
      }
      if (this instanceof Bullet) {
        int x = this.getLocation().getRow();
        int y = this.getLocation().getCol();
        int pointX = -10;
        int pointY = -10;
        for (double r = 0; r < 360; r += 5) {
          pointX = (int)(x + rad * Math.sin(r) / 2);
          pointY = (int)(y + rad * Math.cos(r) / 2);
        }
        //makeshift code
        if (a instanceof Enemy) {
          if (pointX >= a.getLocation().getRow() - 5 && pointX <= a.getLocation().getRow() + 5 && pointY >= a.getLocation().getCol() - 5 && pointY <= a.getLocation().getCol() + 5) {
          }
          else {
            a = null;
          }
        }
      }
      else if (this instanceof Token) {
        int x = this.getLocation().getRow();
            int y = this.getLocation().getCol();
            int pointX;
            int pointY;
            for (double r = 0; r < 360; r++) {
                pointX = (int)(x + Math.sin(r) * rad / 2);
                pointY = (int)(y + Math.cos(r) * rad / 2);
                //System.out.println(pointX + "  " + pointY);
                if(pointX >= xLoc2 && pointX <= xLoc && pointY >= yLoc2 && pointY <= yLoc) {
                    return a;
                }
                else {
                    a = null;
                }
            }
      }
      else if (this instanceof Enemy) {
        int x = this.getLocation().getRow();
        int y = this.getLocation().getCol();
        int pointX = -10;
        int pointY = -10;
        for (double r = 0; r < 360; r += 5) {
          pointX = (int)(x + rad * Math.sin(r));
          pointY = (int)(y + rad * Math.cos(r));
          if (this instanceof Boss) {
            if (pointX >= a.getLocation().getRow() - rectWidth / 2 + 10 && pointX <= a.getLocation().getRow() + rectWidth / 2 - 10 && pointY >= a.getLocation().getCol() - rectHeight / 2 + 10 && pointY <= a.getLocation().getCol() + rectHeight / 2 - 10) {
              return a;
            }
          }
          else {
            if (pointX >= a.getLocation().getRow() - rad && pointX <= a.getLocation().getRow() + rad && pointY >= a.getLocation().getCol() - rad && pointY <= a.getLocation().getCol() + rad) {
              return a;
            }
          }
        }
        a = null;
      }
      return a;
    }
    //wall
    public boolean collisionCheck(Location loc, int rad, boolean[][][] map, int mapLoc, int width, int height, double x, double y) {
      if (this instanceof Bullet || this instanceof Enemy) {
        double x1 = loc.getRow();
        double y1 = loc.getCol();
        int pointX = (int)((x1) / ((double)width / x));
        int pointY = (int)((y1) / ((double)height / y));
        //needs work to prevent sliding past parts
        if (checkLocations(pointX, pointY, (int)x, (int)y)) {
          return true;
        }
        if (map[mapLoc][pointX][pointY]) {
          return false;
        }
      }
      return true;
    }
    public void setFullHealth(int a) {
      fullHealth = a;
    }
 
    public boolean checkLocations(int x1, int y1, int x, int y) {
      if (x1 >= x) {
        return true;
      }
      if (x1 < 0) {
        return true;
      }
      if (y1 >= y) {
        return true;
      }
      if (y1 < 0) {
        return true;
      }
      return false;
    }
 
 
    public int getFullHealth() {
      return fullHealth;
    }
 
    public Location getLocation() {
      return loc;
    }
 
    public void setLocation(int x, int y) {
      loc = new Location(x, y);
    }
 
    public void moveTo(int x, int y) {
      loc = loc.changeLocation(x, y);
    }
 
    public void moveTo(Location loc1) {
      loc = loc.changeLocation(loc1.getRow(), loc1.getCol());
    }
 
    public void setSpeed(int s) {
      if (s <= 10 || speed > 0) {
        speed = s;
      }
      else {
        speed = 5;
      }
    }
 
    public int getSpeed() {
      return speed;
    }
 
    //changes
    public int calculateHP(int l) {
 
      if (this instanceof Enemy) {
        l = l * 40 + 50;
      }
      else if (this instanceof Player) {
        l = l * 50 + 50;
      }
      return l;
    }
 
    //changes
    public void setHealth(int h) {
      health = h;
    }
    public int getHealth() {
      return health;
    }
 
    public void changeHealth(int de) {
      health = health + de;
      if (health > healthLimit) {
        health = healthLimit;
      }
    }
 
    public int getLevel() {
      return level;
    }
 
    public int getSpeedConstant() {
      return speedConstant;
    }
 
    public void resetLocation(int w, int h, int w1, int h1) {
      setLocation(loc.getRow() * w / w1, loc.getCol() * h / h1);
    }
  }
 
 
  public class Controller {
    Player player;
    int x;
    int y;
    int xLoc;
    int yLoc;
    int xLoc2;
    int yLoc2;
    int rectWidth;
    int rectHeight;
    int width;
    int height;
    int angle = 0;
    GameSetup gS;
    boolean off;
    public Controller(Player play, GameSetup gs) {
      player = play;
      gS = gs;
    }
    final int KEY_LEFT = 37;
    final int KEY_UP = 38;
    final int KEY_RIGHT = 39;
    final int KEY_DOWN = 40;
 
    boolean[] keyPressed = new boolean[256];
 
    public boolean[] getKeys() {
      return keyPressed;
    }
 
    public void setKeys(int key, boolean a) {
      keyPressed[key] = a;
    }
 
    //changes check with in school code
    public void checkKeyboard(int x, int y, int width, int height) {
      this.width = width;
      this.height = height;
      this.x = x;
      this.y = y;
      rectWidth = (int) (width / x);
      rectHeight = (int) (height / y);
 
      if (keyPressed[KEY_UP]) {
        player.setDirection(0);
        if (!keyPressed[KEY_LEFT] || !keyPressed[KEY_RIGHT]) {
          angle = 0;
        }
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() - player.getSpeed());
        xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth/ 4, width, x);
        xLoc2 = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4, width, x);
        yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4, height, y);
        checkLocations(xLoc, xLoc2, yLoc, yLoc);
        upMethod();
      }
 
      if (keyPressed[KEY_DOWN]) {
        player.setDirection(2);
        if (!keyPressed[KEY_LEFT] || keyPressed[KEY_RIGHT]) {
          angle = 180;
        }
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() + player.getSpeed());
        xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth/ 4, width, x);
        xLoc2 = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4, width, x);
        yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y);
        checkLocations(xLoc, xLoc2, yLoc, yLoc);
        downMethod();
      }
 
 
      if (keyPressed[KEY_LEFT]) {
        player.setDirection(3);
        if (!keyPressed[KEY_UP] || !keyPressed[KEY_DOWN]) {
          angle = 270;
        }
        player.moveTo(player.getLocation().getRow() - player.getSpeed(), player.getLocation().getCol());
        xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4, width, x);
        yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4, height, y);
        yLoc2 = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y);
        checkLocations(xLoc, xLoc, yLoc, yLoc2);
 
        leftMethod();
      }
 
      if (keyPressed[KEY_RIGHT]) {
        player.setDirection(1);
        if (!keyPressed[KEY_UP] || !keyPressed[KEY_DOWN]) {
          angle = 90;
        }
        player.moveTo(player.getLocation().getRow() + player.getSpeed(), player.getLocation().getCol());
        xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth / 4, width, x);
        yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4, height, y);
        yLoc2 = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y);
        checkLocations(xLoc, xLoc, yLoc, yLoc2);
 
        rightMethod();
      }
      if (keyPressed[KEY_UP] && keyPressed[KEY_RIGHT]) {
        angle = 45;
      }
      if (keyPressed[KEY_UP] && keyPressed[KEY_LEFT]) {
        angle = 315;
      }
      if (keyPressed[KEY_DOWN] && keyPressed[KEY_RIGHT]) {
        angle = 135;
      }
      if (keyPressed[KEY_DOWN] && keyPressed[KEY_LEFT]) {
        angle = 225;
      }
    }
 
 
    public void upMethod() {
      if (player.getLocation().getCol() - rectHeight / 4 <= 0) {
        //println("out up");
        if (gS.getMapLoc() == 0) {
          if (gS.getMaps()[1][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[1][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(1);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[2][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[2][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(2);
            gS.setEnemies(11);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[3][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[3][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(3);
            //gS.setEnemies(4);
            //set boss
          }
        }
        else if (gS.getMapLoc() == 4) {
          if (gS.getMaps()[5][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[5][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(5);
            gS.setEnemies(8);
          }
        }
        else if (gS.getMapLoc() == 5) {
          if (gS.getMaps()[6][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[6][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(6);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 7) {
          if (gS.getMaps()[8][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[8][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(8);
            gS.setEnemies(8);
          }
        }
        else if (gS.getMapLoc() == 8) {
          if (gS.getMaps()[9][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[9][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(9);
            gS.setEnemies(7);
          }
        }
 
        yLoc = (int)((height - rectHeight / 4) / (height / y));
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
          player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
        }
        else {
          player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
        }
      }
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() + player.getSpeed());
      }
    }
 
    public void downMethod() {
      if (player.getLocation().getCol() + rectHeight / 4>= height) {
        //System.out.println("out down");
        if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[0][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[0][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            //System.out.println("occur");
            gS.setSquares(0);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[1][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[1][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(1);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 5) {
          if (gS.getMaps()[4][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[4][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(4);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 6) {
          if (gS.getMaps()[5][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[5][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(5);
            gS.setEnemies(8);
          }
        }
        else if (gS.getMapLoc() == 8) {
          if (gS.getMaps()[7][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[7][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(7);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 9) {
          if (gS.getMaps()[8][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[8][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(8);
            gS.setEnemies(7);
          }
        }
        yLoc = (int)((0 + rectHeight / 4) / (height / y));
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
          player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
        }
        else {
          player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
        }
      }
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
        //System.out.println(mapLoc);
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() - player.getSpeed());
      }
    }
 
    public void leftMethod() {
      if (player.getLocation().getRow() - rectWidth / 4 <= 0) {
        if (gS.getMapLoc() == 0) {
          if (gS.getMaps()[4][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[4][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(4);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[5][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[5][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(5);
            gS.setEnemies(4);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[6][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[6][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(6);
            gS.setEnemies(7);
          }
        }
        else if (gS.getMapLoc() == 7) {
          if (gS.getMaps()[0][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[0][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(0);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 8) {
          if (gS.getMaps()[1][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[1][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(1);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 9) {
          if (gS.getMaps()[2][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[2][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(2);
            gS.setEnemies(9);
          }
        }
        //println("out left");
        xLoc = (int)((width - rectWidth / 4) / (width / x)) ;
 
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
          player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
        }
        else {
          player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
        }
      }
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc2);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
        player.moveTo(player.getLocation().getRow() + player.getSpeed(), player.getLocation().getCol());
      }
    }
 
    public void rightMethod() {
      if (player.getLocation().getRow() + rectWidth / 4 >= width) {
        //println("out right");
        if (gS.getMapLoc() == 4) {
          if (gS.getMaps()[0][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[0][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(0);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 5) {
          if (gS.getMaps()[1][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[1][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(1);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 6) {
          if (gS.getMaps()[2][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[2][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(2);
            gS.setEnemies(9);
          }
        }
        else if (gS.getMapLoc() == 0) {
          if (gS.getMaps()[7][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[7][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(7);
            gS.setEnemies(8);
          }
        }
        else if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[8][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[8][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(8);
            gS.setEnemies(4);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[9][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[9][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(9);
            gS.setEnemies(6);
          }
        }
        xLoc = (int)((0 + rectWidth / 4 ) / (width / x));
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
          player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
        }
        else {
          player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
        }
      }
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc2);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
        player.moveTo(player.getLocation().getRow() - player.getSpeed(), player.getLocation().getCol());
      }
    }
 
 
    public void upMethod(int a) {
 
      if (player.getLocation().getCol() - rectHeight / 4 <= 0) {
        //println("out up");
        if (gS.getMapLoc() == 0) {
          if (gS.getMaps()[1][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[1][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(1);
            gS.setEnemies(4);
          }
        }
        else if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[2][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[2][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(2);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[3][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[3][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(3);
            //gS.setEnemies(4);
            //set boss
          }
        }
        else if (gS.getMapLoc() == 4) {
          if (gS.getMaps()[5][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[5][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(5);
            gS.setEnemies(7);
          }
        }
        else if (gS.getMapLoc() == 5) {
          if (gS.getMaps()[6][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[6][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(6);
            gS.setEnemies(7);
          }
        }
        else if (gS.getMapLoc() == 7) {
          if (gS.getMaps()[8][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[8][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(8);
            gS.setEnemies(9);
          }
        }
        else if (gS.getMapLoc() == 8) {
          if (gS.getMaps()[9][xLoc][(int)((height - rectHeight / 4) / (height / y))] && gS.getMaps()[9][xLoc2][(int)((height - rectHeight / 4) / (height / y))]) {
            gS.setSquares(9);
            gS.setEnemies(8);
          }
        }
 
        yLoc = (int)((height - rectHeight / 4) / (height / y));
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
          player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
        }
        else {
          player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
        }
      }
 
      xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth/ 4, width, x);
      xLoc2 = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4, width, x);
      yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4 - player.getSpeed(), height, y);
      yLoc2 = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y);
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() + player.getSpeed());
      }
    }
 
    public void downMethod(int a) {
 
      if (player.getLocation().getCol() + rectHeight / 4>= height) {
        System.out.println("out down");
        if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[0][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[0][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            //System.out.println("occur");
            gS.setSquares(0);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[1][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[1][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(1);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 5) {
          if (gS.getMaps()[4][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[4][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(4);
            gS.setEnemies(3);
          }
        }
        else if (gS.getMapLoc() == 6) {
          if (gS.getMaps()[5][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[5][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(5);
            gS.setEnemies(9);
          }
        }
        else if (gS.getMapLoc() == 8) {
          if (gS.getMaps()[7][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[7][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(7);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 9) {
          if (gS.getMaps()[8][xLoc][(int)((0 + rectHeight / 4) / (height / y))] && gS.getMaps()[8][xLoc2][(int)((0 + rectHeight / 4) / (height / y))]) {
            gS.setSquares(8);
            gS.setEnemies(7);
          }
        }
        yLoc = (int)((0 + rectHeight / 4) / (height / y));
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc]) {
          player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
        }
        else {
          player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
        }
      }
 
      xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth/ 4, width, x);
      xLoc2 = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4, width, x);
      yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4, height, y);
      yLoc2 = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4 + player.getSpeed(), height, y);
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc2);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2] || !gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc2]) {
        //System.out.println(mapLoc);
        player.moveTo(player.getLocation().getRow(), player.getLocation().getCol() - player.getSpeed());
      }
    }
 
    public void leftMethod(int a) {
 
      if (player.getLocation().getRow() - rectWidth / 4 <= 0) {
        if (gS.getMapLoc() == 0) {
          if (gS.getMaps()[4][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[4][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(4);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[5][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[5][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(5);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[6][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[6][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(6);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 7) {
          if (gS.getMaps()[0][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[0][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(0);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 8) {
          if (gS.getMaps()[1][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[1][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(1);
            gS.setEnemies(3);
          }
        }
        else if (gS.getMapLoc() == 9) {
          if (gS.getMaps()[2][(int)((width - rectWidth / 4) / (width / x))][yLoc] && gS.getMaps()[2][(int)((width - rectWidth / 4) / (width / x))][yLoc2]) {
            gS.setSquares(2);
            gS.setEnemies(5);
          }
        }
        //println("out left");
        xLoc = (int)((width - rectWidth / 4) / (width / x)) ;
 
        checkLocations(xLoc, xLoc2, yLoc, yLoc);
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
          player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
        }
        else {
          player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
        }
      }
 
      xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth/ 4, width, x);
      xLoc2 = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4 - player.getSpeed(), width, x);
      yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4, height, y);
      yLoc2 = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y);
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc2);
 
      if (!gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc2][yLoc2]) {
        player.moveTo(player.getLocation().getRow() + player.getSpeed(), player.getLocation().getCol());
      }
    }
 
    public void rightMethod(int a) {
 
      if (player.getLocation().getRow() + rectWidth / 4 >= width) {
        //println("out right");
        if (gS.getMapLoc() == 4) {
          if (gS.getMaps()[0][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[0][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(0);
            gS.setEnemies(5);
          }
        }
        else if (gS.getMapLoc() == 5) {
          if (gS.getMaps()[1][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[1][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(1);
            gS.setEnemies(6);
          }
        }
        else if (gS.getMapLoc() == 6) {
          if (gS.getMaps()[2][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[2][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(2);
            gS.setEnemies(7);
          }
        }
        else if (gS.getMapLoc() == 0) {
          if (gS.getMaps()[7][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[7][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(7);
            gS.setEnemies(8);
          }
        }
        else if (gS.getMapLoc() == 1) {
          if (gS.getMaps()[8][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[8][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(8);
            gS.setEnemies(4);
          }
        }
        else if (gS.getMapLoc() == 2) {
          if (gS.getMaps()[9][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc] && gS.getMaps()[9][(int)((0 + rectWidth / 4 ) / (width / x))][yLoc2]) {
            gS.setSquares(9);
            gS.setEnemies(5);
          }
        }
        xLoc = (int)((0 + rectWidth / 4 ) / (width / x));
        if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] && gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
          player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
        }
        else {
          player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
        }
      }
      xLoc = player.getLocation().convertToGrid(player.getLocation().getRow() + rectWidth/ 4 + player.getSpeed(), width, x);
      xLoc2 = player.getLocation().convertToGrid(player.getLocation().getRow() - rectWidth / 4, width, x);
      yLoc = player.getLocation().convertToGrid(player.getLocation().getCol() - rectHeight / 4, height, y);
      yLoc2 = player.getLocation().convertToGrid(player.getLocation().getCol() + rectHeight / 4, height, y);
 
      checkLocations(xLoc, xLoc2, yLoc, yLoc2);
      if (!gS.getMaps()[gS.getMapLoc()][xLoc][yLoc] || !gS.getMaps()[gS.getMapLoc()][xLoc][yLoc2]) {
        player.moveTo(player.getLocation().getRow() - player.getSpeed(), player.getLocation().getCol());
      }
    }
 
 
    public int getAngle() {
      return angle;
    }
 
    public void checkLocations(int xLoc, int xLoc2, int yLoc, int yLoc2) {
      if (xLoc >= x) {
        this.xLoc = 0;
        off = true;
      }
      else if (xLoc < 0) {
        this.xLoc = x - 1;
        off = true;
      }
      if (xLoc2 >= x) {
        this.xLoc2 = 0;
        off = true;
      }
      else if (xLoc2 < 0) {
        this.xLoc2 = x - 1;
        off = true;
      }
 
      if (yLoc >= y) {
        this.yLoc = 0;
        off = true;
      }
      else if (yLoc < 0) {
        this.yLoc = y - 1;
        off = true;
      }
      if (yLoc2 >= y) {
        this.yLoc2 = 0;
        off = true;
      }
      else if (yLoc2 < 0) {
        this.yLoc2 = y - 1;
        off = true;
      }
    }
    /*
    public void boundaryCheck() {
            if(player.getLocation().getRow() - rectWidth / 4 < 0) {
                //println("out left");
                xLoc = (int)((width - rectWidth / 4) / (width / x)) ;
                yLoc = (int)(player.getLocation().getCol() / (height / y));
                if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                    player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
                }
                else {
                    player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
                }
            }
             
            if(player.getLocation().getRow() + rectWidth / 4 > width) {
                //println("out right");
                xLoc = (int)((0 + rectWidth / 4) / (width / x));
                yLoc = (int)(player.getLocation().getCol() / (height / y));
                if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                    player.moveTo(0 + rectWidth / 4, player.getLocation().getCol());
                }
                else {
                    player.moveTo(width - rectWidth / 4, player.getLocation().getCol());
                }
            }
             
            if(player.getLocation().getCol() + rectHeight / 4 > height) {
                //println("out down");
                if (gS.getMapLoc() == 1) {
                    gS.setSquares(0);
                    gS.setEnemies(3);
                }
                xLoc = (int)(player.getLocation().getRow() / (width / x));
                yLoc = (int)((0 + rectHeight / 4) / (height / y));
                if (gS.getMaps()[gS.getMapLoc()][xLoc][yLoc]) {
                    player.moveTo(player.getLocation().getRow(), 0 + rectHeight / 4);
                }
                else {
                    player.moveTo(player.getLocation().getRow(), height - rectHeight / 4);
                }
            }
            off = false;
        }
        */
    public Player setPlayer() {
      return player;
    }
 
    public void resetPlayer(Player p) {
      player = p;
    }
  }
 
  public class Enemy extends Character {
    private int level;
    private int damage;
    private Location playerLoc;
    private int direction;
    //private Location[][] nodes;  
    boolean bulletCollision = false;
    //int distance = 0;
    int x;
    int y;
    int count = 0;
 
    public Enemy (Location loc, int l, int sc, Player p) {
      //changes
      super(loc, l, sc);
      setFullHealth(calculateHP(l));
      setHealth(calculateHP(l));
      level = p.getLevel() + l;
      damage = calculateDamage(l);
      l *= l;
      if (l < 20) {
        setSpeed(l * getSpeedConstant() / 6 / p.getLevel() + 1);
      }
      else {
        l /= l;
        setSpeed(l * getSpeedConstant() / 2 / p.getLevel() + 1);
      }
    }
 
    public void setCollision() {
      bulletCollision = true;
    }
 
    public void changeCollision() {
      bulletCollision = !bulletCollision;
    }
    public boolean getCollision() {
      return bulletCollision;
    }
    public int calculateDamage(int l) {
      return l * 40 - 10;
    }
 
    public int getLevel() {
      return level;
    }
 
    public int getDamage() {
      return damage;
    }
 
    public void setPlayerLoc(Location loc) {
      playerLoc = loc;
    }
 
    //use grid to find shortest distance
    public void findShortest(boolean[][][] map, int mapLoc, int width, int height, double x, double y) {
    }
 
    //simple move
    public void move() {
      //int angle;
      x = 0;
      y = 0;
      double xDist = getLocation().getRow() - playerLoc.getRow();
      double yDist = getLocation().getCol() - playerLoc.getCol();
 
      //angle =  (int) Math.toDegrees(Math.atan2((getLocation().getCol() - playerLoc.getCol()),(getLocation().getRow() - playerLoc.getRow()) ));
      if (xDist > 0) {
        x = -1;
      }
      else if (xDist < 0) {
        x = 1;
      }
      if (yDist > 0) {
        y = -1;
      }
      else if (yDist < 0) {
        y = 1;
      }
      if (Math.abs(xDist) - Math.abs(yDist) > 0) {
        if (x == 1) {
          direction = 1;
        }
        else if (x == -1) {
          direction = 3;
        }
      }
      else {
        if (y == 1) {
          direction = 0;
        }
        else if (y == -1) {
          direction = 2;
        }
      }
 
      moveTo(getLocation().getRow() + getSpeed() * x, getLocation().getCol() + getSpeed() * y);
      //moveTo((int)(getLocation().getRow() - (getSpeed() * Math.sin(angle))),(int)(getLocation().getCol() + (getSpeed() * Math.cos(angle))));
    }
 
    public void reverseMove(Location loc, int rad, boolean[][][] map, int mapLoc, int width, int height, double x, double y) {
      if (collisionCheck(getLocation(), rad, map, mapLoc, width, height, x, y)) {
        moveTo(getLocation().getRow() - getSpeed() * this.x, getLocation().getCol() - getSpeed() * this.y);
      }
    }
 
 
 
    /*
    //move based on grid
        public void move(boolean[][][] map, int mapLoc,int width,int height,double x,double y) {
            int[][] mapDist = new int[map[mapLoc].length][map[mapLoc][0].length];
            int playerGridx = getLocation().convertToGrid(playerLoc.getRow(), width, x);
            int playerGridy = getLocation().convertToGrid(playerLoc.getCol(), height, y);
            int enemyGridx = getLocation().convertToGrid(getLocation().getRow(), width, x);
            int enemyGridy = getLocation().convertToGrid(getLocation().getRow(), height, y);   
             
            int xDist = getLocation().getRow() - playerLoc.getRow();
            int yDist = getLocation().getCol() - playerLoc.getCol();
            if (xDist > 0) {
                this.x = -1;
            }
            else if (xDist < 0) {
                this.x = 1;
            }
            if (yDist > 0) {
                this.y = -1;
            }
            else if (yDist < 0) {
                this.y = 1;
            }
             
            System.out.println(getLocation());
            if (map[mapLoc][enemyGridx + this.x][enemyGridy + this.y]) {
                moveTo(getLocation().getRow() + this.x * getSpeed(),getLocation().getCol() + this.y * getSpeed());
                System.out.println(this.x);
            }
            else {
                 
                if (map[mapLoc][enemyGridx + this.x][enemyGridy]) {
                    moveTo(getLocation().getRow() + this.x * getSpeed(),getLocation().getCol());
                }
                else if (map[mapLoc][enemyGridx][enemyGridy + this.y]) {
                    moveTo(getLocation().getRow(),getLocation().getCol() + this.y * getSpeed());
                }
                else {
                    if (map[mapLoc][enemyGridx + this.x][enemyGridy - this.y]) {
                        moveTo(getLocation().getRow() + this.x * getSpeed(),getLocation().getCol() - this.y * getSpeed());
                    }
                    else if (map[mapLoc][enemyGridx - this.x][enemyGridy + this.y]) {
                        moveTo(getLocation().getRow() - this.x * getSpeed(),getLocation().getCol() + this.y * getSpeed());
                    }
                    else {
                        if (map[mapLoc][enemyGridx - this.x][enemyGridy]) {
                            moveTo(getLocation().getRow() - this.x * getSpeed(),getLocation().getCol());
                        }
                        else if (map[mapLoc][enemyGridx][enemyGridy - this.y]) {   
                            moveTo(getLocation().getRow(),getLocation().getCol() - this.y * getSpeed());
                        }
                        else {
                            if (map[mapLoc][enemyGridx - this.x][enemyGridy - this.y]) {
                                moveTo(getLocation().getRow() - this.x * getSpeed(),getLocation().getCol() - this.y * getSpeed());
                            }
                            else {
                                return;
                            }
                        }
                         
                    }
                }
            }
             
             
        }
        */
 
    /*
    public void move(boolean[][][] map, int mapLoc,int width,int height,double x,double y) {
             
            oldEnemyLoc = getLocation();
            nodes = new Location[(int) height][(int) width];
            for (int a = 0; a < width; a++) {
                for (int b = 0; b < height; b++) {
                    nodes[a][b] = new Location(width,height);
                }
            }
            boolean found = findShortestPath(playerLoc,map,mapLoc,width,height,x,y);
            ArrayList<Location> adj = findAdjacentLocations();
            System.out.println(adj.size());
            if (adj.size() > 0) {
                int dist = 9999999;
                int val = 0;
                if (found) {
                    for (int a = 0; a < adj.size(); a++) {
                        if (adj.get(a).getDistance() < dist && adj.get(a).getDistance() >= 0) {
                            dist = adj.get(a).getDistance();
                            val = a;
                        }
                    }
                }
                 
                moveTo(adj.get(val));
             
            }
             
        }
        */
 
 
    /*
    public boolean findShortestPath(Location player, boolean[][][] map, int mapLoc,int width,int height,double x,double y) {
            int row = playerLoc.getRow();
            int col = playerLoc.getCol();
            if (!player.getIgnore()) {
                nodes[row][col].setIgnore();
                nodes[row][col].setDistance(distance);
                distance++;
                for (Location a: getAdjacentLocations(player, map, mapLoc, width, height, x, y, distance)) {
                    System.out.println(a);
                    if (a.getRow() == getLocation().getRow() && a.getCol() == getLocation().getCol()) {
                        System.out.println("exit");
                        return true;
                    }
                    if (map[mapLoc][(int)(a.getRow() / (width / x))][(int)(a.getCol() / (height / y))]) {
                        findShortestPath(a, map, mapLoc, width, height, x, y);
                    }
                     
                }
            }
            return false;
        }
         
        public ArrayList<Location> getAdjacentLocations(Location location,boolean[][][] map,int mapLoc,int width,int height,double x, double y, int distance) {
            ArrayList<Location> temp = new ArrayList<Location>();
            for (int x1 = location.getRow() - 1; x1 <= location.getRow() + 1; x1++) {
                for (int y1 = location.getCol() - 1; y1 <= location.getCol() + 1; y1++) {
                    if (x1 == location.getRow() && y1 == location.getCol()) {
                         
                    }
                    else {
                        if (map[mapLoc][(int)(x1 / (width / x))][(int)((y1) / (height / y))]) {
                            try {
                                if (!nodes[(int) x1][(int) y1].getIgnore()) {
                                    temp.add(new Location((int)x1,(int)y1, distance));
                                }
                            }
                            catch(Exception e) {
                                 
                            }
                        }
                    }
                }
            }
            return temp;
             
        }
         
        public ArrayList<Location> findAdjacentLocations() {
            ArrayList<Location> adjacentLoc = new ArrayList<Location>();
            for (int x = getLocation().getRow() - getSpeed(); x < getLocation().getRow() + getSpeed(); x++)
            {
                for (int y = getLocation().getCol() - getSpeed(); y < getLocation().getCol() + getSpeed();y++) {
                    if (nodes[x][y] != null) {
                        System.out.println(nodes[x][y]);
                        if (Math.abs(nodes[x][y].getRow() - getLocation().getRow()) <= getSpeed() && Math.abs(nodes[x][y].getRow() - getLocation().getRow()) <= getSpeed() ) {
                            adjacentLoc.add(nodes[x][y]);
                        }
                    }
                }
            }
            return adjacentLoc;
        }
        */
 
    public int getDirection() {
      return direction;
    }
  }
 
  public class GameSetup {
    double x;
    double y;
    int width;
    int height;
    int speedConstant;
    Player player;
    ArrayList<Token> tokens = new ArrayList<Token>();
    ArrayList<Bullet> bullets = new ArrayList<Bullet>();
    ArrayList<Enemy> enemies = new ArrayList<Enemy>();
    ArrayList<Boss> boss = new ArrayList<Boss>();
    int mapLoc;
    Square[][] list;
    /*
     map
          
          3
         629
         518
         407
          
         */
    boolean[][][] maps = {
      {     //map 0
        //top connects to map 1
        //left connects to map 4
        //right connects to map 7
        //top left                                      //bottom left
        {
          false, false, false, true, true, true, false, false, false, false
        }
        ,
        {
          false, true, true, true, true, true, true, false, false, false
        }
        ,
        {
          true, true, true, true, false, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, false, true, true, false
        }
        ,
        {
          true, false, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, false, true, true, false, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, false, false, true, true, true, false
        }
        ,
        {
          false, true, true, false, false, true, true, true, true, false
        }
        ,
        {
          true, true, true, false, true, true, false, false, true, false
        }
        ,
        {
          false, false, false, false, true, true, true, false, false, false
        }
        //top right                                    //bottom right
      }
      ,
 
      { //map 1
        //bottom connects to map 0
        //top connects to map 2
        //left connects to map 5
        //right connects to map 8
        {
          false, false, false, false, false, true, true, false, false, false
        }
        ,  
        {
          false, false, true, false, false, false, true, false, true, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, false, true, true, true, true, true
        }
        ,
        {
          true, true, false, true, false, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, false, true, true
        }
        ,
        {
          false, true, true, false, true, false, false, false, false, false
        }
        ,
        {
          false, false, false, false, true, true, true, true, false, true
        }
        ,
        {
          false, false, false, false, false, false, false, true, false, false
        }
      }
      ,
 
      {
        //map 2
        //map before boss
        //top connects to map 3
        //bottom connects to map 1
        //left connects to map 6
        //right connects to map 9
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
      }
      ,
 
      {
        //map 3
        //boss map
        //bottom connects to map 2
        {
          false, false, false, false, false, false, false, false, false, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, false, false, false, false, false, false, false, false, false
        }
      }
      ,
 
      {
        //map 4
        {
          false, false, false, false, false, false, false, false, false, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
      }
      ,
 
      {
        //map 5
        {
          false, false, false, false, false, false, false, false, false, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
      }
      ,
 
      {
        //map 6
        {
          false, false, false, false, false, false, false, false, false, false
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
      }
      ,
 
      {
        //map 7
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, false
        }
        ,
        {
          false, false, false, false, false, false, false, false, false, false
        }
      }
      ,
 
      {
        //map 8
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          true, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, false, false, false, false, false, false, false, false, false
        }
      }
      ,
 
      {
        //map 9
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, true, true, true, true, true, true, true, true, true
        }
        ,
        {
          false, false, false, false, false, false, false, false, false, false
        }
      }
      ,
    };
 
    public GameSetup(double x1, double y1, int w, int h, Player player) {
      x = x1;
      y = y1;
      width = w;
      height = h;
      speedConstant = (int)((height + width) / 80 / x);
      this.player = player;
      list = new Square[(int)x][(int)y];
    }
 
    public void changeMapBoolean(int mapLoc, int x, int y) {
      maps[mapLoc][x][y] = !maps[mapLoc][x][y];
    }
 
    public Square[][] getList() {
      return list;
    }
 
    public boolean[][][] getMaps() {
      return maps;
    }
 
    public ArrayList<Enemy> getEnemies() {
      return enemies;
    }
 
    public ArrayList<Bullet> getBullets() {
      return bullets;
    }
 
    public ArrayList<Token> getTokens() {
      return tokens;
    }
 
    public int getMapLoc() {
      return mapLoc;
    }
 
    public void resetEnemies() {
      for (int a = enemies.size() - 1; a >= 0; a--) {
        enemies.remove(a);
      }
    }
    public void setSquares(int a) {
      for (int row = 0; row < x; row++) {
        for (int col = 0; col < y; col++) {
          if (maps[a][row][col]) {
            list[row][col] = new Square(true);
          }
          else {
            list[row][col] = new Square(false);
          }
        }
      }
      mapLoc = a;
      resetEnemies();
    }
 
    public void removeEnemy(int a) {
      enemies.remove(a);
    }
    public void removeToken(int a) {
      tokens.remove(a);
    }
    public void removeBullet(int a) {
      bullets.remove(a);
    }
 
    public void addBullet(Bullet b) {
      bullets.add(b);
    }
 
    public ArrayList<Boss> getBoss() {
      return boss;
    }
 
    public void setBoss() {
      boss.add(new Boss(new Location(width / 2, height / 2), player.getLevel() + 5, speedConstant, player));
    }
 
    public void setPlayer(Player p) {
      player = p;
    }
 
    public void setEnemies(int c) {
      for (int b = enemies.size() - 1;b >= 0; b--) {
        enemies.remove(b);
      }
      for (int s = 0; s < c;) {
        boolean occupied = false;
        int xLoc = (int)(Math.random() * x);
        int yLoc = (int)(Math.random() * y);
        if (maps[mapLoc][xLoc][yLoc]) {
          for (Enemy e : enemies) {
            if (e.getLocation().getRow() == (int)(xLoc * width / x + (width / x / 2)) && e.getLocation().getCol() ==(int)(yLoc * height / y + (height / y / 2))) {
              occupied = true;
            }
          }
          for (Token t : tokens) {
            if (t.getLocation().getRow() == (int)(xLoc * width / x + (width / x / 2)) && t.getLocation().getCol() ==(int)(yLoc * height / y + (height / y / 2))) {
              occupied = true;
            }
          }
          if (!occupied) {
            int l = (int)(Math.random() * 3 + 1);
            if (player.getLevel() < 3) {
              //System.out.println(player.getLevel());
              l = (int)(Math.random() * player.getLevel() + 1);
            }
 
            enemies.add(new Enemy(new Location((int)(xLoc * width / x + (width / x / 2)), (int)(yLoc * height / y + (height / y / 2))), l, speedConstant, player));
            s++;
          }
        }
      }
    }
 
    public void setupTokens() {
      int tokenNumber = 4; //at least one main and mix of the three
      for (int m = 0; m < maps.length; m++) {
        int bulletNum = (int)(Math.random() * (tokenNumber));
        int healthNum = (int)(Math.random() * (tokenNumber - bulletNum));
        int mainNum = (int)(Math.random() * (tokenNumber - (healthNum + bulletNum)) + 1);
        //System.out.println(mainNum + "   " + bulletNum + "     " + healthNum);
        for (int a = 0; a < tokenNumber;) {
 
          boolean occupied = false;
          int xLoc = (int)(Math.random() * x);
          int yLoc = (int)(Math.random() * y);
          if (maps[m][xLoc][yLoc]) {
            if (m != 3) {
              for (Token t : tokens) {
                if (t.getMapLoc() == m && t.getLocation().getRow() == (int)(xLoc * width / x + (width / x / 2)) && t.getLocation().getCol() ==(int)(yLoc * height / y + (height / y / 2))) {
                  occupied = true;
                }
              }
              if (!occupied) {
 
                if (healthNum > 0) {
                  tokens.add(new HealthToken((new Location((int)(xLoc * width / x + (width / x / 2)), (int)(yLoc * height / y + (height / y / 2)))), player, m));
                  healthNum--;
                }
                else if (bulletNum > 0) {
                  tokens.add(new BulletToken((new Location((int)(xLoc * width / x + (width / x / 2)), (int)(yLoc * height / y + (height / y / 2)))), player, m));
                  bulletNum--;
                }
                else if (mainNum > 0) {
                  tokens.add(new MainToken((new Location((int)(xLoc * width / x + (width / x / 2)), (int)(yLoc * height / y + (height / y / 2)))), player, m));
                  mainNum--;
                }
                a++;
              }
            }
            else {
              for (Token t : tokens) {
                if (t.getLocation().getRow() == (int)(xLoc * width / x + (width / x / 2)) && t.getLocation().getCol() ==(int)(yLoc * height / y + (height / y / 2))) {
                  occupied = true;
                }
                if ((xLoc == 4 && yLoc == 9) || (xLoc == 5 && yLoc == 9) || (xLoc == 4 && yLoc == 4) || (xLoc == 4 && yLoc == 5) || (xLoc == 5 && yLoc == 4) || (xLoc == 5 && yLoc == 5)) {
                  occupied = true;
                }
              }
              if (!occupied) {
                if (a % 2 == 0) {
                  tokens.add(new BulletToken((new Location((int)(xLoc * width / x + (width / x / 2)), (int)(yLoc * height / y + (height / y / 2)))), player, m));
                }
                if (a % 2 == 1) {
                  tokens.add(new HealthToken((new Location((int)(xLoc * width / x + (width / x / 2)), (int)(yLoc * height / y + (height / y / 2)))), player, m));
                }
                a++;
              }
            }
          }
        }
      }
    }
 
 
    public void addToken(Token t) {
      tokens.add(t);
    }
 
    public void resetLocations(int w, int h, int w1, int h1) {
      for (int a = 0; a < enemies.size(); a++) {
        enemies.get(a).resetLocation(w, h, w1, h1);
      }
      for (int a = 0; a < tokens.size(); a++) {
        tokens.get(a).resetLocation(w, h, w1, h1);
      }
      for (int a = 0; a < bullets.size(); a++) {
        bullets.get(a).resetLocation(w, h, w1, h1);
      }
      for (int a = 0; a < boss.size(); a++) {
        boss.get(a).resetLocation(w, h, w1, h1);
      }
      player.resetLocation(w, h, w1, h1);
    }
  }
 
 
  public class HealthToken extends Token {
    public HealthToken (Location loc, Player p, int m) {
      super(loc, p, m, "HealthToken");
    }
  }
 
 
  public class Location {
    int row;
    int col;
    int distance;
    //boolean ignore;
    public Location(int x, int y) {
      row = x;
      col = y;
    }
 
    public Location (int x, int y, int dist) {
      row = x;
      col = y;
      distance = dist;
      //ignore = false;
    }
 
    public void setDistance(int d) {
      distance = d;
    }
    //public boolean getIgnore() {
    //return ignore;
    //}
 
    public void setIgnore() {
      //ignore = true;
    }
    public int getRow() {
      return row;
    }
 
    public int getCol() {
      return col;
    }
 
    public int getDistance() {
      return distance;
    }
 
    public void changeRow(int r) {
      row = r;
    }
 
    public void changeCol(int c) {
      col = c;
    }
 
    public Location changeLocation(int x, int y) {
      row = x;
      col = y;
      return this;
    }
 
    public String toString() {
      return row + "   " + col;
    }
 
    public int convertToGrid(int loc, int width, double x) {
      return (int)(loc / (width / x));
    }
  }
 
 
  public class MainToken extends Token {
    public MainToken (Location loc, Player p, int m) {
      super(loc, p, m, "MainToken");
    }
  }
 
 
  public class Player extends Character {
    private int damage;
    private int level;
    private int exp;
    private int direction;
    private int numBullet;
    private final int totalBullets = 100;
    private int lives;
 
    public Player(Location loc, int sc) {
      //changes
      super(loc, 1, sc);
      level = 1;
      setHealth(calculateHP(level) * 4);
      setSpeed(2 * getSpeedConstant());
      numBullet = 40;
      lives = 3;
    }
 
    public void changeLives(int a) {
      lives += a;
    }
 
    public void levelUp() {
      level = level + 1;
    }
 
    public boolean checkLevelUp() {
      return (exp >= level * level * 15);
    }
 
    public int getExp() {
      return exp;
    }
    public int getLevel() {
      return level;
    }
    public void setDirection(int a) {
      direction = a;
    }
    public int getDirection() {
      return direction;
    }
 
    public void calculateDamage() {
      damage = level * 10;
    }
    public int getDamage() {
      return damage;
    }
 
    public void gainExp(int a) {
      exp = exp + a;
    }
    public int getNumBullets() {
      return numBullet;
    }
    public void changeNumBullets(int a) {
      numBullet = numBullet + a;
      if (numBullet > totalBullets) {
        numBullet = totalBullets;
      }
      else if (numBullet < 0) {
        numBullet = 0;
      }
    }
  }
 
 
  public class Square {
    private boolean pass;
 
    public Square(boolean p) {
      pass = p;
    }
 
    public boolean getPass() {
      return pass;
    }
  }
 
 
  public class Token extends Character {
    Player player;
    int mapLoc;
    String tokenType;
    public Token(Location loc, Player p, int m, String type) {
      super(loc);
      player = p;
      mapLoc = m;
      tokenType = type;
    }
 
    //must be called for each token
    //all tokens will have to be updated consistently then updated with this method
    public Player setPlayer() {
      return player;
    }
 
    public int getMapLoc() {
      return mapLoc;
    }
 
    public String getTokenType() {
      return tokenType;
    }
  }

