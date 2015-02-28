
/*
Shane Kavanagh
D11123610
Assignment 2
Geometry Wars Clone
*/

import ddf.minim.*;
 
Minim minim;

AudioPlayer song;
AudioPlayer powerup;
AudioPlayer bulletSound;
AudioPlayer hit;
AudioPlayer spawn;
AudioPlayer kill;

float x,y;

float aimX;
float aimY; 

int life = 100;
int score = 0;
int hiscore = 0;
int multiplier = 0;

int addTime = 50;

float difficulty = 0;

float healthBonus = -8;
float gunUpgrade = -3;

float BigTrouble = -20;

float accel;

PlayerShip ship;
ArrayList <Enemy> Enemys = new ArrayList <Enemy>();
ArrayList <EnemySlow> EnemySlows = new ArrayList <EnemySlow>();
ArrayList <EnemyBouncer> EnemyBouncers = new ArrayList <EnemyBouncer>();
ArrayList <EnemySmall> EnemySmalls = new ArrayList <EnemySmall>();

ArrayList <Particle> Particles = new ArrayList <Particle>();
ArrayList <Health> Healths = new ArrayList <Health>();
ArrayList <GunUpgrade> GunUpgrades = new ArrayList <GunUpgrade>();
 
boolean up = false;
boolean left = false;
boolean down = false;
boolean right = false;

boolean GameOver = true;

void setup() {
  
  size(1024,768,P3D);
  
  GameOver = true;
    
  ship = new PlayerShip();
  Enemys.add(new Enemy(int(random(7))));
  EnemySlows.add(new EnemySlow(int(random(7))));
  EnemyBouncers.add(new EnemyBouncer(int(random(7))));
  EnemySmalls.add(new EnemySmall(int(random(7))));
  Healths.add(new Health(int(random(7))));
  GunUpgrades.add(new GunUpgrade(int(random(7))));
 
  x = width/2;
  y = height/2;
  
  minim = new Minim(this);
  
  song = minim.loadFile("8BitWeaponChipOnYourShoulder.wav");
  powerup= minim.loadFile("Powerup2.wav");
  bulletSound= minim.loadFile("Laser_Shoot7.wav");
  hit= minim.loadFile("Hit_Hurt.wav");
  spawn= minim.loadFile("Randomize.wav");
  kill= minim.loadFile("Explosion2.wav");
  
  song.loop();
  
}
 
