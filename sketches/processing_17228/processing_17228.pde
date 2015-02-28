
//BRICKS
PVector bDimen, brickDimen, ballInit;
Bat b;
float bSpeed,ballSpeed;
Ball ball;
ArrayList bricks, items, bullets;
int points, level, lives, powerUp, numBalls, numBullets;
PFont f2;
boolean gameStarted, paused, levelstarted, blasterOn;
Ball ball2;

//safetynet
boolean safetyNet;
int netUses;

void setup(){
 size(600,450);
 background(30,30,30);
 smooth();
 ballInit = new PVector(100,height/2+100);
 bDimen = new PVector(100,15);
 brickDimen = new PVector(100,15);
 b = new Bat();
 bSpeed = 10.0;
 ballSpeed = 5.0;
 ball = new Ball();
 bricks = new ArrayList();
 for(int x=0; x<5; x++)
   for(int y=0; y<5; y++)
     bricks.add(new Brick(10+x*120,60+y*50));
 items = new ArrayList();
 numBalls = 1;
 Ball ball2 = new Ball();
 points = 0; 
 level = 1;
 f2 = loadFont("Serif-20.vlw");
 gameStarted = false;
 lives = 5;
 powerUp = 0;
 safetyNet = false;
 netUses = 0;
 paused = false;
 levelstarted = false;
 bullets = new ArrayList();
 blasterOn = false;
 numBullets = 0;
}

void draw(){
  background(30,30,30);
  strokeWeight(1);
  if(gameStarted && !paused){
  
  if(bricks.size() == 0)
    newLevel();
    
    fill(0,206,209,72);
    if(safetyNet)
    for(int x=0; x<3-netUses; x++)
      rect(0,height-10,width,10);
 
  //b.x = mouseX;
  for(int x=0; x<bricks.size(); x++){
   Brick br = (Brick)bricks.get(x);
  br.render(); 
  }
  b.render();
  ball.render();
  if(numBalls > 1)
    ball2.render();
  else
  numBalls = 1;
    
  fill(255);
  textFont(f2,20);
  text("Points: " + points*10,20,20); 
  text("Level: " + level,width-100,20);
  switch(powerUp) {
  case 0: 
    text("PowerUp: None",300,20);  
    break;
  case 1: 
    text("PowerUp: SafetyNet",300,20); 
    break;
  case 2: 
    text("PowerUp: Blaster",300,20); 
    if(blasterOn)
    text("Press SPACE to fire!",width-200,height-20);
    break;
  case 3: 
    text("PowerUp: LongPaddle",300,20); 
    break;
  case 4:
    text("Extra Life!",300,20); 
    break;
}
  
  //lives
  if(lives < 0)
   reset();
  fill(255,0,0,172);
  for(int x=0; x<lives; x++)
    ellipse(145+x*30,20,20,20);
  
  //PowerUps
  for(int i=0; i<items.size(); i++){
    Item temp = (Item)items.get(i);
    temp.render();
  }
 
  //bullets
  if(blasterOn){
    for(int x=0; x<bullets.size(); x++){
      Bullet bt = (Bullet)bullets.get(x);
      bt.render();
      if(numBullets >= 10)
      blasterOn = false;
    }
    
    
  }
}
else if(paused){
  fill(255);
    textFont(f2,20);
  text("PAUSED\nPress 'p' to unpause\nPoints: "+points*10+"\nLevel: "+level+"\nLives: " + lives,50,100); 
  text("CONTROLS:\nUse 'a' and 'd' to move\nPress 'o' to start a level\nPress SPACE to use the blaster",width-300,height-100);
}else{
  textFont(f2,20);
  text("Welcome to Bricks!\nuse 'a' and 'd' to move\nPress 'o' to start level\nPress 'p' to pause",50,50); 
  
  }
  if(!levelstarted && gameStarted){
  textFont(f2,20);
  fill(255);
  text("Press 'o' to start level",width-200,height-20); 
  
  }

}

