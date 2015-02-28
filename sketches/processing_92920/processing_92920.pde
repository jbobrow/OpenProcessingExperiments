
// David Grant
// Nyan Cat Game Edit

 
// Ints
int maxParticles = 300;
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
 
 
void setup() {
  size(600, 400);
  cat = new player();
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
  textSize(10);
   fill(255);
text("help blue get the socks, but don't get caught", 50, 15);
        textSize(20);
       text("Score:" + score, width-150, 30);
 textSize(50);
 
  cat.update();
   

 
  // Updating game
  updateShips();
  updateParticles();
  updateRocks();
  //updatesetupgame();
}
 
// RESTART GAME IF MOUSE PRESSED //
void mousePressed() {
   
  if(gameOver) {
      
    resetGame();
     
     
  } 
}
 
void resetGame() {
   for(int i = 0; i < rocks.length; i++) {
     rocks[i].x = random(0,width*9) + (rocks[i].w / 2);
      for (int b = 0; b<ships.length; b++) {
    ships[b].x = random(0,width*9) + (rocks[i].w/2);
    
      }
   }
    
   score = 0;
   image(nyancat, rectX, rectY); 
   gameOver = false;
    
    
}
 
// PLAYER CONTROL  //
 
void keyPressed() {

   
     
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

        textSize(30);
        fill(255);
        text("BAD DOG!", width/2, height/2);
        fill(255);
        textSize(20);
        fill(255);
        text("CLICK MOUSE TO TRY AGAIN", width/2, height/4 +150);
       
 
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
    w = 60;
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