void draw() {
  
  background(0);
  textSize(32);
  fill(0,255,0);
  
  stroke(0,0,255);
  strokeWeight(1);
  
  if(GameOver == false){
    
  if(life <=0)
  {
    GameOver = true;
  }
  else if(life >=200)
  {
    life = 200;
  }
     
  for(int i=32;i<width;i+=32)
  {
    for(int n=32;n<height;n+=32)
    {
      line(i,n,50,x,y,-2000);
    }
  }
  
  stroke(255,255,0);
  
  line(x,y,mouseX,mouseY);
  
  rect(12,12,life*5,2);
  text(" x " + score, width/2, height- 60);
  text("" + multiplier, width/2 - 100, height- 60);
 
  if(healthBonus >difficulty)
  {
    
     Healths.add(new Health(int(random(7))));
     healthBonus -= 10;
     powerup.rewind();
     powerup.play();
   
    for (int i = 0; i < 100; i++) 
    {
       EnemySmalls.add(new EnemySmall(int(random(7))));
    }
  }
  
  if(gunUpgrade > difficulty)
  {
   
    for (int i = 0; i < 100; i++) 
    {
       EnemySmalls.add(new EnemySmall(int(random(7))));
    }
    GunUpgrades.add(new GunUpgrade(int(random(7))));
    gunUpgrade -= 10;
    powerup.rewind();
    powerup.play();
  }
  
  
  if(BigTrouble >difficulty)
  {
     
     Healths.add(new Health(int(random(7))));
     GunUpgrades.add(new GunUpgrade(int(random(7))));
     BigTrouble -=30;
     spawn.rewind();
     spawn.play();
     powerup.rewind();
     powerup.play();
   
     for (int i = 0; i < 25; i++) 
     {
     EnemySlows.add(new EnemySlow(int(random(7))));
     }
  }
  
  if(addTime < difficulty)
  {
 
    Enemys.add(new Enemy(int(random(7))));
    EnemyBouncers.add(new EnemyBouncer(int(random(7))));
  
    addTime = 200;
  
  }else{
    addTime --;
  }

 
  
 for (int i = Particles.size()-1; i >= 0; i--) 
 {
    Particles.get(i).display();
    Particles.get(i).update();
    
    if(Particles.get(i).death == true)
    {
      Particles.remove(i);
    }
    
  }

  
 for (int i = Enemys.size()-1; i >= 0; i--) 
 {
  
    Enemy enemy = (Enemy) Enemys.get(i);
   
    enemy.aimX = x;
    enemy.aimY = y;
    enemy.display();
    enemy.update();
    
    if(enemy.deathBool ==true){
      kill.play();
      Enemys.remove(i);
      kill.rewind();
      kill.play();
    }
    
    
    if(dist(x,y,enemy.location.x,enemy.location.y)<50)
    {
      enemy.topspeed --; 
    }
       
    PVector mouse = new PVector(mouseX,mouseY);
    PVector aim = new PVector(aimX,aimY);
    
    if(dist(mouseX,mouseY,enemy.location.x,enemy.location.y)<20)
    {
      enemy.topspeed *=-1;
    }else{
      enemy.topspeed *=1;
    }
  }
  
  for (int i = EnemySlows.size()-1; i >= 0; i--)
  {
    
    EnemySlow enemySlow = (EnemySlow) EnemySlows.get(i);
   
    enemySlow.aimX = x;
    enemySlow.aimY = y;
    enemySlow.display();
    enemySlow.update();
    
    if(enemySlow.deathBool ==true){
      EnemySlows.remove(i);
      kill.rewind();
      kill.play();
    }
      
  }
  
  for (int i = EnemySmalls.size()-1; i >= 0; i--) 
  {
    
    EnemySmall enemySmall = (EnemySmall) EnemySmalls.get(i);
   
    enemySmall.aimX = x;
    enemySmall.aimY = y;
    enemySmall.display();
    enemySmall.update();
    
    if(enemySmall.deathBool == true){
      //kill.play();
      EnemySmalls.remove(i);
      kill.rewind();
      kill.play();
    }
      
  }
  
  
   for (int i = EnemyBouncers.size()-1; i >= 0; i--) 
   {
    
    EnemyBouncer enemyBouncer = (EnemyBouncer) EnemyBouncers.get(i);
   
    enemyBouncer.aimX = x;
    enemyBouncer.aimY = y;
    enemyBouncer.display();
    enemyBouncer.update();
    
    if(enemyBouncer.deathBool ==true)
    {
      EnemyBouncers.remove(i);
      kill.rewind();
      kill.play();
    }
  }
  
  for (int i = Healths.size()-1; i >= 0; i--) 
  {
    Healths.get(i).aimX = x;
    Healths.get(i).aimY = y;
    Healths.get(i).display();
    Healths.get(i).update();
  }
  
  for (int i = GunUpgrades.size()-1; i >= 0; i--) 
  {
    GunUpgrades.get(i).aimX = x;
    GunUpgrades.get(i).aimY = y;
    GunUpgrades.get(i).display();
    GunUpgrades.get(i).update();
  }
  
  ship.aimX = x;
  ship.aimY = y;
  ship.update();
  ship.display();

  if (up == true)
  { 
    y -= 3;
    particleInst(x,y,255,100,0,random(3),random(3),random(2));
  }
  
  if (left == true)
  { 
    x -= 3;
    particleInst(x,y,255,100,0,random(3),random(3),random(2));
  }
  
  if (right == true)
  { 
    x += 3;
    particleInst(x,y,255,100,0,random(3),random(3),random(2));
  }
  
  if (down == true)
  { 
    y +=3;
    particleInst(x,y,255,100,0,random(3),random(3),random(2));
  }


  }else{
  
    text("game over", width/2, height/2);
    text("press Mouse", width/2, height/2 + 75);
    text(" last: " + score, width/2, height- 60);
    
    if(score > hiscore){
      hiscore = score;
    }
    
    text(" Hi: " + hiscore, width/2, height- 160);
  
      if (mousePressed == true) 
      {
        GameOver = false;
        score = 0;
        life = 100;
        multiplier = 0;
        addTime = 50;
        difficulty = 0;
        healthBonus = -8;
        gunUpgrade = -3;
        BigTrouble = -20;
      }
   }
}
 
