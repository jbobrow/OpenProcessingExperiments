
//Creates font
PFont font;





//**Level 1 Classes**
//  --Player
private Player playerL1;
//  --level
private Level level1;
//  --Blocks
private Block blockL11;
private Block blockL12;
//  --Moving Blocks
private MovingBlock MBlockL11;
private MovingBlock MBlockL12;
private MovingBlock MBlockL13;
private MovingBlock MBlockL14;
//  -- Goals
private Goal goalL1;


//**Level 2 Classes**
//  --Level
private Level level2;
//  --Player
private Player playerL2;
//  --Blocks
private Block blockL21;
private Block blockL22;
private Block blockL23;
private Block blockL24;
private Block blockL25;
private Block blockL26;
//  --Moving Blocks
private MovingBlock MBlockL21;
private MovingBlock MBlockL22;
private MovingBlock MBlockL23;
private MovingBlock MBlockL24;
private MovingBlock MBlockL25;
private MovingBlock MBlockL26;
private MovingBlock MBlockL27;
private MovingBlock MBlockL28; 
private MovingBlock MBlockL29; 
//  --Goals
private Goal goalL2;
//  --Questions
private Question question2;



//**Level 3 classes**
//  --Level
private Level level3;
//  --Player
private Player playerL3;
//  --Blocks
private Block blockL31;
private Block blockL32;
private Block blockL33;
private Block blockL34;
private Block blockL35;
private Block blockL36;
//  --Moving Blocks
private MovingBlock MBlockL31;
private MovingBlock MBlockL32;
private MovingBlock MBlockL33;
private MovingBlock MBlockL34;
private MovingBlock MBlockL35;
private MovingBlock MBlockL36;
private MovingBlock MBlockL37;
private MovingBlock MBlockL38;
//  --Goals
private Goal goalL3;
//  --questions
private Question question3;



//**Level 4**
//  --Level
private Level level4;
//  --Player
private Player playerL4;
//  --Blocks
private Block blockL41;
private Block blockL42;
private Block blockL43;
private Block blockL44;
private Block blockL45;
private Block blockL46;
private Block blockL47;
private Block blockL48;
private Block blockL49;
//  --Moving Blocks
private MovingBlock MBlockL41;
private MovingBlock MBlockL42;
private MovingBlock MBlockL43;
private MovingBlock MBlockL44;
private MovingBlock MBlockL45;
private MovingBlock MBlockL46;
private MovingBlock MBlockL47;
private MovingBlock MBlockL48;
//  --Goals
private Goal goalL4;
//  --question
private Question question4;


// booleans to decide what level to play
boolean start = false;
boolean failed = false;
int level = 0;




//to decide level boundries (hitting these does not end the game)
float levelX ;
float levelY;
float levelWidth;
float levelHeight;

float startL1X = 70;
float startL1Y = 305;


