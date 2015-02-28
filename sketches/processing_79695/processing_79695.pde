
Fish[] enemy = new Fish[11];
Friendly player;
boolean checkhit, gameStopped, splashScreen;
int fishHit;

int bubbles=60;
float[] bx = new float [bubbles];
float[] by = new float [bubbles];
float[] bs = new float [bubbles];
float[] bym= new float [bubbles];

PFont arialBlack, arialNarrow;
PImage treasureChest;

void setup() {
  size(600, 600);
  smooth();
  background(28, 166, 214);
  arialBlack = loadFont("Arial-Black-48.vlw");
  arialNarrow = loadFont("ArialNarrow-48.vlw");
  treasureChest = loadImage("treasureChest.gif");
  textAlign(CENTER);
  textFont(arialBlack, 48);
  for (int i=0;i<bubbles;i++) {
    bx[i]=random(width);
    by[i]=random(height);
    bs[i]=random(3, 10);
    bym[i]=random(-4, -2);
  }
  for (int i=0; i<enemy.length; i++) {
    if (i % 2 == 0)enemy[i] = new Fish(random(width+50, width+150), i*50+25, random(10), random(-6, -1));
    else enemy[i] = new Fish(random(-150, -50), i*50+25, random(10), random(1, 6));
  }
  player = new Friendly(width/2, height/2-10, 0, 0);
  splashScreen = true;
}

void draw() {
  background(28, 166, 214);
  drawBackground();
  player.display();
  
    if (splashScreen) {
    textFont(arialBlack, 72);
    fill(255);
    text("FISHY!", width/2, height/2-50);
    textFont(arialNarrow, 36);
    text("Use arrow keys to move. \n Avoid larger fish and eat smaller fish. \n Press space to start!", width/2, height/2+50);
    gameStopped = true;
    noLoop();
  }
  
  player.move();
  for (int i=0; i<enemy.length; i++) {
    enemy[i].setColor();
    enemy[i].display();
    enemy[i].move();
    if (player.x+player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x+player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y+player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y+player.s/2 <= enemy[i].y+enemy[i].s/2) {
      checkhit = true;
      fishHit = i;
    }
    else if (player.x+player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x+player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y-player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y-player.s/2 <= enemy[i].y+enemy[i].s/2) {
      checkhit = true;
      fishHit = i;
    }
    else if (player.x-player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x-player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y+player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y+player.s/2 <= enemy[i].y+enemy[i].s/2) {
      checkhit = true;
      fishHit = i;
    }
    else if (player.x-player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x-player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y-player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y-player.s/2 <= enemy[i].y+enemy[i].s/2) {
      checkhit = true;
      fishHit = i;
    }
  }
  hit();
  textFont(arialNarrow, 30);
  textAlign(CENTER);
  fill(255);
  text("Score: " + int(player.s-7), width-75, 30);
  if (player.s-7 >= 100) {
    textFont(arialBlack, 64);
    text("You Win!", width/2, height/2);
    textFont(arialNarrow, 36);
    text("press space to play again!", width/2, height/2+50);
    gameStopped = true;
    noLoop();
  }
}