void particleInst(float px, float py, float r, float g, float b, float psx, float psy, float speed){
   Particles.add(new Particle(px, py, random(0.5,1.5),r, g, b, psx, psy, speed));
   Particles.add(new Particle(px, py, random(-1.5,-0.5),r, g, b, psx, psy, speed));
   Particles.add(new Particle(px, py, random(-0.5,0.5),r, g, b, psx, psy, speed));
}
  
void keyPressed() {
  if ((key == 'W')||(key == 'w'))
  { 
    up = true;
}
  if ((key == 'A')||(key == 'a'))
  { 
    left = true;
}
  if ((key == 'S')||(key == 's'))
  { 
    down = true;
}
  if ((key == 'D')||(key == 'd'))
  { 
    right = true;
}
}
 
void keyReleased() {
  if ((key == 'W')||(key == 'w'))
  { 
  up = false;
} 
  if ((key == 'A')||(key == 'a'))
{ 
left = false;
} 
  if ((key == 'S')||(key == 's'))
{ 
down = false;
}
  if ((key == 'D')||(key == 'd'))
{ 
right = false;
}
}


void stop()
{
  
  powerup.close();
  bulletSound.close();
  hit.close();
  spawn.close();
  kill.close();
 
  super.stop();
}


class Bullet {
  
  PVector location;
  PVector velocity;
  
  float x, y, r, t;
  color c;
  
  float diffA;
  
  Boolean deathBool;
  
  PFont f; 
  
  Bullet(float ax, float ay, float angle) {
    t = angle;
    r=random(2, 20);
    c=color(random(100, 200), 255, 255);
    location = new PVector(ax,ay);
    velocity = new PVector(0,0);
    f = createFont("Arial",16,true);
    diffA = location.x - mouseX;
    deathBool = false;
 }
   
void update(){
  
 if(diffA<=0)
 {
    velocity.y = -cos(t + 1.58);
    velocity.x = sin(t + 1.58);
  }
  else if(diffA>0)
  {
    velocity.y = cos(t + 1.58);
    velocity.x = -sin(t + 1.58);
  }
  velocity.mult(5);
  location.add(velocity);
  
  for (int i = Enemys.size()-1; i >= 0; i--) 
  {
    Enemy enemy = (Enemy) Enemys.get(i);
      
      if(dist(location.x,location.y,enemy.location.x,enemy.location.y)<15)
      {
         particleInst(location.x,location.y,255,0,0,random(10),random(10), random(3,5));
         particleInst(location.x,location.y,255,0,0,random(5),random(5), random(3));
         
         score = score + (10*multiplier);
         multiplier ++;
         difficulty -= 0.1;
         
         enemy.life --;
         deathBool = true;
     
         hit.rewind();
         hit.play();
      }
   }
   
   for (int i = EnemySlows.size()-1; i >= 0; i--) 
   {
     EnemySlow enemySlow = (EnemySlow) EnemySlows.get(i);
      if(dist(location.x,location.y,enemySlow.location.x,enemySlow.location.y)<15){
        particleInst(location.x,location.y,255,255,255,random(10),random(10), random(3,5));
        particleInst(location.x,location.y,0,0,125,random(5),random(5), random(3));
        
        score = score + (10*multiplier);
        multiplier ++;
        difficulty -= 0.01;
        
        enemySlow.life --;
        deathBool = true;
        
        hit.rewind();
        hit.play();
        
      }
   }
   
   for (int i = EnemySmalls.size()-1; i >= 0; i--) 
   {
     EnemySmall enemySmall = (EnemySmall) EnemySmalls.get(i);
    
     if(dist(location.x,location.y,enemySmall.location.x,enemySmall.location.y)<15){
       particleInst(location.x,location.y,125,255,0,random(10),random(10), random(3,5));
       particleInst(location.x,location.y,125,255,0,random(5),random(5), random(3));
     
       score = score + (10*multiplier);
       multiplier ++;
       difficulty -= 0.01;
       
       EnemySmalls.remove(i);
       deathBool = true;
       
       hit.rewind();
       hit.play();
     }
   }
   
   for (int i = EnemyBouncers.size()-1; i >= 0; i--) 
   {
     EnemyBouncer enemyBouncer = (EnemyBouncer) EnemyBouncers.get(i);
      
      if(dist(location.x,location.y,enemyBouncer.location.x,enemyBouncer.location.y)<25){
         particleInst(location.x,location.y,128,0,255,random(10),random(10), random(3,5));
         particleInst(location.x,location.y,128,0,255,random(5),random(5), random(3));
      
         score = score + (10*multiplier);
         multiplier ++;
         difficulty -= 0.01;
         
         enemyBouncer.life --;
         enemyBouncer.rot ++;
       
         deathBool = true;
        
         hit.rewind();
         hit.play();
      }
  }
   
  if((location.x > width) || (location.x < 0) || (location.y > height) || (location.y < 0))
  {
     particleInst(location.x,location.y,255,255,0,random(10),random(10), random(3,5));
     deathBool = true;
  }
  
 }
   
