
import ddf.minim.*; //import minim for our music
Minim minim;


//call the 5 images that will be in my cinematic array
PImage[] images = new PImage[5]; 
PImage[] runImages = new PImage[5];
//a lot of images which will be called for a series of things, slides, sprites and objects for my game
PImage b, b2, b3, start, htp, go, init, ctm, fgm, guy_stand, guy_run1, guy_run2, guy_run3, guy_run4, guy_run5, rj, door, node, bla, rock, statue, tube_right, tube_left, tube_middle, rubble, spikes, spikesbottom, statue2, looking, lookingr,ship;

PFont spacefont; //spacefont, named accordingly

// using the x and y camera to follow my sprite across the screen, the camera follows the sprite, so it never goes off screen
float cameraOffsetX, cameraOffsetY;
//the hacking ellipse
float hacking;


Player thePlayer = new Player(); //get the player class here
World theWorld = new World();

PFont font;

// we use these for keeping track of how long player has played
int gameStartTimeSec, gameCurrentTimeSec;

int counter; // Automatically initialized at 0
final int DISPLAY_TIME = 10000;
int lastTime; // When the current image was first displayed
int gameType = 0; //the type gameType - gameType 0 = start up objects, tutorial etc // gameType 1 = playing the game // gameType 2 = gameOver
int hack = 2; //the default difficulty for the game
int music = 1; //the default song for the game
int progression = 1; //progression goes up as player goes through levels, progression = 1 is the first level etc.
int typeOfLevel = 1;

boolean prevent = true;  
boolean tut = false;
boolean cinematic = true;
boolean gameStartUp = false;
boolean cineFin = false;
boolean ctms = false;

AudioPlayer introMusic; //intro music, using an audioplayer
AudioPlayer startUp; //screen load
AudioPlayer levelOne; //option one music, keypress 4
AudioPlayer levelTwo; //option number 2 for music, keypress 5 
AudioSnippet loadInit; //load up music
AudioSample bub2; //keypress sounds
AudioSnippet dying; //game over sounds
AudioSample landing; //jump sounds
AudioSample bloop; //node sound
AudioSnippet finish; //gamecomplete sounds


// by adding this to the player's y velocity every frame, we get gravity
final float GRAVITY_POWER = 0.7; 

void setup() { 
  frameRate(24); //sets the framerate to 24 as opposed to default 30
  resetGame(); // sets up player and level
  size(880, 660); // how large the window/screen is for the game

  for (int i = 0; i < images.length; i++) { //populate the array
    images[i] = loadImage("cine" + nf(i+1, 2) + ".jpg"); //load the array of images
  }
  for(int i = 0; i < runImages.length; i++){
    runImages[i] = loadImage("r" + i + ".png");
  }
  lastTime = millis(); 
  counter = 0;

  minim = new Minim(this);
  //introMusic = minim.loadFile("opener.wav"); //this is the opening song, this plays on draw 
  startUp = minim.loadFile("startscreen.wav"); //screen load
//  levelOne = minim.loadFile("lvl.wav"); //first music option song, default song - freedom
//  levelTwo = minim.loadFile("levelTwo.wav"); //second music option song, - derezz
  int buffersize = 256; 
  loadInit = minim.loadSnippet("loading.WAV"); //load in music on level start up
  bub2 = minim.loadSample("bub2.mp3", buffersize); //keypress
  bloop = minim.loadSample("Bloop.mp3", buffersize); //collect nodes
  dying = minim.loadSnippet("dying.mp3"); //gameOver music
  finish = minim.loadSnippet("ItemGet.mp3"); //when we hit that plane
  landing = minim.loadSample("Land.mp3"); //landing after jump

  //introMusic.play(); //play first song for cinematic


  start = loadImage("introduction.jpg"); //intro page
  htp = loadImage("how_to_play.jpg"); //tutorial
  b = loadImage("lvl1.jpg"); //load the default background we have.
  b2 = loadImage("lvl2.jpg"); //background 2 for level 2
  b3 = loadImage("lvl3.jpg"); //background for level 3
  go = loadImage("gameover.jpg"); //game over
  init = loadImage("init.jpg"); //initilizing pic
  ctm = loadImage("customise.jpg"); //customise screen
  //fgm = loadImage("finalgameover.jpg"); //finalgameover, NOT IMPLEMENTED.
  guy_stand = loadImage("rstand.png"); //STAND
  rj = loadImage("rj.png"); //JUMP
  bla = loadImage("tile.png"); //default tile, blocks
  rock = loadImage("rubble2.png"); //rubble, use in level 2 
  statue = loadImage("stat1.png"); //statue of choz
  statue2 = loadImage("stat.png"); //reflected image
  tube_right = loadImage("tube_right.png"); //right part of floor
  tube_middle = loadImage("tube_middle.png"); //mid part of floor
  tube_left = loadImage("tube_left.png"); //left part of floor
  rubble = loadImage("rock.png"); //rock image, use in level 2
  spikes = loadImage("spikes.png"); //spikes, will reset game, implemented
  spikesbottom = loadImage("spikes2.png"); //spikes for ground

  looking = loadImage("looking.png"); //space man looking at screen
  lookingr = loadImage("lookingr.png"); //facing SIRI space pirate

  ship = loadImage("ship.png"); //space ship image

  node = loadImage("node.png"); //collectable
  door = loadImage("door.jpg"); //loading door, used to go to next level

  cameraOffsetX = 0.0;  //set to default

  hacking = 0.0f; //translate is 0, any higher and its already started 

  spacefont = loadFont("spacefont.vlw"); //load our font
}

