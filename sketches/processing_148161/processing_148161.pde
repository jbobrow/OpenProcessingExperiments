
// credit to http://tcrf.net/Dark_Wizard for goat image
// credit to http://soundjax.com/goat_sounds-1.html for goat sound
// credit to http://soundjax.com/laser-1.html for laser sound

/********************
 //ASTROGOAT
 // © Stefanie Walker
 ************************/

import ddf.minim.*;
AudioPlayer song1;
AudioPlayer song2;
Minim minim;

Space[] stars;
Ast [] asteroids;
Laser laser;
Goat goat;
PImage img;
int score = 0;
int scoreCount = 1/10;
int numAsteroids = 20;


void setup() {
  size (800, 500);
  minim = new Minim(this);
  song1 = minim.loadFile("GOATSOUND.mp3");
  song2 = minim.loadFile("PEWPEW.mp3");
  smooth();
  textFont(createFont("SPACEFONT.otf", 130));
  textAlign(CENTER);
  imageMode(CENTER);
  laser = new Laser();
  goat = new Goat();
  stars = new Space[100];
  int i = 0;
  while (i < 100) {
    stars[i] = new Space();
    i = i +1;
  }
  asteroids = new Ast[numAsteroids];
  int a = 0;
  while ( a < numAsteroids ) {
    asteroids[a] = new Ast();
    a = a + 1;
  }
  img = loadImage("DWGoatAnimated.gif");
  round(score);
}

void draw() {
  background(0);
  noStroke();
  int i = 1;

  while ( i < 100) {
    stars[i].shoot();
    stars[i].show(); 
    i = i + 1;
  }
  int a = 0;
  while (a < numAsteroids) {
    asteroids[a].hurl();
    asteroids[a].show();
    a = a + 1;
    // asteroids[a].explode();
  }
  goat.fly();
  goat.showgoat();
  laser.shootLaser();
  laser.showLaser();
  textSize(13);
  fill(255);
  text("ASTROGOAT (c) Stefanie Walker", 690, 480);
}


void keyPressed() {
  // pressing space resets
  if (key == ' ') {
    score = 0;
    scoreCount = 1/10;
    goat = new Goat();
    numAsteroids = 20;
    asteroids = new Ast[numAsteroids];
    int a = 0;
    while ( a < numAsteroids ) {
      asteroids[a] = new Ast();
      a = a + 1;
    }
  }
}



class Space {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float r;

  Space() {
    xpos = random(width);
    ypos = random(height);
    xspeed = random (1, 4);
    r = random(5);
    c = color(random(150, 255), random(50, 255));
  }

  void shoot() {
    xpos = xpos - xspeed;
    if (xpos < 1) {
      xpos = width;
    }
  }

  void show() {
    fill(c);
    ellipse(xpos, ypos, r*2, r*2);
  }
}

class Ast {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Ast() {
    xpos = width;
    ypos = random(height);
    xspeed = random (1, 6);
    c = color(227, 185, 48);
    int numAsteroids = 20;
  }

  void hurl() {
    xpos = xpos - xspeed; 
    if (xpos < 1) {
      xpos = width;
    }
  }
  void show() {
    fill(c);
    stroke(166, 63, 8);
    strokeWeight(3);
    ellipse(xpos, ypos, 16, 16);
    if (dist(this.xpos, this.ypos, laser.xpos, laser.ypos) < 7 ) {
      numAsteroids = numAsteroids - 1;
      score = score + 100;
      this.xpos = width;
      this.ypos = height;
      this.xspeed = 0;
    }
  }
}


class Goat {
  float xpos;
  float ypos;
  float r = 8;
  int speed = 2;
  boolean alive = true;

  Goat() {
    ypos = height/2;
    xpos = 30;
  }
  void fly() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          ypos = ypos - speed;
        }
        else if (keyCode == DOWN) {
          ypos = ypos + speed;
        }
      }
    }

    score = score + scoreCount;

    for  (int a = 0; a < numAsteroids; a++) {
      if (dist(asteroids[a].xpos, asteroids[a].ypos, xpos, ypos) < 40 ) {
        a = a + 1;
        alive = false;
        goat.speed = 0;
        song1.play();
      }
    }
  }


  void showgoat() {
    if (alive) {
      noTint();
      image(img, 45, ypos, img.width, img.height);
      song1.rewind();
      if (numAsteroids < 1) {
        scoreCount = 0;
        fill(255);
        textSize(30);
        round(score);
        text("score:", 700, 50);
        text(score, 700, 90);
        textSize(100);
        fill(255, 0, 0);
        text("YOU WIN", width/2, height/2);
      }
    }
    else {
      scoreCount = 0;
      tint(255, 0, 0);
      image(img, 45, ypos, img.width, img.height);
      fill(195, 0, 0);
      textSize(130);
      text("GAME OVER", width/2, height/2);
      textSize(30);
      fill(255);
      round(score);
      text("score:", 700, 50);
      text(score, 700, 90);
      laser.xpos = width + 20;
    }
  }
}

class Laser {
  float xpos = -5;
  float ypos = -5;
  int speed = 3;

  Laser() {
  } 
  void showLaser() {

    if (keyPressed) {
      if (key == 'l') {
        song2.play(0);
        xpos = goat.xpos+35;
        ypos = goat.ypos-10;
        strokeWeight(4);
        stroke(255, 0, 0);
        ellipse (xpos, ypos, 10, 5);
      }
    }
  }
  void shootLaser() {
    strokeWeight(4);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse (xpos, ypos, 10, 5);
    xpos = xpos + speed;
  }
}

void stop() {
  song1.close();
  song2.close();
  minim.stop();
  super.stop();
}


