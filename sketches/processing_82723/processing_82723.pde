
//import fullscreen.*;
//SoftFullScreen fs;

import ddf.minim.*;
Minim minim;

AudioPlayer music1, music2;

PFont font18, font24, font80;

StartScreen startSceen;
Background bg;
Player p1, p2;

int bulletNumber = 100; // the number of bullets fired
float damage = .5; // the damage of each bullet AND for each frame the ships touch

Bullet[] b1 = new Bullet[bulletNumber];
Bullet[] b2 = new Bullet[bulletNumber];

int debrisNumber = 10; // the ammount of debris that comes off a ship 

Debris[] d1 = new Debris[debrisNumber];
Debris[] d2 = new Debris[debrisNumber];

Hud hud;

float tempAngle1, tempSpeed1;
float tempAngle2, tempSpeed2;

float focus = 30; // the spread of the shot cannot be 0;
float fireTimerMax = 100; // the interval in frames of how long is in between each shot
float fireTimer;
boolean firstShot, p1Debris, p2Debris, gameStart;

int[] keys = { 
  LEFT, RIGHT, UP, DOWN
}; //key codes in the key array
int[] keyCodes = {
  'a', 'd', 'w', 's'
};
boolean[] downKeys1 = new boolean[keys.length];
boolean[] downKeys2 = new boolean[keys.length];
float restartTimerMax = 300; // the interval in frames of how long it takes to reset after dieing 
float restartTimer;

// the maximum value for the dials is 1023;

void setup() 
{
  minim = new Minim(this);
  music1 = minim.loadFile("intro_music.mp3", 2048);
  music2 = minim.loadFile("main_loop.mp3", 2048);
  size(800, 600);
  //fs = new SoftFullScreen(this);
  //fs.enter();
  //fs.setShortcutsEnabled(true);

  font18 = loadFont("wendy-18.vlw");
  font24 = loadFont("wendy-24.vlw");
  font80 = loadFont("wendy-80.vlw");

  tempAngle1 = HALF_PI;
  tempSpeed1 = 0;
  tempAngle2 = -HALF_PI;
  tempSpeed2 = 0;
  p1 = new Player(100, 300, HALF_PI);
  p2 = new Player(700, 300, -HALF_PI);
  hud = new Hud(fireTimerMax);
  startSceen = new StartScreen();
  bg = new Background();

  gameStart = false;
  firstShot = false;
  p1Debris = false;
  p2Debris = false;
  background(0);
}

