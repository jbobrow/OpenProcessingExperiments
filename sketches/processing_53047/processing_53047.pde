
// size of terrain pieces
final int CHUNK_WIDTH = 20;
final int CHUNK_HEIGHT = 20;

final int SCREEN_WIDTH = 480;
final int SCREEN_HEIGHT = 320;

final int MISSILE_DRAW_DISTANCE = SCREEN_WIDTH/2;

// terrain boundaries
final int TERRAIN_MIN_HEIGHT = (SCREEN_HEIGHT/3)*2;
final int TERRAIN_MAX_HEIGHT = SCREEN_HEIGHT-(CHUNK_HEIGHT*2);
final int TERRAIN_LENGTH = 1000;

final int FRAME_RATE = 60;
final int GAME_OVER_DELAY = FRAME_RATE*3;
final int PIXELS_PER_FRAME = 1;

// terrain types
final int TERRAIN_FLAT = 0;
final int TERRAIN_SLOPE = 1;
final int TERRAIN_CLIFF = 2;

//final int SHIP_STATIC = 0;
//final int SHIP_UP = 1;
//final int SHIP_DOWN = 2;

final int STATE_GAME_RUN = 0;
final int STATE_GAME_OVER = 1;
final int STATE_GAME_OVER_SPLODE = 2;

final int SPLODE_PARTICLES = 100;

final float MISSILE_VELOCITY_Y = -0.9;
final float BULLET_SIZE = 2;
final float SPLODE_PARTICLE_SIZE = 4;

float[][] terrain;

Ship playerShip;

ArrayList missiles;
ArrayList bullets;
ArrayList explosion;

int vertexCount;
int currentFrame;
int totalFrames;
int score;
int gameState;
int gameOverTimer;
int shipDirection;
boolean bulletFired;
boolean gameOver;

void setup(){
  size(SCREEN_WIDTH,SCREEN_HEIGHT);
  frameRate(FRAME_RATE);
  vertexCount = 0;
  currentFrame = 0;
  totalFrames = 0;
  score = 0;
  gameState = STATE_GAME_RUN;
  gameOverTimer = 0;
  shipDirection = 0;
  bulletFired = false;
  playerShip = new Ship(CHUNK_WIDTH*2,SCREEN_HEIGHT/2,0,0,0.66*CHUNK_WIDTH,CHUNK_WIDTH,PIXELS_PER_FRAME);
  missiles = new ArrayList();
  bullets = new ArrayList();
  explosion = new ArrayList();
  initTerrain();
}

void draw(){
  switch (gameState){
    case STATE_GAME_OVER:
      fill(255);
      textSize(CHUNK_WIDTH);
      text("GAME OVER", SCREEN_WIDTH/2-(textWidth("GAME OVER")/2),(SCREEN_HEIGHT/2)-textAscent());
      gameOverTimer++;
      if(gameOverTimer>GAME_OVER_DELAY){
        initExplosion();
        gameState=STATE_GAME_OVER_SPLODE;
      }
      break;
    case STATE_GAME_OVER_SPLODE:
      drawExplosion();
      break;
    case STATE_GAME_RUN:
      background(0);
      stroke(255);
      noFill();
      drawScreen();
      break;
  }
}

void keyPressed() {
  
  PVector newBulletLocation;
  PVector newBulletVelocity;
  Bullet newBullet;
  
  if (key == 's' || key == 'S') {
    //playerShip.update(Ship.SHIP_UP);
    shipDirection=Ship.SHIP_UP;
  } else if (key == 'x' || key == 'X'){
    //playerShip.update(Ship.SHIP_DOWN);
    shipDirection=Ship.SHIP_DOWN;
  }
  
  if (key == ' '){
    bulletFired=true;
  }
  
}

void keyReleased(){

  if (key == 's' || key == 'S') {
    shipDirection=Ship.SHIP_STATIC;
  } else if (key == 'x' || key == 'X'){
    shipDirection=Ship.SHIP_STATIC;
  }
  
}

void initBullet() {
  
  PVector newBulletLocation;
  PVector newBulletVelocity;
  Bullet newBullet;
  
  newBulletLocation = new PVector (playerShip.getX()+playerShip.getHeight(),playerShip.getY()-(playerShip.getWidth()/2));
  newBulletVelocity = new PVector (PIXELS_PER_FRAME*3, 0);
  newBullet = new Bullet(newBulletLocation,newBulletVelocity,BULLET_SIZE) ;
  bullets.add(newBullet);
  
}