// This function copies start_Grid into worldGrid, putting node back
  // multiple levels could be supported by copying in a different start grid

void resetGame() {
  thePlayer.reset(); // reset the node collected number, etc
  theWorld.reload(); // reset world map
}

Boolean gameWon() { // checks whether all node in the game have been collected, called at gameOver
  return (thePlayer.nodeCollectTotal == theWorld.nodeTotal);
}

//SOURCED - EXAMPLE BY CHRIS DELEON - http://www.hobbygamedev.com/
//GATHERED INFORMATION ON CAMERA POSITION, USED CODE TO IMPLEMENT Y POSITION CAMERA
void updateCameraPosition() {
  int rightEdge = World.GRID_UNITS_WIDE*World.GRID_UNIT_SIZE-width;
  int bottomEdge = World.GRID_UNITS_TALL*World.GRID_UNIT_SIZE-height;
  // the left side of the camera view should never go right of the above number
  // think of it as "total width of the game world" (World.GRID_UNITS_WIDE*World.GRID_UNIT_SIZE)
  // minus "width of the screen/window" (width)

  cameraOffsetX = thePlayer.position.x-width/2;
  if (cameraOffsetX < 0) {
    cameraOffsetX = 0;
  }

  if (cameraOffsetX > rightEdge) {
    cameraOffsetX = rightEdge;
  }
//SOURCE END.
  cameraOffsetY = thePlayer.position.y-height/2;
  if (cameraOffsetY < 0) {
    cameraOffsetY = 0;
  }

  if (cameraOffsetY > bottomEdge) {
    cameraOffsetY = bottomEdge;
  }
}



