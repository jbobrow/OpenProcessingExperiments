
Ship player;
Background b;
EnemySpawner spawner;
CollisionManager cm;
UI ui;
ExplosionManager em;
boolean paused = false;

void setup() {  
  size(300, 600);
  b = new Background(400);
  player = new Ship(width/2, height/2 - 40, 50, 50);
  spawner = new EnemySpawner(10);
  cm = new CollisionManager();
  em = new ExplosionManager(20);
  ui = new UI();
  print(b.twinkleCount);
}

void keyReleased() {
  if(key == CODED){
    if(keyCode == LEFT){
      player.left = false;
    }
    if(keyCode == RIGHT){
      player.right = false;
    }
    if(keyCode == UP){
       player.up = false;
    }
    if(keyCode == DOWN){
       player.down = false;
    }
  }
  if(key == 'a'){
     player.left = false;
  }
  if(key == 'd'){
     player.right = false;
  }
  if(key == 'w'){
     player.up = false;
  }
  if(key == 's'){
     player.down = false;
  }
  if (key == 'p') {
    paused = !paused;
  }
  if(key == ' '){
    player.spacePressed = false;
  }
}

void draw() {
  if (!paused) {
    cm.update(spawner, player, em);
    player.update();
    spawner.update();

    b.move();
    player.move();
    spawner.move();
    em.move();
  }

  b.display();
  player.display();
  spawner.display();
  em.display();
  ui.display(player);
}

 class Background{
  //Fields
  int numberOfStars, twinkle, twinkleCount;
  float speed;
  float[] starX, starY;
  boolean twinkleCountingUp;
  
  //Constructor
  Background(int starCountIn){
    numberOfStars = starCountIn;
    starX = new float[numberOfStars];
    starY = new float[numberOfStars];
    twinkle = 0;
    twinkleCount = 0;
    twinkleCountingUp = true;
    speed = 1.2f;
    
    for(int i = 0; i < numberOfStars; i++){
      starX[i] = random(0, width - 1);
      starY[i] = random(0, height - 1);
    }
  }
  //Methods
  void move(){
    for(int i = 0; i < numberOfStars; i++){
      starY[i] += speed;
      if(starY[i] >= height){
        starY[i] = 0;
        starX[i] = random(0, width - 1);
      }
    }
    moveGreatPlow();
  }
  
  void display(){
    background(0);
    strokeWeight(1);
    stroke(255);
    for(int i = 0; i < numberOfStars; i++){
      point(starX[i], starY[i]);
    }
    drawGreatPlow();
  }
  
  void drawGreatPlow(){
    strokeWeight(twinkle);
    stroke(255);
    point(70, 100);
    point(120, 50);
    point(160, 70);
    point(180, 100);
    point(180, 150);
    point(240, 150);
    point(250, 100);
  }
  
  void moveGreatPlow(){
    if(twinkleCount < 10){
      twinkleCount++;
    }else{
      if(twinkleCountingUp){
        if(twinkle < 5){
          twinkle++;
        }else{
          twinkleCountingUp = false;
        }
      }else{
        if(twinkle > 0){
          twinkle--;
        }else{
          twinkleCountingUp = true;
        }
      }twinkleCount=0;
    } 
  }
}
class Bullet{
  //Fields
  float xPos, yPos, bulletWidth, bulletHeight, speed;
  boolean isAlive;
  //Constructor
  Bullet(){
    reset(0, 0, 0);
    bulletWidth = 3;
    bulletHeight = 10;
    isAlive = false;
  }
  
  //Methods
  void reset(float xIn, float yIn, float speedIn){
    xPos = xIn;
    yPos = yIn;
    speed = speedIn;
    isAlive = true;
  }
  void move(){
    if(!isAlive){
      return;
    }
    yPos -= speed;
    if(yPos < -bulletHeight){
      isAlive = false;
    }
  }
  
  void display(){
    if(!isAlive){
      return;
    }
    fill(255);
    stroke(255);
    rect(xPos, yPos, bulletWidth, bulletHeight);
  }
}
class CollisionManager{
  //Fields
  