void keyPressed(){
  if(gameStarted){
  //b.resetA();
  if(levelstarted && key == 'a'){
    b.update(-1*bSpeed);

  }
  if(levelstarted && key == 'd'){
    b.update(bSpeed);
  }
  if(levelstarted && key == ' '){
    bullets.add(new Bullet(b.x + bDimen.x/2));
    numBullets++;
  }
    if(key == 'p')
    paused = !paused;
  }
  if(key == 'o' && !levelstarted){
    levelstarted = true;
   gameStarted = true;
   ball.v = new PVector(0,ballSpeed); 
  }
  
 
}

void newLevel(){
  level++;
   b = new Bat();
   ballSpeed += .5;
   ball = new Ball();
   bricks = new ArrayList();
 for(int x=0; x<5; x++)
   for(int y=0; y<5; y++)
     bricks.add(new Brick(10+x*120,60+y*50));

     if(level%4 == 0 && lives < 5)
    lives += 1;
    points += 10;
 items = new ArrayList();
 bDimen = new PVector(100,15);
  levelstarted = false;
   bullets = new ArrayList();
   blasterOn = false;
  numBullets = 0;
  
}

void reset(){
   b = new Bat();
   bSpeed = 10.0;
   ballSpeed = 5.0;
   ball = new Ball();
   bricks = new ArrayList();
  for(int x=0; x<5; x++)
   for(int y=0; y<5; y++)
     bricks.add(new Brick(10+x*120,60+y*50));
     lives = 5;
     points = 0;
     level = 1;
  items = new ArrayList();
   powerUp = 0;
   bDimen = new PVector(100,15);
    levelstarted = false;
     bullets = new ArrayList();
     blasterOn = false;
  numBullets = 0;
}

void newPowerUp(){
   switch(powerUp) {
  case 0: 
    break;
  case 1: //SafetyNet
    safetyNet = true;
    netUses = 0;
    break;
  case 2: //Blaster
    blasterOn = true;
    numBullets = 0;
    bullets = new ArrayList();
    break;
  case 3: //LongPaddle
    bDimen.x = 160;
    break;
  case 4: //Extra Life
    if(lives < 5)
    lives++;
    break;
} 
  
}
  


class Bat{
 float x;
 float v;
 float a;
 
 Bat(){
  x = ballInit.x - bDimen.x/2 -20; 
  v = 0;
  a = 0;
 }
 
 void update(float veloc){
  v = veloc;
  a = v / 10;
 }
 
 void updateA(){
   
  a = v / 10;
  
 }
 
 void frameUpdate(){
     if(keyPressed)
   b.a = 0;
  else
  b.updateA();
  
  //check to stop after decel.
  if(b.v < .1 && b.v > -.1){
   b.a = 0;
   b.v = 0;  
}
   
  //bounce check
  if(b.x <= 0){
  b.x = 0;
  b.v *= -1;
  b.a *= -8;  
  }
  if(b.x + bDimen.x >= width){
  b.x = width - bDimen.x;
  b.v *= -1;
  b.a *= -8;  
  }
 }
 
 
 void render(){
   frameUpdate();
   v -= a; 
   x += v;
   fill(127,255,0,172);
    strokeWeight(1);
   stroke(255);
   rect(x,height-35,bDimen.x,bDimen.y);
   if(blasterOn){
    noFill();
   triangle(x+bDimen.x/3,height-35,x+bDimen.x/2,height-35-10,x+bDimen.x*2/3,height-35);
   }
   
 }
  
  
}

class Bullet{
  
float x;
float y = height-35.0;
float vy = -5.0;

Bullet(float x1){
  x = x1;
}

void renderCheck(){
  if(y < 0)
  bullets.remove(this);
  else
  for(int x=0; x<bricks.size(); x++){
    Brick br = (Brick)bricks.get(x);
     if(isKill(br)){
       bricks.remove(br);
       bullets.remove(this);
       points++;
       break;
       
     }
     
     }
  }

boolean isKill(Brick a){
   if(x < a.pos.x || x > a.pos.x + brickDimen.x)
    return false;
 if(y < a.pos.y - brickDimen.y || y -10  > a.pos.y)
   return false;
  return true;  
}

void render(){
  renderCheck();
  y+= vy;
  //stroke(random(255),random(255),random(255));
  stroke(255);
  strokeWeight(3);
  line(x,y,x,y+10);
  
}
  
  
}

