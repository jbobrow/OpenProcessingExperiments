
/* @pjs preload="data/maze.jpg"; */
/* @pjs preload="data/maze_mask.jpg"; */
/* @pjs preload="data/win.jpg"; */
/* @pjs preload="data/died.jpg"; */
/* @pjs preload="data/target.jpg"; */
/* @pjs preload="data/ins.png"; */

import ddf.minim.*;

AudioPlayer player;
Minim minim;

PImage B, M, W, D, T, I;
int dia = 30;
boolean stalk;
boolean ydir = true;
boolean ydir2 = true;
boolean xdir = true;
boolean go = true;
boolean flagMove = true;
boolean musicPlaying = false;

character C1;
enemy E1;
enemy E2;
enemy E3;
treasure T1;

boolean touching (character C1, enemy E1) {
  float distance = dist(C1.x, C1.y, E1.x, E1.y);
  if (distance <= 30)
    return true;
  else
    return false;
}

boolean pickUp (character C1, treasure T1) {
  float distance = dist(C1.x, C1.y, T1.x, T1.y);
  if (distance <=5)
    return true;
  else
    return false;
}

void setup() {
  size(505, 505);
  frameRate(30);
  minim = new Minim(this);
  player = minim.loadFile("data/MK.mp3", 2048);
  music();
  B = loadImage("data/maze.jpg");
  M = loadImage("data/maze_mask.jpg");
  W = loadImage("data/win.jpg");
  D = loadImage("data/died.jpg");
  T = loadImage("data/target.png");
  I = loadImage("data/ins.png");
  //Easily change location of character, enemies, and treasure below
  C1 = new character (130, 30, color(0, 0, 255));
  E1 = new enemy (180, 30, color(255, 0, 0));
  E2 = new enemy (430, 280, color(255, 0, 0));
  E3 = new enemy (330, 230, color(255, 0, 0));
  T1 = new treasure (30 + floor(random((10)))*50, 30 + floor(random((10)))*50, color(255, 255, 0), false);
  get(1, 1);
  stalk = false;
  flagMove = true;
  T1.water();
}

void stop()
{
  player.close();
  minim.stop();
}

void draw() {
  background(M);
  background(B);
  image(T, 110, 10);
  C1.colMap();
  T1.colMap();
  C1.display();
  E1.display();
  E2.display();
  E3.display();
  T1.display();
  instruct();
  if ((dist(C1.x, C1.y, E1.enemyx, E1.enemyy)) <= 30 || (dist(C1.x, C1.y, E2.enemyx, E2.enemyy) <= 30) || (dist(C1.x, C1.y, E3.enemyx, E3.enemyy)) <= 30 ) {
    background(D);
    C1.dead();
    go = false;
    flagMove = false;
  }
  if ((dist(C1.x, C1.y, T1.tX, T1.tY)) <=5) {
    T1.PU();
    T1.follow();
    stalk = true;
  }
  if (T1.tX == 125 && T1.tY == 25) {
    background(W);
  }
  if (go == true) {
    if (ydir == true) {
      E1.down();
    }
    else if (ydir == false) {
      E1.up();
    }
  }
  if (E1.enemyy == 480) {
    ydir = false;
  }
  else if (E1.enemyy == 20) {
    ydir = true;
  }
  if (go == true) {
    if (xdir == true) {
      E2.left();
    }
    else if (xdir == false) {
      E2.right();
    }
  }
  if (E2.enemyx == 170) {
    xdir = false;
  }
  else if (E2.enemyx == 440) {
    xdir = true;
  }
  if (go == true) {
    if (ydir2 == true) {
      E3.up();
    }
    else if (ydir2 == false) {
      E3.down();
    }
  }
  if (E3.enemyy == 70) {
    ydir2 = false;
  }
  else if (E3.enemyy == 240) {
    ydir2 = true;
  }
}

void instruct() {
  if (frameCount <= 120) {
    image(I, 0, 0);
  }
  else{
  }
}

void music() {
  if (musicPlaying == false) {
    player.play();
    musicPlaying = true;
  }
}

