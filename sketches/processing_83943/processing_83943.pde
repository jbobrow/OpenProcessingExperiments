
// David Grant// 20th December 2012
// Nyan Cat Game
// Digital Media Design BA Honors
// NOTES //
// All code here was created through Seb's lessons or the Learningprocessing website/book //
// v Apart from the SpectrumTrail - All credit to v //
// Gabriel Dunne http://www.openprocessing.org/sketch/62123 //
// Any images used have been drawn in illustrator (including Nyan cat) by myself. //


//vBUGSv//
// 1. GETTING THE SOUND TO WORK
// I cannot seem to get the sound to work in openprocessing, it works fine before converted for the site.
// 2. GIFS 
// Gifs also do not work in openprocessing.
// Conclusion: I have created two working files, one for openprocessing, and one for hand-in.
//^BUGS^//

//FONT
PFont font;

//LIBRARIES
// MUSIC //
//import ddf.minim.*;
//import gifAnimation.*;
//Gif loopingGif;
//Gif loopingGifc;
//Gif loopingGifB;
//Gif loopingGifS;


// Ints
// CONTROLS THE MAX AMOUNT OF PARTICLES
int maxParticles = 100;
int score = 0;

//GLOBALS
float speed = 2;
float rockspeed = 2;
float rectY = 100;
float rectX = 100;
float yspeed = 5;
float xspeed = 5;
float speedye = 5;
float speedyup = 3;
float xless = 5;
float xmore = -5;
float rectW = 80;
float rectH = 40;
float xslow = 5;
boolean muted = false;


// Player control
player cat;

boolean gameOver;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

// Images
PImage nyancat;
PImage star;
PImage nyanbg;
PImage comet;
PImage NyanDead;
PImage bignyan;
PImage bignyanC;
PImage nyanchristmas;

//Audio
// MUSIC //
// Minim minim;
// AudioPlayer soundtrack;

// Arrays
Particle[] particles = new Particle[0];
SpaceRock[] rocks = new SpaceRock[0];
SpaceShip[] ships = new SpaceShip[0];
SpectrumTrail trail;
SpectrumTrailtwo trailtwo;
int mode = 0;


void setup() {
  size(600, 400);
  font = loadFont("VisitorTT1BRK-48.vlw");
//  loopingGifc = new Gif(this, "nyangif.gif");
//  loopingGifc.loop();
//  loopingGif = new Gif(this, "nyangifc.gif");
//  loopingGif.loop();
//  loopingGifB = new Gif(this, "NyanBigB.gif");
//  loopingGifB.loop();
//  loopingGifS = new Gif(this, "NyanBigS.gif");
  cat = new player();
  trail = new SpectrumTrail();
  trailtwo = new SpectrumTrailtwo();
  frameRate(60);

  // Loading images
  nyanbg = loadImage ("nyanbg.png");
  nyancat = loadImage ("character.png");
  star = loadImage("Star.png");
  comet = loadImage("comet.png");
  NyanDead = loadImage("NyanDead.png");
  nyanchristmas = loadImage("nyanchristmas.png");
  bignyanC = loadImage("nyanChristBig.png");
//setupGame();
// ---- LOADING AUDIO SECTION ---///
///--- This calls the minim from the libaries folder --- ///
//Loading audio
// MUSIC //
//  minim = new Minim(this);
//  soundtrack = minim.loadFile("nyansong.mp3");
//  soundtrack.loop();
//  soundtrack.setGain(-5);
  background(0);
}

void draw() {
println(int(millis()/50));
if (mode == 0) {
  startScreen();
} else if  (mode == 1) {
  game();
 


}
}

//  background(0);
//
//  image(nyanbg, 0, 0, 600, 400);
//  
//  //---- DRAWS THE TRAIL ----//
//  // All credit to Gabriel Dunne http://www.openprocessing.org/sketch/62123 for SpectrumTrial //
//  trail.draw(rectX+20, rectY+25);
//
//  cat.update();
//  noStroke();

// ---- SIDE TEXT ----//
// ---- MUTE BUTTON ---//
//  fill(255);
//  textSize(15);
//  textAlign(CENTER);
//  text("score:" + score, 40, 30);
//  text("'m' to mute", 550, 380);
//
//  // Updating game 
//  updateShips();
//  updateParticles();
//  updateRocks();
  //updatesetupgame();

