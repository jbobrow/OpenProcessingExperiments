
Triangle[] tri = new Triangle[10000];
int triCount = 0;
int timer;
float speed = 50;
int score;
float sg;
float sb;
boolean go = true;
PGraphics player;

void setup() {
  size(400, 400);
  sg = 255;
  sb = 255;
  mouseX = width/2;
  mouseY = height/2;
  player = createGraphics(width, height);
  smooth();
  noCursor();

  for (int i = 0; i < tri.length; i++) {
    if (tri[i] != null) {
      tri[i].setup();
    }
  }
}

void draw() {
  background(0);
  player.background(0);
  player.beginDraw();
  player.stroke(255, 0, 0);
  player.strokeWeight(width/80);
  player.point(mouseX, mouseY);
  player.endDraw();
  image(player, 0, 0);

  if (go) {
    timer++;
    if (timer % speed*2/3 == 0) {
      tri[triCount] = new Triangle();
      tri[triCount].setup();
      triCount++;
      if (speed >= 3) {
        speed-=.5;
      }
      score++;
    }
    for (int i = 0; i < tri.length; i++) {
      if (tri[i] != null) {
        tri[i].make();
        tri[i].move();
      }
    }
  }

  if (go == false) {
    for (int i = 0; i < tri.length; i++) {
      if (tri[i] != null) {
        tri[i].clear();
      }
    }
    speed = 50;
    timer = 0;
    fill(0);
    rectMode(CORNER);
    rect(width/2, height*3/4, width/2, height/2);
    stroke(127);
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2 - 5, width*5/8, height/20);
    fill(0, 0, 255);
    textSize(30);
    text("score : " + score, width/2, height/2 - height/5);
    fill(255);
    textSize(15);
    text("press any key to restart", width/2, height/2);
    noStroke();
    sg = 0;
    sb = 0;
  }
  
  loadPixels();
  if (pixels[mouseY*width+mouseX] == color(200)) {
    go = false;
  }

  fill(0, sg, sb);
  textAlign(CENTER);
  textSize(15);
  text("score : " + score, width - width/5, height - height/20);
  fill(0, 0, sb);
  text("score : " + score, width - width/5 + 1, height - height/20);
  text("score : " + score, width - width/5 - 1, height - height/20);  
  fill(200);
}

void keyPressed() {
  if (go == false) {
    go = true;
    score = 0;
    sg = 255;
    sb = 255;
  }
}

class Triangle {
  float xpos;
  float ypos = 0;
  float siz = width/20;

  void setup() {
    xpos = (random(siz, width - siz));
  }

  void make() {
    triangle(xpos, ypos + siz, xpos - siz, ypos, xpos + siz, ypos);
  }

  void move() {
    if (ypos <= height*3/2) {
      ypos+=height/266.66;
      siz+=siz/250;
    }
  }

  void clear() {
    ypos = height*2;
  }
}



