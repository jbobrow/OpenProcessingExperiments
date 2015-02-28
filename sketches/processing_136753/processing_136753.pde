
Camera c;
Player p;
PipeSet[] ps;
static final int NUMPIPES = 1000;
int numPipes;
static final int GAMEOVER = 1;
static final int GAME = 0;
int gameState;

void setup() {
  size(640, 640);
  initGame();
}

void draw() {
  switch(gameState) {
  case 1:
    background(251, 185, 1);
    textSize(32);
    fill(255);
    text("GAME OVER", width/2-textWidth("GAME OVER")/2, height/2-32);
    text("Hit any key to replay", width/2-textWidth("Hit any key to replay")/2, height/2+32);
    if (keyPressed) {
      initGame();
      gameState = 0;
    }
    break;
  case 0:
    drawBG();
    fill(0, 255, 0);
    translate(-c.pos.x, -c.pos.y);
    p.draw(c);
    c.draw();
    drawPipes();
    translate(c.pos.x, c.pos.y);
    drawFG();
    drawGUI();
    if (p.pos.y  > height - 120)  gameState = GAMEOVER;
    break;
  }
}


void initGame() {
  gameState = 0;
  ps = new PipeSet[NUMPIPES];
  c = new Camera();
  p = new Player();
  makePipes();
}

void drawBG() {
  background(112, 196, 206);
  fill(255);
  noStroke();
  ellipse(width/2, height-150, width+150, 100);
  fill(131, 227, 140);
  noStroke();
  ellipse(width/2, height-100, width+150, 100);
}

void drawFG() {
  fill(221, 216, 148);
  noStroke();
  rect(-20, height-100, width+50, 300);
  stroke(0);
  fill(153, 230, 90);
  rect(-20, height-110, width+50, 10);
}

void makePipes() {
  float x = 300;
  float y = random(100, 400);
  float h = random(75, 125);

  for (int i = 0; i < NUMPIPES; i++) {
    ps[i] = new PipeSet(x, y, h);
    y = random(100, 400);
    h = random(75, 125);
    x += random(200, 300);
  }
}

void drawPipes() {
  for (int i = 0; i < NUMPIPES; i++) {
    if (PVector.dist(p.pos, ps[i].pos) < 650)
      ps[i].draw();
    if (p.pos.x > ps[i].pos.x && p.pos.x < ps[i].pos.x + ps[i].bWidth && p.pos.y > ps[i].pos.y && p.pos.y < ps[i].pos.y + ps[i].bHeight)
    {
      if (!ps[i].scored)
        p.score++;
      ps[i].scored = true;
    }
    if (p.pos.x > ps[i].pos.x && p.pos.x < ps[i].pos.x + ps[i].bWidth && (p.pos.y < ps[i].pos.y || p.pos.y > ps[i].pos.y + ps[i].bHeight))
      gameState = GAMEOVER;
  }
}

void drawGUI() {
  textSize(20);
  fill(0);
  text("Distance: " + (int)(p.pos.x/100), 0, height - 40);
  text("Score: " + p.score, 0, height - 10);
}

class Camera {
  PVector pos; //Camera's position 
  //The Camera should sit in the top left of the window

  Camera() {
    pos = new PVector(0, 0);
    //You should play with the program and code to see how the staring position can be changed
  }

  void draw() {
    pos.x+=2;
  }
}

class PipeSet {
  PVector pos;
  float bHeight, bWidth;
  boolean scored;

  PipeSet(float x, float y, float h) {
    pos = new PVector(x, y);
    bHeight = h;
    bWidth = 50;
    scored = false;
  }

  void draw() {
    drawPipes();
  }

  void drawPipes() {
    fill(153, 231, 86);
    rect(pos.x, 0, 50, pos.y);
    rect(pos.x, pos.y+bHeight, 50, height);
  }
}

class Player {
  PVector pos;
  int score;

  Player() {
    score = 0;
    pos = new PVector(100, 100);
  }

  void draw(Camera c) {
    drawBird();

    if (keyPressed) {
      if (key == ' ') pos.y-=7;
    }
    pos.y += 4;
    pos.x += 2;
  }

  void drawBird() {
    fill(214, 189, 47);
    stroke(0);
    ellipse(pos.x, pos.y, 25, 20);
    fill(255);
    ellipse(pos.x+7, pos.y-3, 12, 10);
    fill(0);
    ellipse(pos.x+10, pos.y-5, 2, 2);
    fill(255, 75, 58);
    ellipse(pos.x+10, pos.y+3, 14, 4);
    ellipse(pos.x+10, pos.y+7, 14, 4);
    fill(215, 219, 186);
    ellipse(pos.x-10, pos.y, 14, 6);
  }
}