void draw() 
{
  if (gameStart == false)
  {
    music1.play();
    if (music1.position() > music1.length() - 50)
    {
      music1.rewind();
    }
    music2.pause();
    music2.rewind();
    if (keyPressed == true && key == ENTER) {
      gameStart = true;
    }
    bg.display();
    hud.displayStart();
    startSceen.display();
  }
  else
  {
    if (downKeys1[0] == true) {
      tempAngle1 -= .1;
    }
    if (downKeys1[1] == true) {
      tempAngle1 += .1;
    }
    if (downKeys1[2] == true) {
      if (tempSpeed1 < 4) {
        tempSpeed1 += .5;
      }
    }
    if (downKeys1[3] == true) {
      if (tempSpeed1 > -3) {
        tempSpeed1 -= .1;
      }
    }
    if (downKeys2[0] == true) {
      tempAngle2 -= .1;
    }
    if (downKeys2[1] == true) {
      tempAngle2 += .1;
    }
    if (downKeys2[2] == true) {
      if (tempSpeed2 < 4) {
        tempSpeed2 += .5;
      }
    }
    if (downKeys2[3] == true) {
      if (tempSpeed2 > -3) {
        tempSpeed2 -= .1;
      }
    }

    music2.play();
    if (music2.position() > music2.length() - 50)
    {
      music2.rewind();
    }
    music1.pause(); 
    music1.rewind();

    bg.display();

    p1.move();
    tint(225, 150, 150);
    p1.display();
    noTint();

    p2.move();
    tint(150, 150, 225);
    p2.display();
    noTint();

    p1.angle = tempAngle1;
    p1.speed = tempSpeed1;
    p2.angle = tempAngle2;
    p2.speed = tempSpeed2;


    //// if the fire timer (tireTimer) is greater than the fire timer limit (fireTimerMax)
    if (fireTimer > fireTimerMax) {
      for (int i = 0; i < bulletNumber; i++)
      { 
        // creat bullets for each ship with accuracy determined by the float "focus"
        b1[i] = new Bullet(p1.x  + random (-PI/focus, PI/focus), p1.y  + random (-PI/focus, PI/focus), p1.angle + random (-PI/focus, PI/focus), color(225, 150, 150));
        b2[i] = new Bullet(p2.x  + random (-PI/focus, PI/focus), p2.y  + random (-PI/focus, PI/focus), p2.angle + random (-PI/focus, PI/focus), color(150, 150, 225));
        // signal the first shot
        firstShot = true;
      }
      // reset the timer
      fireTimer = 0;
      println("fire");
    }


    //// moves displays and checks collstions for bullets after the first shot
    if (firstShot == true) {
      for (int i = 0; i < bulletNumber; i++)
      {
        b1[i].move();
        b1[i].display();
        b2[i].move();
        b2[i].display();

        // a bullet hits player 1
        if (p1.hitBullet(b2[i]) == true) {
          if (b2[i].r > 0.5)
          {
            // allow debris to be diplayed for the select player
            p1Debris = true;
            // remove the bullet by making too small to collide with
            b2[i].r = 0;
            // damage the select player
            p1.health -= damage;
            p1.textAlpha = 200;
            //## crash sample goes here!
            //## crash sample goes here!
            //## crash sample goes here!
            // create new debris
            for (int j = 0; j < debrisNumber; j++) {
              d1[j] = new Debris(p1.x, p1.y, random(1, 3));
            }
            println("player1 was hit health = " + p1.health);
          }
        }

        // if a bullet hits player 2
        if (p2.hitBullet(b1[i]) == true) {
          if (b1[i].r > 0.5)
          {
            // allow debris to be diplayed for the select player
            p2Debris = true;

            // remove the bullet by making it too small to collide with
            b1[i].r = 0;
            // damage the select player
            p2.health -= damage;
            p2.textAlpha = 200;
            //## crash sample goes here!
            //## crash sample goes here!
            //## crash sample goes here!
            // create new debris
            for (int j = 0; j < debrisNumber; j++) {
              d2[j] = new Debris(p2.x, p2.y, random(1, 3));
            }
            println("player2 was hit health = " +  p2.health);
          }
        }
      }
    }

    //// code for if the players collide
    if (p1.dead == false && p2.dead == false) {
      if (p1.hitPlayer(p2) == true) {
        // allow debris to be diplayed for the select player
        p1Debris = true;
        p2Debris = true;
        // damage the the select player
        p1.health -= damage;
        p2.health -= damage;
        p1.textAlpha = 200;
        p2.textAlpha = 200;
        //## crash sample goes here!
        //## crash sample goes here!
        //## crash sample goes here!
        // create new debris
        for (int i = 0; i < debrisNumber; i++) {
          d1[i] = new Debris(p1.x, p1.y, random(1, 3));
          d2[i] = new Debris(p2.x, p2.y, random(1, 3));
        }
        println("players have collided p1 health = " +  p1.health + " p2 health = " + p2.health);
      }
    }


    //// displays and moves the debris classes for each player
    if (p1Debris == true) {
      for (int i = 0; i < debrisNumber; i++) {
        d1[i].move();
        d1[i].display();
      }
    }
    if (p2Debris == true) {
      for (int i = 0; i < debrisNumber; i++) {
        d2[i].move();
        d2[i].display();
      }
    }

    //// if one of the players dies stop charging shots
    if (p1.dead == false && p2.dead == false) {
      hud.charge();
      fireTimer++;
    }
    else
    {
      restartTimer++;
      if (p1.dead == true && p2.dead == true)
      {
        hud.winner("draw");
        println("draw");
      }
      else if (p2.dead == true)
      {
        hud.winner("player 1 wins");
        println("player 1 wins");
      }
      else if (p1.dead == true)
      {
        hud.winner("player 2 wins");
        println("player 2 wins");
      }

      if (restartTimer > restartTimerMax)
      {
        restart();
      }
    }

    //// display the hud class
    hud.display();
  }
}

