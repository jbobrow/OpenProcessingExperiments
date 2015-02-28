


//CIRCLE VARIABLES
float circleX;
float circleY;
float xVel;
float yVel;
float gravity;
float circleSize;
int circleRot;
float resetyVel;

//BLOCK VARIABLES
ArrayList blockList;
float difficulty;

//OTHER VARIABLES
int topandbottom;
int count;
int highScore;
boolean gameRunning;
boolean collision;
PFont font;
boolean start;

//IMAGES
PImage illustrator;
PImage processing;
PImage html5;
PImage bridge;
PImage title;
PImage retry;

void setup() {
  //VARIOUS SET-UP FUNCTIONS
  size(640, 480, P3D);
  //smooth();
  colorMode(HSB, 360);
  font = createFont("Arial", 18);
  textFont(font, 18);

  //INITIALIZE VARIABLES
  circleX = width/2;
  circleY = height/2;
  xVel = 0;
  yVel = 5;
  resetyVel = yVel;
  gravity = .3;
  circleRot = 0;
  circleSize = 60;

  blockList = new ArrayList();
  difficulty = 45;

  count = 0;
  highScore = 0;
  topandbottom = 32;
  gameRunning = false;
  collision = false;
  start = true;

  illustrator = loadImage("illustrator.gif");
  processing = loadImage("processing.gif");
  html5 = loadImage("html5.gif");
  bridge = loadImage("bridgeicon.gif");
  title = loadImage("title.gif");
  retry = loadImage("retry.gif");
}



void draw() {
  background(0); //Draws background to black every frame
  imageMode(CORNER);

  if (gameRunning == true) {

    drawCircle();

    drawBlocks();

    drawTopBottom();

    fill(0, 0, 340);
    text("Score:", 10, 60);
    text(count, 65, 60);
    text("High Score:", width-150, 60);
    text(highScore, width-50, 60);

    count++;

    if (difficulty > 10) {
      difficulty -= 0.005;
    }
  }  
  else {
    if (start==true) {
        
   image(title,0,0,640,480);
    }  else {
    image(retry,0,0,640,480);
  }
  }
}




//Draws top and bottom row of blocks
void drawTopBottom() {
  fill(140, 250, 250);
  rect(0, 0, width, topandbottom);
  rect(0, height-topandbottom, width, topandbottom);

  for (float i=0; i<width; i+=32) { //loop through texture 32x32 square to create full columns
    beginShape();
    texture(processing);
    vertex(i, 0, 0, 0);
    vertex(i+topandbottom, 0, 100, 0);
    vertex(i+topandbottom, topandbottom, 100, 100);
    vertex(i, topandbottom, 0, 100);
    endShape();

    beginShape();
    texture(illustrator);
    vertex(i, height-topandbottom, 0, 0);
    vertex(i+topandbottom, height-topandbottom, 100, 0);
    vertex(i+topandbottom, height, 100, 100);
    vertex(i, height, 0, 100);
    endShape();
  }
}

void drawCircle() {
  noStroke();
  imageMode(CENTER);

  yVel = yVel + gravity; // Add gravity to the y velocity.
  // If the velocity is positive: makes it bigger (falling down)
  // If it's negative: makes it smaller (slowing down at top)
  circleX = circleX + xVel; // We increment the circle's x position by the x velocity
  circleY = circleY + yVel; // Same with the y position and y velocity


  /* Here's the meat of this sketch.
   If the circle's x position is greater than width, it's about to fly offscreen!
   In that case, its velocity is positive. If the circle's x position is less than
   0, then it's about to fly offscreen too! In that case, its velocity is negative.
   
   If we multiply 1 by -1, we get -1 -- the reverse.
   If we multiply -1 by -1, we get 1 -- the reverse.
   Whichever way it's going, we just turn it around!
   */

  if ((circleX > width-(circleSize/2+topandbottom)) || (circleX < 0+(circleSize/2+topandbottom))) { // We're checking to see if it's about to fly off the left or right
    xVel = xVel * (-1); // And here's where we reverse it.
  }

  if (circleY > height-circleSize || circleY < 0 + circleSize) { // Same idea with the y position.
    yVel = yVel * (-0.85); // And here's where we reverse the y. We use something greater than -1 to dampen
  }

  if (circleY > height-topandbottom*2) { // Prevents it from falling off the bottom of the screen
    circleY = height-topandbottom*2; // Resets it at height if it's about to fall past height
  }

  if (circleY < 0+topandbottom*2) { // Prevents it from falling off the bottom of the screen
    circleY = 0+topandbottom*2; // Resets it at height if it's about to fall past height
  }
  
  image(bridge, circleX, circleY, circleSize, circleSize); // Don't forget to draw your ellipse
}


//FUNCTION FOR KEY PRESSES TO CHANGE GRAVITY
void keyPressed() {
  if (key == ' ') {
    gameRunning = true;
    start = false;
  }

  if (key == CODED) {
    if (keyCode == UP) {
      gravity = -.3;
      yVel= -resetyVel;
    } 
    else if (keyCode == DOWN) {
      gravity = .3;
      yVel= resetyVel;
    }
  }
}

void drawBlocks() {
  int convertDiff = int(difficulty);
  if (count%convertDiff == 0) {
    blockList.add(new Block(int(random(10))));
    print(convertDiff + " ");
  }

  for (int i = blockList.size()-1; i>=0; i--) {
    Block block = (Block) blockList.get(i);
    block.moveBlock();
    block.displayBlock();

    if (block.destroyBlock()) {
      blockList.remove(i);
    }


    if (block.checkCollision()) {
      collision = true;
    }
  }

  if (collision == true) {
    gameRunning = false;
    circleX = width/2;
    circleY = height/2;
    xVel = 0;
    yVel = 5;
    resetyVel = yVel;
    gravity = .3;
    difficulty = 45;
    blockList.clear();

    if (count > highScore) {
      highScore = count;
    }

    count = 0;
    collision = false;
  }
}


//CLASS FOR RANDOMLY SPAWNING BLOCKS
class Block {
  color c;
  float xPos;
  float yPos;
  float h;

  Block(int tempRandom) {
    c = color(40, random(200, 270), random(200, 270));
    xPos = width;
    h = random(topandbottom+20, height/2-topandbottom);
    if (tempRandom > 5) {
      yPos = topandbottom;
    }
    if (tempRandom <= 5) {
      yPos = height-h-topandbottom;
    }
    print(tempRandom);
  }

  void displayBlock() {
    for (float i=yPos; i<yPos+h; i+=32) { //loop through texture 32x32 square to create full columns
      beginShape();
      texture(html5);
      vertex(xPos, i, 0, 0);
      vertex(xPos+topandbottom, i, 100, 0);
      vertex(xPos+topandbottom, i+topandbottom, 100, 100);
      vertex(xPos, i+topandbottom, 0, 100);
      endShape();
    }
    //rect(xPos, yPos, topandbottom, h);
  }

  void moveBlock() {
    xPos-=3;
  }

  boolean checkCollision() {
    if (circleX + circleSize/2 >= xPos && circleX + circleSize/2 <= xPos+topandbottom && circleY + circleSize/2 >= yPos && circleY +circleSize/2 <= yPos+h) {
      return true;
    }
    if (circleX - circleSize/2 >= xPos && circleX - circleSize/2 <= xPos+topandbottom && circleY - circleSize/2 >= yPos && circleY-circleSize/2 <= yPos+h) {
      return true;
    }

    else {
      return false;
    }
  }

  boolean destroyBlock() {
    if (xPos <= -topandbottom) {
      return true;
    }  
    else {
      return false;
    }
  }
}


