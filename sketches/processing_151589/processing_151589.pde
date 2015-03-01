
 
PImage[] playerFrames = new PImage[8];
PImage fastRockRight;
PImage fastRockLeft;
PImage slowRockRight;
PImage slowRockLeft;
PImage title;
PImage ending;
 
Player lava;
 
ArrayList<Rock> rocks = new ArrayList();
ArrayList<Rock2> rocks2 = new ArrayList();
ArrayList<Rock3> rocks3 = new ArrayList();
ArrayList<Rock4> rocks4 = new ArrayList();
 
boolean test = false;
 
int INTRO = 1;
int RUN_GAME = 2;
int GAME_OVER = 3;
int gameState = INTRO;  
int score;
 
void setup() {
  size(800, 600);
  imageMode(CENTER);
  noCursor();
 
  ending = loadImage("ending.jpg");
  subtitleFont = createFont("PressStartK", 48);
 
  for (int i=0; i < playerFrames.length; i++) {
    String filename = "player-" + i + ".png";
    playerFrames[i] = loadImage(filename);
    println("Loading " + filename);
  }
 
  String filename = "fastRockRight.png";
  fastRockRight = loadImage(filename);
  println("Loading " + filename);
 
  String filename2 = "fastRockLeft.png";
  fastRockLeft = loadImage(filename2);
  println("Loading " + filename2);
 
  String filename3 = "slowRockRight.png";
  slowRockRight = loadImage(filename3);
  println("Loading " + filename3);
 
  String filename4 = "slowRockLeft.png";
  slowRockLeft = loadImage(filename4);
  println("Loading " + filename4);

  lava = new Player();
}
 

void draw() {
  if (gameState == INTRO) intro();
  if (gameState == RUN_GAME) run_game();
  if (gameState == GAME_OVER) game_over();
}
 
void mousePressed() {
  if (gameState == GAME_OVER || gameState == INTRO) {
    gameState = RUN_GAME;
    score = 0;
    rocks.clear();
    rocks2.clear();
    rocks3.clear();
    rocks4.clear();
  }
}
 
void intro() {
  background(249,0,124);
  textAlign(CENTER);
  
  fill(255);
  textSize(30);
  text("CLICK ANYWHERE TO START", width/2, height/2);
 
 
  textSize(20);
  fill(50);
  text("Help Lava Man avoid the rocks", width-200, height-250);
 
}
 
void game_over() {
  background(255);
  rectMode(CENTER);
 
  lava.display();
  for (Rock z : rocks) z.display();
  for (Rock2 z : rocks2) z.display();
  for (Rock3 z : rocks3) z.display();
  for (Rock4 z : rocks4) z.display();
 
  image(ending, width/2, height/2);
 
  drawScore();
}
 
void run_game() {
  noCursor();
  background(64);
  noTint(); 
 
  lava.move();
  lava.display();
 
  for (Rock z : rocks) {
    z.move();
    z.display();   
    if ( collision(z, lava) == true) {
      gameState = GAME_OVER;
    }
  }
 
  for (Rock2 z : rocks2) {
    z.move();
    z.display();   
    if ( collision2(z, lava) == true) {
      gameState = GAME_OVER;
    }
  }
 
  for (Rock3 z : rocks3) {
    z.move();
    z.display();   
    if ( collision3(z, lava) == true) {
      gameState = GAME_OVER;
    }
  }
 
  for (Rock4 z : rocks4) {
    z.move();
    z.display();   
    if ( collision4(z, lava) == true) {
      gameState = GAME_OVER;
    }
  }
 
  drawScore();
  score++;
 
  if (score % 50 == 0) rocks.add( new Rock() );
  if (score % 75 == 0) rocks2.add( new Rock2() );
  if (score % 100 == 0) rocks3.add( new Rock3() );
  if (score % 125 == 0) rocks4.add( new Rock4() );

  if (score % 500 == 0) {
    rocks.add( new Rock());
    rocks2.add( new Rock2());
    rocks3.add( new Rock3());
    rocks4.add( new Rock4());

  }
}
 

boolean collision(Rock z, Player lava) {
  float d = dist(lava.x, lava.y, z.x, z.y);
  if ( d < lava.radius + z.radius) {   
    return true;
  }
  return false;
}
 
boolean collision2(Rock2 z, Player lava) {
  float d = dist(lava.x, lava.y, z.x, z.y);
  if ( d < lava.radius + z.radius) {   
    return true;
  }
  return false;
}
 
boolean collision3(Rock3 z, Player lava) {
  float d = dist(lava.x, lava.y, z.x, z.y);
  if ( d < lava.radius + z.radius) {   
    return true;
  }
  return false;
}
 
boolean collision4(Rock z, Player lava) {
  float d = dist(lava.x, lava.y, z.x, z.y);
  if ( d < lava.radius + z.radius) {   
    return true;
  }
  return false;
}
 
void drawScore() {
  textFont(subtitleFont);
  textAlign(LEFT);
  fill(255);
  textSize(24);
  text(score, 5, 25);
}
 
class Rock {
  float x;
  float y; 
  float speedX;
  float radius;
 
  Rock() {
    speedX = 7;
    x = -10;
    y = random(50, height/2-30);
 
    radius = 30;
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(fastRockRight, 0, 0);  
 
    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }
 
    popMatrix();
  }
 
  void move() {
    x += speedX;
    x = x++;
  }
}
 
class Rock2 {
  float x;
  float y; 
  float speedX;
  float radius;
 
  Rock2() {
    speedX = 7;
    x = width+10;
    y = random(height/2+30, height-20);
 
    radius = 30;
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(fastRockLeft, 0, 0);  
 
    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }
 
    popMatrix();
  }
 
  void move() {
    x -= speedX;
    x = x--;
  }
}
 
class Rock3 {
  float x;
  float y; 
  float speedX;
  float radius;
 
  Rock3() {
    speedX = 5;
    x = -10;
    y = random(50, height/2-30);
 
    radius = 30;
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(slowRockRight, 0, 0);  
 
    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }
 
    popMatrix();
  }
 
  void move() {
    x += speedX;
    x = x++;
  }
}
 
class Rock4 {
  float x;
  float y; 
  float speedX;
  float radius;
 
  Rock4() {
    speedX = 5;
    x = width+10;
    y = random(height/2+30, height-20);
 
    radius = 30;
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    if (speedX < 0) scale(-1, 1);
    image(slowRockLeft, 0, 0);  
 
    if (test) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }
 
    popMatrix();
  }
 
  void move() {
    x -= speedX;
    x = x--;
  }
}
 

class Player {
 
  float x;
  float y;   
  float radius;
  int frame;
  int flip = 1;
 
  Player() {
    radius = 40;
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    scale(flip, 1);
    image(playerFrames[frame], 0, 0);
 
    if (test == true) {
      noFill();
      stroke(255);
      ellipse(0, 0, radius*2, radius*2);
    }
 
    popMatrix();
  }
 
  void move() {
    x = mouseX;
    y = mouseY;
    if (mouseX > pmouseX) flip = 1;
    if (mouseX < pmouseX) flip = -1;
    if (frameCount % 2 == 0) frame++;
    if (frame >= playerFrames.length) frame = 0;
  }
}




