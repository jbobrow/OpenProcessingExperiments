
//Today DEMO
//By Colin Horgan, Chris Minardi, and Tyler Aldrich
//(SDX)

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer splash;

int room;

int timer = 0;
int timerLimit = 45;

int tE;
int fE;
int rE;
int transTimer;
int fTransTimer;
int rTransTimer;
int dTrans;
int fTrans;
int rTrans;

int dX1;
int dX2;
int dX3;
int  dX4;
int dX5;
int dX6;
int dX7;
int dX8;

int dY1;
int dY2;
int dY3;
int  dY4;
int dY5;
int dY6;
int dY7;
int dY8;

int gameState;

int attackType;

int enemiesDefeated;

boolean t;
boolean f;
boolean rb;

PImage room1;
PImage room2;
PImage room3;
PImage room4;
PImage city1;
PImage city2;
PImage city3;
PImage city4;
PImage city5;
PImage city6;

PImage baddieLD;
PImage baddieRD;

PImage playerLD;
PImage playerRD;

PImage playerLDmov1;
PImage playerRDmov1;
PImage playerLDmov2;
PImage playerRDmov2;


PImage playerDmov1;
PImage playerDmov2;
PImage playerUmov1;
PImage playerUmov2;

PImage enemy1;
PImage enemy2;
PImage enemy3;
PImage enemy4;
PImage enemy5;
PImage enemy6;

PImage blood;
PImage blood2;
PImage blood3;
PImage blood4;
PImage blood5;

enemy[] es;

player p;
watcher w;
//enemy e;

void setup() {

  frameRate(30);
  size (500, 275);
  
    minim = new Minim(this);
  
    splash = minim.loadFile("BUNNIEZ.wav");

  p = new player(width/2, height/2, 3);
  w = new watcher(round(random(width)), round(random(100, height)));
 //e = new enemy(round(random(width)), round(random(100,height)), 0);

  es = new enemy[18];

  room1 = loadImage("room1.png");
  room2 = loadImage("room2.png");
  room3 = loadImage("room3.png");
  room4 = loadImage("room4.png");
  city1 = loadImage("street1.png");
  city2 = loadImage("street2.png");
  city3 = loadImage("street3.png");
  city4 = loadImage("street4.png");
  city5 = loadImage("street5.png");
  city6 = loadImage("street6.png");

  baddieLD = loadImage("baddieLD.png");
  baddieRD = loadImage("baddieRD.png");

  playerLD = loadImage("purple man.png");
  playerRD = loadImage("purple man right.png");


  playerLDmov1 = loadImage("purple man moving.png");
  playerRDmov1 = loadImage("purple man moving right.png");
  playerLDmov2 = loadImage("purple man moving2.png");
  playerRDmov2 = loadImage("purple man moving right2.png");


  playerDmov1 = loadImage("purple man forward.png");
  playerDmov2 = loadImage("purple man forward 2.png");
  playerUmov1 = loadImage("purple man top.png");
  playerUmov2 = loadImage("purple man top 2.png");

  enemy1 = loadImage("bunny.png");
  enemy2 = loadImage("bunny right.png");
  enemy3 = loadImage("gerbilpuppy 2.png");
  enemy4 = loadImage("kitten.png");
  enemy5 = loadImage("kitten right 2.png");

  blood = loadImage("blood.png");
  blood2 = loadImage("blood 2.png");
  blood3 = loadImage("blood 3.png");
  blood4 = loadImage("blood 4.png");
  blood5 = loadImage("blood 5.png");

  room = 3;

  enemiesDefeated = 0;

  generateEnemies();

  t=false;
  f=false;
  rb=false;

  attackType = 0;


  dX1=round(random(width));
  dX2=round(random(width));
  dX3=round(random(width));
  dX4=round(random(width));
  dX5=round(random(width));
  dX6=round(random(width));
  dX7=round(random(width));
  dX8=round(random(width));

  dY1=round(random(height));
  dY2=round(random(height));
  dY3=round(random(height));
  dY4=round(random(height));
  dY5=round(random(height));
  dY6=round(random(height));
  dY7=round(random(height));
  dY8=round(random(height));
      splash.loop();
        gameState = 0;
}