void draw() { 
  if(!thePlayer.gameComplete){ //IF THE GAME IS NOT COMPLETE, BOOLEAN IN PLAYER CLASS
  image(init, 0, 0); //LOAD INITILISE IMAGE IN BACKGROUND

  if (millis() - lastTime >= DISPLAY_TIME) { // Time to display next image
    counter++;

    if (counter == images.length) { //if counter gets to 5(image length), stop this, set up my music, finish the cinematic
      startUp.loop();               //USED FOR SKIP CUTSCENE USING 'S'
      gameStartUp = true;
      cinematic = false;
      counter = 0;
    }
    if (cineFin) {                  //START GOING TO GAMETYPES...WHAT ONE IS FIRST, GAMETYPE = 0.
      startUp.play();
      gameStartUp = true;
      cinematic = false;
    }
    lastTime = millis();
  }

  if (cinematic) {                  //run the cinematic, if cinematic is true;
    if (keyPressed) {

      if (key == 's' || key == 'S') { //if press S, lets start up skipping the cutscene
        cineFin = true;      //load up gameTypes
        //introMusic.pause();    //pause the playing music
      }
    }
    if (!cineFin) {    //boolean starts off false

      image(images[counter], 0, 0); //call our cinematic
      textFont(spacefont);
      fill(0);
      textAlign(LEFT, LEFT);
      textSize(35);
      text("Press S to SKIP Scene", 26, 40);   //text for skip
    }
  }


  if (gameStartUp) {    //gamestart up after the cinematic has finishes or skipped

    if (gameType == 0) {
      hacking = 0.0f; //set hacking to 0.
    }

    if (prevent) {
      image(start, 0, 0); //the start image
    }

    if (tut) {
      image(htp, 0, 0);    //how to play, set boolean for display tutorial
    }

    if (ctms) {
      image(ctm, 0, 0);      //customise image
    }

    if (keyPressed) {
      //prevent = false;
      if (key == 'c' || key == 'C') {   //if keyPressed is 'c', run the customise page, set booleans and run game
        prevent = false;
        ctms = true;
      }


      if (key == 't' || key == 'T') {    //run tutorial page, then start game
        prevent = false;
        tut = true;
        if (key == ' ') {
          prevent = false;
          gameType = 1;
        }
      }


      else if (key == ' ') {
        gameType = 1;          //if ever space bar is pressed after these functions, its time to play the game
      }
    }



    if (gameType == 1) {
      ctms = false;      //hide these images
      tut = false;
      startUp.mute();    //mute ongoing song, cannot stop without calling super.stop, could not implement.
      loadInit.play();    //load up music
      
      if (music == 1) {        //set music customisations based on keypressed
          //levelOne.play();
        }
        if (music == 2) {
          //levelTwo.play();
        }
      
                              //levels, each collision with the door in the level brings up progression++;, thus allowing background images to change in conjuction with new world array
      if (progression == 1) {
        image(b, 0, 0);
      }
      if (progression == 2) { 
        image(b3, 0, 0);       
      }

      if (progression == 3) { 
        image(b2, 0, 0);       
      }  
      
      pushMatrix(); 
      translate(-cameraOffsetX, -cameraOffsetY); // affects all upcoming graphics calls, until popMatrix

      updateCameraPosition();    //set the camera, get it ready

      theWorld.render();  //load up the world

      thePlayer.inputCheck();    //player functions
      thePlayer.move();
      thePlayer.draw();

      popMatrix(); // undoes the translate function from earlier in draw()
      
      if(focused == false) { // does the window currently not have keyboard focus?
      textAlign(CENTER);
      text("'w' to jump, 'a' to go left and 'd' to go right!!",width/2, height-90);
    }


      textFont(spacefont);
      fill(255);
      textAlign(LEFT);
      textSize(20);
      text("NODES:"+thePlayer.nodeCollected +"/"+theWorld.nodeInStage, 8, HEIGHT - 10);
      
      if(thePlayer.onShip){
      textFont(spacefont);
      fill(255);
      textAlign(CENTER);
      textSize(20);
          text("Press 'w' on the spaceship to enter the craft", width/2, height/4);
      }




      if (hacking < 0) {  
        hacking = 0;
      } //make sure hacking meter is 0, fresh new hacking bar.
      if (hacking >= 1) {
thePlayer.playerDead = true;        
      gameType = 2;
        dying.play();
        dying.rewind();
      } 

      //SPACE hackbar
      ellipseMode(PConstants.CENTER);
      pushMatrix();    
      translate(650-80, 20);
      fill(0, 0, 0);
      stroke(0);
      ellipse(0, 0, 600, 20);
      smooth();
      popMatrix();

      //KEEP A CONSTANT
      ellipseMode(PConstants.CENTER); 
      pushMatrix();
      translate(350 + hacking*300-80, 20);
      //HOW FAR WE'RE TRANSLATING THIS, THE DIFFICULITY IS CHANGED VIA HACKING WHICH SETS HOW FAST THE TRANSLATE GOES
      
      
      //change of colors, making it look more urgent if they're nearly getting hacked
      if (hacking < 0.5) {
        fill (0, 0, 139);
      }
      if (hacking > 0.5) {
        fill(255, 140, 0);
      }
      if (hacking > 0.7) {
        fill(178, 34, 34);
      }
      if (hacking > 0.9) {
        fill(139, 0, 0);
      }

      stroke(0);
      ellipse(0, 0, hacking*600, 20);  
      smooth();  
      popMatrix();


      //TEXT FOR THE "HACKING BAR"
      textFont(spacefont);
      fill(255, 255, 255);
      textAlign(LEFT, LEFT);
      textSize(18);
      text("SPACE Hacking Progress", 600 - 70, 26);
      
      
      //how many nodes they player has collected against how many nodes in the map
      textFont(spacefont);
      fill(255);
      textAlign(LEFT);
      textSize(20);
      text("NODES:"+thePlayer.nodeCollected +"/"+theWorld.nodeInStage, 30, height-60, 300, 60);
      
      
      //OUR DIFFICULTY
      if (hack == 1) {
        hacking += 0.0005f;
      }
      if (hack == 2) {
        hacking += 0.00095f;
      }
      if (hack == 3) {
        hacking += 0.0012f;
      }
  }
    //GAME OVER
    if (gameType == 2) {
      //reset hacking
      hacking = 0.0f;
      noFill();   
      stroke(0);    
      image(go, 0, 0);
      
      //if keypressed space, lets reload the game and play again
      
      if (keyPressed) {
        if (key == ' ') {        
          gameType = 1;
        }
      }      
//pause music while in game over screen
      if (music == 1) {
        levelOne.pause();
      }
      if (music == 2) {
        levelTwo.pause();
      }
    


}
  }
  }
  
  else if(thePlayer.gameComplete){ //if the game is up, they've hit the end and gotten on the ship
    
    //lets pause our music
    
    if (music == 1) {
        levelOne.pause();
      }
      if (music == 2) {
        levelTwo.pause();
      }
    
        //lets play the finishing song and draw some text, 
        finish.play();
        textAlign(CENTER);
        textSize(28);
        text("PRESS ESCAPE TO CLOSE THE GAME!", width/2, height - 550);
        text("ESCAPE THE SPACE - MISSION I ...COMPLETE!", width/2, height - 300);
        text("GAME OBJECTIVE: ESCAPE...COMPLETE!", width/2, height - 260);
        
        
        //load up the collected total of nodes the player collected and the collective total of nodes in the initilised world arrays
        if(gameWon()){
            
        text("SECONDARY OBJECTIVE: COLLECT ALL NODES...COMPLETE!", width/2, height - 220);
        text("NODES:"+thePlayer.nodeCollectTotal +"/"+theWorld.nodeTotal, width/2, height - 180);
          }
          if(!gameWon()){
        text("SECONDARY OBJECTIVE: COLLECT ALL NODES...FAILED!", width/2, height - 220);
        text("NODES:"+thePlayer.nodeCollectTotal +"/"+theWorld.nodeTotal, width/2, height - 180);
        
        
          }
          
  
  
  }
  
  
}




void keyPressed() { //press keys to initilise the customisations, first 3 set the difficulty, last two for music

  if (keyCode == 49) {
    hack = 1;
    bub2.trigger();
  }

  if (keyCode == 50) {
    hack = 2;
    bub2.trigger();
  }

  if (keyCode == 51) {
    hack = 3;
    bub2.trigger();
  }

  if (keyCode == 52) {
    music = 1;
    bub2.trigger();
  }

  if (keyCode == 53) {
    music = 2;
    bub2.trigger();

  }
    //keypresses for player movement, set booleans true if key pressed, keyreleased to catch them
  if ( key == 'w' || key == 'W') {
    thePlayer.holdingUp = true;
  }
  if ( key == 'd' || key == 'D') {
    thePlayer.holdingRight = true;
  }
  if ( key == 'a' || key == 'A') {
    thePlayer.holdingLeft = true;
  } 
}