//  Inital setup   ***********************************************************************************************************************
void setup()
{

  start = true;


  //**Level 1**
  //  --Level
  level1 = new Level(50, 290, 500, 50, startL1X, startL1Y);
  //  --player
  playerL1 = new Player(level1.getStartX(), level1.getStartY(), 2);
  //  --blocks
  blockL11 = new Block(300, 290, 250, 13);
  blockL12 = new Block(300, 327, 250, 13);
  //  --Moving Blocks
  MBlockL11 = new MovingBlock(100, 290, 10, 10, 1.2, 40);
  MBlockL12 = new MovingBlock(150, 290, 10, 10, 1.2, 40);
  MBlockL13 = new MovingBlock(200, 330, 10, 10, -1.2, 40);
  MBlockL14 = new MovingBlock(250, 330, 10, 10, -1.2, 40);
  //  --goals
  goalL1 = new Goal(535, 303, 13, 24);



  //**Level 2**
  //  --Level
  level2 = new Level(100, 100, 400, 400, 290, 120);
  //  --player
  playerL2 = new Player(level2.getStartX(), level2.getStartY(), 2);
  //  --Blocks
  blockL21 = new Block(100, 100, 175, 250);
  blockL22 = new Block(325, 100, 175, 250);
  blockL23 = new Block(100, 350, 50, 150);
  blockL24 = new Block(450, 350, 50, 150);
  //  --Moving Blocks
  MBlockL21 = new MovingBlock(200, 150, 50, 40, 1.9, 50);
  MBlockL22 = new MovingBlock(350, 150, 50, 40, -1.9, 50);
  MBlockL23 = new MovingBlock(200, 225, 50, 40, 1.9, 50);
  MBlockL24 = new MovingBlock(350, 225, 50, 40, -1.9, 50);
  MBlockL25 = new MovingBlock(200, 300, 50, 40, 1.9, 50);
  MBlockL26 = new MovingBlock(350, 300, 50, 40, -1.9, 50);
  MBlockL27 = new MovingBlock(145, 390, 10, 10, 4, 300);
  MBlockL28 = new MovingBlock(445, 425, 10, 10, -4, 300);
  MBlockL29 = new MovingBlock(145, 475, 10, 10, 3, 300);
  //  --goals
  goalL2 = new Goal(150, 488, 300, 10);
  //  --Questions
  question2 = new Question(4, 8, 6, 1);


  //**level 3**
  //  --Level
  level3 = new Level(25, 25, 525, 525, 75, 75);
  //  --player
  playerL3 = new Player(level3.getStartX(), level3.getStartY(), 2);
  //  --blocks
  blockL31 = new Block(25, 125, 375, 120);
  blockL32 = new Block(427, 25, 125, 250);
  blockL33 = new Block(100, 275, 450, 120);
  blockL34 = new Block(25, 225, 45, 325);
  blockL35 = new Block(25, 25, 525, 25);
  blockL36 = new Block(23, 500, 529, 60);
  //  --Moving Blocks
  MBlockL31 = new MovingBlock(100, 325, 400, 50, 0.5, 50);
  MBlockL32 = new MovingBlock(100, 510, 400, 50, -0.5, 50);
  MBlockL33 = new MovingBlock(100, 30, 10, 20, 1, 100);
  MBlockL34 = new MovingBlock(110, 130, 10, 20, -1, 100);
  MBlockL35 = new MovingBlock(170, 30, 10, 20, 1.5, 100);
  MBlockL36 = new MovingBlock(180, 130, 10, 20, -1.5, 100);
  MBlockL37 = new MovingBlock(230, 30, 10, 20, 2, 100);
  MBlockL38 = new MovingBlock(240, 130, 10, 20, -2, 100);
  //  --goals
  goalL3 = new Goal(500, 395, 48, 105);
  //  --questions
  question3 = new Question( 3, 7, 6, 3);




  //**level 4**
  //  --Level
  level4 = new Level(25, 25, 550, 550, 35, 525);
  //  --Player
  playerL4 = new Player(level4.getStartX(), level4.getStartY(), 2);
  //  --Blocks
  blockL41 = new Block(25, 25, 550, 40);
  blockL42 = new Block(100, 175, 475, 75);
  blockL43 = new Block(25, 375, 475, 75);
  blockL44 = new Block(525, 375, 50, 200);
  blockL45 = new Block(300, 480, 250, 95);
  blockL46 = new Block(100, 450, 175, 50); 
  blockL47 = new Block(210, 527, 90, 47);
  blockL48 = new Block(100, 550, 175, 25); 
  blockL49 = new Block(100, 500, 85, 20);
  //  --Moving Blocks
  MBlockL41 = new MovingBlock(100, 250, 25, 62.5, 1, 375);
  MBlockL42 = new MovingBlock(475, 312.5, 25, 62.5, -1, 375);
  MBlockL43 = new MovingBlock(100, 113, 25, 62.5, 1, 375);
  MBlockL44 = new MovingBlock(475, 50.5, 25, 62.5, -1, 375);
  MBlockL45 = new MovingBlock(100, 60, 25, 25, 1, 90);
  MBlockL46 = new MovingBlock(475, 60, 25, 25, 1, 90);
  MBlockL47 = new MovingBlock(193.75, 150, 25, 25, -1, 90);
  MBlockL48 = new MovingBlock(381.25, 150, 25, 25, -1, 90);
  // --Goal
  goalL4 = new Goal(535, 65, 38, 110);
  // --question
  question4 = new Question(2, 1, 3, 3);



  //initilize fonts
  font = loadFont("ArialNarrow-Bold-40.vlw");
  //set size of screen
  size(600, 600);
}