void draw() {
  
  if (gameState == 5) {
    background(124, 22, 22);
  }

  if (gameState == 0) {


    timer++;
    background(0);
    textAlign(CENTER);
    fill(255);

    if (timer >= timerLimit) {
      dX1=round(random(width));
      dX2=round(random(width));
      dX3=round(random(width));
      dX4=round(random(width));
      dX5=round(random(width));
      dX6=round(random(width));
      dX7=round(random(width));
      dX8=round(random(width));

      dY1=round(random(height));
      dY2=round(random(height));
      dY3=round(random(height));
      dY4=round(random(height));
      dY5=round(random(height));
      dY6=round(random(height));
      dY7=round(random(height));
      dY8=round(random(height));
      timer = 0;
      timerLimit = round(random(30, 90));
    }

    text("DEMO", dX1, dY1);

    text("DEMO", dX2, dY2);
    text("DEMO", dX3, dY3);
    text("DEMO", dX4, dY4);
    text("DEMO", dX5, dY5);
    text("DEMO", dX6, dY6);
    text("DEMO", dX7, dY7);
    text("DEMO", dX8, dY8);

    fill(round(random(255)), round(random(255)), round(random(255)));
    text("CLICK TO PLAY", width/2, height/2);

    if (mousePressed) {
      gameState = 2;
    }
  }

  if (gameState == 2) {

    background(0);
    timer ++;

    if (timer >= timerLimit) {
      dX1=round(random(width));
      dX2=round(random(width));
      dX3=round(random(width));


      dY1=round(random(height));
      dY2=round(random(height));
      dY3=round(random(height));

      timer = 0;
      timerLimit = round(random(30, 90));
    }
    fill(round(random(255)), round(random(255)), round(random(255)));  

    text("ARROWSS//./WASD ;; MOVE", dX3, dY3);

    text("CLICK ;; SHOOT", dX1, dY1);

    text("SHIFT ;; KILL", dX2, dY2);

    fill(255);
    text("ENTER TO STRT", width/2, height/2);

    p.display();

    p.walk();

    if (keyPressed) {
      if (key == ENTER || key == RETURN) {

        gameState = 1;
      }
    }
  }

  if (gameState == 1) {

    room = 3;

    displayBackground();

    checkEnemies();
    moveEnemies();

    w.injure(p);
    w.chase(p);
    w.display();

    p.walk();
    p.doors();
    p.gun();
    p.display();

    attack();
    stomp();
    displayF();
    displayR();

    transition(p);
    displayD();

    if (enemiesDefeated >= 17) {
      dTrans = 255;
    }
  }
}

void displayBackground() {
  imageMode(CENTER);
  stroke(0);
  strokeWeight(0);
  if (room==1) {
    image(room1, width/2, height/2);
    //line(230,0,230,height);
    //line(310,0,310,height);
  }
  if (room==2) {
    image(room2, width/2, height/2);
    //line(225,0,225,height);
    //line(310,0,310,height);
  }
  if (room==3) {
    image(room3, width/2, height/2);
    //line(230,0,230,height);
    //line(310,0,310,height);
  }
  if (room==4) {
    image(room4, width/2, height/2);
    //line(230,0,230,height);
    //line(310,0,310,height);
  }
  if (room==5) {
    image(city1, width/2, height/2);
    /*line(38,0,38,height);
     line(66,0,66,height);
     line(381,0,381,height);
     line(405,0,405,height);**/
  }
  if (room==6) {
    image(city2, width/2, height/2);
    /*line(110,0,110,height);
     line(140,0,140,height);
     line(220,0,220,height);
     line(240,0,240,height);
     line(338,0,338,height);
     line(355,0,355,height);**/
  }
  if (room==7) {
    image(city3, width/2, height/2);
    /*line(16,0,16,height);
     line(36,0,36,height);
     line(427,0,427,height);
     line(447,0,447,height);**/
  }
  if (room==8) {
    image(city4, width/2, height/2);
    /*line(25,0,25,height);
     line(55,0,55,height);
     line(115,0,115,height);
     line(135,0,135,height);
     line(280,0,280,height);
     line(300,0,300,height);
     line(420,0,420,height);
     line(440,0,440,height);**/
  }
  if (room==9) {
    image(city5, width/2, height/2);
    /*line(20,0,20,height);
     line(50,0,50,height);
     line(372,0,372,height);
     line(394,0,394,height);
     line(458,0,458,height);
     line(475,0,475,height);**/
  }
  if (room==10) {
    image(city6, width/2, height/2);
    /*line(20,0,20,height);
     line(40,0,40,height);
     line(188,0,188,height);
     line(215,0,215,height);
     line(353,0,353,height);
     line(374,0,374,height);**/
  }
}


void transition(player p) {


  if (t==true) {

    tE++;

    if (dTrans<255&&transTimer == 0) {
      dTrans=255;
      //spawnEnemies();
    }

    if (dTrans>=255) {
      transTimer ++;
    }

    if (transTimer>=15) {







      dTrans-=17;
    }

    if (dTrans<=0&&transTimer>=30) {
      t = false;
      tE = 0;
    }
  }
}

