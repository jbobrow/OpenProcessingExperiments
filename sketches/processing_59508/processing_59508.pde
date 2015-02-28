
// Niko Victorino, Océane Tran, David Doodnauth
//References go to all bouchard's lectures/examples, as well as minnim examples
// Underwater Escapade  
// VARIABLES 
//[snip java]
import ddf.minim.*;

Minim minim;
AudioPlayer in;
int loopcount;
Player player; 
Fish fishs[] = new Fish[1];
PowerUp powerUp;
PowerUp2 powerup2;

// something to keep track of what screen we're in / game stage 

int INTRO = 1;
int GAME = 2;
int GAMEOVER = 3;

int gameStage = INTRO;  // 1= intro, 2= game, 3= game over 

PFont titleFont;
PFont basicFont; 
PFont scoreFont; 

int score = 0; 
PImage star;
PImage water;
PImage goldeen; 
PImage kelp; 
///////////////////////////////////////////////////////////////////////////
// SETUP
void setup() {
  size(640, 400);
  minim = new Minim(this);
  in = minim.loadFile("underwater.mp3");
  
   
  in.play();
  in.loop(100);
 loopcount = 100;
   
 
  smooth();
  player = new Player();   // create the player object
  powerUp = new PowerUp();
  powerup2 = new PowerUp2();

  for (int i=0; i < fishs.length; i++) {
    fishs[i] = new Fish(); // create all the Fish objects
  }

  titleFont = createFont("Impact", 48);
  basicFont = createFont("Courier", 14); 
  scoreFont = createFont("14Segment", 14);

  goldeen = loadImage("goldeen.png");
  water = loadImage("water.jpg");
  star =loadImage("star.png"); 
  kelp = loadImage("kelp.png");
}

// DRAW 
void draw() {
  if (gameStage == INTRO) intro(); 
  if (gameStage == GAME) runGame();  
  if (gameStage == GAMEOVER) gameOver();
}

/////////////////////////////////////////////////////////////////////////////////
void intro() {
  background(34, 142, 242);
  fill(255);
  textAlign(CENTER); 
  textFont(titleFont); 
  text("Underwater Escapade", width/2, height/2); 
  textFont(basicFont); 
  text("Dodge fish and collect kelp! Some Kelp will help you, some will hinder you.", width/2, height/3*2);
  text("Click to start", width/2, height/4);
}

/////////////////////////////////////////////////////////////////////////////////
// The main game code 
void runGame() {
  background(water);
  
  

  if (powerup2.active == true) {
   
    Fish newEnemy = new Fish(); // Oh no! You ate the large kelp! You greedy thing. 2 More fish appear.
     Fish newEnemy2 = new Fish();
  } 
  else {  
    //nothing
  }

  if (powerUp.active == true) {
 
    player.diameter =20; //Indulging in the smaller Kelp will shrink you temporarily
  }
  else {
    player.diameter = 50;
  } 


  player.move();
  player.display();
  for (int i=0; i < fishs.length; i++) {
    fishs[i].move();
    fishs[i].display();  
    // check for collisions with the player
    if ( overlap(player.x, player.y, player.diameter/3, 
    fishs[i].x, fishs[i].y, fishs[i].diameter/3) ) {
      // game over!
      gameStage = GAMEOVER;
    }
  }

  // score drawing
  drawScore(); 

  score++;

  if ( score % 100 == 0 ) { 
    Fish newEnemy = new Fish(); // make a new object 
    fishs = (Fish[])append(fishs, newEnemy); // adds an object to an array
  }

  // update and show the powerUp if it is available
  powerUp.update();
  if (powerUp.available) {
    powerUp.display();
    // check for collisions with the powerup
    if (overlap(player.x, player.y, player.diameter/3, 
    powerUp.x, powerUp.y, powerUp.diameter/3) == true) {
      powerUp.activate();
    }

    powerup2.update();
    if (powerup2.available) {
      powerup2.display();
      // check for collisions with the powerup
      if (overlap(player.x, player.y, player.diameter/3, 
      powerup2.x, powerup2.y, powerup2.diameter/3) == true) {
        powerup2.activate();
      }
    }
  }
}
/////////////////////////////////////////////////////////////////////////////////
void gameOver() {
  background(#3E769B);


  fill(255); 
  textFont(titleFont); 
  textAlign(CENTER);
  text("GAME OVER! x_x", width/2, height/2);

  drawScore();
}

/////////////////////////////////////////////////////////////////////////////////
void drawScore() {
  // draw the score 
  textAlign(LEFT); 
  fill(0); 
  textFont(scoreFont); 
  text("Score: " + score, 20, 20);
}

/////////////////////////////////////////////////////////////////////////////////
void mousePressed() {

  if (gameStage == GAMEOVER || gameStage == INTRO) {
    gameStage = GAME;
    score = 0; // "reset" the score 
    fishs = new Fish[1]; 
    fishs[0] = new Fish(); 
    powerUp.reset();
  }
}

void stop()
{

in.close();

minim.stop();

super.stop();
}
//[/snip]

// our collision detection test (thank you bouchard for poasting this via interwebs)
boolean overlap(float x1, float y1, float r1, float x2, float y2, float r2) {
  float d = dist(x1, y1, x2, y2);
  if ( d < (r1+r2) ) return true;
  return false;
}