//  draw function  ***********************************************************************************************************************

void draw() 
{


  //Set up start screen
  if (start == true) {
    background(255, 255, 255);
    fill(0, 0, 0);
    textSize(30);
    text("Obstacle Course game", 100, 50);
    textSize(20);
    text("Don't hit the walls, use WASD to move", 20, 200);
    text("If you fail a level you have a chance to answer a question", 20, 240);
    text("about the previous level if you get it correct you only go", 20, 265);
    text("back one level, if you get it wrong you have to start again.", 20, 290);
    text("Good luck", 20, 315);
    text("Press space to begin", 20, 360);

    if (keyPressed) {
      if (key == ' ') {
        start = false;
        level = level + 1;
      }
    }
  }


  //set-up and player level 1

    if (level == 1) {

    // = false;

    background (255, 255, 255);

    //**set boundries**
    levelX = level1.getX();
    levelY = level1.getY();
    levelWidth = level1.getLWidth();
    levelHeight = level1.getLHeight();

    //**render the level**
    level1.render();

    //**player 1**
    playerL1.render();
    playerL1.input();

    //**Moving blocks level 1**
    //  --Moving block 1
    MBlockL11.render();
    MBlockL11.update(playerL1.getX(), playerL1.getY());
    MBlockL11.collisionY();
    //  --Moving block 2
    MBlockL12.render();
    MBlockL12.update(playerL1.getX(), playerL1.getY());
    MBlockL12.collisionY();
    //  --Moving block 3
    MBlockL13.render();
    MBlockL13.update(playerL1.getX(), playerL1.getY());
    MBlockL13.collisionY();
    //  --Moving block 4
    MBlockL14.render();
    MBlockL14.update(playerL1.getX(), playerL1.getY());
    MBlockL14.collisionY();

    //**Blocks**
    //  --block 1
    blockL11.render();
    blockL11.update(playerL1.getX(), playerL1.getY());
    //  --block2
    blockL12.render();
    blockL12.update(playerL1.getX(), playerL1.getY());    

    //**Level 1 goal**
    goalL1.render();
    goalL1.update(playerL1.getX(), playerL1.getY());
  }



  if (level == 2)
  {

    background(255, 255, 255);

    //set boundries
    levelX = level2.getX();
    levelY = level2.getY();
    levelWidth = level2.getLWidth();
    levelHeight = level2.getLHeight();

    //level render
    level2.render();

    //player
    playerL2.render();
    playerL2.input();

    //Blocks
    //Block 1
    blockL21.render();
    blockL21.update(playerL2.getX(), playerL2.getY());
    //Block2
    blockL22.render();
    blockL22.update(playerL2.getX(), playerL2.getY());
    //Block3
    blockL23.render();
    blockL23.update(playerL2.getX(), playerL2.getY());
    //Block4
    blockL24.render();
    blockL24.update(playerL2.getX(), playerL2.getY());


    //Moving Blocks
    //Moving block 1
    MBlockL21.render();
    MBlockL21.update(playerL2.getX(), playerL2.getY());
    MBlockL21.collisionX();
    //moving block 2
    MBlockL22.render();
    MBlockL22.update(playerL2.getX(), playerL2.getY());
    MBlockL22.collisionX();
    //moving block 3
    MBlockL23.render();
    MBlockL23.update(playerL2.getX(), playerL2.getY());
    MBlockL23.collisionX();
    //moving block 4
    MBlockL24.render();
    MBlockL24.update(playerL2.getX(), playerL2.getY());
    MBlockL24.collisionX();
    //moving block 5
    MBlockL25.render();
    MBlockL25.update(playerL2.getX(), playerL2.getY());
    MBlockL25.collisionX();
    //moving block 6
    MBlockL26.render();
    MBlockL26.update(playerL2.getX(), playerL2.getY());
    MBlockL26.collisionX();
    //moving block 7
    MBlockL27.render();
    MBlockL27.update(playerL2.getX(), playerL2.getY());
    MBlockL27.collisionX();
    //moving block 8
    MBlockL28.render();
    MBlockL28.update(playerL2.getX(), playerL2.getY());
    MBlockL28.collisionX();    
    //moving block 9
    MBlockL29.render();
    MBlockL29.update(playerL2.getX(), playerL2.getY());
    MBlockL29.collisionX();

    //goal
    goalL2.render();
    goalL2.update(playerL2.getX(), playerL2.getY());
  }

  if (level == 3 ) {

    background(255, 255, 255);

    //set boundries
    levelX = level3.getX();
    levelY = level3.getY();
    levelWidth = level3.getLWidth();
    levelHeight = level3.getLHeight();

    //level
    level3.render();

    //player
    playerL3.render();
    playerL3.input();

    //Block
    //block 1
    blockL31.render();
    blockL31.update(playerL3.getX(), playerL3.getY());  
    //block 2
    blockL32.render();
    blockL32.update(playerL3.getX(), playerL3.getY()); 
    //block3   
    blockL33.render();
    blockL33.update(playerL3.getX(), playerL3.getY());     
    //block4 
    blockL34.render();
    blockL34.update(playerL3.getX(), playerL3.getY());   
    //block5  
    blockL35.render();
    blockL35.update(playerL3.getX(), playerL3.getY());    
    //block6  
    blockL36.render();
    blockL36.update(playerL3.getX(), playerL3.getY());   

    //moving blocks
    //moving block1
    MBlockL31.render();
    MBlockL31.update(playerL3.getX(), playerL3.getY());
    MBlockL31.collisionY();

    //moving block 2
    MBlockL32.render();
    MBlockL32.update(playerL3.getX(), playerL3.getY());
    MBlockL32.collisionY();

    //moving block 3
    MBlockL33.render();
    MBlockL33.update(playerL3.getX(), playerL3.getY());
    MBlockL33.collisionY();

    //moving block 4
    MBlockL34.render();
    MBlockL34.update(playerL3.getX(), playerL3.getY());
    MBlockL34.collisionY();

    //moving block 5
    MBlockL35.render();
    MBlockL35.update(playerL3.getX(), playerL3.getY());
    MBlockL35.collisionY();

    //moving block 6
    MBlockL36.render();
    MBlockL36.update(playerL3.getX(), playerL3.getY());
    MBlockL36.collisionY();

    //moving block 6
    MBlockL37.render();
    MBlockL37.update(playerL3.getX(), playerL3.getY());
    MBlockL37.collisionY();
    //moving block 6
    MBlockL38.render();
    MBlockL38.update(playerL3.getX(), playerL3.getY());
    MBlockL38.collisionY();

    //goal
    //Level 3 goal
    goalL3.render();
    goalL3.update(playerL3.getX(), playerL3.getY());
  }

  if (level == 4 ) {

    background(255, 255, 255);

    //set boundries
    levelX = level4.getX();
    levelY = level4.getY();
    levelWidth = level4.getLWidth();
    levelHeight = level4.getLHeight();

    //level
    level4.render();

    //player
    playerL4.render();
    playerL4.input();

    //Block
    //block 1
    blockL41.render();
    blockL41.update(playerL4.getX(), playerL4.getY());
    //block 2
    blockL42.render();
    blockL42.update(playerL4.getX(), playerL4.getY());  
    //block 3
    blockL43.render();
    blockL43.update(playerL4.getX(), playerL4.getY()); 
    //block 4
    blockL44.render();
    blockL44.update(playerL4.getX(), playerL4.getY()); 
    //block 5
    blockL45.render();
    blockL45.update(playerL4.getX(), playerL4.getY()); 
    //block 6
    blockL46.render();
    blockL46.update(playerL4.getX(), playerL4.getY());
    //block 7
    blockL47.render();
    blockL47.update(playerL4.getX(), playerL4.getY()); 
    //block 8
    blockL48.render();
    blockL48.update(playerL4.getX(), playerL4.getY());
    //block 9
    blockL49.render();
    blockL49.update(playerL4.getX(), playerL4.getY());   

    //Moving Blocks
    //Moving block 1
    MBlockL41.render();
    MBlockL41.update(playerL4.getX(), playerL4.getY());
    MBlockL41.collisionX();
    //moving block 2
    MBlockL42.render();
    MBlockL42.update(playerL4.getX(), playerL4.getY());
    MBlockL42.collisionX(); 
    //moving block 3
    MBlockL43.render();
    MBlockL43.update(playerL4.getX(), playerL4.getY());
    MBlockL43.collisionX(); 
    //moving block 4
    MBlockL44.render();
    MBlockL44.update(playerL4.getX(), playerL4.getY());
    MBlockL44.collisionX(); 
    //moving block 5
    MBlockL45.render();
    MBlockL45.update(playerL4.getX(), playerL4.getY());
    MBlockL45.collisionY(); 
    //moving block 6
    MBlockL46.render();
    MBlockL46.update(playerL4.getX(), playerL4.getY());
    MBlockL46.collisionY(); 
    //moving block 7
    MBlockL47.render();
    MBlockL47.update(playerL4.getX(), playerL4.getY());
    MBlockL47.collisionY(); 

    //moving block 7
    MBlockL48.render();
    MBlockL48.update(playerL4.getX(), playerL4.getY());
    MBlockL48.collisionY(); 

    //goal level 4
    goalL4.render();
    goalL4.update(playerL4.getX(), playerL4.getY());
  }

  if (level == 5) {
    background(255, 255, 255);

    textSize(25);
    text("Well done, you've completed all the levels!", 20, 100);
    text("refresh the page start again!", 20, 200);
  }



  if (failed == true) {




    if (level == 1) {

      level = 0;
      failed = false;
      setup();
    }

    if (level == 2) {


      boolean pass;
      boolean fail;  
      background(255, 255, 255);


      question2.render();
      question2.update();
      textSize(25);
      text("How many blocks where there on", 40, 100);
      text("level 1? ", 40, 130);

      pass = question2.getCorrect();
      fail = question2.getIncorrect();



      if (pass == true) { 
        startL1X = 70;
        startL1Y = 305;
        level = level - 1;
        failed = false;
        level1 = new Level(50, 290, 500, 50, 70, 305);
      }

      if (fail == true) { 
        level = 0;   
        failed = false; 
        setup();
      }
    }




    if (level == 3) {
      boolean pass;
      boolean fail;


      background(255, 255, 255);


      question3.render();
      question3.update();
      textSize(25);
      text("How many moving objects where there", 40, 100);
      text("on level 2?", 40, 130);

      pass = question3.getCorrect();
      fail = question3.getIncorrect();



      if (pass == true) { 
        failed = false;
        level = level-1;
      }

      if (fail == true) {
        failed = false;
        level = 0;
        setup();
      }
    }


    if (level == 4) {

      boolean pass;
      boolean fail;

      background(255, 255, 255);


      question4.render();
      question4.update();

      pass = question4.getCorrect();
      fail = question4.getIncorrect();
      textSize(25);
      text("At the start of level 3 whats set of ", 40, 100);
      text("blocks were the fastest?", 40, 130);



      if (pass == true) { 
        failed = false;
        level = level-1;
      }

      if (fail == true) {
        level = 0;
        failed = false;
        setup();
      }
    }
  }
}