void initExplosion(){
  for(int i = 0; i<SPLODE_PARTICLES;i++){
    
    PVector newParticleLoc;
    PVector newParticleVel;
    Bullet newParticle;
    
    newParticleLoc = new PVector (SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    newParticleVel = new PVector (random(-(2)*PIXELS_PER_FRAME, 2*PIXELS_PER_FRAME),random(-(2)*PIXELS_PER_FRAME,2*PIXELS_PER_FRAME));
    newParticle = new Bullet(newParticleLoc,newParticleVel,random(0,SPLODE_PARTICLE_SIZE));
    explosion.add(newParticle);
  }
}

void initTerrain(){
   
  // whether the terrain is going up (true) or down (false)
  boolean direction;

  // current terrain piece - slope, flat, cliff
  int currentTerrainPiece;

  // prev row
  float prevRowX;
  float prevRowY;

  direction = true;
  prevRowX = 0;
  prevRowY = 0; 
  
  terrain = new float[TERRAIN_LENGTH][2];
  for (int row = 0; row < terrain.length; row++) {
    
    if (row == 0){
      terrain[row][0] = 0;
      terrain[row][1] = random(TERRAIN_MIN_HEIGHT, TERRAIN_MAX_HEIGHT);
    }else{
      currentTerrainPiece = (int) random(2);
      switch (currentTerrainPiece){
        case TERRAIN_FLAT:
          terrain[row][0] = prevRowX + CHUNK_WIDTH;
          terrain[row][1] = prevRowY;
          int createMissile = (int) random(1,10);
          if(createMissile>3){       
            Missile newMissile = new Missile(prevRowX+(CHUNK_WIDTH/4),prevRowY - 2,0,random(MISSILE_VELOCITY_Y*2,MISSILE_VELOCITY_Y),CHUNK_WIDTH/2,(CHUNK_WIDTH/3)*2);
            missiles.add(newMissile);
          }
          break;
        case TERRAIN_SLOPE:
          terrain[row][0] = prevRowX + CHUNK_WIDTH;
          if(direction){
            terrain[row][1] = prevRowY - CHUNK_HEIGHT;
          }else{
            terrain[row][1] = prevRowY + CHUNK_HEIGHT;
          }
          if((terrain[row][1]<=TERRAIN_MIN_HEIGHT)&&(direction)){
            direction = false;
          }else if((terrain[row][1]>=TERRAIN_MAX_HEIGHT)&&(direction==false)){
            direction = true;
          }      
        break;
        case TERRAIN_CLIFF:
          terrain[row][0] = prevRowX;
          if(direction){
            terrain[row][1] = prevRowY - CHUNK_HEIGHT;
          }else{
            terrain[row][1] = prevRowY + CHUNK_HEIGHT;
          }
          if((terrain[row][1]<=TERRAIN_MIN_HEIGHT)&&(direction)){
            direction = false;
          }else if((terrain[row][1]>=TERRAIN_MAX_HEIGHT)&&(direction==false)){
            direction = true;
          }
        break;
      }      
    }
    prevRowX = terrain[row][0];
    prevRowY = terrain[row][1];   
  }
  
}

void drawScreen(){
  
  //println("currentFrame="+currentFrame);
  //println("vertexCount="+vertexCount);
  //println("(vertexCount+(SCREEN_WIDTH/CHUNK_WIDTH)="+(vertexCount+(SCREEN_WIDTH/CHUNK_WIDTH)));
  
  pushMatrix();
  translate(-((currentFrame*PIXELS_PER_FRAME)+(vertexCount*CHUNK_WIDTH)),0);
  beginShape();
  for (int row = vertexCount; row < ((vertexCount+(SCREEN_WIDTH/CHUNK_WIDTH))+3); row++) {  
      vertex(terrain[row][0], terrain[row][1]);
      //check for terrain collisions
      if((terrain[row][0]>=(playerShip.getX()-CHUNK_WIDTH)&&terrain[row][0]<=(playerShip.getX()+CHUNK_WIDTH)&&(terrain[row][1]<=playerShip.getY()))){
        gameState=STATE_GAME_OVER;
      }
  }
  endShape();
  
  // draw ship and initialise any bullets
  playerShip.update(Ship.SHIP_RIGHT);
  if (shipDirection==Ship.SHIP_DOWN){
    playerShip.update(Ship.SHIP_DOWN);
  } else if (shipDirection==Ship.SHIP_UP){
    playerShip.update(Ship.SHIP_UP);
  }
  if (bulletFired){
    initBullet();
    bulletFired=false;
  }
  playerShip.draw();
  
  // activate new missiles and draw
  for (int j = missiles.size()-1; j>0; j--) {  
    
    boolean missileDestroyed = false;
    boolean missileOutOfBounds = false;
    
    Missile currentMissile = (Missile) missiles.get(j);
    if(!((currentMissile.getX()<(vertexCount*CHUNK_WIDTH))||(currentMissile.getX()>(SCREEN_WIDTH+(vertexCount*CHUNK_WIDTH))))){
      if((currentMissile.getX()>=(totalFrames+MISSILE_DRAW_DISTANCE))&&(currentMissile.getX()<=(totalFrames+MISSILE_DRAW_DISTANCE+(CHUNK_WIDTH/2)))){
        currentMissile.setAnimated(true);
      }
      currentMissile.update();
      currentMissile.draw();
      
      // get missile location for collision checks
      PVector mLoc = new PVector (currentMissile.getX()+(currentMissile.getWidth()/2),currentMissile.getY()-(currentMissile.getHeight()/2));
      
      // check for collisions with bullets
      for (int k=bullets.size()-1;k>=0;k--) {
        Bullet testBullet = (Bullet) bullets.get(k) ;
        PVector bLoc = new PVector(testBullet.getX(),testBullet.getY());
        
        if(bLoc.dist(mLoc) <=currentMissile.getSize()) {
          bullets.remove(k);
          missileDestroyed = true;
        }                
      }      
      
      // check for missile collision with player
      if(mLoc.dist(playerShip.getShipCentre()) <=currentMissile.getSize()){
        gameState = STATE_GAME_OVER;
      }
      
      // check missile out of bounds    
      if(currentMissile.getY()<0){
        missileOutOfBounds = true;
      }
      
      // destroy missile if it's been shot or moved off screen
      if(missileDestroyed){
        missiles.remove(j);
        score+=75;
      } else if(missileOutOfBounds){
        missiles.remove(j);
      }  
    }
  }
  
  // draw bullet
  for (int i=bullets.size()-1;i>=0;i--) {
    Bullet currentBullet = (Bullet) bullets.get(i);
    currentBullet.update();
    fill(255);
    currentBullet.draw();
    if (currentBullet.getX()>=SCREEN_WIDTH+(vertexCount*CHUNK_WIDTH)) {
      bullets.remove(i) ;
    }
  }
  fill(0) ;
  
  popMatrix();
  
  // check if we have come to the end of the terrain
  if(((vertexCount+(SCREEN_WIDTH/CHUNK_WIDTH))+3)<terrain.length){
    currentFrame++;
    if(currentFrame == CHUNK_WIDTH/PIXELS_PER_FRAME){
      vertexCount++;
      currentFrame=0; 
    }
    totalFrames+=PIXELS_PER_FRAME;
  }
  
  // draw score
  fill(255);
  textSize(floor(CHUNK_WIDTH*0.75));
  text("SCORE: "+score, SCREEN_WIDTH*0.75,textAscent());
  
}

void drawExplosion(){
  
  background(0);
  fill(255);
  
  for (int i=explosion.size()-1;i>=0;i--) {
    Bullet currentParticle = (Bullet) explosion.get(i);
    currentParticle.update();
    fill(255);
    currentParticle.draw();
    if (currentParticle.isOutOfBounds(SCREEN_WIDTH, SCREEN_HEIGHT)){
      explosion.remove(i) ;
    }
  }
  
  text("GAME OVER", SCREEN_WIDTH/2-(textWidth("GAME OVER")/2),(SCREEN_HEIGHT/2)-textAscent());
  
}

class Missile{
  
  boolean animated = false;
  
  float missileWidth;
  float missileHeight;
   
  PVector missileLoc;
  PVector missileVel;
  
  Missile(float lx, float ly, float vx, float vy, float w, float h){
  
    missileLoc = new PVector(lx,ly);
    missileVel = new PVector(vx,vy);
    missileWidth = w;
    missileHeight = h;
    
  }
  
  void update(){
    if(animated){
      missileLoc.add(missileVel);
    }
  }
  
  void draw(){
    
    triangle(missileLoc.x,missileLoc.y,missileLoc.x+(missileWidth/2),missileLoc.y-missileHeight,missileLoc.x+missileWidth,missileLoc.y);
    
  }
  
  float getX(){
    return missileLoc.x;
  }
  
  float getY(){
    return missileLoc.y;
  }
  
  void setAnimated(boolean isAnimated){
    animated = isAnimated;
  }
  
  float getSize(){
    return (missileWidth + missileHeight) /2;
  }
  
  float getWidth(){
    return missileWidth;
  }
  
  float getHeight(){
    return missileHeight;
  }    
   
}

class Ship{ 
  
  public final static int SHIP_STATIC = 0;
  public final static int SHIP_UP = 1;
  public final static int SHIP_DOWN = 2;
  public final static int SHIP_RIGHT = 3; 
  
  float pixelsPerFrame;
  float shipWidth;
  float shipHeight;
   
  PVector shipLoc;
  PVector shipVel;
  
  Ship(float lx, float ly, float vx, float vy, float w, float h, float p){
  
    //println(lx+", "+ly+", "+vx+", "+vy+", "+w+", "+h+", "+p);
    
    shipLoc = new PVector(lx,ly);
    shipVel = new PVector(vx,vy);
    shipWidth = w;
    shipHeight = h;
    pixelsPerFrame = p;    
  }
  
  void update(int direction){
    
    switch(direction){
      case SHIP_RIGHT:
        shipVel.set(pixelsPerFrame,0,0);
        shipLoc.add(shipVel);
        break;      
      case SHIP_UP:
        shipVel.set(0,(-1)*pixelsPerFrame,0);
        shipLoc.add(shipVel);
        break;
      case SHIP_DOWN:
        shipVel.set(0,1*pixelsPerFrame,0);
        shipLoc.add(shipVel);
        break;
    }
  }
  
  void draw(){
    
    triangle(shipLoc.x,shipLoc.y,shipLoc.x,shipLoc.y-shipWidth,shipLoc.x+shipHeight,shipLoc.y-(shipWidth/2));
    triangle(shipLoc.x+(shipHeight/6),shipLoc.y-((shipHeight*0.5)+(shipWidth*0.5)),shipLoc.x+(shipHeight/6),shipLoc.y-(shipWidth/2)+(shipHeight/2),shipLoc.x+(shipHeight/2),shipLoc.y-(shipWidth/2));
    
    //rect(shipLoc.x+(shipHeight/6),shipLoc.y-((shipHeight*0.5)+(shipWidth*0.5)),shipHeight/6,shipHeight);    
  }
  
  float getX(){
    return shipLoc.x;
  }
  
  float getY(){
    return shipLoc.y;
  }
  
  float getWidth(){
    return shipWidth;
  }
  
  float getHeight(){
    return shipHeight;
  } 
 
  PVector getShipCentre(){
    PVector p = new PVector(shipLoc.x+(shipHeight/2),shipLoc.y-(shipWidth/2));
    return p;
  }
   
}

class Bullet{
  
  PVector bulletLocation;
  PVector bulletVelocity;
  
  float bulletSize;
  
  Bullet(PVector locInit,PVector velInit, float s) {
    bulletLocation = new PVector(locInit.x,locInit.y);
    bulletVelocity = new PVector(velInit.x,velInit.y);
    bulletSize = s;
  }
  
  void draw () {
    ellipse(bulletLocation.x,bulletLocation.y,bulletSize,bulletSize);
  }
  
  void update () {
    bulletLocation.add(bulletVelocity);
  }
  
  float getX() {
    return bulletLocation.x;
  }
  
  float getY() {
    return bulletLocation.y;
  }
  
  boolean isOutOfBounds(float w, float h) {
    
    boolean outOfBounds = false;
    
    if (bulletLocation.x<0) {
      outOfBounds=true;
    }else if (bulletLocation.x>w) {
      outOfBounds=true;
    }else if(bulletLocation.y<0) {
      outOfBounds=true;
    }else if (bulletLocation.y>h) {
      outOfBounds=true;
    }
    
      return outOfBounds;
      
  }
  
  PVector getLocation() {
    return bulletLocation;
  }

}

