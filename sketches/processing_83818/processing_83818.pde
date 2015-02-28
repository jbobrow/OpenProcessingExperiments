
// David Grant
// Nyan Cat Game

//vBUGSv//
// 1. RESETTING THE LOOPS/SPACESHIPS/ROCKS
// I am currently in the process of figuring out how to reset the speed of SpaceRocks and SpaceShips when the player resets the game.
// any advice or tips would be great!
// 2. GETTING THE SOUND TO WORK
// I cannot seem to get the sound to work in openprocessing, it works fine before converted for the site.
//^BUGS^//

//LIBRARIES
//MUSIC import ddf.minim.*;

// Ints
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
float xless = 5;
float xmore = -5;
float rectW = 80;
float rectH = 40;
float xslow = 5;
//MUSIC boolean muted = false;


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

//Audio
//MUSIC Minim minim;
//MUSIC AudioPlayer soundtrack;

// Arrays
Particle[] particles = new Particle[0];
SpaceRock[] rocks = new SpaceRock[0];
SpaceShip[] ships = new SpaceShip[0];
SpectrumTrail trail;


void setup() {
  size(600, 400);
  cat = new player();
  trail = new SpectrumTrail();
  frameRate(60);

  // Loading images
  nyanbg = loadImage ("nyanbg.png");
  nyancat = loadImage ("character.png");
  star = loadImage("Star.png");
  comet = loadImage("comet.png");
  //setupGame();

  //Loading audio
  //MUSIC minim = new Minim(this);
  //MUSIC  soundtrack = minim.loadFile("nyansong.mp3");
  //MUSIC soundtrack.loop();
  //MUSIC  soundtrack.setGain(-5);
}

void draw() {
  background(0);

  image(nyanbg, 0, 0, 600, 400);
  trail.draw(rectX+20, rectY+25);

  cat.update();

  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("score:" + score, 40, 30);
  text("'m' to mute", 550, 380);

  // Updating game 
  updateShips();
  updateParticles();
  updateRocks();
  //updatesetupgame();
}

// RESTART GAME IF MOUSE PRESSED //
void mousePressed() {

  if (gameOver) {

    resetGame();
    rocks = new SpaceRock[0];
    ships = new SpaceShip[0];
  }
}

void resetGame() {
  rocks = (SpaceRock[]) subset(rocks, 4);
 
  speedye = 5;
  for (int i = 0; i < rocks.length; i++) {
    rocks[i].x = random(0, width*9) + (rocks[i].w / 2); 

    
    speedye = -5;
    for (int b = 0; b<ships.length; b++) {
      ships[b].x = random(0, width*9) + (rocks[i].w/2);
    }
  }

  score = 0;
  image(nyancat, rectX, rectY);  
  gameOver = false;
}

// PLAYER CONTROL  //

void keyPressed() {
  //if (key == 'm' || key == 'M') {
  //  if (muted) {
  //    soundtrack.unmute();
  //  } else {
  //    soundtrack.mute();
  //  } muted = !muted;
  //}


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

void keyReleased() {

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

// v ADDING PARTICLES v //

void updateParticles() {

  while (particles.length>maxParticles) {
    particles = (Particle[]) subset(particles, 1);
  }

  for (int i=0; i<particles.length; i++) {  
    particles[i].update();
  }
}

// ^ END OF ADDING PARTICLES ^ //



void updateRocks() {

  if (frameCount % 40 == 0) {
    SpaceRock rock = new SpaceRock();
    rocks = (SpaceRock[]) append(rocks, rock);
    speedye +=0.05;
  }

  if (rocks.length>10) {

    rocks = (SpaceRock[]) subset(rocks, 1);
  }

  for (int i = 0; i<rocks.length; i++) {
    rocks[i].update();
  }
}

void updateShips() {

  if (frameCount % 40 == 0) {
    SpaceShip ship = new SpaceShip();
    ships = (SpaceShip[]) append(ships, ship);
    speed +=0.01;
  }

  if (ships.length>10) {

    ships = (SpaceShip[]) subset(ships, 1);  //
  }

  for (int i = 0; i<ships.length; i++) {
    ships[i].update();
  }
}

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

// --- THIS CONTROLS THE PARTICLES ATTRIBUTES, SUCH AS COLOUR, SIZE, GRAVITY AND FADESPEED, ADJUST THIS CODE :) --- //


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

    // fill(28,116,111);
    image(nyancat, rectX, rectY);

    if (rectY<0) {
      rectY+=xless;
    }
    if (rectX< 0) {
      rectX +=xless;
    }

    if (rectY>height - rectH) {
      rectY-=xless;
      
    }

    for (int i = 0; i<ships.length; i++) {
      SpaceShip ship = ships[i];

      if ((rectX+rectW>ship.x) && (rectX+rectW<ship.x + ship.w+50) && (rectY+rectH>ship.y) && (rectY+rectH<ship.y+ship.h+40)) {
        ship.alive = false;
        ship.velX = 50;
        score++;
        makeExplosion(ship.x + (ship.w/2), ship.y+(ship.h/2));
      }
      if (!gameOver) {
        for (int b = 0; b<rocks.length; b++) {
          SpaceRock rock = rocks[b];
          if ((rectX+rectW>rock.x) && (rectX+rectW<rock.x + rock.w+rock.h) && (rectY+rectH>rock.y) && (rectY+rectH<rock.y+rock.h+10)) {
            gameOver = true;
            //rocks = (SpaceRock[]) subset(rocks, 1);
            makeExplosion(rock.x + (rock.w/2), rock.y+(rock.h/2));
           
          }
        }
      }

      else if (gameOver == true) {
        
        image(nyanbg, 0, 0, 600, 400);
        textAlign(CENTER);
        textSize(20);
        fill(255);
        text("Score:" + score, width/2, height/2-50);

        textSize(30);
        fill(255);
        text("SPLAT!", width/2, height/2);
        fill(255);
        textSize(20);
        fill(255);
        text("CLICK MOUSE TO TRY AGAIN", width/2, height/2 +150);
        textSize(10);

      }
    } // for loop end
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
    velX = -speed;
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