  void display() {
  
    stroke(255,0,255);
    //noStroke();
    //fill(255,0,255);
    pushMatrix();
  
    translate(location.x,location.y);
    rotate(t);
   
    // ellipse(-6,-6,5,2);
   
   // ellipse(0,0,5,5);
   
  line(0,4,-4,0);
  line(-4,0,0,-4);
  line(0,-4,4,0);
  line(4,0,0,4);

    
    
    
   
    
    popMatrix();
    


  }  
}

class Enemy extends EnemyBasic{
  
  Enemy(int locInst){
    
    loc = locInst;
    
    StartLoc();
         
    life = 2;

  }
 
  void update() 
  {
  
     if(life<=0)
     {
       for (int n = 10; n >= 0; n--) 
       {
          particleInst(location.x,location.y,255,0,0,random(10),random(10), random(3,5));
          particleInst(location.x,location.y,255,0,0,random(5),random(5), random(3));
       }
     deathBool = true;
     }
      
     PVector aim = new PVector(aimX,aimY);
     PVector dir = PVector.sub(aim,location);
     
     dir.normalize();
     dir.mult(0.1);
  
     acceleration = dir;
   
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
  
  }
  void display() 
  {
       
      stroke(255,255,255);
      strokeWeight(2);
      fill(255,0,255);
      
      float angle = atan(velocity.y/velocity.x);
   
      pushMatrix();
        rectMode(CENTER);
        translate(location.x,location.y);
        rotate(angle);
        rect(0,0,20,20);
        line(-10,-10,10,10);
        line(-10,10,10,-10);
      popMatrix();
  }


}
class EnemyBasic
{
 
  PVector location;
 
  PVector velocity;
  PVector acceleration;
  
  float topspeed = 3;
  
  float aimX;
  float aimY;
  
  int loc;
  
  int life = 2;
  
  Boolean deathBool= false;
  
  EnemyBasic()
  {
    location = new PVector(width/2,height/2);
    
    velocity = new PVector(0,0);
    
    deathBool = false;
  }
  
  void StartLoc()
  {
  
    if(loc == 0){
       location = new PVector(0,0);
    }else if(loc == 1){
       location = new PVector(width/2,0);
    }else if(loc == 2){
       location = new PVector(width,0);
    }else if(loc == 3){
       location = new PVector(width,height/2);
    }else if(loc == 4){
       location = new PVector(width,height);
    }else if(loc == 5){
       location = new PVector(width/2,height);
    }else if(loc == 6){
       location = new PVector(0,height);
    }else if(loc == 7){
       location = new PVector(0,height/2);
    }
  }
  
  void update()
  {
  }
  
  void draw()
  {
  }
  
}
class EnemyBouncer extends EnemyBasic{
 
  float moveX = 0.1;
  float moveY = 0.1;
 
  float rot=0;
   
  EnemyBouncer(int locInst)
  {
   loc = locInst;
   StartLoc();
   life = 2;
   moveX = random(0.1,2);
   moveY = random(0.1,2);
  
  }
 
  void update() 
  {

   if(life<=0)
   {
      deathBool = true;
   }
   
   location.x += moveX;
   location.y += moveY;

   if(location.x < 0)
   {
     moveX *=-1;
   }

   if(location.x > width)
   {
     moveX *=-1;
   }

   if(location.y < 0)
   {
     moveY *=-1;
   }

   if(location.y > height)
   {
     moveY *=-1;
   }

   rot+=0.05;
  }

