
int[]     bgColor      = {
  10, 0, 20
};
int       delay        = 5;
int       clock;
int       dTime;
Player    player;
int       mode;
int       level;
float     rotSpeed     = 0.005; //(rad/milliseconds)
float     accSpeed     = 0.0001;
int       shootDelay   = 75;  //milliseconds
ArrayList shoots;
ArrayList enemies;
int       enemyCheckDelay = 20;
int       enemyAddClock;
float     enemyAddProb    = 0.1;
int       enemiesCounter;
int       enemiesOnLevel  = 30;

String[]  levelName       = {"SLD", "PSL", "PO", "PiS"};
String[]  enemyImage      = {"enemy_level0.gif","enemy_level1.gif","enemy_level2.gif","enemy_level3.gif"};


void setup() {
  size(500, 500);
  background(bgColor[0], bgColor[2], bgColor[2]);
  player  = new Player();
  clock   = millis();
  enemyAddClock=millis();
  mode    = 0;
  level   = 1;
  shoots  = new ArrayList();
  enemies  = new ArrayList();
  enemiesCounter=0;
}

void levelUp() {
  //Why the h*ll itn't remove enemies?!
  for (int i=0;i<enemies.size();i++) {
      enemies.remove(i);
    }
  level++;
  enemiesCounter=0;
}

void draw() {
  background(bgColor[0], bgColor[2], bgColor[2]);
  delay(delay);
  dTime=millis()-clock;
  int fps = int(1000/dTime);
  clock=millis();

  switch (mode) {
  case 0:
    intro();
    break;

  case 20:  //PLAY

    //shall we increase level?
    if(enemiesCounter>enemiesOnLevel) {
      levelUp();
    }

    //shall we add new enemy?
    if (millis()-enemyAddClock>enemyCheckDelay) {
      if (random(1)<enemyAddProb) {
        float r=random(1)+0.4;
        float a1=random(2*PI);
        float a2=random(2*PI);
        enemies.add(new Enemy(r*sin(a1)+player.x, -r*cos(a1)+player.y, a2));
        enemiesCounter++;
      }
      enemyAddClock=millis();
    }

    player.update();
    player.display();

    for (int i=0;i<shoots.size();i++) {
      Shoot shoot=(Shoot) shoots.get(i);
      shoot.update(i);
      shoot.display();
    }

    for (int i=0;i<enemies.size();i++) {
      Enemy enemy=(Enemy) enemies.get(i);
      enemy.update(i);
      enemy.display();
    }

    noFill();
    stroke(255);
    rect(sCoord(-0.95), sCoord(-0.95), sSize(0.79), sSize(0.11));
    fill(0, 200, 0);
    float w = player.health*0.75;
    rect(sCoord(-0.93), sCoord(-0.94), sSize(w), sSize(0.08));

    fill(255);
    textSize(sSize(0.06));
    text("Wynik:  "+player.score+" milikorwinów", sCoord(-0.1), sCoord(-0.87));

    textAlign(CENTER);
    textSize(sSize(0.1));
    text("LEVEL "+level+" - "+levelName[level-1], sCoord(0), sCoord(-0.7));
    textAlign(LEFT);

    break;

  case 30:
    gameOver();
    break;
  }

  key=0;
  keyCode=-1;
}

int sCoord(float cTemp) {
  return(int((cTemp+1)*width/2));
}

int sSize(float cTemp) {
  return(int((cTemp)*width/2));
}

void gameOver() {

  fill(255);
  textSize(sSize(0.2));
  textAlign(CENTER);
  text("Game Over!", sCoord(0), sCoord(-0.5));
  textSize(sSize(0.1));
  text("Uzyskałeś:", sCoord(0), sCoord(-0.3));
  textSize(sSize(0.3));
  text(player.score, sCoord(0), sCoord(0.1));
  textSize(sSize(0.2));
  text("milikorwinów", sCoord(0), sCoord(0.35));
  textSize(sSize(0.08));
  text("(wduś ENTER by powtórzyć!)", sCoord(0), sCoord(0.65));
  textAlign(LEFT);

  if (keyCode==ENTER) {
    setup();
  }
}

void intro() {
  textAlign(CENTER);
  textSize(sSize(0.25));
  text("Zostań", sCoord(0), sCoord(-0.6));
  textSize(sSize(0.3));
  text("Korwinem!", sCoord(0), sCoord(-0.2));
  textSize(sSize(0.1));
  text("I rozwal bandę czworga!", sCoord(0), sCoord(0));
  textSize(sSize(0.07));
  text("(kliknij by zacząć)", sCoord(0), sCoord(0.4));

  textAlign(LEFT);

  if (mousePressed) {
    mode=20;
  }
}

class Player {
  float x;
  float y;
  float w;
  float h;
  float v;
  float angle;
  int lastShootTime;
  int myColor;
  float health;
  int score;
  PImage img;

  Player() {
    x     = 0;
    y     = 0;
    w     = 0.2;
    h     = 0.27;
    v     = 0.0;
    angle = 0;
    health= 1;
    score = 0;
    lastShootTime=millis();
    img = loadImage("player.gif");
    myColor=200;
  }

