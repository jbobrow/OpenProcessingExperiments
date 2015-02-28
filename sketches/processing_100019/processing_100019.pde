
import ddf.minim.*;

Minim minim;
AudioPlayer planeNoise;
AudioPlayer loseNoise;
PImage plane;
PImage rocky;
boolean gameStart = false;
boolean loseGame = false;
int distance = 0;
int rockTrack;
int planeX = -5;
int planeY = 200;
int rockX = 500;
int rockY = 50;
int maxScore = 0;
float move = 0.6;
ArrayList<Rock> rockSolid = new ArrayList<Rock>();

void setup() {
  size(700, 500);
  minim = new Minim(this);
  planeNoise = minim.loadFile("sound.wav");
  loseNoise = minim.loadFile("lose.wav");
  plane = loadImage("plane.png");
  rocky = loadImage("rock.png");
  smooth();
  frameRate(60);
}

void draw() {
  if (gameStart == false && loseGame == false) {
    welcome();
  }
  else if (gameStart == true && loseGame == false) {
    gamePlay();
  }
  else if (gameStart == false && loseGame == true) {
    gameOver();
  }
}

void welcome() {
  background(135, 206, 250);
  rect(0, 0, width, 70);
  rect(0, 430, width, 70);
  stroke(0);
  fill(0);
  textSize(40);
  text("WELCOME!", 250, 150);
  textSize(15);
  text("DIRECTIONS: AVOID INCOMING ROCKS USING THE SPACEBAR TO CONTROL THE PLANE!", 40, 200);
  line(150, 360, 540, 360);
  line(150, 420, 540, 420);
  line(150, 360, 150, 420);
  line(540, 420, 540, 360);
  textSize(25);
  text("PRESS SPACEBAR TO BEGIN!", 160, 400);
  image(plane, 220, planeY);
  image(rocky, 130, -25 );
  if (keyPressed) {
    if (key == ' ') {
      gameStart = true;
    }
  }
}

void gamePlay() {
  planeNoise.play();
  
  if(distance % 4902 == 0) {
    planeNoise.rewind();
  }  
   
  background(135, 206, 250);
  rect(0, 0, width, 70);
  rect(0, 430, width, 70);
  stroke(0);
  fill(0);
  image(plane, planeX, planeY);
  textSize(10);
  text(distance, 10, 100);
  distance += 3;
  frameRate(60); 
  
  
  
  if (distance % 150 ==0) {
    for (int i = 0; i < 1; i++) {
      Rock r = new Rock(rockTrack);
      rockSolid.add(r);
    }
  }  
 
  for (Rock theRock : rockSolid) {
    if ( distance % 243 == 0 && (Math.abs(planeY - theRock.getRockY() - 165)) <= 2) {
      loseGame = true;
      gameStart = false;
      planeY = 200;
      rockX = 500; 
    }   
    theRock.generate();    
  }
  
  
  if (keyPressed) {
    if (key == ' ') {
      planeY -= 5;
      frameRate(60);
    }
  }
  else planeY+=5;


  if (planeY <= 0 || planeY >= 345) {
    loseGame = true;
    gameStart = false;
    planeY = 200;
    rockX = 500;
  }
   
  if (keyPressed) {
    if (key != ' ' && key != 'r') {
      loseGame = true;
      gameStart = false;
      planeY = 200;
      rockX = 500;
    }
  }
}  

void gameOver() {
  planeNoise.pause();
  planeNoise.rewind();
  loseNoise.play();
 
  background(135, 206, 250);
  rect(0, 0, width, 70);
  image(plane, 220, 165);
  image(rocky, 130, -60);
  rect(0, 430, width, 70);
  stroke(0);
  textSize(40);
  text("GAME OVER!", 240, 150);
  textSize(20);
  text("DISTANCE TRAVELED: " + distance, 225, 200);
  if (distance > maxScore) {
    maxScore = distance;
  } 
  text("YOUR BEST: " + maxScore, 270, 300);
  line(145, 360, 565, 360);
  line(145, 420, 565, 420);
  line(145, 360, 145, 420);
  line(565, 420, 565, 360);
  textSize(28);
  text("PRESS 'R' TO RESTART!", 205, 400);

  if (keyPressed) {
    if (key == 'r') {
      gameStart = true;
      loseGame = false;
      loseNoise.pause();
      loseNoise.rewind();
    }
  }

  if (gameStart == true) 
    distance = 0;
}

class Rock {
  PImage rocks;
  float rockX;
  float rockY;

  Rock(float x) {
    rocks = loadImage("rock.png");
    rockX = x;
    rockY = random(height-700);
  }

  void generate() {
    rockX = rockX - 30 * move;
    image(rocks, rockX+440, rockY);
  }
  
  float getRockX() {
    return rockX;
  }
  
  float getRockY() {
    return rockY;
  }  
}