//  Classes   ***********************************************************************************************************************************************************************




//Class for the player---------------------------------------------------------------
class Player {
  float x;
  float y;
  float m;

  //constructor
  //     player(starting x position,starting y position, speed)
  public Player(float newX, float newY, float speed)
  {
    x = newX;
    y = newY;
    //movement speed
    m = speed;
  }

  //creates the player
  void render() {
    fill(255, 0, 0);
    stroke(0);
    rect(x, y, 20, 20);
  }

  //manages inputs
  void input() {
    //used to reset speed for boundries
    float ms;
    ms = m;


    if (keyPressed) {

      //up
      if (key == 'w' || key == 'W') {
        y-=ms;
      }
      //down
      if (key == 's' || key == 'S') {
        y+=ms;
      }
      //left
      if (key == 'a' || key == 'A') {
        x-=ms;
      }
      //right
      if (key == 'd' || key == 'D') {
        x+=ms;
      }
      //up+left
      if (key == 'w' && key == 'a') {
        y-=ms;
        x-=ms;
      }
      //up+right
      if (key == 'w' && key == 'd') {
        y-=ms;
        x+=ms;
      }
      //down+right
      if (key == 's' && key == 'a') {
        y+=ms;
        x-=ms;
      }
      //down+left
      if (key == 's' && key == 'd') {
        y+=ms;
        x+=ms;
      }
    }

    //left boundry For level border
    if (x < levelX + 1) {
      m = 0;
      x+=3;
      m = ms;
    }
    // right boundry for level border
    if (x+24 > (levelX + levelWidth) ) {
      m = 0;
      x-=3;
      m = ms;
    }

    // top boundry for level border
    if (y < levelY + 4) {
      m = 0;
      y+=3;
      m = ms;
    }

    //bottom boundry
    if (y+24 > (levelY + levelHeight)) {
      m = 0;
      y-=3;
      m = ms;
    }
  }