// --- MENU --- //
// -- I decided the game isn't in desperate need of a menu, I may add one in the future once the assignment is finished -- //
// --- LAST MINUTE TOUCH, I ADDED A MAIN MENU, I WAS WRONG, IT MADE THE PIECE COME TOGETHER PERFECTLY! :) ---// 
void startScreen() {
  
   image(nyanbg, 0, 0, 600, 400);
   
    
 
    trailtwo.draw(250, 170);
     image(bignyanC,140,95,300,150);

    //image(loopingGifS,200,100,220,150); // <--Not for Christmas
    //image(loopingGifB,200,100,220,150);// <--For Christmas
   noStroke();
   fill(255);
   font = loadFont("VisitorTT1BRK-48.vlw");
   textFont(font);
  textSize(15);
  textAlign(CENTER);
  text("'m' to mute", 550, 380);
  textSize(15);
  text("'Wsad/Arrow keys' to move",110,380);
  textSize(50);
  stroke(0);
  text("Nyan Cat",width/2,height/2+-140);
  textSize(47);
  text("Comet Frenzy",width/2,height/2+100);
  textSize(25);
   text("Press Space",width/2,height/2+140);
  
 
}


void game() {
  background(0);

  image(nyanbg, 0, 0, 600, 400);
  
  //---- DRAWS THE TRAIL ----//
  // All credit to Gabriel Dunne http://www.openprocessing.org/sketch/62123 for SpectrumTrial //
  trail.draw(rectX+20, rectY+25);

  cat.update();
  noStroke();
   fill(255);
  textSize(15);
  textAlign(CENTER);
  text("score:" + score, 40, 30);
  text("'m' to mute", 550, 380);

  // Updating game 
  updateShips();
  updateParticles();
  updateRocks();

}
// RESTART GAME IF MOUSE PRESSED //
void mousePressed() {
 
  if (gameOver) {
    resetGame();
    ships = new SpaceShip[0];
    rocks = new SpaceRock[0];
   
    }
  }

// -- RESTARTING GAME --//
// -- Resetting the score --//
// -- Continue the for loop -- //
void resetGame() {
  score = 0;
  speedye = 5;
  for (int i = 0; i < rocks.length; i++) {
    rocks[i].x = random(0, width*9) + (rocks[i].w / 2); 

  }


    speedyup =3;
    for (int b = 0; b<ships.length; b++) {
      ships[b].x = random(0, width*9) + (ships[b].w/2);
    }
  
 gameOver = false;
  
  //image(nyancat, rectX, rectY);  
 
}

// --- MUTE BUTTON --- //

void keyPressed(){
  {
  if (key == ' ') {
    mode = 1;
  
    }  
  if (key == ' ' || key == ' ') {
    if(gameOver) {
      resetGame();
      mode = 0;
     
//      ships = new SpaceShip[0];
//      rocks = new SpaceRock [0];
    }
  }
    
  if (key == 'm' || key == 'M') {
    if (muted) {
//      soundtrack.unmute();
    } 
    else {
//      soundtrack.mute();
    } 
    muted = !muted;
  }
    // --- LEFT HANDED CONTROLS --- //
  if (key == 'w' || key == 'W') {
    upPressed = true;
  }
  else if(key == 's' || key == 'S') {
    downPressed = true;
  }
  else if (key == 'a' || key == 'A') {
    leftPressed = true;
  }
  else if (key == 'd' || key == 'D') {
    rightPressed = true;
  }  
// ^ --- LEFT HANDED CONTROLS --- ///
// --- PLAYER CONTROL ---  //

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = true;
    }
    else if (keyCode == DOWN) {
      downPressed = true;
    }
    else if (keyCode == LEFT) {
      leftPressed = true;
    }
    else if (keyCode == RIGHT) {
      rightPressed = true;
    }
  }
}
}

void keyReleased() {
  // --- LEFT HANDED CONTROLS --- //
  if (key == 'w' || key == 'W') {
    upPressed = false;
  }
  else if (key == 's' || key == 'S') {
    downPressed = false;
  }
  else if (key == 'a' || key == 'A') {
    leftPressed = false;
  }  
  else if (key == 'd' || key == 'D') {
    rightPressed = false;
  }
// ^ --- LEFT HANDED CONTROLS --- ///

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    }
    else if (keyCode == DOWN) {
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    }
    else if (keyCode == RIGHT) {
      rightPressed = false;
    }
  }
}

//^ END OF PLAYER CONTROL ^ //

// v UPDATING AND SUBSTRACTING THE PARTICLES v //

