
//
// Game Desing Summer 2014
// Homework #3: Legend of Legolas
// Copyright(c) 2014 James Young, Suphanut Jamonnak
//

//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

// Get Hero...
Ship ship;

boolean upPressed = false;//CHANGE LEFT AND RIGHT TO UP AND DOWN( IN SHIP TOO)
boolean downPressed = false;
boolean aPressed = false;
boolean dPressed = false;
 
float shipSpeed = .4;
float rotationAngle = .2;
float bulletSpeed = 10;

// Images
PImage[] asteroidPics = new PImage[8];
PImage level1;
PImage level2;
PImage level3;
PImage levels;
PImage heart;
PImage rocket;
PImage startScreen;
PImage loadingScreen;
PImage resultScreen;

ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;
// Font Input
PFont font;
//
int kill;
int darkCounter;
int darkCounterLimit = 24*2;
int MAX_LIVES = 10;
int lives;
int stage = -1;
int diffCurve = 2;
int numAsteroids = 1;
int startingRadius = 50;
// Sound Library
//Minim minim;
//Minim minim1;
//AudioPlayer sou;
//AudioPlayer sou1;

void setup(){
 
 size(1000,600);
 font = createFont("Consolas", 32);
 
 asteroidPics[0] = loadImage("images/orc__sprite1.png");
 asteroidPics[1] = loadImage("images/orc__sprite2.png");
 asteroidPics[2] = loadImage("images/orc__sprite3.png");
 asteroidPics[3] = loadImage("images/orc__sprite4.png");
 asteroidPics[4] = loadImage("images/orc__sprite5.png");
 asteroidPics[5] = loadImage("images/orc__sprite5.png");
 asteroidPics[6] = loadImage("images/orc_attack_01.png");
 asteroidPics[7] = loadImage("images/orc_attack_02.png");
 
 // for game over page;
 rocket = loadImage("images/lives.png");
 
 startScreen = loadImage("images/start_screen.png");
 resultScreen = loadImage("images/result_screen.png");
 heart = loadImage("images/lives.png");
 loadingScreen = loadImage("images/111.png");
 startScreen.resize(1000,600);
 resultScreen.resize(1000,600);
 loadingScreen.resize(1000,600);
 level1 = loadImage("images/ground1.png");
 level2 = loadImage("images/ground2.jpg");
 level3 = loadImage("images/ground3.png");
 levels = loadImage("images/grounds.jpg");
 level1.resize(1000,600);
 level2.resize(1000,600);
 level3.resize(1000,600);
 levels.resize(1000,600);
 
 background(startScreen);
 frameRate(24);
 lives = 10;
 asteroids = new ArrayList<Asteroid>(0);
  
  // Sound Setup for game theme ...
  //minim = new Minim(this);
  //sou = minim.loadFile("musics/song_1.mp3");
  //sou.loop();
  kill = 0;
}
 
 
void draw(){
 if( lives >= 0 && asteroids.size()>0){
   float theta = heading2D(ship.rotation)+PI/2;
   
   if(stage == 0){
     // level 1
     background(level1);
     
   }else if(stage == 1){
     // level 2
     background(level2);
    
   }else if(stage == 2){
     // level 3
     background(level3);
     
   }else{
     // level ....
     background(levels);
     
   }
   ship.update();
   ship.edges();
   ship.render();
   
   if(ship.checkCollision(asteroids)){
    // if collision detected -lives
    lives--;
    // Create new hero at start point ...
    ship = new Ship();
   }
    
   if(aPressed){
     rotate2D(ship.rotation,-rotationAngle);
     //ellipse(100,100,100,100);
   }
   if(dPressed){
     rotate2D(ship.rotation, rotationAngle);
   }
   if(upPressed){
     ship.acceleration = new PVector(0,shipSpeed);
     rotate2D(ship.acceleration, theta);
   }
    
   
   for(int i = 0; i < bullets.size(); i++){
    bullets.get(i).edges();
    if(bullets.get(i).update()){
      bullets.remove(i);
      i--;
    }
    if(i < 0){
     break;
    }
    
    bullets.get(i).render();
    if(bullets.get(i).checkCollision(asteroids)){
      bullets.remove(i);
        // Sound Setup for game theme ...
        //minim1 = new Minim(this);
        //sou1 = minim1.loadFile("musics/getcoin.mp3"); 
        //sou1.play();
      kill+=10;
      i--;
    }
   }
    
  

    // get rid of memory
    while(bullets.size() >5){
    bullets.remove(0);
    bullets.remove(1);
   }
    
   for(Asteroid a : asteroids){
    a.update();
    a.edges();
    a.render();
   }
   textFont(font, 30);
   fill(255);
   
   text("Stage " + (stage + 1),500,40);
   textFont(font, 30);
   fill(255);
   text("Golds: "+kill+" G", 700, 40);
   
   for(int i = 0; i < lives; i++){
     image(heart,40*i + 10, 10, 40, 40);
   }
 }else  if(lives < 0){
   if(darkCounter < darkCounterLimit){
    background(loadingScreen);
    darkCounter++;
    for(Asteroid a : asteroids){
      a.update();
      a.edges();
      a.render();
     }
    fill(0, 255-(darkCounterLimit-darkCounter)*3);
    rect(0,0,width,height);
   } else {
     background(resultScreen);
     for(Asteroid a : asteroids){
      a.update();
      a.edges();
      a.render();
     }
     
     textFont(font, 33);
     fill(255);
     text("Your Golds: "+kill+" G",360, 240);
   }
 } else {
     background(startScreen);
     ship = new Ship();
     ship.render();
      
     textFont(font, 33);
     fill(255);
     if(stage > -1){
         text("Stage " + (stage + 1) + " Complete",20,460);
         text("Click Anywhere to start stage " + (stage + 2), 20, 500);
     } else {
         
     }
     
 }
}
 