  //used to show x value outside the class
  public float getX() 
  {
    return x;
  }

  public float getY() 
  {
    return y;
  }
}





//class for blocks to avoid ----------------------------------------------------------------
class Block {

  float x;
  float y;
  float bHeight;
  float bWidth;  
  float hitX;
  float hitY;



  //     Block(starting x position, starting postision, block width, block height) 
  public Block(float newX, float newY, float newWidth, float newHeight) {
    x= newX;
    y= newY;
    bHeight = newHeight;
    bWidth = newWidth;
  }

  void render() {
    fill(0, 0, 0);
    noStroke();
    rect(x, y, bWidth, bHeight);
  }
  //   update(x value of object,y value of object)
  void update(float newHitX, float newHitY) {

    hitX = newHitX;
    hitY = newHitY;



    if (hitX+19 > (x) && (hitX) < (x+bWidth) && hitY+18 > y && hitY < (y+bHeight) ) {

      failed = true;
    }
  }
}




// Class for levels ------------------------------------------------------
class Level {

  float x;
  float y;
  float lHeight;
  float lWidth;
  float startX;
  float startY;

  //constructor
  //     Level(starting x point, starting y point, level width, levelheight, starting x point of player, starting y point of player)
  public Level(float newX, float newY, float newWidth, float newHeight, float newStartX, float newStartY) 
  {
    x = newX;
    y = newY;
    lWidth = newWidth;
    lHeight = newHeight;
    startX = newStartX;
    startY = newStartY;
  }

