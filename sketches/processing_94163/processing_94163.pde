
/* @pjs preload = "town.PNG", "skull.png", "villager.png", "demonknight.png", "towngirl.png", "man.png", "boy.png", "lady.png", "oldman.png", "fire256.png" */
/* @pjs font=snap.ttf";*/
PImage townmap;
boolean scared = true;
int timer = 30;
int gameOver = 0;
int sec = 0;
class Fire
{
  PImage image;
  int fireX;
  int fireY;
  float frameTimer;
  int frameRow;
  int frameColumn;
}
  
class Mover
{
  PImage image;
  PVector position;
  int radius;
  int frameRow;
  int frameColumn;
  float frameTimer;
  PVector velocity;
  float speed;
  PVector direction;
  boolean dead;
}
int killpoint = 0;

int maxVillagers =10;
Mover[] villager = new Mover[maxVillagers]; 

int maxFires = 8;
Fire[] firedance = new Fire[maxFires];
 
Mover deathface;
float left = 0;
float right = 0;
float down = 0;
float up = 0;

void setup()
{
  size(830,600);
  background(255);
  textFont(createFont("snap", 32));
  imageMode(CENTER);
  ellipseMode(RADIUS);
  gameOver = second();
  frameRate(10);
  townmap = loadImage("town.PNG");
  for (int i = 0; i < maxFires; i++)
  {
    firedance[i] = new Fire();
    firedance[i].image = loadImage("fire256.png");
    if (i == 0) {
      firedance[i].fireX = 80;
      firedance[i].fireY = 266; }
    else if (i == 1){
      firedance[i].fireX = 673;
      firedance[i].fireY = 140; }
    else if (i == 2) {
      firedance[i].fireX = 432;
      firedance[i].fireY = 120; }
    else if (i == 3) {
      firedance[i].fireX = 495;
      firedance[i].fireY = 210; }
    else if (i == 4) {
      firedance[i].fireX = 93;
      firedance[i].fireY = 43; }
    else if (i == 5) {
      firedance[i].fireX = 545;
      firedance[i].fireY = 34; }
    else if (i == 6) {
      firedance[i].fireX = 326;
      firedance[i].fireY = 64; }
    else if (i == 7) {
      firedance[i].fireX = 234;
      firedance[i].fireY = 218; }
    else {
      firedance[i].fireX = 64;
      firedance[i].fireY = 53; }
    firedance[i].frameRow = 0;
    firedance[i].frameColumn = 0;
    firedance[i].frameTimer = 0;
  }
  for (int i = 0; i < maxVillagers; i++)
  {
    villager[i] = new Mover();
    if (i == 0)
      villager[i].image = loadImage("townnerd.png");
    else if (i == 1)
      villager[i].image = loadImage("towngirl.png");
    else if (i == 2)
      villager[i].image = loadImage("boy.png");
    else if (i == 3)
      villager[i].image = loadImage("oldman.png");
    else if (i == 4)
      villager[i].image = loadImage("man.png");
    else
      villager[i].image = loadImage("lady.png");
    villager[i].position = new PVector(random(30, 800),random(290, 580));
    villager[i].velocity = new PVector(0,0);
    villager[i].frameRow = 0;
    villager[i].frameColumn = 0;
    villager[i].frameTimer = 0;
    villager[i].radius = 18;
    villager[i].direction = new PVector(random(-5, 5),random(-5, 5));
  }
  deathface = new Mover();
  deathface.image = loadImage("demonknight.png");
  deathface.position = new PVector(415, 300);
  deathface.velocity = new PVector(0, 0);
  deathface.frameRow = 0; 
  deathface.frameColumn = 0;
  deathface.frameTimer = 0;
  deathface.speed = 5;
  deathface.radius = 18;
}

void gameOver() {
  background(0);
  stroke(255);
  if (killpoint < 50) {
    text("You didn't catch enough villagers!" , 0, (height)/2); 
  }
  else {
    text("Good work!  You caught enough villagers!", 0, (height)/2);
    print(killpoint);    
  }
}

void draw()
{
  if (timer > 0){
    game();
  }
  if (timer == 0) {
    gameOver();
    return;
  }
}
void game()
{
  if (second() != gameOver){
    gameOver = second();
    timer -=1;
  }
  background(255);
  image(townmap, width/2, height/2);
  villageFire();
  villagerMove();
  deathfaceMove();
  text("Timer: "+timer, 100, 50);
  text("Score: "+killpoint, 300,50);
}

