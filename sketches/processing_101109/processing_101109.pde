
Gui gui;
Beetles[] beetle;
Snakes[] snake;
Frogs[] frog;
DogBones [] dbone;
Carrots [] carrot;

PShape a;//banana
PShape b;//mushroom
PShape bo; //bones
PShape e; //gameoverscreen
PShape f; //winscreen
PShape fr; //frogs
PShape str; //strawberry
PShape ap; //apples
PShape sn; // snakes
PShape bu; //bunnies
PShape bi; //bird
PShape cu; //cucumber
PShape gr; //grapes
PShape be; //beetle
PShape ca; //carrot
int winX;//winscreen
int winY;
int goX; //gameoverscreen
int goY;
int cX = 200; //start button
int cY = 200;

int nsX = 300; //next level
int nsY = 400; 

PImage startscreen;
PImage img; //background to game
Animation animation1, animation2, animation3, animation4, animation5;

float xpos = 100; //character
float ypos = 100;
float bx; //map
float by;
float speed = 3; 


int boradius = 200; //bones
float bonesspeed = 0.5;

int savedTime;
int timer1 = 3000;

float x = 255;
float y = 255;

float banX = 300; //banana
float banY = 300;
float mX = 200; // mushroom
float mY = 200;
float frX = 300; //frog
float frY = 300;
float boX = 400; //bones
float boY = 400;
float buX = 400; //bunny
float buY = 440;
float snX = 100; //snakes
float snY = 400;
float apX = 100; //apples
float apY = 300;
float strX = 200; //strawberry
float strY = 330;
float beX = 100; //beetle
float beY = 100;
float biX = 200; //bird
float biY = 100;
float cuX = 100; //cucumber
float cuY = 400;
float grX = 100; //grapes
float grY = 200;
float caX = 100; //carrot
float caY = 200;


int health = 5;
int goodfood = 0;


float enemyEasing = .015;

float characterspeed = 6; 

int level = 0;

void setup() {
  size(500, 600);
  textFont(createFont("File", 50));
  PShape beetleShape = loadShape("beetle.svg");
  PShape frogShape = loadShape("frog.svg");
  PShape snakeShape = loadShape("snake.svg");
  PShape dboneShape = loadShape("bone.svg");
  PShape carrotShape = loadShape("carrot.svg");
  beetle = new Beetles[5];
   for (int i = 0; i < beetle.length; i ++) {
    float x = random(width);
    float y = random(height);
    beetle[i] = new Beetles(beetleShape, x, y);
  }
  frog = new Frogs[5];
   for (int i = 0; i < frog.length; i ++) {
    float x = random(width);
    float y = random(height);
    frog[i] = new Frogs(frogShape, x, y);
  }
  snake = new Snakes[5];
   for (int i = 0; i < snake.length; i ++) {
    float x = random(width);
    float y = random(height);
    snake[i] = new Snakes(snakeShape, x, y);
  }
  dbone = new DogBones[5];
   for (int i = 0; i < dbone.length; i ++) {
    float x = random(width);
    float y = random(height);
    dbone[i] = new DogBones(dboneShape, x, y);
  }
  carrot = new Carrots[5];
   for (int i = 0; i < carrot.length; i ++) {
    float x = random(width);
    float y = random(height);
    carrot[i] = new Carrots(carrotShape, x, y);
  }

  noStroke();
  gui = new Gui();
  startscreen = loadImage("MGstartscreenbox.png");
  savedTime = millis();
  a = loadShape("banana.svg");
  b = loadShape("mushroom.svg");
  bo = loadShape("bone.svg");

  e = loadShape("MGgameover.svg");
  f = loadShape("MGwin.svg");
  fr = loadShape("frog.svg");
  bu = loadShape("bunny.svg");
  ap = loadShape("apple.svg");
  sn = loadShape("snake.svg");
  str = loadShape("strawberry.svg");
  be = loadShape("beetle.svg");
  bi = loadShape("bird.svg");
  gr = loadShape("grapes.svg");
  cu = loadShape("cuc.svg");
  ca = loadShape("carrot.svg");



  img = loadImage("MGbgeight13.png");
  animation1 = new Animation("up", 2);
  animation2 = new Animation("left", 2);
  animation3 = new Animation("right", 2);
  animation4 = new Animation("down", 4);
  animation5 = new Animation("restFrame", 2);
}