  void render() {
    stroke(0);
    strokeWeight(4);
    fill(255);
    rect(x, y, lWidth, lHeight);
  }

  public float getX()
  {
    return x;
  }

  public float getY()
  {
    return y;
  }

  public float getLWidth()
  {
    return lWidth;
  }

  public float getLHeight()
  {
    return lHeight;
  }

  public float getStartX()
  {
    return startX;
  }

  public float getStartY()
  {
    return startY;
  }
}



//class for blocks to avoid ----------------------------------------------------------------
class MovingBlock {

  float x;
  float y;
  float bHeight;
  float bWidth;  
  float hitX;
  float hitY;

  float bSpeed;
  float counter;
  float range;




  //      Moving block(starting x, starting y, block width, block height, speed, distance to move)
  public MovingBlock(float newX, float newY, float newWidth, float newHeight, float newSpeed, float newRange) {
    x= newX;
    y= newY;
    bHeight = newHeight;
    bWidth = newWidth;
    counter = 0;
    bSpeed = newSpeed;
    range= newRange;
  }

  void render() {
    fill(0, 0, 0);
    noStroke();
    rect(x, y, bWidth, bHeight);
  }

  void update( float newHitX, float newHitY) {

    hitX = newHitX;
    hitY = newHitY;



    if (hitX+18 > x && hitX < (x+bWidth) && hitY+18 > y && hitY < (y+bHeight) ) {

      failed = true;
    }
  }
  //after moving the distance on the x axis move back to starting point
  void collisionX()
  {


    x += bSpeed;    
    counter = counter +  bSpeed;

    if (counter > range)
    {
      bSpeed = bSpeed * (-1);
      counter = 0;
    }

    if (counter < (range *(-1)))
    {

      bSpeed = bSpeed *(-1);
      counter = 0;
    }
  }
  //after moving the distance on the y axis move back to starting point
  void collisionY()
  {

    y += bSpeed;    
    counter = counter +  bSpeed;

    if (counter > range)
    {
      bSpeed = bSpeed * (-1);
      counter = 0;
    }


    if (counter < (range *(-1)))
    {

      bSpeed = bSpeed *(-1);
      counter = 0;
    }
  }
}