class Brick{ 
  PVector pos;
  float w;
  int r;
  int g;
  int b;
  
  Brick(float x,float y){
   pos = new PVector(x,y);
   
   r = (int)random(255);
   g = (int)random(255);
   b = (int)random(255);
  }
  
  
  void render(){
   strokeWeight(1);
   fill(r,g,b,100);
   stroke(255);
   rect(pos.x,pos.y,brickDimen.x,brickDimen.y);
    
  }
  
  
  
}

class Ball{
 PVector pos;
 PVector v;
 float bWidth  = 15;
  
  Ball(){
   pos = new PVector(ballInit.x,ballInit.y);
   v = new PVector(0.0,0.0); 
    
  }
  
  
 void bounceCheck(){
  if ((pos.x  > width)) {
    pos.x = width;
    v.x *= -1;
  }
  if(pos.x  < 0){
    pos.x = 0;
    v.x *=  -1;
  }
  if (pos.y > height){
    if(!safetyNet){
      bDimen = new PVector(100,15);
      powerUp =0;
     blasterOn = false;
     numBullets = 0;
    bReset();
    levelstarted = false;
    background(255,0,0,172);
    lives--;
    items = new ArrayList();
    b = new Bat();
    }else{
    pos.y = height;
    v.y *= -1;
     netUses++;
    if(netUses >= 3){
     safetyNet = false; 
     powerUp = 0;  
  }
      
    }
  }
  if(pos.y < 0){
    pos.y = 0;
    v.y *= -1;
  }
  if(pos.y + bWidth/2 >= height-bDimen.y-15 && pos.y + bWidth/2 <= height-15 && pos.x + bWidth/2 >= b.x && pos.x - bWidth/2 <= b.x + bDimen.x){
    pos.y = height-bDimen.y-15-bWidth/2;
    float diff = b.x + bDimen.x/2 - pos.x;
    v.y *= -1;
    v.x -= diff/15;
  }
  for(int x=0; x<bricks.size(); x++){
   Brick br = (Brick)bricks.get(x);
    if(pos.y >= br.pos.y && pos.y  <= br.pos.y + brickDimen.y && pos.x + bWidth/2 >= br.pos.x && pos.x - bWidth/2 <= br.pos.x + brickDimen.x){
    
    v.y *= -1;
    bricks.remove(br);
    points ++;
    if((int)random(10) == 0)
      items.add(new Item(pos.x-bWidth/2,pos.y));
    break;
  }
  }
 }
 
 void bReset(){
   pos = new PVector(ballInit.x,ballInit.y);
   v = new PVector(0.0,0.0);
 }
  
 void render(){
   pos.add(v);
   bounceCheck();
   fill(127,255,0,172);
    strokeWeight(1);
   stroke(255);
   ellipse(pos.x,pos.y,bWidth,bWidth);
   
 }
}

class Item{
  PVector pos;
  float v = 1;
  float w = 30;
  
  Item(float x, float y){
    pos = new PVector(x,y);
    
  }
  void check(){
   if(pos.y > height)
     items.remove(this);
   if(pos.y + w >= height-bDimen.y-15 && pos.y <= height-15 && pos.x + w >= b.x && pos.x <= b.x + bDimen.x){
     items.remove(this);
     powerUp = (int)random(1,5);
     //powerUp = 1;
     newPowerUp();
   }
    
  }
    
  void render(){
   check();
   fill(random(255),random(255),random(255));
   pos.y += v;
   rect(pos.x,pos.y,w,w);
   textFont(f2,20);
   fill(random(255),random(255),random(255));
   text("?",pos.x+w*1/4+4,pos.y+w/2+7);
  }
  
  
}

