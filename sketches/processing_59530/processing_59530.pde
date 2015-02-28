

PFont titleFont = createFont("Impact", 48);
PFont scoreFont = createFont("14Segment", 24);
PFont basicFont = createFont("Courier", 18);

int INTRO     = 0;
int RUN_GAME  = 1;
int GAME_OVER = 2;

int gameState = INTRO;

Player player;

Ball balls[] = new Ball[1];
PImage back;
PImage first;
PImage over;
int score = 0;

void setup() {
  size(500, 500); 
  smooth();

  player = new Player();

  for (int i=0; i< balls.length; i ++) {


    balls[i]= new Ball();
    first = loadImage("first.jpg"); 
    back = loadImage("back.jpg");
    over = loadImage("over.jpg");
  }
}

void draw() {
  if (gameState == INTRO) {
    intro();
  }
  else if (gameState == RUN_GAME) {
    run_game();
  }
  else if (gameState == GAME_OVER) {
    game_over();
  }
}

void intro() {
  imageMode(CENTER);
  image (first, width/2, height/2, 500, 500);
}


void run_game() {
  imageMode(CENTER);
  image (back, width/2, height/2);

  for (int i=0; i < balls.length; i++) {
    balls[i].fall();
    balls[i].display();
  }

  player.move();
  player.display();

  show_score(); 

  score++;

  if ( score % 100 == 0 ) { 
    Ball newEnemy = new Ball();
    balls = (Ball[])append(balls, newEnemy);
  }
}

void game_over() {

  image (over, width/2, height/2, 500, 500);
  // draw the balls and the player, but don't move them
  for (int i=0; i < balls.length; i++) {
    balls[i].display();
  }
  player.display();


  show_score();
}


void show_score() {
  // draw the score
  fill(0);
  textFont(scoreFont);
  text(score, 410, 30);
}


void mousePressed() {
  if (gameState == GAME_OVER || gameState == INTRO) {
    gameState = RUN_GAME;
    score = 0;
    balls[0] = new Ball();
  }
}


boolean intersect(float x1, float y1, float d1, 
float x2, float y2, float d2 ) {
  float d = dist(x1, y1, x2, y2);
  if ( d < (d1/2 + d2/2) ) return true; 
  else return false;
}


class Ball {


  float x;
  float y;
  float speed;
  float diameter;
  float gravity= 0.1;


  // cosntructor

  Ball() {

    x = random(width);
    y= -10;

    speed= random(5, 12);
    diameter= map (speed, 0.1, 1, 1, 15);
  }

  void display() {
    fill(50, 100, 150);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
    if (y > 500) gameState= GAME_OVER;
  }

  void fall() {
    x+=0;
    y+=speed;



    for (int i=0; i < balls.length; i++) {

      if (intersect(player.x, player.y, player.diameter, 
      balls[i].x, balls[i].y, balls[i].diameter)) {
        speed= 0;
        y=-1000000;
      }
    }
  }
}




class Player {
  float x;
  float y;
  float diameter;
  color c;

  Player() {
    diameter = 50;
    c = color(255);
  } 

  void move() {
    x = mouseX;
    y = mouseY;
  }

  void display() {
    fill(c);
    stroke(0);
    ellipse(x, y, diameter, diameter);
  }
}



