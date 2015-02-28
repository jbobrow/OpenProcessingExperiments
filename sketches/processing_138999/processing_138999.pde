
float ballY;
ArrayList<Block> blocks;
int initialNumbOfBlocks;
int counter;
int spawnrate;
int difficulty;
int score;
boolean collision; 
boolean paused;
boolean restart;
PFont f;
float speedY = 1;
float fall_speed;
float timer;

void setup() {
  restart = false;
  score = 0; //set score to 0
  difficulty = 0; //reset difficulty
  counter = 0; //reset counter
  spawnrate = 55; //set rate that blocks spawn
  paused = false; 
  f = createFont("Arial", 50, true); // set font
  fall_speed = 2.25; //set the speed the blocks fall
  initialNumbOfBlocks = 6; //set initial number of blocks on screen
  collision = false;
  size(500, 800); //set screen size
  smooth(); 
  blocks = new ArrayList<Block>(); //create empty arraylist for blocks
  ballY = 400;
  
  //add blocks to array list
  for (int i = 0; i < initialNumbOfBlocks; i++) {
    blocks.add(new Block(color(0,0,255), random(50,450), (i * height/initialNumbOfBlocks), fall_speed));
  }
}

void draw() {
  score++; //score increases with every frame
  counter++; 
  if (paused == true) return; //if paused stop drawing
  background(255); //clear the background 
  stroke(0); //stroke is black
  fill(20, 255, 100); // fill is green
  ellipse(mouseX, ballY, 20, 20);  //frog 
  fill(255); 
  ellipse(mouseX + 5, ballY - 7, 9, 9); // eyes
  ellipse(mouseX - 5, ballY - 7, 9, 9);
  fill(0);   
  ellipse(mouseX + 5, ballY - 7, 3, 3);
  ellipse(mouseX - 5, ballY - 7, 3, 3); 
  
  
  //gravity
  if (score >= 120) { // wait 2 seconds before beginning  
    speedY = speedY + 0.5; 
    ballY = ballY + speedY;
  }

  // bounce
  if (collision == true) {
    speedY = -12.5;
    collision = false;
  }
  
  // increase difficulty
  if ((difficulty == 10) && (spawnrate <  105)) {
    spawnrate = spawnrate + 10;
    counter = 0;
    difficulty = 0;
    println(spawnrate);
  }
  

  //spawn blocks
  for (int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i);
    block.drive();
    block.display();
  }
  // decrease rate of blocks by increasing wait time (spawnrate)
  if (counter == spawnrate) {
    blocks.add(new Block(color(0,0,255), random(50,450), -10, fall_speed));
    counter = 0;
    difficulty++;
  }

  // draw boundaries
  fill(255, 0, 0);
  rectMode(CORNER);
  rect(0, 0, 500, 20);
  rect(0, height - 20, 500, 20);  
  
  // losing 
  if ((ballY <= 27) || (ballY >= height - 27)) {
    paused = true;
    background(0);
    textFont(f, 36);
    fill(255);
    text("Score: " + score, 170, 375);
    if (restart == true) {
      paused = false;
      ballY = 400;
      restart = false;
    }
      
  }
  
  //print score in top corner
  textFont(f, 36);
  fill(0);
  text("SCORE: " + score, 0, 60);
}

  // blocks
class Block {
  color c; //colour of block
  float xpos; //x co-ordinate of block
  float ypos; //y co-ordinate of block
  float yspeed; //fall speed
  float block_w; // block width
  float block_h; // block height 
  
  Block (color tempC, float tempXpos, float tempYpos, float tempYspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempYspeed;
    block_w = 100;
    block_h = 1;
  }
  
  //draw block
  void display() { 
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 100, 10);
  }
  
  // move blocks
  void drive() {
    ypos = ypos + yspeed;
    if (ypos >= height) {
      blocks.remove(this); // removes block from arraylist when reaches the bottom of the screen 
    }
     // collision detection
    if (rectCircleIntersect(xpos, ypos, block_w, block_h, mouseX, ballY, 10) == true) {
      collision = true;
    }
  } 
  
  // collision detection
  boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

    float dx = abs(cx - rx);
    float dy = abs(cy - ry);

    if ( (dx <= (rw/2 + cr)) && (dy <= (rh/2 + cr)) ) { 
      return true;
    }
    else { 
      return false;
    }
  }
}

void keyPressed() {
  switch(key) {
    case('r'): restart |= true; break;
  }
}