void draw() {
  smooth();
  background(255);
  levelUp();
  println(level);
  
  
  
  
  
}

void frogs() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    frX = random(500);
    frY = random(500);
    savedTime = millis();
  }
  shape(fr, frX, frY, 40, 40);
}


void banana() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    banX = random(500);
    banY = random(500);
    savedTime = millis();
  }
  shape(a, banX, banY, 40, 40);
}

void mushroom() {
  int passedTime = millis() -savedTime;
  if (passedTime > timer1) {
    mX = random(500);
    mY = random(500);
    savedTime = millis();
  }
  shape(b, mX, mY, 30, 30);
} 

void bunny() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    buX = random(500);
    buY = random(500);
    savedTime = millis();
  }
  shape(bu, buX, buY, 40, 40);
}
void strawberry() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    strX = random(500);
    strY = random(500);
    savedTime = millis();
  }
  shape(str, strX, strY, 50, 50);
}

void apples() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    apX = random(500);
    apY = random(500);
    savedTime = millis();
  }
  shape(ap, apX, apY, 50, 50);
}


void bird() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    biX = random(500);
    biY = random(500);
    savedTime = millis();
  }
  shape(bi, biX, biY, 60, 60);
}

void cuc() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    cuX = random(500);
    cuY = random(500);
    savedTime = millis();
  }
  shape(cu, cuX, cuY, 60, 60);
}

void grapes() {
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    grX = random(500);
    grY = random(500);
    savedTime = millis();
  }
  shape(gr, grX, grY, 60, 60);
}



void character() {
  if (keyPressed) {
    if (keyCode == UP) {
      animation1.display(xpos, ypos);
      if (by <= -3) {
        by += speed;
      }
      else {
        by = by;
        ypos -= speed;
      }
    } 
    else if (keyCode == LEFT) {
      animation2.display(xpos, ypos);
      if (bx <= -3) {
        bx += speed;
      }
      else {
        bx = bx;
        xpos -= speed;
      }
    }
    else if (keyCode == RIGHT) {
      animation3.display(xpos, ypos);
      if (bx >= -255) {
        bx -= speed;
      }
      else {
        bx = bx;
        xpos += speed;
      }
    }
    else if (keyCode == DOWN) {
      animation4.display(xpos, ypos);
      if (by >= -173) {
        by -= speed;
      }
      else {
        by = by;
        ypos += speed;
      }
    }
  }
  else {
    animation5.display(xpos, ypos);
  }
}



void eat() {
  float distBan = dist(xpos, ypos, banX, banY); //bananas
  float distMush = dist(xpos, ypos, mX, mY); //mushrooms
  float distBun = dist(xpos, ypos, buX, buY); //bunny
  float distAp = dist(xpos, ypos, apX, apY); //apples
  float distSt = dist(xpos, ypos, strX, strY); //strawberry
  float distCu = dist(xpos, ypos, cuX, cuY); //cuc
  float distBi = dist(xpos, ypos, biX, biY); //bird
  float distGr = dist(xpos, ypos, grX, grY); //grapes
  float distCa = dist(xpos, ypos, caX, caY); //grapes
  
 
  
  if (distBan < 50) {
    banX = random(500);
    banY = random(500);
    gui.goodfood += 1;
  }

  if (distMush < 20) {
    mX = random(500);
    mY = random(500);
    gui.health -= 1;
  }

  if (distSt < 50) {
    strX = random(500);
    strY = random(500);
    gui.goodfood += 1;
  }
  if (distAp < 50) {
    apX = random(500);
    apY = random(500);
    gui.goodfood += 1;
  }

  if (distBun < 50) {
    buX = random(500);
    buY = random(500);
    gui.health -= 1;
  }
  if (distGr < 30) {
    grX = random(500);
    grY = random(500);
    gui.health -= 1;
  }
  if (distCu < 50) {
    cuX = random(500);
    cuY = random(500);
    gui.goodfood += 1;
  }
  if (distCa < 50) {
    caX = random(500);
    caY = random(500);
    gui.goodfood += 1;
  }

  if (distBi < 50) {
    biX = random(500);
    biY = random(500);
    gui.health -= 1;
  }
  if (gui.health <= 0) {
    level = -1;
  }
  
}




