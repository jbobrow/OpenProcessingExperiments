
int mode = 0;
int radius = 10;
int enemyballradius = 10;
float x = 23;
float y = 35;
float speedBall = 25;
float speedEnemyball = 10;
float speedEnemy = 3;
int direction = 1;
//int score = 0;
float bally;
boolean move = false;

float enemyballx = 800;
float enemybally = 58;
boolean enemymove = false;




void setup() {
  size(800, 480);
  smooth();

  noCursor();
  noStroke();
}

void draw() {
  background(255);
  translate(-50, -25);

  if (mode == 0) {
    background(0);
    fill(206, 165, 110);
    textSize(85);
    text("BLOCK", 300, 240);
    textSize(60);
    text("SHOOTER", 300,300); 
    fill(101, 112, 232);
    textSize(20);
    text("-----CLICK TO START-----", 300, 330);
  }
  else if (mode == 1) {
    background(206, 165, 110);
    playGame();
  }

  if (mode == 2) {
    background(0);
    fill (101, 112, 232);
    textSize(60);
    text("YOU WIN!", 290, 290);
  }
  if (mode == 3) {
    background(0);
    fill (255, 0, 0);
    textSize(60);
    text("GAME OVER", 260, 260);
    
    text("YOU LOSE", 290, 320);
  }
}





void mousePressed() {

  if (mode == 0) {
    enemylifeX = 200;
    speedEnemy = 3;
    enemycolor = 0;
    mode = 1;
    mylifeX= 200;
    youcolor = 0;
    enemyballradius=10;
  } 
  else if (mode == 1) {
    //x = 0;
    move = true;
    enemymove = true;
  }
  if (mode == 2) {
    mode = 0;
  }
  if (mode ==3) {
    mode = 0;
  }
}