  //Constructor
  CollisionManager(){
    
  }
  //Methods
  void update(EnemySpawner spawn, Ship ship, ExplosionManager eMan){
    for(int i = 0; i < spawn.enemies.length; i++){
      if((spawn.enemies[i].isAlive) &&
       (ship.xPos - ship.shipWidth/2 < spawn.enemies[i].xPos + spawn.enemies[i].eWidth) &&
       (ship.xPos + ship.shipWidth/2 > spawn.enemies[i].xPos) &&
       (ship.yPos < spawn.enemies[i].yPos + spawn.enemies[i].eHeight) &&
       (ship.yPos + ship.shipHeight > spawn.enemies[i].yPos)){
            spawn.enemies[i].isAlive = false;
            ship.hp--;
      }
    }
    
    for(int i = 0; i < spawn.enemies.length; i++){
      if(!spawn.enemies[i].isAlive){
        continue;
      }
      for(int j = 0; j < ship.bullets.length; j++){
        if(!ship.bullets[j].isAlive){
          continue;
        }
        if((spawn.enemies[i].xPos < ship.bullets[j].xPos + ship.bullets[j].bulletWidth) && (spawn.enemies[i].xPos + spawn.enemies[i].eWidth > ship.bullets[j].xPos) && (spawn.enemies[i].yPos + spawn.enemies[i].eHeight > ship.bullets[j].yPos) && (spawn.enemies[i].yPos < ship.bullets[j].yPos + ship.bullets[j].bulletHeight)){
          spawn.enemies[i].isAlive = false;
          ship.bullets[j].isAlive = false;
          ship.score += 10;
          eMan.spawnExplosion((int)random(20, 50), spawn.enemies[i].xPos + spawn.enemies[i].eWidth/2, spawn.enemies[i].yPos  + spawn.enemies[i].eHeight/2, 60, 2, spawn.enemies[i].r, spawn.enemies[i].g, spawn.enemies[i].b, 10, 10);
        }
      }
    }
  }
  
}
class Enemy{
  //Fields
  float orbitX, orbitY, xPos, yPos, orbitDistance, 
        orbitSpeed, orbitAngle, eWidth, eHeight, r, g, b, speed;
  boolean isAlive, clockwise;
  
  //Constructor
  Enemy(){
    reset(0, 0, 0, 0);
    isAlive = false;
  }
  //Methods
  void reset(float xIn, float yIn, float oSpeedIn, float speedIn){
    orbitX = xIn;
    orbitY = yIn;
    orbitSpeed = oSpeedIn;
    speed = speedIn;
    eWidth = 20;
    eHeight = 20;
    orbitDistance = 80;
    orbitAngle = 0;
    isAlive = true;
    if(random(0,2) >= 1){
      clockwise = false;
    }else{
      clockwise = true;
    }
  }
  void move(){
    if(!isAlive){
      return;
    }
    orbitY += speed;
    xPos = orbitX + cos(orbitAngle) * orbitDistance;
    yPos = orbitY + sin(orbitAngle) * orbitDistance;
    if(clockwise){
      orbitAngle += orbitSpeed;
      orbitAngle = orbitAngle%(2*PI);
    }else{
      orbitAngle -= orbitSpeed;
      orbitAngle = -1 * (abs(orbitAngle)%(2*PI));
    }
    
    //orbitAngle = abs(orbitAngle)%(2*PI);
    if(yPos >= height + eHeight/2){
      isAlive = false;
    }
  }
  void display(){
    if(!isAlive){
      return;
    }
    b = map(yPos, 0, height, 0, 255);
    if(abs(orbitAngle) < PI){
      r = map(abs(orbitAngle), 0, PI, 0, 255);
      g = 255 - r;
      fill(r, g, b);
      stroke(r, g, b);
    }else{
      g = map(abs(orbitAngle), PI, 2*PI, 0, 255);
      r = 255 - g;
      fill(r, g, b);
      stroke(r, g, b);
    }
    rect(xPos, yPos, eWidth, eHeight);
  }
}
class EnemySpawner{
  //Fields
  Enemy[] enemies;
  int cooldown;
  