void firstlevel() {
  noCursor();
  image(img, bx, by);
  banana();
  mushroom();
  character();
  eat();
  for (int i = 0; i < dbone.length; i ++) {
    dbone[i].display();
    dbone[i].eat();
  }
  for (int i = 0; i < frog.length; i ++) {
    frog[i].update();
    frog[i].display();
    frog[i].eat();
  }
  gui.levelGui();
  
}


void secondlevel() {
  noCursor();
  image(img, bx, by);
  bunny();
  apples();
  strawberry();
  character();
  eat();
  for (int i = 0; i < snake.length; i ++) {
    snake[i].update();
    snake[i].display();
    snake[i].eat();
  }
  gui.levelGui();
}

  void thirdlevel() {
    noCursor();
    image(img, bx, by);
    cuc();
    bird();
    grapes();
    character();
    eat();
    for (int i = 0; i < beetle.length; i ++) {
    beetle[i].update();
    beetle[i].display();
    beetle[i].eat();
  }
  for (int i = 0; i < carrot.length; i ++) {
    carrot[i].display();
    carrot[i].eat();
  }
    gui.levelGui();
  } 



  void levelUp() {

    if (level == 0) {
      gui.startMenu();
    }
    if (level == 1) {
      firstlevel();
    }
    if (level == -1) {
      gui.gameOver();
    }
      
    if (level == 2) {
      secondlevel();
    }

    if (level == 3) {
      thirdlevel();
    }
    
  if(gui.goodfood == 6) {
    level = 2;
  }
  if(gui.goodfood == 11) {
    level = 3;
  }
  if(gui.goodfood == 16) {
    gui.win();
  }

  }










class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
class Beetles { 
  float bxpos;
  float bypos;
  float angle;
  PShape beetleShape;
  float yoffset = 0.0;

  Beetles (PShape shape, float tempX, float tempY) {
    beetleShape = shape;
    bxpos = tempX;
    bypos = tempY;
    angle = random(0, TWO_PI);
  }
 
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  
  void display() {
    shape(beetleShape, bxpos, bypos + yoffset);
  }

  void eat () {
    float distBeetles = dist(xpos, ypos, bxpos, bypos); //beetle array
    if (distBeetles < 50) {
      bxpos = random(500);
      bypos = random(500);
      gui.health -= 1;
    }
  }
}


class Carrots { 
  float cxpos;
  float cypos;
 
  PShape carrotShape;
  
  int cradius = 200; //bones
  float cspeed = 0.5;

  
  Carrots (PShape shape, float tempX, float tempY) {
    carrotShape = shape;
    cxpos = tempX;
    cypos = tempY;
    
  }
  

  
  void display() {
    cxpos += cspeed;
  if (cxpos >width + cradius) {
      cxpos = -cradius;
    }
  shape(carrotShape, cxpos, cradius, 40, 40);
  }

  void eat () {
    float distC = dist(xpos, ypos, cxpos, cradius); //beetle array
    if (distC < 50) {
      cxpos = random(500);
      cradius = int(random(500));
      gui.goodfood += 1;
    }
  }
}
class DogBones { 
  float dbxpos;
  float dbypos;
 
  PShape dboneShape;
  
  int dbradius = 200; //bones
  float dbspeed = 0.5;