void updateParticles() {

  while (particles.length>maxParticles) {
    particles = (Particle[]) subset(particles, 1);
  }

  for (int i=0; i<particles.length; i++) {  
    particles[i].update();
  }
}

// ^ UPDATING AND SUBTRACTING THE PARTICLES ^ //

// v UPDATING AND SUBTRACTING THE ROCKS(COMETS) v //

void updateRocks() {

  if (frameCount % 40 == 0) {
    SpaceRock rock = new SpaceRock();
    rocks = (SpaceRock[]) append(rocks, rock);
    speedye +=0.05; // <--- This little bit of code is what causes the comets to speed up over time.
  }

  if (rocks.length>10) {

    rocks = (SpaceRock[]) subset(rocks, 1);
  }

  for (int i = 0; i<rocks.length; i++) {
    rocks[i].update();
  }
}

// ^ UPDATING AND SUBTRACTING THE ROCKS(COMETS) ^ //

// v UPDATING AND SUBTRACTING THE SHIPS(STARS) v //

void updateShips() {

  if (frameCount % 40 == 0) {
    SpaceShip ship = new SpaceShip();
    ships = (SpaceShip[]) append(ships, ship);
    speedyup +=0.02; // <--- This little bit of code is what causes the stars to speed up over time.
    
  }
/// When the amount of ships reach 10, delete them //
// Reason behind this, see: http://gamedev.tutsplus.com/tutorials/implementation/object-pools-help-you-reduce-lag-in-resource-intensive-games/ //
  if (ships.length>10) {

    ships = (SpaceShip[]) subset(ships, 1);  
  }

  for (int i = 0; i<ships.length; i++) {
    

    ships[i].update();
  }
}

// ^ UPDATING AND SUBTRACTING THE SHIPS(STARS) ^ //

// v MAKES THE PARTICLE EXPLOSION v //
// -- Values determine size and attributes of the explosion, feel free to adjust -- //

void makeExplosion(float xpos, float ypos) {

  for (int i = 0; i<50; i++) {
    Particle p = new Particle(xpos, ypos);

    p.yVel = random(-3, 3);
    p.xVel = random(-3, 3);
    //p.opacity = random(50,100);
    //p.gravity = 0.1;
    //p.fadeSpeed = 0.96;
    p.shrink = 0.90;

    particles = (Particle[]) append(particles, p );
  }
}

//+      o     +              o   
//    +             o     +       +
//o          +
//    o  +           +        +
//+        o     o       +        o
//-_-_-_-_-_-_-_,------,      o 
//_-_-_-_-_-_-_-|   /\_/\  
//-_-_-_-_-_-_-~|__( ^ .^)  +     +  
//_-_-_-_-_-_-_-""  ""      
//+      o         o   +       o
//    +         +
//o        o         o      o     +
//    o           +
//+      +     o        o      +   
// --- THIS CONTROLS THE PARTICLES ATTRIBUTES, SUCH AS COLOUR, SIZE, GRAVITY AND FADESPEED, ADJUST THIS CODE :) --- //

// PARTICLE CLASS, EVERYTHING IN HERE ADJUSTS THE PARTICLES.
class Particle {

  float x;
  float y;
  float xVel;
  float yVel;
  float particleSize;
  float opacity;
  float gravity;
  float fadeSpeed;
  float shrink;

  Particle(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    xVel = random(-5, 5);
    yVel = random(-5, 5);
    particleSize = random(5, 10);

    //opacity = 255;
    gravity = 0;
    fadeSpeed = 0.96;
    shrink = 0.91;
  }

  void update() {
    x+=xVel;
    y+=yVel;
    opacity*=fadeSpeed;
    yVel += gravity;
    particleSize*=shrink;

    noStroke();
    //fill(255,opacity);
    //ellipse(x, y, particleSize, particleSize);
    image(star, x, y, particleSize, particleSize);
  }
}

/// -- THIS CLASS IS NAMED PLAYER BUT IT INCLUDES THE GAME OVER SCREEN -- //



class player {
  float x;
  float y;
  float speed = 4;