  void display() 
  {
    stroke(255,255,255);
    fill(0,0,125);
    
    pushMatrix();
    
      rectMode(CENTER);
      translate(location.x,location.y);
      rotate(rot);
      
      beginShape(TRIANGLES);
      
        vertex(0,-20);
        vertex(0,0);
        vertex(-10,-10);
        
        vertex(0,0);
        vertex(10,-10);
        vertex(20,0);
            
        vertex(0,0);
        vertex(10,10);
        vertex(0,20);
        
        vertex(0,0);
        vertex(-10,10);
        vertex(-20,0);
      
      endShape();
    
    popMatrix();
    
  }
}
class EnemySlow extends EnemyBasic
{
 
  EnemySlow(int locInst)
  {
    loc = locInst;
    StartLoc();
    topspeed = 0.5;
    life = 20;
  }
 
  void update() 
  {
   if(life<=0)
   {
     for (int n = 10; n >= 0; n--) 
     {
       particleInst(location.x,location.y,255,0,0,random(10),random(10), random(3,5));
       particleInst(location.x,location.y,255,0,0,random(5),random(5), random(3));
     }
 
     int mSlowList = EnemySlows.size();
     if(mSlowList < 5){
       EnemySlows.add(new EnemySlow(int(random(7))));
       EnemySlows.add(new EnemySlow(int(random(7))));
       spawn.rewind();
       spawn.play();
     }
    
     for (int i = 0; i < 10; i++) 
     {
       Enemys.add(new Enemy(int(random(7))));
       EnemyBouncers.add(new EnemyBouncer(int(random(7))));
     }
    
    deathBool = true;
    Healths.add(new Health(int(random(7))));
    
   }
 
   PVector aim = new PVector(aimX,aimY);
   PVector dir = PVector.sub(aim,location);
   
   dir.normalize();
   dir.mult(0.1);
   
   acceleration = dir;
 
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
  }
  
  void display() 
  {
    
    stroke(255,255,255);
    fill(128,0,255);
    
    float angle = atan(velocity.y/velocity.x);
 
    pushMatrix();
      rectMode(CENTER);
      translate(location.x,location.y);
  
      rotate(angle);
      rect(0,0,25,25);
      line(0,8,-8,0);
      line(-8,0,0,-8);
      line(0,-8,8,0);
      line(8,0,0,8);
    popMatrix();
      
 }
}
class EnemySmall extends EnemyBasic{
 
  EnemySmall(int locInst){
  
    loc = locInst;
    StartLoc();
    
    topspeed = random(1,1.5);
    
    life = 1;
    
  }
 
  void update() 
  {
    PVector aim = new PVector(aimX,aimY);
   
    PVector dir = PVector.sub(aim,location);
    
    dir.normalize();

    dir.mult(5);

    acceleration = dir;
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }
  
  void display() 
  {
    stroke(125,255,0);
    noFill();
    
    float angle = atan(velocity.y/velocity.x);
 
    pushMatrix();
      rectMode(CENTER);
      translate(location.x,location.y);
  
      rotate(angle);
      
      rect(0,0,5,5);
      line(0,4,-4,0);
      line(-4,0,0,-4);
      line(0,-4,4,0);
      line(4,0,0,4);

    popMatrix();
    

    
  }


}
class GunUpgrade extends EnemyBasic{
 
  GunUpgrade(int locInst)
  {
    loc = locInst;
    StartLoc();
    topspeed = random(1,2);
  }
 
  void update() {

    PVector mouse = new PVector(aimX,aimY);
    
    PVector dir = PVector.sub(mouse,location);
    
    dir.normalize();

    dir.mult(5);

    acceleration = dir;
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }
  
  void display() {
  
   stroke(200,0,200);
   
   float angle = atan(velocity.y/velocity.x);
 
   pushMatrix();
     rectMode(CENTER);
     translate(location.x,location.y);
  
     line(-5,-10,5,-10);
     line(5,-10,5,-5);
     line(5,-5,10,-5);
     line(10,-5,10,5);
     line(10,5,5,5);
     line(5,5,5,10);
     line(5,10,-5,10);
     line(-5,10,-5,5);
     line(-5,5,-10,5);
     line(-10,5,-10,-5);
     line(-10,-5,-5,-5);
     line(-5,-5,-5,-10);
      
    popMatrix();
    
  }
}
class Health extends EnemyBasic{
 