  void display() {
    noStroke();
    fill(myColor);
    translate(sCoord(x), sCoord(y));
    rotate(angle);
    //    rect(sCoord(x)-sSize(w)/2,sCoord(y)-sSize(h)/2,sSize(w),sSize(h));
    image(img, -sSize(w)/2, -sSize(h)/2, sSize(w), sSize(h));
    //    rect(-sSize(w)/2, -sSize(h)/2, sSize(w), sSize(h));
    rotate(-angle);
    translate(-sCoord(x), -sCoord(y));
  }

  void update() {

    //first at all check, whether we haven't die
    if (health<0) {
      mode=30;
    }

    switch(keyCode) {
    case RIGHT:
      angle+=rotSpeed*dTime;
      break;
    case LEFT:
      angle-=rotSpeed*dTime;
      break;
    case UP:
      v+=accSpeed;
      break;
    case DOWN:
      v-=accSpeed;
      break;
    case ENTER:
      x=0;
      y=0;
      angle=-PI/2;
      v=0;
      break;
    }

    switch(key) {
    case 'r':
      setup();
      /*
      x=0;
       y=0;
       angle=-PI/2;
       v=0;
       */
      break;
    }

    x+=v*sin(angle)*dTime;
    y+=-v*cos(angle)*dTime;

    if (x>1) {
      x=2-x;
      angle+=PI-2*angle;
    }
    if (x<-1) {
      x=-2-x;
      angle+=PI-2*angle;
    }
    if (y>1) {
      y=2-y;
      angle+=-PI+2*angle;
    }
    if (y<-1) {
      y=-2-y;
      angle+=-PI+2*angle;
    }

    //check whether we've been hited

    for (int i=0;i<enemies.size();i++) {
      Enemy enemy=(Enemy) enemies.get(i);

      if ( enemy.x-enemy.r/2<x+w/2 && enemy.x+enemy.r/2 > x-w/2 && enemy.y-enemy.r/2<y+h/2 && enemy.y+enemy.r/2 > y-h/2) {
        enemies.remove(i);
        health-=0.1;
      }
    }

    //check, whether it's time to shoot
    if (millis()-lastShootTime>shootDelay) {
      shoots.add(new Shoot(x, y, angle));
      //      myColor=0;
      lastShootTime=millis();
    }
  }
}

class Shoot {
  float x;
  float y;
  float r;
  float v;
  float angle;
  PImage img;

  Shoot(float xTemp, float yTemp, float angleTemp) {
    x=xTemp;
    y=yTemp;
    v=0.002;
    angle=angleTemp;
    r=0.05;
  }

  void display() {
    noStroke();
    fill(200);
    translate(sCoord(x), sCoord(y));
    rotate(angle);
    ellipse(0, 0, sSize(r), sSize(r));
    rotate(-angle);
    translate(-sCoord(x), -sCoord(y));
  }

  void update(int nTemp) {
    x+=v*sin(angle)*dTime;
    y+=-v*cos(angle)*dTime;

    if (x>1.1 || x< -1.1) {
      shoots.remove(nTemp);
    }

    for (int i=0;i<enemies.size();i++) {
      Enemy enemy=(Enemy) enemies.get(i);

      if ( enemy.x-enemy.r/2<x+r/2 && enemy.x+enemy.r/2 > x-r/2 && enemy.y-enemy.r/2<y+r/2 && enemy.y+enemy.r/2 > y-r/2) {
        enemies.remove(i);
        player.score+=1;
      }

      //   shoot.update(i);
      // shoot.display();
    }
  }
}

class Enemy {
  float x;
  float y;
  float r;
  float v;
  float angle;
  PImage img;
  float aEpsilon;

  Enemy(float xTemp, float yTemp, float angleTemp) {
    x=xTemp;
    y=yTemp;
    v=0.0005;
    angle=angleTemp;
    r=0.15;
    aEpsilon=0.2;
    
    img=loadImage(enemyImage[level-1]);
    
  }

  void display() {
    fill(200);
    translate(sCoord(x), sCoord(y));
    rotate(angle);
//    ellipse(0, 0, sSize(r), sSize(r));
    image(img, -sSize(r)/2, -sSize(r)/2, sSize(r), sSize(r));
    rotate(-angle);
    translate(-sCoord(x), -sCoord(y));
  }

  void update(int nTemp) {
    x+=v*sin(angle)*dTime;
    y+=-v*cos(angle)*dTime;
    angle+=(random(2*aEpsilon)-aEpsilon);
    if (x>1.1 || x< -1.1) {
      enemies.remove(nTemp);
    }
  }
}

class Boss {
  float x;
  float y;
  float r;
  float v;
  float angle;
  PImage img;
  float aEpsilon;

  Boss(float xTemp, float yTemp, float angleTemp) {
    x=xTemp;
    y=yTemp;
    v=0.0005;
    angle=angleTemp;
    r=0.15;
    aEpsilon=0.2;
    
    img=loadImage(enemyImage[level-1]);
    
  }

  void display() {
    fill(200);
    translate(sCoord(x), sCoord(y));
    rotate(angle);
//    ellipse(0, 0, sSize(r), sSize(r));
    image(img, -sSize(r)/2, -sSize(r)/2, sSize(r), sSize(r));
    rotate(-angle);
    translate(-sCoord(x), -sCoord(y));
  }

  void update(int nTemp) {
    x+=v*sin(angle)*dTime;
    y+=-v*cos(angle)*dTime;
    angle+=(random(2*aEpsilon)-aEpsilon);
    if (x>1.1 || x< -1.1) {
      enemies.remove(nTemp);
    }
  }
}