void keyPressed() {
  if (key == ENTER) {
    C1.dead();
    go = true;
    setup();
    frameCount = 0;
  }
  else if (T1.tX != 125 || T1.tY != 25) {
    if (flagMove == true) {
      if (key == CODED) {
        if (keyCode == 37) {
          C1.left();
          if (stalk == true) {
            T1.left();
          }
        }
        else if (keyCode == 38) {
          C1.up();
          if (stalk == true) {
            T1.up();
          }
        }
        else if (keyCode == 39) {
          C1.right();
          if (stalk == true) {
            T1.right();
          }
        }
        else if (keyCode == 40) {
          C1.down();
          if (stalk == true) {
            T1.down();
          }
        }
      }
    }
  }
}

//Player's character class

class character {
  float charx = 30, chary = 30;
  int x = 80, y = 30;
  color c;
  int s = 5;
  int speed = 25;
  int half_size = s/2;
  boolean isDead = false;
  boolean[][] collisionMap;
  PImage map = loadImage("maze_mask.jpg");

  void colMap() {
    collisionMap = new boolean [map.width][map.height];
    color black = color(0);
    color white = color(255);

    for (int i=0; i<map.width; i++) {
      for (int j=0; j<map.height; j++) {
        color c = map.get(i, j);
        if (c == black) {
          collisionMap[i][j] = false;
        }
        else if (c == white) {
          collisionMap[i][j] = true;
        }
        else {
        }
      }
    }
  }

  character() {
    c = color(255);
    charx = 30;
    chary = 30;
  }

  character (float x, float y, color _c) {
    charx = x;
    chary = y;
    c= _c;
  }
  void display() {
    fill(c);
    ellipse(x, y, dia, dia);
  }

  void dead() {
    isDead = true;
    T1.pickedUp=false;
  }

  boolean upleft = false;
  boolean upright = false;
  boolean downright = false;
  boolean downleft = false;

  void up() {
    if (keyCode == 38) {  
      if (y >= half_size + speed) {
        upleft = collisionMap[x - half_size][y - speed - half_size];
        upright = collisionMap[x + half_size][y - speed - half_size];
        downright = collisionMap[x + half_size][y - speed + half_size];
        downleft = collisionMap[x - half_size][y - speed + half_size];
        if (upleft && upright && downleft && downright) {
          y -= speed;
        }
      }
    }
    else {
    }
  }

  void down() {
    if (keyCode == 40) {
      if (y <= height - half_size + speed) {
        upleft = collisionMap[x - half_size][y + speed - half_size];
        upright = collisionMap[x + half_size][y + speed - half_size];
        downright = collisionMap[x + half_size][y + speed + half_size - 3];
        downleft = collisionMap[x - half_size][y + speed + half_size - 3];
        if (upleft && upright && downright && downleft) {
          y += speed;
        }
      }
      else {
      }
    }
  }

  void left() {
    if (keyCode == 37) {
      if ( x >= half_size + speed) {
        upleft = collisionMap[x - speed - half_size][y - half_size];
        upright = collisionMap[x - speed + half_size][y - half_size];
        downright = collisionMap[x - speed + half_size][y + half_size];
        downleft = collisionMap[x - speed - half_size][y + half_size];
        if (upleft && upright && downright && downleft) {
          x -= speed;
        }
      }
    }
    else {
    }
  }

  void right() {
    if ( keyCode == 39) {
      if (x <= width - half_size - speed) {        
        upleft = collisionMap[x + speed - half_size][y - half_size];
        upright = collisionMap[x + speed + half_size][y - half_size];
        downright = collisionMap[x + speed + half_size][y + half_size];
        downleft = collisionMap[x + speed - half_size][y + half_size];
        if (upleft && upright && downleft && downright) {
          x += speed;
        }
      }
    }
    else {
    }
  }
}


//Collision Map code found at: http://www.openprocessing.org/sketch/46944
//Enemy class that kills the player

class enemy {
  float enemyx, enemyy;
  int x, y;
  color c;
  int speed = 10;

  enemy() {
    c = color(255);
    enemyx = 30;
    enemyy = 30;
  }

  enemy (float x, float y, color _c) {
    enemyx = x;
    enemyy = y;
    c= _c;
  }
  void display() {
    fill(c);
    ellipse(enemyx, enemyy, dia, dia);
  }