void keyReleased() { //if we keyrelease 'w'/'a'/'d', set movement booleans to false, we're not moving

  if ( key == 'w' || key == 'W') {
    thePlayer.holdingUp = false;
  }
  if ( key == 'a' || key == 'A') {
    thePlayer.holdingLeft = false;
  }
  if ( key == 'd' || key == 'D') {
    thePlayer.holdingRight = false;
  }
}

//void stop() { // automatically called when program exits. here we'll stop and unload sounds.
//  music.close();
//  sndJump.close();
//  sndCoin.close();
// 
//  minim.stop();
//
//  super.stop(); // tells program to continue doing its normal ending activity
//}

//BASIC PLAYER HAS BEEN SOURCED - CHRIS DELEON - http://www.hobbygamedev.com/

class Player {
  PVector position, velocity; // PVector contains two floats, x and y

    Boolean isOnGround; // used to keep track of whether the player is on the ground. useful for control and animatioPImage door;
  Boolean onShip = false;
  Boolean gameComplete = false;
  Boolean playerDead = false;


  Boolean facingRight; // used to keep track of which direction the player last moved in. used to flip player image.
  int animDelay; // countdown timer between animation updates
  int animFrame; // keeps track of which animation frame is currently shown for the player
  int nodeCollected; // a counter to keep a tally on how many node the player has collected
  int nodeCollectTotal; //a counter to keek track of how many nodes they've collected altogether
  int reduceNode; //a counter which gains the nodes collected and the nodes total to take away from the collected, incase they die...
  int runCounter; //initialized at 0 - image iterator counter

    Boolean holdingUp, holdingRight, holdingLeft, holdingSpace;

  //SOURCED
  static final float JUMP_POWER = 12; // how hard the player jolts upward on jump
  static final float RUN_SPEED = 7.0; // force of player movement on ground, in pixels/cycle
  static final float AIR_RUN_SPEED = 2.0; // like run speed, but used for control while in the air
  static final float SLOWDOWN_PERC = 0.6; // friction from the ground. multiplied by the x speed each frame.
  static final float AIR_SLOWDOWN_PERC = 0.85; // resistance in the air, otherwise air control enables crazy speeds
  static final int RUN_ANIMATION_DELAY = 3; // how many game cycles pass between animation updates?
  static final float TRIVIAL_SPEED = 1.0; // if under this speed, the player is drawn as standing still

  Player() { // constructor, gets called automatically when the Player instance is created
    holdingUp=holdingRight=holdingLeft=holdingSpace=false;
    isOnGround = false;
    facingRight = true;
    position = new PVector();
    velocity = new PVector();
    reset();
  }

  void reset() {

    hacking = 0.0f;

    if (playerDead) {
      //ONLY IF THEY DIED, we get rid of the total we added to our int because player was unsucessful, if i dont implement this, max node count could be a random int based on deaths and resets.
      nodeCollectTotal = nodeCollectTotal - nodeCollected;
      //also remove the total nodes in the game that was added during failed attempt/death
      theWorld.nodeTotal = theWorld.nodeTotal - theWorld.nodeInStage;
      playerDead = false;
    }
    //on normal reset, nodes collected = 0, reset it.
    nodeCollected = 0;
    animDelay = 0;
    animFrame = 0;
    velocity.x = 0;
    velocity.y = 0;
  }

  void inputCheck() {

    //check against the keyboard presses which are set in main class, these are constantly flagged up for movement

    float speedHere = (isOnGround ? RUN_SPEED : AIR_RUN_SPEED);
    float frictionHere = (isOnGround ? SLOWDOWN_PERC : AIR_SLOWDOWN_PERC);

    if (holdingLeft) {
      velocity.x -= speedHere;
    } 
    else if (holdingRight) {
      velocity.x += speedHere;
    } 
    velocity.x *= frictionHere; // causes player to constantly lose speed

    if (isOnGround) { // player can only jump if currently on the ground
      if (holdingUp) { // either up arrow or space bar cause the player to jump
        velocity.y = -JUMP_POWER; // adjust vertical speed
        isOnGround = false; // mark that the player has left the ground, i.e. cannot jump again for now
      }
    }
  }