  DogBones (PShape shape, float tempX, float tempY) {
    dboneShape = shape;
    dbxpos = tempX;
    dbypos = tempY;
    
  }
  

  
  void display() {
    dbxpos += dbspeed;
  if (dbxpos >width + dbradius) {
      dbxpos = -dbradius;
    }
  shape(dboneShape, dbxpos, dbradius, 40, 40);
  }

  void eat () {
    float distDB = dist(xpos, ypos, dbxpos, dbradius); //beetle array
    if (distDB < 50) {
      dbxpos = random(500);
      dbradius = int(random(500));
      gui.goodfood += 1;
    }
  }
}
class Frogs { 
  float frxpos;
  float frypos;
  float angle;
  PShape frogShape;
  float yoffset = 0.0;

  
  Frogs (PShape shape, float tempX, float tempY) {
    frogShape = shape;
    frxpos = tempX;
    frypos = tempY;
    angle = random(0, TWO_PI);
  }
  
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  
  void display() {
    shape(frogShape, frxpos, frypos + yoffset);
  }

  void eat () {
    float distFrog = dist(xpos, ypos, frxpos, frypos); //beetle array
    if (distFrog < 50) {
      frxpos = random(500);
      frypos = random(500);
      gui.health -= 1;
    }
  }
}
class Gui {
  float sX = 195; //press start
  float sY = 520;
  float tryX = 200; //try again
  float tryY = 375;
  int goodfood = 0;
  int health = 5;
  int levelValue;
  int ssX; //start screen Image
  int ssY;

  

  Gui() {
  }

  void startMenu() {
    cursor();
    
    image(startscreen, ssX, ssY);
    fill(0);
    textSize(50);
    strokeWeight(2);
    textSize(30);
    text("START", sX, sY);
    float pStart = dist(mouseX, mouseY, sX, sY);
    if (mousePressed && pStart <= 100) {
      gui.health = 5;
      gui.goodfood = 0;
      level = 1;
      gui.levelValue = 1;
    }
  }
 
  void levelGui() {
    textSize(20);
    textAlign(LEFT, TOP);
    fill(#C6343E);
    text("DANGER = " + health, 30, 30);
    fill(#57DE77);
    text("GOODFOOD= " + goodfood, 30, 60);
    
    if (health <= 0) {
      level = -1;
    }
  }


  void win() {
    //  textAlign(CENTER, CENTER);
    cursor();
    level = 11;
    shape(f, winX, winY, 500, 600);
    fill(0);
    textSize(30);
    text("YOU WIN!", 50, 25);
    textSize(18);
    text("Thanks for the bee costume!", 50, 100);
    textSize(18);
    text("PLAY AGAIN", nsX, nsY);
    float nextpStart = dist(mouseX, mouseY, nsX, nsY);
    if (mousePressed && nextpStart <= 50) {
      health = 5;
      goodfood = 0;
      level = 1;
    }
  }

  void gameOver() {
    cursor();
    shape(e, goX, goY, 500, 600);
    fill(0);
    textSize(30);
    text("GAME OVER", 100, 25);
    textSize(40);
    text("OUCH!", 200, 250);
    textSize(25);
    text("My tummy hurts!", 200, 300);
    textSize(40);
    text("TRY AGAIN", tryX, tryY);
    float tryAgain = dist(mouseX, mouseY, tryX, tryY);
    if (mousePressed && tryAgain <= 100) {
      gui.health = 5;
      gui.goodfood = 0;
      gui.levelValue = 1;
      level = 1;
    }
  }
}

class Snakes { 
  float snxpos;
  float snypos;
  float angle;
  PShape snakeShape;
  float yoffset = 0.0;

 
  Snakes (PShape shape, float tempX, float tempY) {
    snakeShape = shape;
    snxpos = tempX;
    snypos = tempY;
    angle = random(0, TWO_PI);
  }
  
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  
  void display() {
    shape(snakeShape, snxpos, snypos + yoffset);
  }

  void eat () {
    float distSn = dist(xpos, ypos, snxpos, snypos); //beetle array
    if (distSn < 50) {
      snxpos = random(500);
      snypos = random(500);
      gui.health -= 1;
    }
  }
}