  Health(int locInst){
    
    loc = locInst;
    StartLoc();
    topspeed = random(1,2);
  }
 
  void update() {

    PVector mouse = new PVector(aimX,aimY);
    
    PVector dir = PVector.sub(mouse,location);
    
    dir.normalize();

    dir.mult(5);

    acceleration = dir;
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }
  
  void display() {
    
    stroke(0,255,0);
  
    pushMatrix();
      rectMode(CENTER);
      translate(location.x,location.y);
  
      line(-5,-10,5,-10);
      line(5,-10,5,-5);
      line(5,-5,10,-5);
      line(10,-5,10,5);
      line(10,5,5,5);
      line(5,5,5,10);
      line(5,10,-5,10);
      line(-5,10,-5,5);
      line(-5,5,-10,5);
      line(-10,5,-10,-5);
      line(-10,-5,-5,-5);
      line(-5,-5,-5,-10);
    
    popMatrix();
     
  }
}
class Particle {
  
  PVector location;
  PVector velocity;
  
  float x, y, r, t;
  color c;
  
  float diffA;
  float scaleX = 3;
  float scaleY = 3;

  Boolean death = false;
  PFont f; 
  
  float speed;
  
  float ranDir;

  Particle(float ax, float ay, float angle, float rC, float gC, float bC, float sX, float sY, float sT) 
  {
   
    t = angle;
    r=random(2, 20);
    c=color(rC,gC,bC);
    
    location = new PVector(ax,ay);
    velocity = new PVector(0,0);
        
    diffA = location.x - mouseX;
    
    scaleX = sX;
    scaleY = sY;
    
    speed = sT;
    
    ranDir = random(-2,2);
  
  }
  
  void update()
  {

    scaleX = scaleX - 0.1;
    scaleY = scaleY - 0.1;
   
    if(scaleX < 0)
    {
    death = true;
    }
  
    if(ranDir<=0)
    {
      velocity.y = -cos(t + 1.58);
      velocity.x = sin(t + 1.58);
    }
    else if(ranDir>0)
    {
      velocity.y = cos(t + 1.58);
      velocity.x = -sin(t + 1.58);
    }
    
    velocity.mult(speed);
    location.add(velocity);
 
  }
  void display() 
  {
  
    stroke(c);
    pushMatrix();
  
    translate(location.x,location.y);
    rotate(t);
   
    line(0,0,scaleX,scaleY);
    
    popMatrix();
   
  }  
}

class PlayerShip {
 
  PVector dir;
  PVector mouse;
  PVector pos;
  
  float aimX;
  float aimY;
  
  float angle;
  
  int fireRate = 0;
  
  int firePower = 10;
  
  ArrayList <Bullet> Bullets = new ArrayList <Bullet>();

  PlayerShip()
  {
    Bullets.add(new Bullet(width + 1, height + 1, angle));
  }
  