void restart() {
  tempAngle1 = HALF_PI;
  tempSpeed1 = 0;
  tempAngle2 = -HALF_PI;
  tempSpeed2 = 0;
  p1 = new Player(100, 300, HALF_PI);
  p2 = new Player(700, 300, -HALF_PI);
  hud = new Hud(fireTimerMax);

  gameStart = false;
  firstShot = false;
  p1Debris = false;
  p2Debris = false;

  fireTimer = 0;
  restartTimer = 0;
}

void keyPressed() {
  for  (int i=0; i< keys.length; i++) { 
    if (keyCode == keys[i] ) {
      downKeys1[i] = true;
    }
  }
  for  (int i=0; i< keyCodes.length; i++) { 
    if (key == keyCodes[i] ) {
      downKeys2[i] = true;
    }
  }
}
void keyReleased() {
  for  (int i=0; i< keys.length; i++) { 
    if (keyCode == keys[i]) {
      downKeys1[i] = false;
    }
  }
  for  (int i=0; i< keyCodes.length; i++) { 
    if (key == keyCodes[i]) {
      downKeys2[i] = false;
    }
  }
}

void stop()
{
  music1.close();
  music2.close();
  minim.stop();
  super.stop ();
}

class Background {
  int[] r = {
    700, 100, 300, 150, 100, 350, 300, 110, 200, 300
  };
  int[] x = {
    -10, 300, 50, 80, 90, 100, 130, 100, 120, 800
  }; 

  int[] s = {
    700, 100, 300, 150, 100, 350, 300, 110, 200, 300
  };
  int[] y = {
    -10, 800, 450, 880, 390, 700, 630, 190, 520, 600
  }; 

  int[] t = {
    700, 100, 300, 150, 100, 350, 300, 110, 200, 300
  };
  int[] z = {
    -10, 100, 850, 480, 690, 400, 830, 890, 720, 200
  }; 

  int[] u = {
    700, 100, 300, 150, 100, 400, 400
  };
  int[] a = {
    -10, 100, 300, 500, 700, 890, 400
  };

  int[] v = {
    700, 100, 300, 150, 100, 400, 400, 100, 150, 800, 900, 500, 50, 100, 350
  };
  int[] b = {
    -10, 50, 150, 250, 350, 450, 550, 650, 750, 850, 400, 300, 700, 100, 500
  };

  int[] w = {
    700, 100, 300, 150, 100, 400, 400, 100, 150, 800, 900, 500, 50, 100, 350
  };
  int[] c = {
    -10, 820, 660, 150, 270, 780, 200, 620, 150, 450, 300, 200, 400, 100, 50
  };


  int[] x2 = {
    700, 100, 300, 150, 100, 400, 400, 100, 150, 800, 900, 500, 50, 100, 350
  };
  int[] d = {
    -10, 800, 630, 120, 240, 750, 170, 590, 120, 420, 270, 170, 370, 70, 20
  };

  int[] y2 = {
    700, 100, 300, 150, 100, 400, 400, 100, 150, 800, 900, 500, 50, 100, 350
  };
  int[] e = {
    -10, 100, 430, 520, 340, 250, 870, 690, 720, 840, 40, 87, 773, 370, 220
  };

  int[] z2 = {
    700, 100, 300, 150, 100, 350, 300, 110, 200, 300
  };
  int[] f = {
    -10, 80, 760, 4350, 652, 441, 615, 874, 760, 280
  }; 

  int[] a2 = {
    700, 100, 300, 150, 100, 350, 300, 110, 200, 300
  };
  int[] g = {
    -10, 250, 700, 450, 352, 441, 615, 374, 160, 230
  }; 