void mousePressed(){
  if(lives < 0){
   kill = 0;
   stage = -1;
   lives = 10;
   asteroids = new ArrayList<Asteroid>(0);
  } else  if (asteroids.size()==0){
   stage++;
   reset();
  }
}
 
 
void reset(){
 ship  = new Ship();
 bullets = new ArrayList<Bullet>();
 asteroids = new ArrayList<Asteroid>();
 for(int i = 0; i <numAsteroids + diffCurve*stage; i++){
  PVector position = new PVector((int)(Math.random()*width), (int)(Math.random()*height-100));
  asteroids.add(new Asteroid(position, startingRadius, asteroidPics, stage));
 }
 darkCounter = 0;
}
 
void fireBullet(){
  ship.attack = true;
  PVector pos = new PVector(0, ship.r*2);
  rotate2D(pos,heading2D(ship.rotation) + PI/2);
  pos.add(ship.position);
  PVector vel  = new PVector(0, bulletSpeed);
  rotate2D(vel, heading2D(ship.rotation) + PI/2);
  bullets.add(new Bullet(pos, vel));
}
 
void keyPressed(){
  if(key==CODED){
   if(keyCode==UP){
      upPressed=true;
   } else if(keyCode==DOWN){
      downPressed=true;
   } else if(keyCode == LEFT){
    aPressed = true; 
   }else  if(keyCode==RIGHT){
    dPressed = true;
   }
  }
  if(key == 'a'){
    aPressed = true;
  }
  if(key=='d'){
   dPressed = true;
  }
  if(key=='w'){
    upPressed=true;
  }
  if(key=='s'){
   downPressed=true;
  }
  ship.attack = false;
}
 
void keyReleased(){
  if(key==CODED){
   if(keyCode==UP){
     upPressed=false;
    ship.acceleration = new PVector(0,0); 
   } else if(keyCode==DOWN){
     downPressed=false;
     ship.acceleration = new PVector(0,0);
   } else if(keyCode==LEFT){
     aPressed = false;
   } else  if(keyCode==RIGHT){
    dPressed = false;
   }
  }
  if(key=='a'){
   aPressed = false;
  }
  if(key=='d'){
   dPressed = false;
  }
  if(key=='w'){
    upPressed=false;
    ship.acceleration = new PVector(0,0);
  }
  if(key=='s'){
   downPressed=false;
   ship.acceleration = new PVector(0,0);
  }
  if(key == ' '){
    // fire arrow;
   fireBullet();
  }
}

float heading2D(PVector pvect){
  return (float)(Math.atan2(pvect.y, pvect.x)); 
}
 
void rotate2D(PVector v, float theta) {
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}