//class for Goal----------------------------------------------------------------
class Goal {

  float x;
  float y;
  float bHeight;
  float bWidth;  
  float hitX;
  float hitY;



  //     Goal(starting x, starting y , width,height)
  public Goal(float newX, float newY, float newWidth, float newHeight) {
    x= newX;
    y= newY;
    bHeight = newHeight;
    bWidth = newWidth;
  }

  void render() {
    fill(89, 191, 83);
    noStroke();
    rect(x, y, bWidth, bHeight);
  }

  void update( float newHitX, float newHitY) {

    hitX = newHitX;
    hitY = newHitY;


    //if object is within goal advance to next level
    if (hitX+18 > x && hitX < (x+bWidth) && hitY+18 > y && hitY < (y+bHeight) ) {

      level = level + 1;
    }
  }
}

//class for Button----------------------------------------------------------------
class Button {

  float x;
  float y;
  float bHeight;
  float bWidth;  
  float hitX;
  float hitY;
  boolean clicked;






  public Button(float newX, float newY) {
    x= newX;
    y= newY;
    bHeight = 80;
    bWidth = 80;
    clicked = false;
  }

  void render() {
    fill(0, 0, 255, 100);
    stroke(0);
    rect(x, y, bHeight, bWidth);
  }

  void update() {

    if (mousePressed == true) {

      if (mouseX > x && mouseX < (x+bWidth) && mouseY > y && mouseY < (y+bHeight)) {
        clicked = true;
      }
    }
  }

  public boolean getClicked() {
    return clicked;
  }
}

//class for Question----------------------------------------------------------------
class Question {

  String questionText;
  int answer1;
  int answer2;
  int answer3;
  int correctAnswer;
  boolean correct;
  boolean incorrect;
  Button button1;
  Button button2;
  Button button3;






  public Question(int newA1, int newA2, int newA3, int cA) {
    answer1 = newA1;
    answer2 = newA2;
    answer3 = newA3;
    correctAnswer = cA;
    button1 = new Button(50, 400);
    button2 = new Button(260, 400);
    button3 = new Button(470, 400);
    correct = false;
    incorrect = false;
  }

  void render() {
    fill(0, 0, 0);
    textSize(30);
    //text(questionText, 20, 250);
    text(answer1, 80, 450);
    text(answer2, 290, 450);
    text(answer3, 500, 450);

    button1.render();
    button2.render();
    button3.render();
  }

  void update() {

    boolean button1Clicked = button1.getClicked();
    boolean button2Clicked = button2.getClicked();
    boolean button3Clicked = button3.getClicked();

    button1.update();
    button2.update();
    button3.update();

    if (button1Clicked == true ) {

      if (correctAnswer == 1) {
        correct = true;
      }
      else {
        incorrect = true;
      }
    }

    if (button2Clicked == true ) {

      if (correctAnswer == 2) {
        correct = true;
      }
      else {
        incorrect = true;
      }
    }

    if (button3Clicked == true ) {

      if (correctAnswer == 3) {
        correct = true;
      }
      else {
        incorrect = true;
      }
    }
  }

  public boolean getCorrect() {
    return correct;
  }

  public boolean getIncorrect() {
    return incorrect;
  }
}