  player() {
    x = width/5;
    y = height/5;
  }

/// ---- CONTROLS THE SPEED OF NYAN CAT, BY ADJUSTING THESE IN THEIR FLOATS, IT CAN CHANGE HOW NYAN CAT MOVES ---- ///
  void update() {

    // Up button
    if (leftPressed) {
      rectX-=speed;
    } 
    else if (rightPressed) {
      rectX+=speed;
    }

    // Down button
    if (upPressed) {
      rectY-=speed;
    } 
    else if (downPressed) {
      rectY+=speed;
    }
/// --- CHARACTER --- ///
// --- Because gifs are not supported by Openprocessing anymore, I have made an image and a loop which can be slashed in and out //
    // fill(28,116,111);
// --- CHRISTMAS THEMED NYANCAT --//
// --- Commenting out one while leaving the other visable switches between the two ---//

    //image(nyancat, rectX, rectY); // <--For OpenProcessing
     image(nyanchristmas, rectX, rectY);                              // <--For OpenProcessing Christmas
//    image(loopingGifc,rectX,rectY); // <--Not for Christmas
    //image(loopingGif,rectX,rectY);// <--For Christmas

    if (rectY<0) {
      rectY+=xless;
    }
    if (rectX< 0) {
      rectX +=xless;
    }

    if (rectY>height - rectH) {
      rectY-=xless;
    }
/// --- FOR LOOP ---///
// ----- These lines of code is testing the collison when the ships(Stars) collide with NyanCat's value's(rectx etc) ----//
    for (int i = 0; i<ships.length; i++) {
      SpaceShip ship = ships[i];

      if ((rectX+rectW>ship.x) && (rectX+rectW<ship.x + ship.w+50) && (rectY+rectH>ship.y) && (rectY+rectH<ship.y+ship.h+40)) {
// --- End result once collison is made --//
//---- star dies ---//
//--- star reverses backwards (this is a hidden way to get extra points, from hitting the stars from the back) --- //
//-- score +++ = increases the score -- //
//-- makeExplosion = the particle explosions, the values within the brackets is explosions location --//
        ship.alive = false;
        ship.velX = 50;
        score++;
        makeExplosion(ship.x + (ship.w/2), ship.y+(ship.h/2));
      }
      if (!gameOver) {
        for (int b = 0; b<rocks.length; b++) {
          SpaceRock rock = rocks[b];
          if ((rectX+rectW>rock.x) && (rectX+rectW<rock.x + rock.w+rock.h) && (rectY+rectH>rock.y) && (rectY+rectH<rock.y+rock.h+10)) {
// -- COMET COLLISON --//
// -- Same as above, but this ends the game using the gameOver = Ytrue; buloen 
            gameOver = true;
            ships = (SpaceShip[]) subset(ships, 1);
            



            //rocks = (SpaceRock[]) subset(rocks, 1);
            makeExplosion(rock.x + (rock.w/2), rock.y+(rock.h/2));
          }
        }
      }
/// --- THIS CALLS THE GAME OVER SCREEN -- ///
// --- This is probably the sketchiest part of my code, using the combination of ships.length>1, --//
// --- speedup/speedye = -50, and subset(****,1), I have managed to create a game over screen --- //
// -- I originally tried doing this with strings, but could not get my head around how they worked in time. --///
//--- Any advice or input on how to improve this would be great!--- ///
      else if (gameOver == true) {

         // This deletes the stars before they reach NyanCat
        if (ships.length>1) {

          ships = (SpaceShip[]) subset(ships, 1);
        }
        speedyup = -50;
        
         if (rocks.length>1) {

    rocks = (SpaceRock[]) subset(rocks, 1);
  }
        speedye = -50;
        
        image(nyanbg, 0, 0, 600, 400);
        image(NyanDead,250,200,100,57);
        textAlign(CENTER);
        textSize(35);
        fill(255);
        text("Score:" + score, width/2, height/2-100);

        textSize(50);
        fill(255);
        text("SPLAT!", width/2, height/2-30);
        fill(255);
        textSize(20);
        fill(255);
        text("Press space to try again", width/2, height/2 +150);
        textSize(15);
        text("Avoid the comets!", width/2, height/2 +85);
      }
    } 
  }
}

/// --- THIS CODE CONTROLS THE SIZE AND SPEED OF THE ROCKS -- ///
// ROCKS = THE ENEMY, OBJECT TO AVOID INGAME //


class SpaceRock {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;

  SpaceRock() {
    y = random(0, height*0.9);
    w = 70;
    x = width + (w/2); // canvas width + (space rock width divided by two)
    h = 40;
    velX = -speedye;
    velY = 0;
    alive = true;
  } 

  void update() {
    x+=velX;
    y+=velY;
    
    if(alive) {
      fill(255, 0, 0);
      image(comet,x, y, w, h);
    } else {
      fill(128, 0, 0); 

      //velY +=50;
    }
  }
}

