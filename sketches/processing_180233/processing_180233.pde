
/* @pjs globalKeyEvents=true; 
 */

  /* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/6572*@* */
  /*
   * !do not delete the line above, required for linking your tweak if you
   * re-upload
   */

  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/

  Conf conf;
  PImage filtre;
  PFont fontA;
  Ship ship;
  Fleet fleet;
  Laser laser;
  MotherShip motherShip;
  ArrayList<Ship> livesFeedBck;
  ArrayList<Sheild> sheilds;

   void setup() {
    size(500, 430);
    conf = new Conf();
    frameRate(40);
    initGame();
    filtre = loadImage("filtrejeu.tga");
    fontA = loadFont("CourierNew36.vlw");
  }

   void draw() {
    displayScore();
    if (conf.lives <= 0) {
      gameOver();
      return;
    }
    laser.display();
    ship.display();
    fleet.display();
    motherShip.display();
   
   

    fleet.update();
    laser.update();
    updateShip();
    updateMother();
    
    for (Sheild s : sheilds){
     s.display();
     s.contact(laser);
     s.contactList(fleet.getLasers());
     s.contactInvader(fleet.getInvaders());
    }

    conf.lives = (fleet.checkShipContact(ship))?0:conf.lives;
    conf.score += motherShip.checkContact(laser);
    conf.score += fleet.checkLaserContact(laser);
    for (Laser invaderLaser : fleet.getLasers()) {
      if (ship.contact(invaderLaser)) {
        invaderLaser.setaLive(false);
        conf.lives--;
      }
    }
    
    if(fleet.everyInvadersAreDead()){
      fleet = new Fleet();
    }
    
   //image(filtre, 0, -90);
  }

  /** Ship Actions 
   * You can directly Set X ship by call ship.setPosition(X);
   * This X value will be constraint by borderLimit Ship will stay on screen. 
   * 
   **/

  void updateShip() {
    if (conf.Ri == true) {
      ship.moveRight();
    }
    if (conf.Le == true) {
      ship.moveLeft();
    }
    if (conf.Ti == true) {
      if (!laser.aLive) {
        laser = new Laser(ship.location.x);
      }
    }
  }

   void keyPressed() {
    if (keyCode == RIGHT) {
      conf.Ri = true;
    }
    if (keyCode == LEFT) {
      conf.Le = true;
    }
    if (key == ' ') {
      conf.Ti = true;
    }
  }

   void keyReleased() {
    if (keyCode == RIGHT) {
      conf.Ri = false;
    }
    if (keyCode == LEFT) {
      conf.Le = false;
    }
    if (key == ' ') {
      conf.Ti = false;
    }
  }
  
  
   void updateMother() {
    if (motherShip.aLive) {
      motherShip.update();
    } else {
      if (frameCount % 60 == 0 && random(100) > 85) {
        motherShip.launchMotherShip(random(100) > 50);
      }
    }
  }

   void initializeSheild() {
    sheilds = new ArrayList<Sheild>();
    for (int i = 0; i < 4; i++) {
      sheilds.add(new Sheild(i * 125 + 45, 310));
    }
  }

  void initGame() {
    ship = new Ship();
    fleet = new Fleet();
    laser = new Laser( ship.location.x);
    laser.setaLive(false);
    motherShip = new MotherShip();
    initializeSheild();
    conf.score = 0;
    conf.lives = 3;
    livesFeedBck = new ArrayList<Ship>();
    for (int i = 0; i < conf.lives; i++) {
      livesFeedBck.add(new Ship(width - 120 + 40 * i, height / 15));
    }
  }

  void displayScore() {
    background(0);
    fill(255);
    textFont(fontA, 15);
    textAlign(LEFT);
    text("Score: ", width / 20, height / 15);
    text(conf.score, width / 20 + 60, height / 15);
    strokeWeight(2);
    stroke(0, 255, 0);
    line(0, 9 * height / 10 + 20, width, 9 * height / 10 + 20);
    for (int i = 0; i < conf.lives; i++) {
      Ship ship = livesFeedBck.get(i);
      ship.display();
    }
  }

  void gameOver() {
    textFont(fontA, 35);
    textAlign(CENTER);
    text("GAME OVER", width / 2, height / 2);
    if (mousePressed) {
      initGame();
    }
   image(filtre, 0, -90);
  }
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/
class Conf {
  boolean Ri, Le, Ti;
  int lives;
  int score;
  