  //Constructor
  EnemySpawner(int maxEnemies){
    enemies = new Enemy[maxEnemies];
    for(int i = 0; i < enemies.length; i++){
      enemies[i] = new Enemy();
    }
    cooldown = 20;
  }
  
  //Methods
  void update(){
    if(cooldown > 0){
      cooldown--;
    }else{
      for(int i = 0; i < enemies.length; i++){
        if(!enemies[i].isAlive){
          enemies[i].reset(random(0, width), -random(height/20, height/18), random(0.01, 0.05), random(1, 3));
          break;
        }
      }
      cooldown = (int)random(30, 90);
    }
  }
  void move(){
    for(int i = 0; i < enemies.length; i++){
      enemies[i].move();
    }
  }
  void display(){
    for(int i = 0; i < enemies.length; i++){
      enemies[i].display();
    }
  }
}
class Explosion{
  //Fields
  Particle[] parties;
  float lifeSpan;
  
  //Constructor
  Explosion(int maxParticles, float xPos, float yPos, float life, int speed, float r, float g, float b, float pw, float ph){
    parties = new Particle[maxParticles];
    lifeSpan = life;
    for(int i = 0; i < parties.length; i++){
      parties[i] = new Particle(xPos, yPos, life, i*((2*PI)/maxParticles), speed, r, g, b, pw, ph);
    }
  }
  //Methods
  void move(){
    if(lifeSpan > 0){
      lifeSpan--;
    }else{
      return;
    }
    for(int i = 0; i < parties.length; i++){
      parties[i].move();
    }
  }
  void display(){
    if(lifeSpan <= 0){
      return;
    }
    for(int i = 0; i < parties.length; i++){
      parties[i].display();
    }
  }
}
class ExplosionManager{
  //Fields
  Explosion[] explosions; 
  //Constructor
  ExplosionManager(int maxEx){
    explosions = new Explosion[maxEx];
    for(int i = 0; i < explosions.length; i++){
      explosions[i] = new Explosion(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  //Methods
  void spawnExplosion(int maxParticles, float xPos, float yPos, float lifeSpan, int speed, float r, float g, float b, float pw, float ph){
    for(int i = 0; i < explosions.length; i++){
      if(explosions[i].lifeSpan > 0){
        continue;
      }
      explosions[i] = new Explosion(maxParticles, xPos, yPos, lifeSpan, speed, r, g, b, pw, ph);
      break;
    }
  }
  
  void move(){
    for(int i = 0; i < explosions.length; i++){
      explosions[i].move();
    }
  }
  
  void display(){
    for(int i = 0; i < explosions.length; i++){
      explosions[i].display();
    }
  }
}
class Particle{
  //Fields
  float xPos, yPos, orbitX, orbitY;
  float r, g, b, pWidth, pHeight;
  float lifeSpan;
  float orbitDistance, orbitAngle, speed;
  //Constructor
  Particle(float xIn, float yIn, float life, float angle, int moveSpeed, float rr, float gg, float bb, float pw, float ph){
    xPos = xIn;
    yPos = yIn;
    orbitX = xPos;
    orbitY = yPos;
    pWidth = pw;
    pHeight = ph;
    speed = moveSpeed;
    lifeSpan = life;
    orbitAngle = angle;
    orbitDistance = 1;
    r = rr;
    g = gg;
    b = bb;
  }
  
  //Methods
  void move(){
    if(lifeSpan > 0){
      lifeSpan--;
      orbitDistance += speed;
      xPos = orbitX + cos(orbitAngle) * orbitDistance;
      yPos = orbitY + sin(orbitAngle) * orbitDistance;
    }
  }
  
  void display(){
    if(lifeSpan <= 0){
      return;
    }
    stroke(r, g, b);
    fill(r, g, b);
    rect(xPos, yPos, pWidth, pHeight);
  }
}
class Ship{
  //Fields
  float shipWidth, shipHeight, speed, xPos, yPos, hp;
  int cooldown, partyCooldown, score, maxFlames;
  boolean spacePressed = false, up = false, down = false, left = false, right = false;
  Particle[] flames;
  Bullet[] bullets;
  //Constructor
  Ship(int xIn, int yIn, int maxBullets, int maxFlamesIn){
    xPos = xIn;
    yPos = yIn;
    shipWidth = 40;
    shipHeight = 40;
    speed = 2.0f;
    score = 0;
    hp = 10;
    cooldown = 10;
    maxFlames = maxFlamesIn;
    partyCooldown = 0;
    bullets = new Bullet[maxBullets];
    for(int i = 0; i < bullets.length; i++){
      bullets[i] = new Bullet();
    }
    
    flames = new Particle[maxFlames];
    for(int i = 0; i < bullets.length; i++){
      flames[i] = new Particle(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  //Methods
  void update(){
    if(partyCooldown > 0){
      partyCooldown--;
    }else{
      //ADD TO THE PARTY
      for(int i = 0; i < flames.length; i++){
        if(flames[i].lifeSpan > 0){
          continue;
        }
        flames[i] = new Particle(random(xPos - shipWidth/2, xPos + shipWidth/2), yPos + shipHeight, random(15, 30), PI/2, 1, 255, 0, 0, 2, 2);
        partyCooldown = (int)random(1, 4);
        break;
      }
    }
    if(cooldown > 0){
      cooldown--;
    }else{
      if(!spacePressed){
        return;
      }
      for(int i = 0; i < bullets.length; i++){
        if(!bullets[i].isAlive){
          bullets[i].reset(xPos - bullets[i].bulletWidth/2, yPos - bullets[i].bulletHeight, 5);
          break;
        }
      }
      cooldown = 10;
    }
   
  }
  void move(){
    checkInput();
    for(int i = 0; i < bullets.length; i++){
      bullets[i].move();
    }
    for(int i = 0; i < maxFlames; i++){
      flames[i].move();
    }
    
    if(left && xPos > 0){
       xPos -= speed;
    }
    if(right && xPos < width - 1 - shipWidth){
       xPos += speed;
    }
    if(up && yPos > 0){
       yPos -= speed;
    }
    if(down && yPos < height - 1 - shipHeight){
       yPos += speed;
    }
  }
  
  void checkInput(){
    if(keyPressed){
      if(key == CODED){
        if(keyCode == LEFT){
          left = true;
        }
        if(keyCode == RIGHT){
          right = true;
        }
        if(keyCode == UP){
           up = true;
        }
        if(keyCode == DOWN){
           down = true;
        }
      }
      if(key == 'a'){
         left = true;
      }
      if(key == 'd'){
         right = true;
      }
      if(key == 'w'){
         up = true;
      }
      if(key == 's'){
         down = true;
      }
      if(key == ' '){
        spacePressed = true;
      }
      
    }
  }
  
  void display(){
    strokeWeight(1);
    for(int i = 0; i < bullets.length; i++){
      bullets[i].display();
    }
    for(int i = 0; i < maxFlames; i++){
      flames[i].display();
    }
    int g = (int)map(hp, 0, 5, 0, 255);
    int r = (int)map(hp, 5, 10, 255, 0);
    fill(r, g, 0);
    stroke(r, g ,0);
    beginShape();
    vertex(xPos, yPos);
    vertex(xPos - shipWidth/4, yPos + 3*(shipHeight/4));
    vertex(xPos - shipWidth/2, yPos + shipHeight);
    vertex(xPos + shipWidth/2, yPos + shipHeight);
    vertex(xPos + shipWidth/4, yPos + 3*(shipHeight/4));
    endShape(CLOSE);
  }
}
class UI{
  //Fields
  
  //Constructor
  UI(){
    
  }
  //Methods
  
  void display(Ship ship){
    fill(255);
    stroke(255);
    textSize(20);
    textAlign(LEFT, TOP);
    text("HP: " + ship.hp, 0, 0);
    textAlign(RIGHT, TOP);
    text("SCORE: " + ship.score, width, 0);
    textAlign(BOTTOM, CENTER);
    textSize(10);
    text("By Ciaran C",0,height-5);
  }
}


