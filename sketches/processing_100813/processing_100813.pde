
Block[] block = new Block[10000];

void setup() {
  size(400, 400);
  rectMode(CENTER);
  smooth();
  strokeWeight(2);
  for (int i = 0; i < block.length; i++) {
    if (block[i] != null) {
      block[i].init();
    }
  }
  level = .1;
  mouseX = width/2;
  frameRate(40);
}

float level;
int timer;
int blockCount;

float playerPos;
float playerSpeed;
float moveSpeed;

float scroll;
float scrollSpeed;
void draw() { 
  background(0);   
  lineEffect();
    
  makeEnemy();  
  moveEnemy();
  player();
  
  fadeEffect(); 
}

void moveEnemy() {
  stroke(0, 0, 255);
  noFill();
  playerSpeed = sqrt((sq(mouseX - width/2)))/20;
  moveSpeed+=playerSpeed/5;
  if (mouseX >= width/2) {
    for (int i = 0; i < block.length; i++) {
      if (block[i] != null) {
        block[i].setXPos(block[i].getXPos() - playerSpeed);
      }
    }
  } 
  else {
    for (int i = 0; i < block.length; i++) {
      if (block[i] != null) {
        block[i].setXPos(block[i].getXPos() + playerSpeed);
      }
    }
  }
}

void makeEnemy() {
  timer++;
  if (timer % 750 == 0) {
    level+=.1;
  }
  if (timer % 2.5 == 0) {
    block[blockCount] = new Block();
    block[blockCount].init();
    blockCount++;
  }
  for (int i = 0; i < block.length; i++) {
    if (block[i] != null) {
      block[i].make();
      block[i].move();
      block[i].check();
    }
  }
}

void player() {
  triangle(width/2, height*19/20, width/2 + 15, height - 1, width/2 - 15, height - 1);
}

void lineEffect() {
  scrollSpeed = -(mouseX - width/2)/5;
  scroll+=scrollSpeed/5;

  for (int i = -width; i < width*2; i+=25) {
    strokeWeight(1.5);
    if (i/25 % 2 == 0) {
      stroke(0, 255, 255, 127);
    } 
    else {
      stroke(0, 255, 255, 63);
    }
    line(width/2, -height, i + scroll, height);
    line(0, i, width, i);
    if (scroll >= 50 || scroll <= -50) {
      scroll = 0;
    }
    strokeWeight(3);
  }
}

void fadeEffect() {
  for (int i = 0; i <= 100; i++) {
    stroke(0, i*1.5);
    line(0, 100 - i, width, 100 - i);
  }
}

class Block {
  float xpos;
  float ypos;
  float enemySpeed;
  float ref;
  float backRef;
  float siz;

  void init() {
    xpos = random(-width*2, width*3);
  }

  void make() {
    if (mouseX >= width/2) {
      stroke(255, 0, 0);
      noFill();
      beginShape();
      vertex(xpos - siz + ref, ypos - siz - ref*3/4 - backRef);
      vertex(xpos + siz + ref, ypos - siz - ref - backRef);
      vertex(xpos + siz + ref, ypos + siz + ref - backRef);
      vertex(xpos - siz + ref, ypos + siz + ref*3/4 - backRef);
      endShape(CLOSE);

      beginShape();
      vertex(xpos - siz, ypos - siz - ref*3/4);
      vertex(xpos + siz, ypos - siz - ref);
      vertex(xpos + siz, ypos + siz + ref);
      vertex(xpos - siz, ypos + siz + ref*3/4);
      endShape(CLOSE);

      line(xpos - siz + ref, ypos - siz - ref*3/4 - backRef, xpos - siz, ypos - siz - ref*3/4);
      line(xpos + siz + ref, ypos - siz - ref - backRef, xpos + siz, ypos - siz - ref);
      line(xpos + siz + ref, ypos + siz + ref - backRef, xpos + siz, ypos + siz + ref);
      line(xpos - siz + ref, ypos + siz + ref*3/4 - backRef, xpos - siz, ypos + siz + ref*3/4);
    } 
    else {
      stroke(255, 0, 0);
      noFill();
      beginShape();
      vertex(xpos - siz - ref, ypos - siz - ref - backRef);
      vertex(xpos + siz - ref, ypos - siz - ref*3/4 - backRef);
      vertex(xpos + siz - ref, ypos + siz + ref*3/4 - backRef);
      vertex(xpos - siz - ref, ypos + siz + ref - backRef);
      endShape(CLOSE);

      beginShape();
      vertex(xpos - siz, ypos - siz - ref);
      vertex(xpos + siz, ypos - siz - ref*3/4);
      vertex(xpos + siz, ypos + siz + ref*3/4);
      vertex(xpos - siz, ypos + siz + ref);
      endShape(CLOSE);

      line(xpos - siz - ref, ypos - siz - ref - backRef, xpos - siz, ypos - siz - ref);
      line(xpos + siz - ref, ypos - siz - ref*3/4 - backRef, xpos + siz, ypos - siz - ref*3/4);
      line(xpos + siz - ref, ypos + siz + ref*3/4 - backRef, xpos + siz, ypos + siz + ref*3/4);
      line(xpos - siz - ref, ypos + siz + ref - backRef, xpos - siz, ypos + siz + ref);
    }
  }

  void move() {
    if (ypos <= height*3/2) {
      ypos+=enemySpeed;
      enemySpeed+=level;
      siz+=level + .3;
      backRef = sqrt(sq(ypos))/20;  
      ref = sqrt(sq(mouseX - width/2))/16;
    }
  }

  void check() {
    if (sqrt(sq(width/2 - xpos) + sq(height - ypos)) <= 50) {
      filter(INVERT);
    }
  }

  float getXPos() {
    return xpos;
  }

  void setXPos(float x) {
    xpos = x;
  }
}



