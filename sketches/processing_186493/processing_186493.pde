
Log log1, log2, log3, log4, log5, log6, log7, log8;
Car car1, car2, car3, car4, car5;
Goal goal1, goal2, goal3, goal4, goal5;
float lH, cH, level, gW;
int counter, score;
float x, y, dx, dy, w, h;
boolean intro;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
/* @pjs preload="art.jpg,log.jpg"; */

void setup() {
  h = displayHeight * .90;  /////Height of the screen set to 90% of display height
  w = h * .67; ////ratio of w:h is .67:1
  size(int(w), int(h)); 
  dx = width - width / 13;
  dy = height / 1.07;
  gW = width / 10;
  counter = width / 120;
  score = 0;
  intro = true;
  minim = new Minim(this);
  player = minim.loadFile("themesong.mp3");
  x = width / 85.7;
  y = height / 1.07;
  lH = height / 20;
  cH = width / 1.12;
  level = width / 200;                       ///////change speed
  log1 = new Log(lH + width / 120);
  log2 = new Log(lH + width / 9.2);
  log3 = new Log(lH + width / 4.8);
  log4 = new Log(lH + width / 3.243);
  log5 = new Log(lH + width / 2.449);
  log6 = new Log(lH + width / 1.97);
  log7 = new Log(lH + width / 1.65);
  car1 = new Car(cH);
  car2 = new Car(cH + width / 10);
  car3 = new Car(cH + width / 5);
  car4 = new Car(cH + width / 3.33);
  car5 = new Car(cH + width / 2.5);
  goal1 = new Goal(width / 10, 0);
  goal2 = new Goal( width / 3.3, 0);
  goal3 = new Goal(width / 2, 0);
  goal4 = new Goal( width / 1.43, 0);
  goal5 = new Goal( width / 1.1, 0);
}




void draw() {

  //play theme
  player.play();
  ///////////////////
  if (intro) {
    showHelp();
  }
  else {
    textSize(12);

    drawBackground();
    /////////////////
    log1.display();
    log1.moveRight();
    log1.logRight();
    //////////////////
    log2.display();
    log2.moveLeft();
    log2.logLeft();
    /////////////////
    log3.display();
    log3.moveRight();
    log3.logRight();
    /////////////////
    log4.display();
    log4.moveLeft();
    log4.logLeft();
    ////////////////
    log5.display();
    log5.moveRight();
    log5.logRight();
    ///////////////
    log6.display();
    log6.moveLeft();
    log6.logLeft();
    ///////////////
    log7.display();
    log7.moveRight();
    log7.logRight();
    ///////////////
    drawFrogger(x, y);
    drawDeer(dx, dy);
    log1.frogDie();
    log2.frogDie();
    log3.frogDie();
    log4.frogDie();
    log5.frogDie();
    log6.frogDie();
    log7.frogDie();
    fill(255);
    //////////////////
    car1.display();
    car1.moveRight();
    car1.frogSplat();
    //////////////////
    car2.display();
    car2.moveLeft();
    car2.frogSplat();
    car2.deerStop();
    /////////////////
    car3.display();
    car3.moveRight();
    car3.frogSplat();
    /////////////////
    car4.display();
    car4.moveLeft();
    car4.frogSplat();
    car4.deerStop();
    /////////////////
    car5.display();
    car5.moveRight();
    car5.frogSplat();
    /////////////////
    goal1.display(width / 6.7, width / 30);
    goal2.display( width / 2.86, width / 30);
    goal3.display( width / 1.82, width / 30);
    goal4.display( width / 1.33, width / 30);
    goal5.display(570, width / 30);
    fill(0);
    textSize(32);
    text("LIVES: " + counter,  width / 1.33, height);
    gameOver();
    score();
  }
}


////////////////////////////////////////////////////////////////////////////////