/// --- THIS CODE CONTROLS THE SIZE AND SPEED OF THE STARS -- ///
// STARS = OBJECTIVE! COLLECT STARS FOR POINTS  //




class SpaceShip {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float velback;
  boolean alive;

  SpaceShip() {

    y = random(0, height*0.9);
    w = 40;
    x = width + (w/2);
    h = 40;
    velX = -speedyup;
    velback = +100;
    velY = 0;
    alive = true;


  } 

  void update() {
    x+=velX;
    y+=velY;

    if (alive) {
      fill(255, 0, 0);
      
      image(star, x, y, w, h);
      
    } else {
      fill(255, 0); 
      noStroke();
      velY +=50;
    }
  }
}
/// ---- SPECTRUMTRAIL --- CREDIT GOES TO Gabriel Dunne http://www.openprocessing.org/sketch/62123 //




class SpectrumTrail {
 
  // position
  PVector p;
 
  // trails
  PVector[] trails;
  int trailLength = 20;
 
  // settings
  float trailHeight = 20; 
  float speed = 0.1;
  float amp = 10.0;
  float thickness = 5;
  float xDir = 4.0;
 
  // colors
  color[] colors;
 
  SpectrumTrail() {
 
    // position vector
    p = new PVector();
 
    // init colors
    colors = new color[6];
    colors[0] = color(255, 18, 21);
    colors[1] = color(255, 168, 10);
    colors[2] = color(255, 255, 10);
    colors[3] = color(60, 255, 13);
    colors[4] = color(20, 171, 255);
    colors[5] = color(118, 68, 255);
 
    // init trails
    trails = new PVector[trailLength];
    for (int i = 0; i < trailLength; i++)
      trails[i] = new PVector(0, 0);
  }
 
 
 
  void draw(float _x, float _y) {
 
    strokeWeight(thickness);
 
    // set position
    p.x = _x;
    p.y = _y + (sin(frameCount * speed) * amp);
 
    // offset trail from last position in the array, backwards
    // this needs to happen before the trail head is set
    for (int i = 0; i < trailLength-1; i++ ) {
      trails[i].set(trails[i+1]);
      trails[i].x -= xDir;
    }
 
    // set trail head to position
    trails[trailLength-1].set(p);
 
    // draw color trails
    // TODO: fade out trails
    for (int c = 0; c < colors.length; c++) {
      stroke(colors[c]);
      for (int i = trailLength-2; i >= 0; i-- ) {
        float offset = trailHeight / colors.length * (c+1) - (trailHeight/2);
        line(trails[i].x, trails[i].y + offset, trails[i+1].x, trails[i+1].y + offset);
      }
    }
  }
}

class SpectrumTrailtwo {
 
  // position
  PVector p;
 
  // trails
  PVector[] trails;
  int trailLength = 70;
 
  // settings
  float trailHeight = 79; 
  float speed = 0.2;
  float amp = 10.0;
  float thickness = 15;
  float xDir = 4.0;
 
  // colors
  color[] colors;
 
  SpectrumTrailtwo() {
 
    // position vector
    p = new PVector();
 
    // init colors
    colors = new color[6];
    colors[0] = color(255, 18, 21);
    colors[1] = color(255, 168, 10);
    colors[2] = color(255, 255, 10);
    colors[3] = color(60, 255, 13);
    colors[4] = color(20, 171, 255);
    colors[5] = color(118, 68, 255);
 
    // init trails
    trails = new PVector[trailLength];
    for (int i = 0; i < trailLength; i++)
      trails[i] = new PVector(0, 0);
  }
 
 
 
  void draw(float _x, float _y) {
 
    strokeWeight(thickness);
 
    // set position
    p.x = _x;
    p.y = _y + (sin(frameCount * speed) * amp);
 
    // offset trail from last position in the array, backwards
    // this needs to happen before the trail head is set
    for (int i = 0; i < trailLength-1; i++ ) {
      trails[i].set(trails[i+1]);
      trails[i].x -= xDir;
    }
 
    // set trail head to position
    trails[trailLength-1].set(p);
 
    // draw color trails
    // TODO: fade out trails
    for (int c = 0; c < colors.length; c++) {
      stroke(colors[c]);
      for (int i = trailLength-2; i >= 0; i-- ) {
        float offset = trailHeight / colors.length * (c+1) - (trailHeight/2);
        line(trails[i].x, trails[i].y + offset, trails[i+1].x, trails[i+1].y + offset);
      }
    }
  }
}