void hit() {
  if (checkhit) {
    if (enemy[fishHit].s > player.s)gameOver();
    else if (enemy[fishHit].s <= player.s) {
      player.s += enemy[fishHit].s/4;
      if (fishHit % 2 == 0) {
        enemy[fishHit] = new Fish(random(width+50, width+150), fishHit*50+25, random(10), random(-6, -1));
        for (int i=0; i<enemy.length; i++) {
          if (player.x+player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x+player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y+player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y+player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else if (player.x+player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x+player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y-player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y-player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else if (player.x-player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x-player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y+player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y+player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else if (player.x-player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x-player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y-player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y-player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else checkhit = false;
        }
      }
      else {
        enemy[fishHit] = new Fish(random(-150, -50), fishHit*50+25, random(10), random(1, 6));
        for (int i=0; i<enemy.length; i++) {
          if (player.x+player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x+player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y+player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y+player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else if (player.x+player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x+player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y-player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y-player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else if (player.x-player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x-player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y+player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y+player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else if (player.x-player.s*1.25 >= enemy[i].x-enemy[i].s*1.25 && player.x-player.s*1.25 <= enemy[i].x+enemy[i].s*1.25 && player.y-player.s/2 >=enemy[i].y-enemy[i].s/2 && player.y-player.s/2 <= enemy[i].y+enemy[i].s/2) {
            checkhit = true;
            fishHit = i;
          }
          else checkhit = false;
        }
      }
    }
  }
}

void gameOver() {
  gameStopped = true;
  textAlign(CENTER);
  textFont(arialBlack, 64);
  fill(255);
  text("Game Over!", width/2, height/2);
  textFont(arialNarrow, 36);
  text("press space to try again!", width/2, height/2+50);
  noLoop();
}

void drawBackground() {
  background(28, 166, 214);
  noFill();
  strokeWeight(1);
  stroke(102, 203, 206);
  for (int i=0;i<bubbles;i++) {
    ellipse(bx[i], by[i], bs[i], bs[i]);
    by[i]+=bym[i];
    if (bs[i]<6)bx[i]+=random(-2, 2);
    else if (bs[i]>=6)bx[i]+=random(-1, 1);
    if (by[i]<-1) {
      by[i]=height+5;
    }
  }
  noStroke();
  fill(82, 71, 73);
  rect(0, 530, 600, 100);
  ellipse(30, 540, 60, 60);
  ellipse(70, 530, 65, 65);
  ellipse(120, 525, 40, 40);
  ellipse(160, 530, 50, 50);
  ellipse(200, 520, 60, 60);
  ellipse(240, 515, 55, 55);
  ellipse(275, 520, 30, 30);
  ellipse(295, 530, 40, 40);
  ellipse(310, 520, 50, 50);
  ellipse(320, 525, 30, 30);
  ellipse(343, 530, 20, 20);
  ellipse(355, 527, 40, 40);
  ellipse(375, 530, 30, 30);
  ellipse(390, 520, 50, 50);
  ellipse(425, 522, 60, 60);
  ellipse(435, 530, 40, 40);
  ellipse(465, 525, 50, 50);
  ellipse(500, 520, 40, 40);
  ellipse(530, 530, 60, 60);
  ellipse(540, 505, 30, 30);
  ellipse(560, 520, 40, 40);
  ellipse(580, 535, 50, 50);
  fill(62, 51, 53);
  rect(0, height-50, width, 50);

  strokeWeight(6);
  stroke(55, 134, 60);
  line(45, 510, 70, 420);
  fill(55, 134, 60);
  ellipse(42, 500, 10, 20);
  ellipse(70, 455, 10, 20);
  line(200, 490, 180, 425);
  line(205, 490, 200, 400);
  ellipse(184, 460, 10, 20);  
  ellipse(187, 430, 5, 10);
  ellipse(205, 410, 10, 20);
  ellipse(205, 445, 5, 15);
  line(340, 510, 307, 420);
  ellipse(340, 490, 10, 20);
  ellipse(325, 460, 5, 10);
  line(400, 500, 410, 440);
  ellipse(400, 475, 10, 20);
  fill(73, 85, 61);
  stroke(73, 85, 61);
  ellipse(570, 500, 100, 100);
  
  tint(175);
  image(treasureChest, width-100, height-100, 100, 100);
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      player.up = true;
      break;
    case DOWN:
      player.down = true;
      break;
    case LEFT:
      player.left = true;
      player.facingLeft = false;
      break;
    case RIGHT:
      player.right = true;
      player.facingLeft = true;
      break;
    }
  }
  if (gameStopped) {
    if (key == ' ') {
      checkhit = false;
      setup();
      loop();
      gameStopped = false;
      splashScreen = false;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      player.up = false;
      break;
    case DOWN:
      player.down = false;
      break;
    case LEFT:
      player.left = false;
      break;
    case RIGHT:
      player.right = false;
      break;
    }
  }
}

class Fish {

  float x, y, probability, s, mx;
  boolean facingLeft;
  color c, lightOrange, darkOrange, lightPink, darkPink, lightBlue, darkBlue, grey;

  Fish(float tx, float ty, float tp, float tmx) {
    x = tx;
    y = ty;
    probability = tp;
    mx = tmx;
    lightOrange = color(#ffc34b);
    darkOrange = color(#e89b00);
    lightPink = color(#ec7af0);
    darkPink = color(#c804cf);
    lightBlue = color(#05baee);
    darkBlue = color(#2041ce);
    grey = color(#9497a1);
    
    if(probability < 2)s = random(3, 10);
    else if(probability <= 4)s = random(3, 20);
    else if(probability <= 7)s = random(20, 30);
    else if(probability <= 8)s = random(30, 40);
    else if(probability <= 9)s = random(40, 50);
  }

  void display() {
    fill(c);
    stroke(0);
    strokeWeight(1);
    if (facingLeft) {
      triangle(x-s*1, y+s*.3, x, y-s*.2, x-s*2, y-s*.75);
      triangle(x-s*1, y-s*.2, x, y+s*.2, x-s*2, y+s*.5);
    }
    else {
      triangle(x+s*1, y+s*.3, x, y-s*.2, x+s*2, y-s*.75);
      triangle(x+s*1, y-s*.2, x, y+s*.2, x+s*2, y+s*.5);
    }
    ellipse(x, y, s*2.5, s);
    if (facingLeft) {
      fill(255);
      ellipse(x+s*.8, y-s*.1, s*.3, s*.3);
      fill(0);
      ellipse(x+s*.8, y-s*.1, s*.1, s*.1);
    }
    else {
      fill(255);
      ellipse(x-s*.8, y-s*.1, s*.3, s*.3);
      fill(0);
      ellipse(x-s*.8, y-s*.1, s*.1, s*.1);
    }
  }
  
  void move(){
    x+=mx;
    if(x <= -100){
      mx = abs(mx);
      s = random(5, 50);
    }
    if(x >= width+100){
      mx = (abs(mx))*-1;
      s = random(5, 50);
    }
    if(s >= 40)mx = constrain(mx, -3, 3);
  }
  
  //MAKE SURE THIS IS BEFORE DISPLAY() IN DRAW()! IT SETS COLOR
  void setColor() {
    if(mx > 0)facingLeft = true;
    if(mx <=0)facingLeft = false;
    if (s <= 10)c = color(lightOrange);
    else if (s <= 20)c = color(darkOrange);
    else if (s <= 25)c = color(lightPink);
    else if (s <= 30)c = color(darkPink);
    else if (s <= 35)c = color(lightBlue);
    else if (s <= 40)c = color(darkBlue);
    else c = color(grey);
  }
}
class Friendly extends Fish {

  boolean up, down, left, right;
  float my;

  Friendly(float tx, float ty, float ts, float tmx) {
    super(tx, ty, ts, tmx);
    s = 7;
    c = color(#ff8000);
  }

  void display() {
    super.display();
  }

  void move() {
    x += mx;
    y += my;
    if(x <= 0){
      x = 0;
      mx *= -.5;
    }
    if(x >= width){
      x = width;
      mx *= -.5;
    }
    if(y <= 0){
      y = 0;
      my *= -.5;
    }
    if(y >= height-50){
      y = height-50;
      my *= -.5;
    }
    mx = constrain(mx, -10, 10);
    my = constrain(my, -10, 10);
    if (up)my-=.2;
    if (down)my+=.2;
    if (left)mx-=.2;
    if (right)mx+=.2;
    if (!up && !down)my*=.95;
    if (!left && !right)mx*=.95;
  }
}