  Background() {
    width = 800;
    height = 600;
  }
  void display() {
    fill(0, random(80,90));
    rect(0,0,width,height);
    fill(random(255), random(255), random(255));
    //background(0);
    for (int i=0; i < r.length; i++) {
      ellipse(x[i], r[i], 3, 3);

      r[i] +=i+1;

      if (r[i] > 500) {
        r[i] = 0;
      }
    }

    for (int i=0; i < s.length; i++) {
      ellipse(y[i], s[i], 3, 3);

      s[i] +=i+1;

      if (s[i] > 300) {
        s[i] = 0;
      }
    }

    for (int i=0; i < t.length; i++) {
      ellipse(z[i], t[i], 3, 3);

      t[i] +=i+1;

      if (t[i] > 400) {
        t[i] = 0;
      }
    }

    for (int i=0; i < u.length; i++) {
      noStroke();
      ellipse(a[i], u[i], 6, 6);

      u[i] +=i+1;

      if (u[i] > 900) {
        u[i] = 0;
      }
    }

    for (int i=0; i < v.length; i++) {
      noStroke();
      ellipse(b[i], v[i], 1, 1);

      v[i] +=i+1;

      if (v[i] > 300) {
        v[i] = 0;
      }
    }

    for (int i=0; i < w.length; i++) {
      noStroke();
      ellipse(c[i], w[i], 1, 1);

      w[i] +=i+1;

      if (w[i] > 200) {
        w[i] = 0;
      }
    }

    for (int i=0; i < x2.length; i++) {
      noStroke();
      ellipse(d[i], x2[i], 1, 1);

      x2[i] +=i+1;

      if (x2[i] > 500) {
        x2[i] = 0;
      }
    }

    for (int i=0; i < y2.length; i++) {
      noStroke();
      ellipse(e[i], y2[i], 1, 1);

      y2[i] +=i+1;

      if (y2[i] > 300) {
        y2[i] = 0;
      }
    }

    for (int i=0; i < z2.length; i++) {
      noStroke();
      ellipse(f[i], z2[i], 3, 3);

      z2[i] +=i+1;

      if (z2[i] > 450) {
        z2[i] = 0;
      }
    }

    for (int i=0; i < a2.length; i++) {
      noStroke();
      ellipse(g[i], a2[i], 3, 3);

      a2[i] +=i+1;

      if (a2[i] > 415) {
        a2[i] = 0;
      }
    }
  }
}

class Bullet {
  float x, y, xspeed, yspeed, speed;
  float r;
  int a;
  color c;
  float decay, decayMax;

  Bullet(float tempX, float tempY, float tempAlpha, color tempC) {
    x = tempX;
    y = tempY;
    r = 3;
    speed = 5;
    a = round(random(200, 255));
    c = tempC;
    xspeed = cos(tempAlpha)*speed;
    yspeed = sin(tempAlpha)*speed;
    decay = 0;
    decayMax = 20;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, r * 2, r * 2);
    decay++;
    if (decay > decayMax)
    {
    if (r > 0) {  
      r -= .5;
      decay = 0;
    }
    }
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }
}

class Debris {
  float x, y, w, h, xspeed, yspeed;
  //color c;
  int t, f;
  float a;

  boolean playSplash;

  Debris(float tempX, float tempY, float tempSize)
  {
    x = tempX;
    y = tempY;
    w = tempSize;
    h = tempSize;
    t = 0;
    f = round(random(0, 3));
    playSplash = true;
    xspeed = random(-1, 1);
    yspeed = random(-1, 1);
    a = random(200,255);
    
  }

  void move() {
    x += xspeed;
    y += yspeed;
    a--;
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }
  void display() {
    noStroke();
    fill(random(0,225),random(0,225),random(0,225), a);
    rect(x, y, w + random(-10, 10), h + random(-10, 10) );
  }
}

class Hud {

  float fireX, fireY, fireW, fireH, fireWBumper;
  float fireTimerMax;
  float fireTimerStep;

  //BURN IT