  void update() 
  {
  
    pos = new PVector(aimX,aimY);
    mouse = new PVector(mouseX,mouseY);
    
    dir = PVector.sub(mouse,pos);
    dir.normalize();
    dir.mult(0.5);
  
    for (int i = Bullets.size()-1; i >= 0; i--) 
    {
      Bullets.get(i).display();
      Bullets.get(i).update();
      if(Bullets.get(i).deathBool)
      {
          Bullets.remove(i);
      }
    }
    
    if (mousePressed == true) {
      fireBullet();
    }
       
    for (int i = Enemys.size()-1; i >= 0; i--) 
    {
      Enemy enemy = (Enemy) Enemys.get(i);
      
      if(dist(aimX,aimY,enemy.location.x,enemy.location.y)<20)
      {
         Enemys.remove(i);
         life -=5;
         multiplier = 1;
        
         kill.rewind();
         kill.play();
         
         for (int n = 20; n >= 0; n--) 
         {
         particleInst(aimX,aimY,255,255,0,random(10),random(10), random(3,5));
         particleInst(aimX,aimY,255,0,0,random(5),random(5), random(3));
         }
       }
     }
   
 for (int i = EnemySlows.size()-1; i >= 0; i--) 
 {
    EnemySlow enemySlow = (EnemySlow) EnemySlows.get(i);
    
    if(dist(aimX,aimY,enemySlow.location.x,enemySlow.location.y)<20)
    {
       EnemySlows.remove(i);
       life -=50;
       multiplier = 1;
       kill.rewind();
       kill.play();
      
       for (int n = 20; n >= 0; n--) 
       {
         particleInst(aimX,aimY,255,255,0,random(10),random(10), random(3,5));
         particleInst(aimX,aimY,255,0,0,random(5),random(5), random(3));
       }
   
       EnemySlows.add(new EnemySlow(int(random(7))));
       
       EnemySlows.add(new EnemySlow(int(random(7))));
     }
   }
   
   for (int i = EnemySmalls.size()-1; i >= 0; i--) 
   {
     EnemySmall enemySmall = (EnemySmall) EnemySmalls.get(i);
      
      if(dist(aimX,aimY,enemySmall.location.x,enemySmall.location.y)<20)
      {
         EnemySmalls.remove(i);
         life -=50;
         multiplier = 1;
         kill.rewind();
         kill.play();
        
         for (int n = 5; n >= 0; n--) 
         {
           particleInst(aimX,aimY,255,255,0,random(10),random(10), random(3,5));
           particleInst(aimX,aimY,255,0,0,random(5),random(5), random(3));
         }
      }
   }
   
   
   for (int i = EnemyBouncers.size()-1; i >= 0; i--) 
   {
      EnemyBouncer enemyBouncer = (EnemyBouncer) EnemyBouncers.get(i);
      
      if(dist(aimX,aimY,enemyBouncer.location.x,enemyBouncer.location.y)<20)
      {
         EnemyBouncers.remove(i);
         life -=50;
         multiplier = 1;
        
         kill.rewind();
         kill.play();
         
         for (int n = 20; n >= 0; n--) 
         {
           particleInst(aimX,aimY,255,255,0,random(10),random(10), random(3,5));
           particleInst(aimX,aimY,255,0,0,random(5),random(5), random(3));
         }
     
       EnemyBouncers.add(new EnemyBouncer(int(random(7))));
       EnemyBouncers.add(new EnemyBouncer(int(random(7))));
           
      }
    }
   
   
   for (int i = Healths.size()-1; i >= 0; i--) 
   {
    Health health = (Health) Healths.get(i);
    
    if(dist(aimX,aimY,health.location.x,health.location.y)<30)
    {
       Healths.remove(i);
       life += 100;
       for (int n = 20; n >= 0; n--) 
       {
         particleInst(aimX,aimY,0,255,0,random(15),random(15), random(3));
       }
     }
   }
   
  for (int i = GunUpgrades.size()-1; i >= 0; i--) 
  {
    GunUpgrade gunUpgrade = (GunUpgrade) GunUpgrades.get(i);
    
    if(dist(aimX,aimY,gunUpgrade.location.x,gunUpgrade.location.y)<30){
       GunUpgrades.remove(i);
       firePower --;
       for (int n = 20; n >= 0; n--) {
          particleInst(aimX,aimY,255,0,255,random(15),random(15), random(3));
       } 
     }
   }
 }

 void display() 
 {
 
  fill(0,255,0);
  
  stroke(255,255,0);
  strokeWeight(2);
  
  angle = atan(dir.y/dir.x);

  pushMatrix();
 
    rectMode(CENTER);
    translate(aimX,aimY);
    rotate(angle);
   
    line(-10,-10,-14,0);
    line(-14,0,0,16);
    line(0,16,14,0);
    line(14,0,10,-10);
    line(10,-10,10,0);
    line(10,0,0,10);
    line(0,10,-10,0);
    line(-10,0,-10,-10);
    
    line(10,10,14,0);
    line(14,0,0,-16);
    line(0,-16,-14,0);
    line(-14,0,-10,10);
    line(-10,10,-10,0);
    line(-10,0,0,-10);
    line(0,-10,10,0);
    line(10,0,10,10);
  
   popMatrix();
     
 }

 void mousePressed() 
 {
    Bullets.add(new Bullet(aimX, aimY, angle));
 }
 
 void fireBullet()
 {
  if(firePower<1)
  {
   firePower = 1;
  }
  if(fireRate == 0)
  {
    Bullets.add(new Bullet(aimX, aimY, angle));
    bulletSound.rewind();
    bulletSound.play();
    fireRate = firePower;
  }
  else
  {
    fireRate --;
  }
 }
}