  void checkForWallBumping() {
    int guyWidth = guy_stand.width; // think of image size of player standing as the player's physical size
    int guyHeight = guy_stand.height;
    int wallProbeDistance = int(guyWidth*0.7);
    int ceilingProbeDistance = int(guyHeight*0.94);

    //SOURCED
    // used as probes to detect running into walls, ceiling
    PVector leftSideHigh, rightSideHigh, leftSideLow, rightSideLow, topSide;
    leftSideHigh = new PVector();
    rightSideHigh = new PVector();
    leftSideLow = new PVector();
    rightSideLow = new PVector();
    topSide = new PVector();

    // update wall probes
    leftSideHigh.x = leftSideLow.x = position.x - wallProbeDistance; // left edge of player
    rightSideHigh.x = rightSideLow.x = position.x + wallProbeDistance; // right edge of player
    leftSideLow.y = rightSideLow.y = position.y-0.2*guyHeight; // shin high
    leftSideHigh.y = rightSideHigh.y = position.y-0.8*guyHeight; // shoulder high

    topSide.x = position.x; // center of player
    topSide.y = position.y-ceilingProbeDistance; // top of guy


    //if the player has jumped onto the carefully placed ship, they've hit the ship block and the game is completed.    
    if (theWorld.worldSquareAt(position)==World.TILE_SHIP) {
      gameComplete = true;
    } 

    //we check the collision points on the sprite against these blocks, if they're hit, they've died and reset the game.

    if ( theWorld.worldSquareAt(topSide)==World.TILE_SPIKES ||
      theWorld.worldSquareAt(leftSideHigh)==World.TILE_SPIKES ||
      theWorld.worldSquareAt(leftSideLow)==World.TILE_SPIKES ||
      theWorld.worldSquareAt(rightSideHigh)==World.TILE_SPIKES ||
      theWorld.worldSquareAt(rightSideLow)==World.TILE_SPIKES ||
      theWorld.worldSquareAt(position)==World.TILE_SPIKES ||
      theWorld.worldSquareAt(topSide)==World.TILE_SPIKESBOTTOM ||
      theWorld.worldSquareAt(leftSideHigh)==World.TILE_SPIKESBOTTOM ||
      theWorld.worldSquareAt(leftSideLow)==World.TILE_SPIKESBOTTOM ||
      theWorld.worldSquareAt(rightSideHigh)==World.TILE_SPIKESBOTTOM ||
      theWorld.worldSquareAt(rightSideLow)==World.TILE_SPIKESBOTTOM ||
      theWorld.worldSquareAt(position)==World.TILE_SPIKESBOTTOM
      ) {
      playerDead = true;
      resetGame();
      return; // any other possible collisions would be irrelevant, exit function now
    }

    //again, checking collision within the sprite, in this case, if they've hit a door block, they've moved on to the next level
    if ( theWorld.worldSquareAt(topSide)==World.TILE_NODEDOOR ||
      theWorld.worldSquareAt(leftSideHigh)==World.TILE_NODEDOOR ||
      theWorld.worldSquareAt(leftSideLow)==World.TILE_NODEDOOR ||
      theWorld.worldSquareAt(rightSideHigh)==World.TILE_NODEDOOR ||
      theWorld.worldSquareAt(rightSideLow)==World.TILE_NODEDOOR ||
      theWorld.worldSquareAt(position)==World.TILE_NODEDOOR) {
      progression++;
      resetGame();
      return; // any other possible collisions would be irrelevant, exit function now
    }

    //need to know if theyre on the ship, make ship a solid object first then call statement to win the game by making sure position is == to the same tile as ship.
    if  (theWorld.worldSquareAt(topSide)==World.TILE_SHIP ||
      theWorld.worldSquareAt(leftSideHigh)==World.TILE_SHIP ||
      theWorld.worldSquareAt(leftSideLow)==World.TILE_SHIP ||
      theWorld.worldSquareAt(rightSideHigh)==World.TILE_SHIP ||
      theWorld.worldSquareAt(rightSideLow)==World.TILE_SHIP ||
      theWorld.worldSquareAt(position)==World.TILE_SHIP) {
      //gameComplete = true;
      onShip = true;    
      return;
    }




    //the following statements check different collision parts within the sprite to check if any of them meet the arguement, if they do...it means we're touching one of the following blocks, negate velocity, make them stop.

    if ( theWorld.worldSquareAt(topSide)==World.TILE_SOLID || theWorld.worldSquareAt(topSide)==World.TILE_STATUE || theWorld.worldSquareAt(topSide)==World.TILE_STATUE2 || theWorld.worldSquareAt(topSide)==World.TILE_TUBELEFT || theWorld.worldSquareAt(topSide)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(topSide)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(topSide)==World.TILE_ROCK || theWorld.worldSquareAt(topSide)==World.TILE_SHIP) {
      if (theWorld.worldSquareAt(position)==World.TILE_SOLID || theWorld.worldSquareAt(position)==World.TILE_STATUE || theWorld.worldSquareAt(position)==World.TILE_STATUE2 || theWorld.worldSquareAt(position)==World.TILE_TUBELEFT || theWorld.worldSquareAt(position)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(position)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(position)==World.TILE_ROCK || theWorld.worldSquareAt(position)==World.TILE_SHIP) {
        position.sub(velocity);
        velocity.x=0.0;
        velocity.y=0.0;
      } 
      else {
        position.y = theWorld.bottomOfSquare(topSide)+ceilingProbeDistance;
        if (velocity.y < 0) {
          velocity.y = 0.0;
        }
      }
    }

    if ( theWorld.worldSquareAt(leftSideLow)==World.TILE_SOLID || theWorld.worldSquareAt(leftSideLow)==World.TILE_STATUE || theWorld.worldSquareAt(leftSideLow)==World.TILE_STATUE2 || theWorld.worldSquareAt(leftSideLow)==World.TILE_TUBELEFT || theWorld.worldSquareAt(leftSideLow)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(leftSideLow)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(leftSideLow)==World.TILE_ROCK || theWorld.worldSquareAt(leftSideLow)==World.TILE_SHIP) {
      position.x = theWorld.rightOfSquare(leftSideLow)+wallProbeDistance;
      if (velocity.x < 0) {
        velocity.x = 0.0;
      }
    }

    if ( theWorld.worldSquareAt(leftSideHigh)==World.TILE_SOLID || theWorld.worldSquareAt(leftSideHigh)==World.TILE_STATUE || theWorld.worldSquareAt(leftSideHigh)==World.TILE_STATUE2 || theWorld.worldSquareAt(leftSideHigh)==World.TILE_TUBELEFT || theWorld.worldSquareAt(leftSideHigh)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(leftSideHigh)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(leftSideHigh)==World.TILE_ROCK || theWorld.worldSquareAt(leftSideHigh)==World.TILE_SHIP ) {
      position.x = theWorld.rightOfSquare(leftSideHigh)+wallProbeDistance;
      if (velocity.x < 0) {
        velocity.x = 0.0;
      }
    }

    if ( theWorld.worldSquareAt(rightSideLow)==World.TILE_SOLID || theWorld.worldSquareAt(rightSideLow)==World.TILE_STATUE || theWorld.worldSquareAt(rightSideLow)==World.TILE_STATUE2 || theWorld.worldSquareAt(rightSideLow)==World.TILE_TUBELEFT || theWorld.worldSquareAt(rightSideLow)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(rightSideLow)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(rightSideLow)==World.TILE_ROCK || theWorld.worldSquareAt(rightSideLow)==World.TILE_SHIP) {
      position.x = theWorld.leftOfSquare(rightSideLow)-wallProbeDistance;
      if (velocity.x > 0) {
        velocity.x = 0.0;
      }
    }

    if ( theWorld.worldSquareAt(rightSideHigh)==World.TILE_SOLID || theWorld.worldSquareAt(rightSideHigh)==World.TILE_STATUE || theWorld.worldSquareAt(rightSideHigh)==World.TILE_STATUE2 || theWorld.worldSquareAt(rightSideHigh)==World.TILE_TUBELEFT || theWorld.worldSquareAt(rightSideHigh)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(rightSideHigh)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(rightSideHigh)==World.TILE_ROCK || theWorld.worldSquareAt(rightSideHigh)==World.TILE_SHIP) {
      position.x = theWorld.leftOfSquare(rightSideHigh)-wallProbeDistance;
      if (velocity.x > 0) {
        velocity.x = 0.0;
      }
    }
  }