void attack() {

  if (rb == false) {
    if (f==true) {
      fE++;

      if (fTrans<255&&fTransTimer == 0) {
        fTrans=255;
      }

      if (fTrans>=255) {
        fTransTimer ++;
      }

      if (fTransTimer>=2) {
        fTrans-=70;
        fTransTimer++;
      }

      if (fTrans<=0&&fTransTimer>=30) {
        f = false;
        fE = 0;
      }
    }
  }
}

void stomp() {

  if (rb==true) {
    rE++;

    if (rTrans<255&&rTransTimer == 0) {
      rTrans=255;
    }

    if (rTrans>=255) {
      rTransTimer ++;
    }

    if (attackType == 1) {
      if (rTransTimer>=2) {
        rTrans-=70;
        rTransTimer++;
      }
    }
    if (attackType == 2) {
      if (rTransTimer>=5) {
        rTrans-=70;
        rTransTimer++;
      }
    }
    if (attackType == 3) {
      if (rTransTimer>=15) {
        rTrans-=15;
        rTransTimer++;
      }
    }

    if (rTrans<=0&&rTransTimer>=30) {
      rb = false;
      rE = 0;
    }
  }
}

void displayD() {
  rectMode(CENTER);
  fill(0, dTrans);
  noStroke();
  rect(width/2, height/2, 505, 305);
}

void displayF() {
  rectMode(CENTER);
  fill(255, fTrans);
  noStroke();
  rect(width/2, height/2, 505, 305);
}

void displayR() {
  rectMode(CENTER);
  fill(124, 22, 22, rTrans);
  noStroke();
  rect(width/2, height/2, 505, 305);
}

void generateEnemies() {
  for (int i = 0; i < es.length; i++) {
    es[i] = new enemy(-10, -10, i);
  }
}

void moveEnemies() {

  for (int i = 0; i < es.length; i++) {
    es[i].display();
    es[i].wander();
  }
}

void checkEnemies() {

  for (int i = 0; i < es.length; i++) {
    es[i].injure(p);
  }
}

void spawnEnemies() {

  int eNumb = enemiesDefeated;

  int wChance = round(random(1, 4));
    if (w.on == 1) {
      if (wChance == 1 || wChance == 4) {
        w.x = round(random(width));

        w.y = round(random(width));
      }
      if (wChance == 2) {
      }
      if (wChance == 3) {
        w.on = 0;
      }
    }
    
    if (w.on == 0) {
      if (wChance == 1 || wChance == 4) {
       w.on = 1;
      }
      if (wChance == 2) {
      }
      if (wChance == 3) {
   
      }
    }


  for (int i = 0; i < es.length; i++) {
    es[i].on = 0;
  }

  if (enemiesDefeated<18) {
    int eChance = round(random(1, 10));
    if (room>=5) {
      if (eChance >= 1 && eChance <3) {
        if (enemiesDefeated<17) {
          es[eNumb].x = round(random(width));
          es[eNumb].y = round(random(100, height));
          es[eNumb].on = 1;
        }
      }
    }
    if (room <5) {
      if (eChance >= 3 && eChance <= 6) {
        if (enemiesDefeated<17) {
          es[eNumb].x = round(random(width));
          es[eNumb].y = round(random(100, height));
          es[eNumb].on = 1;
        }
      }
      if (eChance >= 7 && eChance <= 8) {
        if (enemiesDefeated<17) {
          es[eNumb].x = round(random(width));
          es[eNumb].y = round(random(100, height));
          es[eNumb].on = 1;
        }
        if (enemiesDefeated<16) {
          es[eNumb+1].x = round(random(width));
          es[eNumb+1].y = round(random(100, height));
          es[eNumb+1].on = 1;
        }
      }

      if (eChance == 9) {
        if (enemiesDefeated<17) {
          es[eNumb].x = round(random(width));
          es[eNumb].y = round(random(100, height));
          es[eNumb].on = 1;
        }
        if (enemiesDefeated<16) {
          es[eNumb+1].x = round(random(width));
          es[eNumb+1].y = round(random(100, height));
          es[eNumb+1].on = 1;
        }
        if (enemiesDefeated<15) {
          es[eNumb+2].x = round(random(width));
          es[eNumb+2].y = round(random(100, height));
          es[eNumb+2].on = 1;
        }
      }
    }
  }
}

void stop()
{
  splash.close();
 
    minim.stop();

  super.stop();
}


