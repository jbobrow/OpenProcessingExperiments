
float px = width/2;
float py = 220;
float dx = random(width);
float dy = -10;
float easing = 0.23;

int level = 0;
//set trash & smog transparency
int transb = 0;
int transg = 0;

int caught = 0;
int missed = 0;
//cutscene images
PImage startimg;
PImage earth1;
PImage earth2;
PImage earth3;
PImage levelimg;
PImage winimg;
PImage loseimg;
//in game images
PImage bgb;
PImage bg;
PImage girl;
PImage grasslineb;
PImage grassline;
PImage bottle;
PImage frame;
PImage losing;

void setup() {
  size(480, 340);
  //cutscene images
  startimg = loadImage("start.jpg");
  earth1 = loadImage("earthstart.jpg");
  earth2 = loadImage("earthlevel.jpg");
  earth3 = loadImage("earthwin.jpg");
  levelimg = loadImage("level2.jpg");
  winimg = loadImage("win.jpg");
  loseimg = loadImage("lose.jpg");
  //in game images
  bgb = loadImage("background1.png");
  bg = loadImage("background.png");
  girl = loadImage("up0001.png");
  grasslineb = loadImage("grass1.png");
  grassline = loadImage("grass.PNG");
  bottle = loadImage("empty_bottle.png");
  frame = loadImage("frame.png");
  losing = loadImage("backgroundlose.png");
  smooth();
  noStroke();
  frameRate(24);
}
void draw() {  
  background(#A7C6F0);
  levelcheck();
}

void levelcheck() {
  if (level == 0) {
    startearth();
  }
  if (level == 1) {
    startscreen();
  }
  if (level == 11) {
    level1();
  }
  if (level == 12) {
    level2earth();
  }
  if (level == 13) {
    level2splash();
  }
  if (level == 2) {
    level2();
  }
  if (level == 3) {
    win();
  }
  if (level == 31) {
    winearth();
  } 
  if (level == -1) {
    lose();
  }
  if (level == -2) {
    lose2();
  }
}

void startearth() {
  image(earth1, 0, 0);
  if (((mouseX >= 410) && (mouseX <= 480)) && ((mouseY >= 130) && (mouseY <= 185))) {
    if (mousePressed) {
      level = 1;
    }
  }
}

void startscreen() {
  image(startimg, 0, 0);
  if (((mouseX >= 160) && (mouseX <= 320)) && ((mouseY >= 210) && (mouseY <= 250))) {
    if (mousePressed) {
      level = 11;
    }
  }
}

void level1() {
  easing = 0.23;
  image(bgb, 0, 0);
  fill(22, 125, 36);
  backgroundgood();
  drop();
  player();
  collision();
  image(grasslineb, 0, 50);
  grassgood();
  image(frame, 301, 20);
  textSize(14);
  text("Bottles Caught: " + caught, 320, 55);
  text("Bottles Missed: " + missed, 320, 75);
  if (caught == 20) {
    level = 12;
  }
  if (missed == 10) {
    caught = 0;
    missed = 0;
    transb = 0;
    transg = 0;
    level = -1;
  }
}

void level2earth() {
  image(earth2, 0, 0);
  if (((mouseX >= 410) && (mouseX <= 480)) && ((mouseY >= 130) && (mouseY <= 185))) {
    if (mousePressed) {
      caught = 0;
      missed = 0;
      transb = 0;
      transg = 0;
      easing = 0.3;
      level = 13;
    }
  }
}

void level2splash() {
  image(levelimg, 0, 0);
  if (((mouseX >= 160) && (mouseX <= 320)) && ((mouseY >= 210) && (mouseY <= 250))) {
    if (mousePressed) {
      level = 2;
    }
  }
}

void level2() {
  image(bg, 0, 0);
  fill(22, 125, 36);
  backgroundbad();
  drop();
  player();
  collision();
  image(grassline, 0, 50);
  grassbad();
  image(frame, 301, 20);
  textSize(14);
  text("Bottles Caught: " + caught, 320, 55);
  text("Bottles Missed: " + missed, 320, 75);
  if (caught == 36) {
    level = 3;
  }
  if (missed == 13) {
    caught = 0;
    missed = 0;
    transb = 0;
    transg = 0;
    level = -2;
  }
}

void win() {
  image(winimg, 0, 0);
  if (mousePressed) {
    level = 31;
  }
}

void winearth() {
  image(earth3, 0, 0);
  if (((mouseX >= 360) && (mouseX <= 470)) && ((mouseY >= 10) && (mouseY <= 70))) {
      if (mousePressed) {
    level = 0;
  }
}
}

void lose() {
  image(loseimg, 0, 0);
  if (((mouseX >= 410) && (mouseX <= 480)) && ((mouseY >= 130) && (mouseY <= 185))) {
    if (mousePressed) {
      level = 1;
    }
  }
}

void lose2() {
  image(loseimg, 0, 0);
  if (((mouseX >= 410) && (mouseX <= 480)) && ((mouseY >= 130) && (mouseY <= 185))) {
    if (mousePressed) {
      level = 13;
    }
  }
}

void player() {
  float targetX = mouseX;
  px += (targetX - px) * (easing * 2);
  image(girl, (px - 32), py);
}

void drop() {
  image(bottle, dx, dy);
  float targetY = 600;
  dy += (targetY - dy) * easing/7;
  if (dy >=320) {
    missed += 1;
    dy = -120;
    dx = random(width);
  }
}

void collision() {
  float pDist = dist(px, dy, dx, dy);
  if (pDist <= 34) {
    if ((dy > 220) && (dy < 280)) {
      caught += 1;
      dy = -50;
      dx = random(width);
    }
  }
}



void grassgood() {
  if (caught == 3) {
    transg = 50;
  }
  if (caught == 6) {
    transg = 90;
  }
  if (caught == 9) {
    transg = 130;
  }
  if (caught == 12) {
    transg = 180;
  }
  if (caught == 15) {
    transg = 220;
  }
  if (caught == 18) {
    transg = 255;
  }
  tint(255, transg);
  image(grassline, 0, 50);
  tint(255, 255);
}

void backgroundgood() {
  if (caught == 3) {
    transg = 50;
  }
  if (caught == 6) {
    transg = 90;
  }
  if (caught == 9) {
    transg = 130;
  }
  if (caught == 12) {
    transg = 180;
  }
  if (caught == 15) {
    transg = 220;
  }
  if (caught == 18) {
    transg = 255;
  }
  tint(255, transg);
  image(bg, 0, 0);
  image(grassline, 0, 50);
  tint(255, 255);
}

void grassbad() {
  if (missed == 3) {
    transb = 100;
  }
  if (missed == 6) {
    transb = 200;
  }
  if (missed == 9) {
    transb = 255;
  }
  tint(255, transb);
  image(grasslineb, 0, 50);
  tint(255, 255);
}

void backgroundbad() {
  if (missed == 3) {
    transb = 100;
  }
  if (missed == 6) {
    transb = 200;
  }
  if (missed == 9) {
    transb = 255;
  }
  tint(255, transb);
  image(losing, 0, 0);
  tint(255, 255);
}