  void checkForCoinGetting() {
    PVector centerOfPlayer;// this checks the center of the sprite to make sure we're not over lapping on any nodes and they're picked up and disappear
    centerOfPlayer = new PVector(position.x, position.y-guy_stand.height/2);

    if (theWorld.worldSquareAt(centerOfPlayer)==World.TILE_NODE) {
      theWorld.setSquareAtToThis(centerOfPlayer, World.TILE_EMPTY);
      bloop.trigger();    //play music
      nodeCollected++;    //add nodes to the int
      nodeCollectTotal++; //add nodes to the collective amount of nodes
      hacking -= 0.1f; //decrease the hacking increment, reduces the bar momentarilty
    }
  }

  void checkForFalling() { //if we're not standing on anything important, like an empty block or a used up NODE, let gravity kick in...
    if (theWorld.worldSquareAt(position)==World.TILE_EMPTY ||
      theWorld.worldSquareAt(position)==World.TILE_NODE) {
      isOnGround=false;
    }

    if (isOnGround==false) { //if we're not on the ground, are we currently on a block instead?  
      if (theWorld.worldSquareAt(position)==World.TILE_SOLID || theWorld.worldSquareAt(position)==World.TILE_STATUE || theWorld.worldSquareAt(position)==World.TILE_STATUE2 || theWorld.worldSquareAt(position)==World.TILE_TUBELEFT || theWorld.worldSquareAt(position)==World.TILE_TUBERIGHT || theWorld.worldSquareAt(position)==World.TILE_TUBEMIDDLE || theWorld.worldSquareAt(position)==World.TILE_ROCK || theWorld.worldSquareAt(position)==World.TILE_SHIP) { // landed on solid square?
        landing.trigger();
        isOnGround = true;
        position.y = theWorld.topOfSquare(position);
        velocity.y = 0.0;
      } 
      else { // fall
        velocity.y += GRAVITY_POWER;
      }
    }
  }

  void move() {
    position.add(velocity);

    checkForWallBumping();

    checkForCoinGetting();

    checkForFalling();
  }

  void draw() {
    int guyWidth = guy_stand.width;
    int guyHeight = guy_stand.height;

    if (velocity.x<-TRIVIAL_SPEED) {
      facingRight = false;
    } 
    else if (velocity.x>TRIVIAL_SPEED) {
      facingRight = true;
    }

    pushMatrix(); // lets us compound/accumulate translate/scale/rotate calls, then undo them all at once
    translate(position.x, position.y);
    if (facingRight==false) {
      scale(-1, 1); // flip horizontally by scaling horizontally by -100%
    }
    translate(-guyWidth/2, -guyHeight); // drawing images centered on character's feet

      if (isOnGround==false) { // if not on the ground, either falling or jumping, so lets call our respective image 
      image(rj, 0, 0); // image for when sprite is not on the ground
    } 
    else if (abs(velocity.x)<TRIVIAL_SPEED) { // not moving fast, i.e. standing
      image(guy_stand, 0, 0);
    } 
    else { // running. Animate.
      image(runImages[runCounter], 0, 0);
      delay(10);
      runCounter = ++runCounter % images.length;
    }
    popMatrix(); // undoes all translate/scale/rotate calls since the pushMatrix earlier in this function
  }
}

 
//BASIC WORLD HAS BEEN SOURCED - CHRIS DELEON - http://www.hobbygamedev.com/
class World {
  int nodeInStage; // when we load a level, we count how many node are in the level
  int nodeTotal;
  