  void up() {
    enemyy -= speed;
  }
  void down() {
    enemyy += speed;
  }
  void left() {
    enemyx -= speed;
  }
  void right() {
    enemyx += speed;
  }
}



//Treasure class player must retrieve to win the game

class treasure {
  float tX = 227;
  float tY = 227;
  int x, y;
  color c;
  boolean pickedUp;
  int s = 5;
  int speed = 25;
  int half_size = s/2;
  boolean[][] collisionMap;
  PImage map = loadImage("maze_mask.jpg");

  void colMap() {
    collisionMap = new boolean [map.width][map.height];
    color black = color(0);
    color white = color(255);

    for (int i=0; i<map.width; i++) {
      for (int j=0; j<map.height; j++) {
        color c = map.get(i, j);
        if (c == black) {
          collisionMap[i][j] = false;
        }
        else if (c == white) {
          collisionMap[i][j] = true;
        }
        else {
        }
      }
    }
  }

  treasure () {
    tX = 227;
    tY = 227;
    c = color(0);
    pickedUp = false;
  }

  treasure(float x, float y, color _c, boolean _pu) {
    tX = x;
    tY = y;
    c = _c;
    pickedUp = _pu;
  }

  void display() {
    fill(c);
    rect(tX, tY, 10, 10);
    pickedUp = false;
  }

  void PU() {
    pickedUp = true;
    println(pickedUp);
  }

  void follow() {
    tX = C1.x - 5;
    tY = C1.y - 5;
    x = C1.x - 5;
    y = C1.y - 5;
  }

  boolean block = false;

  void water() {
    do {
      land();
      println(tX);
      println(tY);
    }
    while ((tX != 180 && tY == 30) || (tX >= 230 && tY == 80) || (tX == 30 && tY >= 230 && tY <= 430) || 
    (tX >= 330 && tY == 480) || (tX == 130 && tY >= 130 && tY <= 330) || (tX == 230 && tY >= 430) ||
    (tX >= 380 && tY == 130) || (tX == 30 && tY == 480) || (tX == 80 && tY == 130) || 
    (tX == 130 && tY == 430) || (tX == 230 && tY == 330) || (tX == 380 && tY == 380));
  }

  void land() {
    tX = 30 + floor(random((10)))*50;
    tY = 30 + floor(random((10)))*50;
  }

  boolean upleft = false;
  boolean upright = false;
  boolean downright = false;
  boolean downleft = false;

  void left() {
    if (x >= half_size + speed) {
      upleft = collisionMap[x - speed - half_size][y - half_size];
      upright = collisionMap[x - speed + half_size][y - half_size];
      downright = collisionMap[x - speed + half_size][y + half_size];
      downleft = collisionMap[x - speed - half_size][y + half_size];
      if (upleft && upright && downright && downleft) {
        x = C1.x;
        tX = C1.x;
      }
    }
  }
  void up() {
    if (y >= half_size + speed) {
      upleft = collisionMap[x - half_size][y - speed - half_size];
      upright = collisionMap[x + half_size][y - speed - half_size];
      downright = collisionMap[x + half_size][y - speed + half_size];
      downleft = collisionMap[x - half_size][y - speed + half_size];
      if (upleft && upright && downleft && downright) {
        y = C1.y;
        tY = C1.y;
      }
    }
  }
  void down() {
    if (y <= height - half_size + speed) {
      upleft = collisionMap[x - half_size][y + speed - half_size];
      upright = collisionMap[x + half_size][y + speed - half_size];
      downright = collisionMap[x + half_size][y + speed + half_size];
      downleft = collisionMap[x - half_size][y + speed + half_size];
      if (upleft && upright && downright && downleft) {
        y = C1.y;
        tY = C1.y;
      }
    }
  }
  void right() {
    if (x <= width - half_size - speed) {        
      upleft = collisionMap[x + speed - half_size][y - half_size];
      upright = collisionMap[x + speed + half_size][y - half_size];
      downright = collisionMap[x + speed + half_size][y + half_size];
      downleft = collisionMap[x + speed - half_size][y + half_size];
      if (upleft && upright && downleft && downright) {
        x = C1.x;
        tX = C1.x;
      }
    }
  }
}