  Conf() {
    Ri = false;
    Le = false;
    Ti = false;
    lives = 3;
    score = 0;
  
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/
class Entity {
  PVector location;
   PVector hitboxNE;
   PVector hitboxSW;
   boolean aLive;
   boolean debugE;
  

   Entity(PVector location) {
    this.location = new PVector(location.x,location.y);
    this.hitboxNE = new PVector(0, 0);
    this.hitboxSW = new PVector(0, 0);
    this.aLive = true;
  }

   void setHitbox(PVector hitboxNE, PVector hitboxSW) {
    this.hitboxNE = hitboxNE;
    this.hitboxSW = hitboxSW;
  }


   PVector gethitboxNE() {
    PVector hitboxcopNE =  new PVector(hitboxNE.x,hitboxNE.y);
    hitboxcopNE.add(location);
    return hitboxcopNE;
  }

   boolean contact(Entity other) {
    if(!other.aLive||!aLive)return false;
    PVector hitboxcopNE = gethitboxNE();
    PVector otherHitboxcopNE = other.gethitboxNE();

    if (hitboxcopNE.x + hitboxSW.x < otherHitboxcopNE.x)
      return false;
    if (hitboxcopNE.x > otherHitboxcopNE.x + other.hitboxSW.x)
      return false;
    if (hitboxcopNE.y + hitboxSW.y < otherHitboxcopNE.y)
      return false;
    if (hitboxcopNE.y > otherHitboxcopNE.y + other.hitboxSW.y)
      return false;

    return true;
  }
  
   boolean contact(PVector loc, int size) {
    PVector hitboxcopNE = gethitboxNE();
    

    if (hitboxcopNE.x + hitboxSW.x < loc.x)
      return false;
    if (hitboxcopNE.x > loc.x + size)
      return false;
    if (hitboxcopNE.y + hitboxSW.y < loc.y)
      return false;
    if (hitboxcopNE.y > loc.y + size)
      return false;

    return true;
  }

   boolean isaLive() {
    return aLive;
  }

   void setaLive(boolean aLive) {
    this.aLive = aLive;
  }

   void setLocation(PVector location) {
    this.location = location;
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/
 class Fleet {
  int rows = 5;
  int cols = 10;
  int maxInvadersLazer = 3;
  boolean positionFlag;
  boolean boundaryContact = false;
  int speedUpdate = 40;
  float velocityX = 8;
  int velocityY = 8;
  int deltaX;
  int deltaY;

  ArrayList<SpaceInvader> invaders;
  ArrayList<Laser> lasers;

   Fleet() {
    deltaX = width / 10 + 35;
    deltaY = height / 10 + 70;
    invaders = new ArrayList<SpaceInvader>();
    lasers = new ArrayList<Laser>();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        invaders.add(createNewInvaders(i, j));
      }
    }
  }

  SpaceInvader createNewInvaders(int i, int j) {
    return new SpaceInvader(deltaX + (35 * i), deltaY + (30 * j),
        computeTypeFromRow(j));
  }

  void update() {
    updateLasers();
    if (frameCount % speedUpdate != 0)
      return;
    shotLaser();
    positionFlag = !positionFlag;
    if (boundaryContact) {
      boundaryContact = false;
      for (SpaceInvader spaceInvader : invaders) {
        spaceInvader.moveY(velocityY);
      }
      
      return;
    }
    for (SpaceInvader spaceInvader : invaders) {
      if (spaceInvader.moveX(velocityX)) {
        boundaryContact = true;
      }
    }

    if (boundaryContact)
      maneuveFleet();
  }

   void updateLasers() {
    ArrayList<Laser> laserToRemove = new ArrayList<Laser>();
    for(Laser l : lasers){
      l.update();
      if (!l.aLive) {
        laserToRemove.add(l);
      }
    }
    // Remove died laser
    for(Laser l : laserToRemove){
      lasers.remove(l);
    }
  }

   void shotLaser() {
    if (lasers.size() >= maxInvadersLazer)
      return;
    if (random(100) <= 75)
      return;

    int randomInvaderIndex = (int) random(invaders.size()) - 1;
    randomInvaderIndex = constrain(randomInvaderIndex, 0,
        invaders.size() - 1);
    SpaceInvader shootingInvader = invaders.get(randomInvaderIndex);

    lasers.add(new Laser(shootingInvader.location.x,
        shootingInvader.location.y));
  }

   void maneuveFleet() {
    speedUpdate -= 3;
    speedUpdate = constrain(speedUpdate, 6, 60);
    if (velocityX > 0) {
      velocityX = velocityX * -1 - 0.3f;
    } else {
      velocityX = velocityX * -1 + 0.3f;
    }
    velocityX = constrain(velocityX, -14, 14);
  }

  void display() {
    for (SpaceInvader spaceInvader : invaders) {
        spaceInvader.display(positionFlag);
     }
    for (Laser l : lasers){
      l.display();
    }
  }

   int computeTypeFromRow(int j) {
    switch (j) {
    case 0:
      return 3;
    case 1:
    case 2:
      return 2;
    default:
      return 1;
    }
  }

  boolean checkShipContact(Ship ship){
    for(SpaceInvader invader : invaders){
      if(invader.contact(ship)){
        return true;
      }
    }
    return false;
  }

   int checkLaserContact(Laser laser) {
    if (!laser.aLive)
      return 0;
      
    int score = 0;
  
    ArrayList<SpaceInvader> invaderToRemove = new ArrayList<SpaceInvader>();
    for(SpaceInvader i : invaders){
      if(i.contact(laser)){
        invaderToRemove.add(i);
        laser.setaLive(false);
        score = i.type * 10;
      }      
    }
    // Remove died laser
    for(SpaceInvader i : invaderToRemove){
      invaders.remove(i);
    }
    return score;
  }

   boolean everyInvadersAreDead(){
    return invaders.isEmpty();
  }
  
  
   ArrayList<Laser> getLasers() {
    return lasers;
  }

   ArrayList<SpaceInvader> getInvaders() {
    return invaders;
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/
  
class Laser extends Entity {

  float speedy;
  int type;

  Laser(float x_, float y_) {
    super(new PVector(x_, y_));
    super.setHitbox(new PVector(-3, -15), new PVector(8, 15));
    speedy = -3;
    type = 2;
  }

  Laser(float x) {
    super( new PVector(x, 9 * height / 10));
    super.setHitbox(new PVector(-1, -10), new PVector(2, 10));
    speedy = 4f;
    type = 1;
  }

 
   void display() {
    if (!aLive)
      return;
    stroke(255);
    if (type == 1) {
      strokeWeight(2);
      line(location.x, location.y, location.x, location.y - 10);
    } else {
      strokeWeight(2);
      line(location.x + 3, location.y, location.x - 3, location.y - 3);
      line(location.x - 3, location.y - 3, location.x + 3,location.y - 6);
      line(location.x + 3, location.y - 6, location.x - 3,location.y - 9);
      line(location.x - 3, location.y - 9, location.x + 3,location.y - 12);
      line(location.x + 3, location.y - 12, location.x - 3,location.y - 15);
    }
    
  }

  void update() {
    location.y = location.y - speedy;
    if (location.y < 0 || location.y > height + 15) {
      aLive = false;
    }
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/

class MotherShip extends Entity {
  float speedx;

  MotherShip() {
    super(new PVector(width / 2, 65));
    super.setHitbox(new PVector(-16, -6), new PVector(32, 12));
    aLive = false;
    speedx = 1;
  }


   public void display() {
    if (aLive == true) {
      noStroke();
      fill(255, 10, 10);
      rectMode(CORNER);
      rect(-6 + location.x, -6 + location.y, 12, 2);
      rect(-10 + location.x, -4 + location.y, 20, 2);
      rect(-12 + location.x, -2 + location.y, 24, 2);
      rect(-14 + location.x, 0 + location.y, 4, 2);
      rect(-8 + location.x, 0 + location.y, 4, 2);
      rect(-2 + location.x, 0 + location.y, 4, 2);
      rect(4 + location.x, 0 + location.y, 4, 2);
      rect(10 + location.x, 0 + location.y, 4, 2);
      rect(-16 + location.x, 2 + location.y, 32, 2);
      rect(-12 + location.x, 4 + location.y, 6, 2);
      rect(-2 + location.x, 4 + location.y, 4, 2);
      rect(6 + location.x, 4 + location.y, 6, 2);
      rect(-10 + location.x, 6 + location.y, 2, 2);
      rect(8 + location.x, 6 + location.y, 2, 2);
    }
    
  }

  void launchMotherShip(boolean k) {
    if (k) {
      location.x = -14;
      speedx = random(0.8f, 2);
    } else {
      location.x = width + 14;
      speedx = -random(0.8f, 2);
    }
    aLive = true;
  }

  void update() {
    if (location.x + 16 > 0 && location.x - 16 < width) {
      location.x = location.x + speedx;
    } else {
      aLive = false;
    }
  }

  int checkContact(Laser laser) {
    if (contact(laser)) {
      laser.setaLive(false);
      setaLive(false);
      return 100;
    }
    return 0;
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/

class Sheild extends Entity {

  int[][] protect = {
      { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
      { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
      { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
      { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 } };

  Sheild(int x_, int y_) {
    super(new PVector(x_, y_));
    super.setHitbox(new PVector(-1, -1), new PVector(40, 30));
  }


   public void display() {
    noStroke();
    fill(0, 255, 0);
    rectMode(CENTER);
    for (int i = 0; i < 15; i++) {
      for (int j = 0; j < 20; j++) {
        if (protect[i][j] == 1) {
          rect(j * 2 + location.x, i * 2 + location.y, 2, 2);
        }
      }
    }
    
  }

   void contactList( ArrayList<Laser> lasers) {
    for(Laser l : lasers){
      contact(l);
    }
  }

   boolean contact( Laser other) {
    if (!other.aLive){
      return false;
    }
      
    float pX = other.location.x;
    float pY = other.location.y;
    for (int i = 0; i < 15; i++) {
      for (int j = 0; j < 20; j++) {
        if (pX >= j * 2 + location.x - 1
            && pX <= j * 2 + location.x + 1
            && pY >= i * 2 + location.y - 1
            && pY <= i * 2 + location.y + 1 && protect[i][j] == 1) {
          destroyAround(i, j);
          other.setaLive(false);
          return true;
        }
      }
    }
    return false;
  }

   void contactInvader( ArrayList<SpaceInvader> invader) {
    for (int i = 0; i < 15; i++) {
      for (int j = 0; j < 20; j++) {
        PVector particuleLoc = new PVector(j * 2 + location.x - 1, i * 2 + location.y - 1);
        for (SpaceInvader spaceInvader : invader) {
          if(spaceInvader.contact(particuleLoc, 2)){
            protect[i][j] = 0;
            continue;
          }
        }
      }
    }
  }

   void destroyAround(int i, int j) {
    protect[i][j] = 0;
    for (int t = i - 2; t <= i + 2; t++) {
      for (int r = j - 2; r <= j + 2; r++) {
        if (t >= 0 && t < 15 && r >= 0 && r < 20) {
          if (random(100) > 75) {
            protect[t][r] = 0;
          }
        }
      }
    }
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/

class Ship extends Entity {

   float minLimit;
   float maxLimit;
    float shipVelocity = 3;
  
  /**
   * Create new Ship 
   * 
   */
  Ship(float x_, float y_) {
    super(new PVector(x_, y_));
    this.minLimit=width / 15;
    this.maxLimit=14 * width / 15;
  }

  /**
   * Create new Ship 
   * With define Y value
   */
  Ship() {
    super(new PVector(width / 2, 9 * height / 10));
    super.setHitbox(new PVector(-15, -10), new PVector(30, 14));
    this.minLimit=width / 15;
    this.maxLimit=14 * width / 15;
  }


  public void display() {
     float x = location.x;
     float y = location.y;
    noStroke();
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(x, y, 30, 14);
    rect(x, y - 10, 6, 6);
    rect(x, y - 14, 2, 2);
    fill(0);
    rect(x - 14, y - 6, 2, 2);
    rect(x + 14, y - 6, 2, 2);
    
  }

  /**
   * Add delta to X
   * @param delta
   */
  void move(float delta) {
    location.x = constrain(location.x + delta, minLimit,maxLimit);
  }
  
  void moveLeft(){
    move(-shipVelocity);
  }
  
  void moveRight(){
    move(shipVelocity);
  }
  
  /**
   * Set X position
   * @param newPosition
   */
  void setPosition(float newPosition){
    location.x = constrain(newPosition, minLimit,maxLimit);
  }
}
  /** Space Invader Clone **/
  /** Code by Tristan Brismontier **/

class SpaceInvader extends Entity {
  int type;

  SpaceInvader(int X_, int Y_, int _type) {
    super(new PVector(X_, Y_));
    super.setHitbox(new PVector(-12, -8), new PVector(24, 16));
    type = _type;
  }

   void display(boolean flag) {
    float spX = location.x;
    float spY = location.y;
    if (type == 1) {
      noStroke();
      fill(255);
      rectMode(CORNER);
      rect(-4 + spX, -8 + spY, 8, 2);
      rect(-10 + spX, -6 + spY, 20, 2);
      rect(-12 + spX, -4 + spY, 24, 2);
      rect(-12 + spX, -2 + spY, 6, 2);
      rect(-2 + spX, -2 + spY, 4, 2);
      rect(6 + spX, -2 + spY, 6, 2);
      rect(-12 + spX, spY, 24, 2);
      rect(2 + spX, 2 + spY, 4, 2);
      rect(-6 + spX, 2 + spY, 4, 2);
      rect(-2 + spX, 4 + spY, 4, 2);

      if (flag == false) {
        rect(-8 + spX, 4 + spY, 4, 2);
        rect(4 + spX, 4 + spY, 4, 2);
        rect(-12 + spX, 6 + spY, 4, 2);
        rect(8 + spX, 6 + spY, 4, 2);
      } else {
        rect(-10 + spX, 4 + spY, 4, 2);
        rect(6 + spX, 4 + spY, 4, 2);
        rect(-8 + spX, 6 + spY, 4, 2);
        rect(4 + spX, 6 + spY, 4, 2);
      }
    }
    if (type == 2) {
      noStroke();
      fill(255);
      rectMode(CORNER);
      rect(-7 + spX, -8 + spY, 2, 2);
      rect(5 + spX, -8 + spY, 2, 2);
      rect(-5 + spX, -6 + spY, 2, 2);
      rect(3 + spX, -6 + spY, 2, 2);
      rect(-7 + spX, -4 + spY, 14, 2);
      rect(-7 + spX, -4 + spY, 2, 10);
      rect(5 + spX, -4 + spY, 2, 10);
      rect(-7 + spX, spY, 14, 4);
      rect(-3 + spX, -2 + spY, 6, 2);
      rect(-9 + spX, -2 + spY, 2, 4);
      rect(7 + spX, -2 + spY, 2, 4);
      if (flag == false) {
        rect(-11 + spX, spY, 2, 6);
        rect(9 + spX, spY, 2, 6);
        rect(.5f * 2 + spX, 6 + spY, 4, 2);
        rect(-5 + spX, 6 + spY, 4, 2);
      } else {
        rect(-11 + spX, -6 + spY, 2, 6);
        rect(9 + spX, -6 + spY, 2, 6);
        rect(7 + spX, 6 + spY, 2, 2);
        rect(-9 + spX, 6 + spY, 2, 2);
      }
    }
    if (type == 3) {
      noStroke();
      fill(255);
      rectMode(CORNER);
      rect(-2 + spX, spY - 8 , 4, 2);
      rect(-4 + spX, spY - 6, 8, 2);
      rect(-6 + spX, spY - 4, 12, 2);
      rect(-8 + spX, spY - 2, 4, 2);
      rect(-2 + spX, spY - 2, 4, 2);
      rect(4 + spX, spY - 2 , 4, 2);
      rect(-8 + spX, spY, 16, 2);
      rect(-4 + spX, 2 + spY, 2, 2);
      rect(2 + spX, 2 + spY, 2, 2);
      rect(-6 + spX, 4 + spY, 2, 2);
      rect(4 + spX, 4 + spY, 2, 2);
      rect(-4 + spX, 6 + spY, 2, 2);
      rect(2 + spX, 6 + spY, 2, 2);
      rect(-4 + spX, 6 + spY, 2, 2);
      rect(2 + spX, 6 + spY, 2, 2);

      if (flag == false) {
        rect(-8 + spX, 6 + spY, 2, 2);
        rect(6 + spX, 6 + spY, 2, 2);
        rect(-2 + spX, 4 + spY, 4, 2);
      }

    }
    
  }

  void moveY(float yDelta){
    location.y += yDelta;
  }
  
  boolean moveX(float xDelta) {
    location.x += xDelta;
    if (location.x > 14 * width / 15) {
      return true;
    } else {
      return location.x < width / 15;
    }
  }

}