void deathfaceMove()
{  
  deathface.velocity.x = deathface.speed * (left + right);
  deathface.velocity.y = deathface.speed * (up + down);
  PVector boundaryPosition = new PVector(deathface.position.x, deathface.position.y);
  boundaryPosition.add(deathface.velocity);
  float offset = 20;
  if (boundaryPosition.x > offset && boundaryPosition.x < (width - offset))
  {
    deathface.position.x = boundaryPosition.x;
  }
  if (boundaryPosition.y > (250 + offset) && boundaryPosition.y < (height - offset))
  {
    deathface.position.y = boundaryPosition.y;
  }
  deathface.frameTimer += 1;
  if (deathface.frameTimer >= 3){ deathface.frameTimer = 0;}
  deathface.frameColumn = (int)deathface.frameTimer;   
  if (deathface.velocity.x == 0 && deathface.velocity.y == 0)
  {deathface.frameColumn = 0;}
  if (left != 0){deathface.frameRow = 1;}
  if (right != 0){deathface.frameRow = 2;}
  if (up != 0){deathface.frameRow = 3;}
  if (down != 0){deathface.frameRow = 0;}
 
  pushMatrix();
  translate(deathface.position.x, deathface.position.y);
  imageMode(CENTER);
  PImage frameImage = getSubImage(deathface.image, deathface.frameRow, deathface.frameColumn, 32, 32);
  image(frameImage, 0, 0);
  popMatrix();
}

void villageFire()
{
  for (int i = 0; i < maxFires; i++)
  {
    firedance[i].frameTimer += 1;
    if (firedance[i].frameTimer >= 4) 
    {
      firedance[i].frameTimer = 0; 
    }
    firedance[i].frameColumn = (int)firedance[i].frameTimer;
    if (firedance[i].frameTimer == 0) 
    {
      firedance[i].frameRow = 0;
    }
    else if (firedance[i].frameTimer == 1) {
      firedance[i].frameRow = 1;
    }
    else if (firedance[i].frameTimer == 2) 
    {
      firedance[i].frameRow = 2;
    }
    else {
      firedance[i].frameRow = 3;
    }
    pushMatrix();
    translate(firedance[i].fireX, firedance[i].fireY);
    imageMode(CENTER);
    PImage frameImage = getSubImage(firedance[i].image, firedance[i].frameRow, firedance[i].frameColumn, 64, 64);
    image(frameImage, 0, 0);
    popMatrix();
  }
}
  
    
void villagerMove()
{
  PImage skull = loadImage("skull.png");
  for (int i = 0; i < maxVillagers; i++) {
    villager[i].position.x += villager[i].direction.x;
    villager[i].position.y += villager[i].direction.y;
    PVector boundaryPosition = new PVector(villager[i].position.x, villager[i].position.y);
    boundaryPosition.add(villager[i].velocity);
    float offset = 20;
    if ((villager[i].position.x > width - villager[i].radius) || (villager[i].position.x < villager[i].radius)) {
      villager[i].direction.x = -villager[i].direction.x; }
    if ((villager[i].position.y > height - villager[i].radius) || (villager[i].position.y < (260 + villager[i].radius))) {
      villager[i].direction.y = -villager[i].direction.y; }
    villager[i].frameTimer += 1;
    if (villager[i].frameTimer >= 3) {
      villager[i].frameTimer = 0; }
    villager[i].frameColumn = (int)villager[i].frameTimer;
    if (villager[i].position.x == 0 && villager[i].position.y == 0) {
      villager[i].frameColumn = 0; }
    if (abs(villager[i].direction.x) >= abs(villager[i].direction.y)) {
      if (villager[i].direction.x < 0){villager[i].frameRow = 1; }
      if (villager[i].direction.x > 0){villager[i].frameRow = 2; }
      if (villager[i].direction.y < 0){villager[i].frameRow = 3; }
      if (villager[i].direction.y > 0){villager[i].frameRow = 0; }
    if (dist(villager[i].position.x, villager[i].position.y, deathface.position.x, deathface.position.y) < villager[i].radius*2) {
      villager[i].direction.x =- villager[i].direction.x;
      villager[i].direction.y =- villager[i].direction.y;
      scared = true; }
    else {
      scared = false; 
    }
    if (dist(deathface.position.x, deathface.position.y, villager[i].position.x, villager[i].position.y) < deathface.radius +10 )
    {
      if( villager[i].image != skull) {
        killpoint += 1;
      }
      else {
        killpoint += 0;
      }
      villager[i].image = skull;      
    }
    pushMatrix();
    translate(villager[i].position.x, villager[i].position.y);
    imageMode(CENTER);
    PImage frameImage = getSubImage(villager[i].image, villager[i].frameRow, villager[i].frameColumn, 32, 32);
    image(frameImage, 0, 0);
    popMatrix();
    }
  }
}


PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}

void keyPressed()
{
  if(key == CODED)
  {
    if (keyCode == RIGHT)
    {
      right = 1;  
    }
    if (keyCode == LEFT)
    {
      left = -1;
    }
    
    if (keyCode == UP)
    {
      up = -1;
    }
    
    if (keyCode == DOWN)
    {
      down = 1;
    }
  }
}

 
void keyReleased()
{
  if (keyCode == RIGHT)
  {
    right = 0;
  }
  if (keyCode == LEFT)
  {
    left = 0;
  }
  if (keyCode == UP)
  {
    up = 0;
  }
  if (keyCode == DOWN) 
  {
    down = 0;
  }
}