  Hud(float tempFireTimerMax) {
    fireX = 0;
    fireY = 560;
    fireW = 00;
    fireH = 20;
    fireWBumper = 20;
    fireTimerMax = tempFireTimerMax;
    fireTimerStep = width/fireTimerMax;
  }
  void charge()
  {
    fireW += fireTimerStep;
    if (fireW > width + fireWBumper)
    {
      fireW = fireWBumper;
    }
  }
  void displayStart()
  {
    textAlign(LEFT);
    noFill();
    stroke(255);
    rect(-1, 0, width + 1, 40);
    noStroke();
    fill (255, 150, 150);
    rect(fireX, 570, fireW, fireH);
    fill(255);
    textFont(font24);
    text("ARDUEENU0S V1.0", 10, 37);
    text("BL,AR,FW,KJ", 699, 37);
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(-1, 565, width + 1, 40);
  }
  void display()
  {
    textAlign(LEFT);
    noFill();
    stroke(random(255), random(255), random(255));
    rect(-1, 0, width + 1, 40);
    noStroke();
    fill (255, 150, 150);
    rect(fireX, 565, fireW, fireH);
    fill(255);
    textFont(font24);
    text("ARDUEENU0S V1.0", 10, 37);
    text("BL,AR,FW,KJ", 699, 37);
    noFill();
    stroke(random(255), random(255), random(255));
    strokeWeight(2);
    rect(-1, 565, width + 1, 40);
    fill(255);
    text("POWERING UP..", 350, 582);
  }
  void winner(String s)
  {
    textAlign(CENTER);
    textFont(font24);
    fill(random(255), random(255), random(255));
    text(s, width/2, height/2);
  }
}

class Player {

  PImage playerSprite;
  float x, y, speed, thrust, angle;
  float r;
  boolean dead;
  float health;
  float textAlpha; 

  Player(float tempX, float tempY, float tempA) {
    playerSprite = loadImage("playerSprite.png");
    x = tempX;
    y = tempY;
    speed = 0;
    r = 12.5;
    thrust = 0;
    angle = tempA;
    dead = false;
    health = 100;
    textAlpha = 0;
  }

  void display() {
    if (health > 0) {
      textFont(font18);
      textAlign(LEFT);
      fill(255, textAlpha);
      textAlpha--;
      text(round(health) + "/100", x - 25, y - 30);
      pushMatrix();
      translate(x, y);
      rotate(angle);
      //ellipse (0,0, r * 2, r* 2);
      image (playerSprite, 0 - r, 0 - r);
      popMatrix();
    }
    else
    {
      dead = true;
    }
  }
  void move()
  {
    // Add the acceleration to the speed, but limit how fast it can go.
    //if (speed < 3 && speed > -.5) {
     // speed += thrust;
   // }
    // Slow the ship down once you take your foot off the gas.  
    //else {
      //speed = speed*.95;
    //}
    // Moves the ship in the angle it is facing.
    x += cos(angle)*speed;
    y += sin(angle)*speed;

    // If the ship moves off the screen, send it to the other side.
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }
  void health() 
  {
  }

  boolean hitBullet(Bullet bullet) {
    if (dist(x, y, bullet.x, bullet.y) < 20) {
      return true;
    }
    else {
      return false;
    }
  }
  boolean hitPlayer(Player player) {
    if (dist(x, y, player.x, player.y) < 20) {
      return true;
    }
    else
    {
      return false;
    }
  }
}

class StartScreen {
  int spriteLength = 24;
  PImage[] startSprites = new PImage[spriteLength];
  float x, y, c;
  int frame, maxFrame, frameChanger;

  StartScreen() {
    for (int i = 0; i < startSprites.length; i++)
    {
      startSprites[i] = loadImage("title_" + (11 + i) + ".png");
    }
    x = 195;
    y = 100;
    maxFrame = spriteLength;
    frame = 0;
    c = random(0, 255);
  }
  void display() {
    x = 250 + random(-3, 3);
    y = 100 + random(-3, 3);
     c = random(0, 255);
    tint(c, 0, c);
    image(startSprites[frame], x, y, 300, 300);
    noTint();
    frameChanger++;
    if (frameChanger > 4)
    {
      frameChanger = 0;
      frame++;
    }
    if (frame == maxFrame)
    {
      frame = 0;
    }
    textAlign(CENTER);
    textFont(font80);
    text("ARDUEENUOS", width/2 + random(-1, 1), 360 + random(-1, 1));
    textFont(font18);
    text("PRESS RETURN TO BEGIN", width/2 + random(-1, 1), 400 + random(-1, 1));
  }
}