  static final int TILE_EMPTY = 0;
  static final int TILE_SOLID = 1;
  static final int TILE_NODE = 2; //our collectables
  static final int TILE_START = 4; // the player starts where this is placed
  static final int TILE_NODEDOOR = 5; //hit this, go next level
  static final int TILE_STATUE = 6; //statue to hold the nodes
  static final int TILE_SPIKES = 7; //top spikes, if touch, reset()
  static final int TILE_SPIKESBOTTOM = 8; //bottom spikes, if touch, reset()
  static final int TILE_TUBELEFT = 9; //left tubing for block
  static final int TILE_TUBERIGHT = 10; //right tubing for block
  static final int TILE_TUBEMIDDLE = 11; //middle tubing for block
  static final int TILE_STATUE2 = 12; //statue reflect
  static final int TILE_LOOKING = 13; //space prison alien
  static final int TILE_LOOKINGR = 14; //space prison alien locked up
  static final int TILE_ROCK = 15; //rock image
  static final int TILE_RUBBLE = 16; //our rubble in level2
  static final int TILE_SHIP = 17; //our final ship, last point in game
  
  static final int GRID_UNIT_SIZE = 47; // size, in pixels, of each world unit square
  // if the above number becomes too small, how the player's wall bumping is detected may need to be updated

  // these next 2 numbers need to match the dimensions of the example level grid below
  static final int GRID_UNITS_WIDE = 43;
  static final int GRID_UNITS_TALL = 24;
  
    
  int[][] worldGrid = new int[GRID_UNITS_TALL][GRID_UNITS_WIDE]; // the game checks this one during play
  
  // the game copies this into worldGrid each reset, returning node that have since been cleared
  
  //these grids are for the level, respective places
  
  //start grid = level 1 // second grid = level 2 // third grid = level 3
  