void drawBackground() {
  background(0);
  noStroke();
  fill(#10186F);
  rect(0, 0, width, height * .55);
  fill(#9D15E3);
  rect(0, height/ 2 +  width / 30, width, height / 14);
  rect(0, height * .93, width, height / 14);
  fill(#41DE59);
  rect(0, 0, width, height / 20);
  fill(#10186F);
  rect(gW, 0, width / 10, height / 20); 
  rect(gW + width / 5, 0, width/ 10, height / 20); 
  rect(gW + width / 2.5, 0, width/ 10, height / 20);
  rect(gW +  width / 1.67, 0, width/ 10, height / 20);
  rect(gW +  width / 1.25, 0, width/ 10, height / 20);
  stroke(0);
}

void showHelp() {
  background(0);
  fill(#1FD113);
  text("Welcome to FRAWGER", width / 4, height / 6);
  drawFrogger(width / 4 -  width / 12, height / 6 - 40);
  drawFrogger(width -  width / 6, height / 6 - 40);
  drawFrogger( width / 1.33, height / 3 - width / 24);
  drawDeer( width / 1.33, height / 4 - width / 24);
  textSize(32);
  text("Press SpaceBar to START", width / 5, height - 200);
  text("Use A, S, D, W to move:",  width / 12, height / 4);
  text("Use arrow keys to move:",  width / 12, height / 3);
  fill(255);
  text("Goal: Reach the       to win!",  width / 12, height/ 2);
  text("Goal is 100pts. Highest score wins!",  width / 12, height * .60);
  noStroke();
  fill(#37792E);
  ellipse(width / 2,  width / 1.43,  width / 12,  width / 12);
  fill(0);
  triangle( width / 1.71,  width / 1.28,  width / 1.85,  width / 1.35,  width / 1.71,  width / 1.43);
}

void gameOver() {
  if (counter <= 0) {
    background(0);
    fill(255);
    textSize(42);
    text("GAME OVER", width / 3, height / 2);
    text("Press R to reset", width / 3, height / 2 +  width / 12);
    drawFrogger( width / 6,  width / 6);
  }
}

void score() {
  fill(255);
  text("SCORE: " + score, 0, height);
}

void drawFrogger(float x, float y) {       //////The frog
  noStroke();
  fill(#F9FF55);
  rect(x + width / 60, y + width / 60, width / 24, width / 24);
  rect(x + width / 40, y, width / 40, width / 60);
  fill(#4BFF00);
  rect(x, y, width / 60, width / 40);
  rect(x + width / 17, y, width / 60, width / 40);
  rect(x, y + width / 24, width / 60, width / 30);
  rect(x + width / 17, y + width / 24, width / 60, width / 30);
  rect(x + width / 60, y + width / 24, width / 60, width / 60);
  rect(x + width / 24, y + width / 24, width / 60, width / 60);
  fill(#FF12E8);
  rect(x + width / 40, y, width / 120, width / 120);
  rect(x + width / 24, y, width / 120, width / 120);
}

void drawDeer(float dx, float dy) {
  fill(#431F1F);
  beginShape();
  vertex(dx, dy + width / 29); 
  vertex(dx + width / 33, dy + width / 29);
  vertex(dx + width / 33, dy + width / 40);
  vertex(dx + width / 40, dy + width / 40);
  vertex(dx + width / 40, dy + width / 50);
  vertex(dx + width / 50, dy + width / 50);
  vertex(dx + width / 50, dy);
  vertex(dx + width / 40, dy);
  vertex(dx + width / 40, dy + width / 200);
  vertex(dx + width / 33, dy + width / 200);
  vertex(dx + width / 33, dy + width / 100);
  vertex(dx + width / 40, dy + width / 100);
  vertex(dx + width / 40, dy + width / 67);
  vertex(dx + width / 33, dy + width / 67);
  vertex(dx + width / 33, dy + width / 50);
  vertex(dx + width / 25, dy + width / 50);
  vertex(dx + width / 25, dy + width / 67);
  vertex(dx + width / 22, dy + width / 67);
  vertex(dx + width / 22, dy + width / 100);
  vertex(dx + width / 25, dy + width / 100);
  vertex(dx + width / 25, dy + width / 200);
  vertex(dx + width / 22, dy + width / 200);
  vertex(dx + width / 22, dy);
  vertex(dx + width / 20, dy);
  vertex(dx + width / 20, dy + width / 50);
  vertex(dx + width / 22, dy + width / 50);
  vertex(dx + width / 22, dy + width / 40);
  vertex(dx + width / 25, dy + width / 40);
  vertex(dx + width / 25, dy + width / 18);
  vertex(dx + width / 29, dy + width / 18);
  vertex(dx + width / 29, dy + width / 13);
  vertex(dx + width / 33, dy + width / 13);
  vertex(dx + width / 33, dy + width / 17);
  vertex(dx + width / 40, dy + width / 17);
  vertex(dx + width / 40, dy + width / 18);
  vertex(dx + width / 67, dy + width / 18);
  vertex(dx + width / 67, dy + width / 17);
  vertex(dx + width / 200, dy + width / 17);
  vertex(dx + width / 200, dy + width / 13);
  vertex(dx, dy + width / 13);
  vertex(dx, dy + width / 22);
  vertex(dx + width / 200, dy + width / 22); 
  vertex(dx + width / 200, dy + width / 25);
  vertex(dx, dy + width / 25);
  vertex(dx, dy + width / 29);
  endShape();
  fill(#FF2020);
  rect(dx + width / 32, dy + width / 35, width / 150, width / 150);
  fill(255);
  rect(dx - width / 200, dy + width / 35, width / 200, width / 200);
}

class Log {
  float logX, logY, speed;
  int logWidth, logHeight;
  PImage log;

  Log(float logYlocation) {
    logX = random(0, width);
    logY = logYlocation;
    logWidth = int((random(width / 4, width / 1.5)));
    logHeight = int(width / 10);
    speed = level;
    log = loadImage("log.jpg");
  }

  void display() {
    stroke(0);
    fill(#482A2A);
    image(log, logX, logY, logWidth, logHeight);
  }

  void moveRight() {
    if ( logX < width) {         //////move log right at speed.
      logX += speed;
    }
    else logX = - logWidth;
  }
  void moveLeft() {
    if ( logX > - logWidth) {        ////move log left at a speed.
      logX -= speed;
    }
    else logX = width;
  }

  void logRight() {
    if (x >= logX && x <= logX + logWidth && y >= logY && y <= logY + logHeight) {  ////if frog is on log, move right
      x = x + level;
    }
    if (dx >= logX && dx <= logX + logWidth && dy >= logY && dy <= logY + logHeight) {  ////if frog is on log, move right
      dx = dx + level;
    }
  }

  void logLeft() {
    if (x >= logX && x <= logX + logWidth && y >= logY && y <= logY + logHeight) {   ///if frog is on log, move left
      x = x - level;
    }
    if (dx >= logX && dx <= logX + logWidth && dy >= logY && dy <= logY + logHeight) {   ///if frog is on log, move left
      dx = dx - level;
    }
  }
  void frogDie() {
    if (x > logX + logWidth && y >= logY && y <= logY + logHeight || x < logX && y >= logY && y <= logY + logHeight || x < 0 || x > width) {   //////if frog in water or off screen, it dies.
      x = width / 85.7;
      y = height / 1.07;
      counter = counter - 1;
      player = minim.loadFile("dead.wav");
    }
    if (dx > logX + logWidth && dy >= logY && dy <= logY + logHeight || dx < logX && dy >= logY && dy <= logY + logHeight || dx < 0 || dx > width) {   //////if frog in water or off screen, it dies.
      dx = width - width / 13;
      dy = height / 1.07;
      counter = counter - 1;
      player = minim.loadFile("dead.wav");
    }
  }
}

class Car {
  float carX, carY, carWidth, carHeight, speed;
  float r, g, b;

  Car(Float carYLocation) {
    carX = random(0, width);
    carY = carYLocation;
    carWidth = random(75, width / 5);
    carHeight =  width / 12;
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    speed = level;
  }

  void display() {
    stroke(0);
    fill(r, g, b);
    rect(carX, carY, carWidth, carHeight);
    fill(100);
    rect(carX + .10 * carWidth, carY - width / 120, width / 24, width / 60); 
    rect(carX + .65 * carWidth, carY - width / 120, width / 24, width / 60);
    rect(carX + .10 * carWidth, carY + carHeight - width / 120, width / 24, width / 60);
    rect(carX + .65 * carWidth, carY + carHeight - width / 120, width / 24, width / 60);
  }

  void moveRight() {
    if ( carX < width) {
      carX += speed;
    }
    else carX = - carWidth;
  }
  void moveLeft() {
    if ( carX > - carWidth) {
      carX -= speed;
    }
    else carX = width;
  }
  void frogSplat() {
    if (x >= carX - 40 && x <= carX + carWidth && y >= carY && y <= carY + carHeight) {
      x = width / 85.7;
      y = height / 1.07;
      counter = counter - 1;
      player = minim.loadFile("dead.wav");
    }
    if (dx >= carX - width / 13 && dx <= carX + carWidth + width / 13 && dy >= carY && dy <= carY + carHeight) {
      carX = carX - level;
    }
  }
  void deerStop() {
    if (dx >= carX - width / 13 && dx <= carX + carWidth && dy >= carY && dy <= carY + carHeight) {
      carX = carX + level * 2;
    }
  }
}


class Goal {
  float goalX, goalY;

  Goal(float endX, float endY) {
    goalX = endX;
    goalY = endY;
    ellipseMode(CORNER);
  }

  void display(float g1, float g2) {
    noStroke();
    fill(#37792E);
    ellipse(goalX, goalY,  width / 12,  width / 12);
    fill(#10186F);
    triangle(goalX + width / 24, goalY + width / 24, goalX +  width / 12, goalY +  width / 12, goalX +  width / 12, goalY); 
    if (x >= goalX && x <= goalX + width / 10 && y  <= height / 20) { 
      x = width / 85.7;
      y = height / 1.07;
      player = minim.loadFile("goal.wav");
      score = score +  100;
      drawFrogger(goalX, goalY);
    }
    if (dx >= goalX && dx <= goalX + width / 10 && dy  <= height / 20) { 
      dx = width - width / 13;
      dy = height / 1.07;
      player = minim.loadFile("goal.wav");
      score = score + 100;
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT && x < width - width / 10) 
    x = x + width / 10; 
  player = minim.loadFile("jump.wav");

  if (keyCode == LEFT && x > width / 10)
    x = x - width / 10;
  player = minim.loadFile("jump.wav");

  if (keyCode == UP && y > 0)
    y = y - height / 14.85;
  player = minim.loadFile("jump.wav");

  if (keyCode == DOWN && y < height - width / 10)
    y = y + height / 14.85;
  player = minim.loadFile("jump.wav");
  /////////////////////////////////////////////
  if (key == 'd' && dx < width - width / 10) 
    dx = dx + width / 10; 
  player = minim.loadFile("jump.wav");

  if (key == 'a' && dx > width / 10)
    dx = dx - width / 10;
  player = minim.loadFile("jump.wav");

  if (key == 'w' && dy > 0)
    dy = dy - height / 14.85;
  player = minim.loadFile("jump.wav");

  if (key == 's' && dy < height - width / 10)
    dy = dy + height / 14.85;
  player = minim.loadFile("jump.wav");
  //////////////////////////////////////////

  if (key == ' ')   ///space to start game
    intro = false;

  if (key == 'r')   ///reset
    setup();
  draw();
}