  int[][] start_Grid = { {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                         {1, 1, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5}, 
                         {0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5},
                         {0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                         {0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                         {0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 6, 1},
                         {0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1},
                         {0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0},
                         {0, 0, 0, 12, 2, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
                         {0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
                         {4, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 2, 6, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
                         {0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1},
                         {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0 ,0},
                         {0, 0, 0, 0, 0, 0, 0, 1, 1, 12, 2, 0, 1, 12, 2, 0, 0, 0, 0, 1, 1, 0, 1, 12, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 6, 1, 0, 0, 1, 0, 0, 0, 0},
                         {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 12, 2, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 2, 6, 1},
                         {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};
                         
  int[][] second_Grid = { {1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 15, 15, 15, 15, 15},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15}, 
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 2, 15, 15, 15, 15, 15, 15, 15, 15},
                         {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 11, 11, 0, 0, 11, 11, 11, 11, 11, 11, 10, 16, 0 , 0, 9, 11, 11, 11, 11, 11, 11, 11, 10},
                         {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 1},
                         {0, 0, 0, 0, 15, 1, 1, 0, 0, 0, 0, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
                         {12, 2, 9, 10, 15, 9, 11, 11, 10, 0, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 13},
                         {9, 0, 9, 15, 15, 15, 15, 9, 10, 0, 0, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1},
                         {5, 0, 9, 10, 15, 15, 15, 15, 9, 10, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0},
                         {5, 0, 0, 9, 10, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 14},
                         {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 1, 13, 1, 1},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0,0, 0, 0, 0, 0, 0,  0, 0, 1, 1, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 10},
                         {15, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9},
                         {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 9, 10, 0, 0, 9},
                         {0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 0, 0, 0, 0, 0, 0, 0, 9, 10, 2, 6, 9},
                         {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 10},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1},
                         {1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 12, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 12, 2, 0, 0, 0, 1, 0, 0, 0 ,0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 12, 2, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 2, 6},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1},
                         {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8},
                         {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};
                         
   int[][] third_Grid = { {1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 4 , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,9 , 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 12 , 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0, 0, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 10, 0, 0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11 ,11, 11, 11, 11, 11, 11, 11, 11, 10, 0, 0, 0, 0, 0, 0},
                       {9, 11, 11, 11, 11, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 11, 11, 11, 11, 11, 10},
                        {11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11},
                         {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};
                         
                         
  
  
  
  // returns what type of tile is at a given pixel coordinate
  int worldSquareAt(PVector thisPosition) {
    float gridSpotX = thisPosition.x/GRID_UNIT_SIZE;
    float gridSpotY = thisPosition.y/GRID_UNIT_SIZE;
  
    // first a boundary check, to avoid looking outside the grid
    // if check goes out of bounds, treat it as a solid tile (wall)
    if(gridSpotX<0) {
      return TILE_SOLID; 
    }
    if(gridSpotX>=GRID_UNITS_WIDE) {
      return TILE_SOLID;
    }
    if(gridSpotY<0) {
      return TILE_SOLID; 
    }
    if(gridSpotY>=GRID_UNITS_TALL) {
      return TILE_SOLID;
      
    }
    
    return worldGrid[int(gridSpotY)][int(gridSpotX)];
  }
  
  // changes the tile at a given pixel coordinate to be a new tile type
  // currently used to replace TILE_COIN tiles with TILE_EMPTY tiles once collected
  void setSquareAtToThis(PVector thisPosition, int newTile) {
    int gridSpotX = int(thisPosition.x/GRID_UNIT_SIZE);
    int gridSpotY = int(thisPosition.y/GRID_UNIT_SIZE);
  
    if(gridSpotX<0 || gridSpotX>=GRID_UNITS_WIDE || 
       gridSpotY<0 || gridSpotY>=GRID_UNITS_TALL) {
      return; // can't change grid units outside the grid
    }
    
    worldGrid[gridSpotY][gridSpotX] = newTile;
  }
  
  // these helper functions help us correct for the player moving into a world tile
  float topOfSquare(PVector thisPosition) {
    int thisY = int(thisPosition.y);
    thisY /= GRID_UNIT_SIZE;
    return float(thisY*GRID_UNIT_SIZE);
  }
  float bottomOfSquare(PVector thisPosition) {
    if(thisPosition.y<0) {
      return 0;
    }
    return topOfSquare(thisPosition)+GRID_UNIT_SIZE;
  }
  float leftOfSquare(PVector thisPosition) {
    int thisX = int(thisPosition.x);
    thisX /= GRID_UNIT_SIZE;
    return float(thisX*GRID_UNIT_SIZE);
  }
  float rightOfSquare(PVector thisPosition) {
    if(thisPosition.x<0) {
      return 0;
    }
    return leftOfSquare(thisPosition)+GRID_UNIT_SIZE;
  }
  
  void reload() {
    nodeInStage = 0; // we count them while copying in level data
    
    for(int i=0;i<GRID_UNITS_WIDE;i++) {
      for(int ii=0;ii<GRID_UNITS_TALL;ii++) {
        if(start_Grid[ii][i] == TILE_START) { // player start position
          worldGrid[ii][i] = TILE_EMPTY; // put an empty tile in that spot
  
          // then update the player spot to the center of that tile
          thePlayer.position.x = i*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2);
          thePlayer.position.y = ii*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2);
        } else {
          //depending on our progression, have we hit one of the doors? then lets go to the next level, int is at default 1
          if(progression == 1){
          if(start_Grid[ii][i]==TILE_NODE) {
            nodeInStage++;
            nodeTotal++;
          }
          worldGrid[ii][i] = start_Grid[ii][i];
          }
          
          if(progression == 2){
            if(second_Grid[ii][i]==TILE_NODE) {
            nodeInStage++;
            nodeTotal++;
          }
          worldGrid[ii][i] = second_Grid[ii][i];
          }
          
          if(progression == 3){
            if(third_Grid[ii][i]==TILE_NODE) {
           nodeInStage++;
           nodeTotal++;
         }
        worldGrid[ii][i] = third_Grid[ii][i];
         }
         
          
        }
      }
    }
  }
  
  void render() { // draw the world
    
    
    
    for(int i=0;i<GRID_UNITS_WIDE;i++) { // for each column
      for(int ii=0;ii<GRID_UNITS_TALL;ii++) { // for each tile in that column
        switch(worldGrid[ii][i]) { // check which tile type it is
          case TILE_SOLID:
            noStroke(); // faint dark outline. set to 0 (black) to remove entirely.
            fill(225); // black
            break;
          default:
            noStroke(); // faint light outline. set to 255 (white) to remove entirely.
            noFill(); // white
            break;
        }
        // then draw a rectangle
        rect(i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE, // x,y of top left corner to draw rectangle
             GRID_UNIT_SIZE-1,GRID_UNIT_SIZE-1); // width, height of rectangle
        
        if(worldGrid[ii][i]==TILE_NODEDOOR) { 
          image(door,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);
        }
          if(worldGrid[ii][i]==TILE_NODE) { // if it's a node, draw the node
          image(node,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);
        }
          if(worldGrid[ii][i]==TILE_SOLID) { 
          image(bla,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //our solid building blocks
                    
          }
          if(worldGrid[ii][i]==TILE_TUBELEFT) { 
          image(tube_left,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //left tubing
                    
          }
          if(worldGrid[ii][i]==TILE_TUBERIGHT) { 
          image(tube_right,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //right tubing
                    
          }
          if(worldGrid[ii][i]==TILE_TUBEMIDDLE) { 
          image(tube_middle,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //middle tubing
                    
          }
          if(worldGrid[ii][i]==TILE_STATUE) { 
          image(statue,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //our statue
                    
          }
          if(worldGrid[ii][i]==TILE_STATUE2) { 
          image(statue2,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //reflect statue
                    
          }
          if(worldGrid[ii][i]==TILE_SPIKES) { 
          image(spikes,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //spikes at the top
                    
          }
          if(worldGrid[ii][i]==TILE_SPIKESBOTTOM) { 
          image(spikesbottom,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //bottom spikes
                    
          }
          
          if(worldGrid[ii][i]==TILE_LOOKING) { 
          image(looking,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //space pirate load up
                    
          }
          
          if(worldGrid[ii][i]==TILE_LOOKINGR) { 
          image(lookingr,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //space pirate 2
                    
          }
          
          if(worldGrid[ii][i]==TILE_ROCK) { 
          image(rubble,i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE);     //draw our rocks for level 2
                    
          }
          
          if(worldGrid[ii][i]==TILE_RUBBLE) { //draw destroyed terrain
          image(rock,1380,133);     
                    
          }
          
          if(worldGrid[ii][i]==TILE_SHIP) { 
          image(ship,890,360);                 //draw ship here
                    
          }
          
          
          
          
      }
    }
  }


  
}


