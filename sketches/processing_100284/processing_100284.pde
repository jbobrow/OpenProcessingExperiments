
/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */

// these next 2 lines are used for sound
import ddf.minim.*;
Minim minim;

// for storing and referencing animation frames for the player character
PImage guy_stand, guy_run1, guy_run2, npc_run, npc_stand;

// music and sound effects
AudioPlayer music; // AudioPlayer uses less memory. Better for music.
AudioSample sndJump, sndCoin; // AudioSample plays more respnosively. Better for sound effects.

// we use this to track how far the camera has scrolled left or right
float cameraOffsetX;

Player thePlayer = new Player();
World theWorld = new World();
Keyboard theKeyboard = new Keyboard();
NPC npc1 = new NPC();


PFont font;

// we use these for keeping track of how long player has played
int gameStartTimeSec,gameCurrentTimeSec;

// by adding this to the player's y velocity every frame, we get gravity
final float GRAVITY_POWER = 0.5; // try making it higher or lower!

void setup() { // called automatically when the program starts
  size(1024,300); // how large the window/screen is for the game
  
  font = loadFont("SansSerif-20.vlw");
  
  guy_stand = loadImage("guy.png");
  guy_run1 = loadImage("run1.png");
  guy_run2 = loadImage("run2.png");
  npc_run = loadImage("npc_run.png");
  npc_stand = loadImage("npc_stop.png");
  cameraOffsetX = 0.0;
  
  minim = new Minim(this);
  music = minim.loadFile("mariotheme.mp3", 1024);
  music.loop();
  int buffersize = 256;
  sndJump = minim.loadSample("jump.wav", buffersize);
  sndCoin = minim.loadSample("coin.wav", buffersize);
  
  frameRate(24); // this means draw() will be called 24 times per second
  
  resetGame(); // sets up player, game level, and timer
}

void resetGame() {
  // This function copies start_Grid into worldGrid, putting coins back
  // multiple levels could be supported by copying in a different start grid
  
  thePlayer.reset(); // reset the coins collected number, etc.
  
  theWorld.reload(); // reset world map

  // reset timer in corner
  gameCurrentTimeSec = gameStartTimeSec = millis()/1000; // dividing by 1000 to turn milliseconds into seconds
}

Boolean gameWon() { // checks whether all coins in the level have been collected
  return (thePlayer.coinsCollected == theWorld.coinsInStage);
}

void outlinedText(String sayThis, float atX, float atY) {
  textFont(font); // use the font we loaded
  fill(0); // white for the upcoming text, drawn in each direction to make outline
  text(sayThis, atX-1,atY);
  text(sayThis, atX+1,atY);
  text(sayThis, atX,atY-1);
  text(sayThis, atX,atY+1);
  fill(255); // white for this next text, in the middle
  text(sayThis, atX,atY);
}

void updateCameraPosition() {
  int rightEdge = World.GRID_UNITS_WIDE*World.GRID_UNIT_SIZE-width;
  // the left side of the camera view should never go right of the above number
  // think of it as "total width of the game world" (World.GRID_UNITS_WIDE*World.GRID_UNIT_SIZE)
  // minus "width of the screen/window" (width)
  
  cameraOffsetX = thePlayer.position.x-width/2;
  if(cameraOffsetX < 0) {
    cameraOffsetX = 0;
  }
  
  if(cameraOffsetX > rightEdge) {
    cameraOffsetX = rightEdge;
  }
}

void draw() { // called automatically, 24 times per second because of setup()'s call to frameRate(24)
  pushMatrix(); // lets us easily undo the upcoming translate call
  translate(-cameraOffsetX,0.0); // affects all upcoming graphics calls, until popMatrix
  updateCameraPosition();
  theWorld.render();
  thePlayer.inputCheck();
  thePlayer.move();
  thePlayer.draw();
  npc1.move();
  npc1.draw();
  popMatrix(); // undoes the translate function from earlier in draw()
  
  
  
  if(focused == false) { // does the window currently not have keyboard focus?
    textAlign(CENTER);
    outlinedText("Click this area to play.\n\nUse arrows to move.\nSpacebar to jump.",width/2, height-90);
  } else {
    textAlign(LEFT); 
    outlinedText("Items:"+thePlayer.coinsCollected +"/"+theWorld.coinsInStage,8, height-10);
    
    textAlign(RIGHT);
    if(gameWon() == false) { // stop updating timer after player finishes
      gameCurrentTimeSec = millis()/1000; // dividing by 1000 to turn milliseconds into seconds
    }
    int minutes = (gameCurrentTimeSec-gameStartTimeSec)/60;
    int seconds = (gameCurrentTimeSec-gameStartTimeSec)%60;
    if(seconds < 10) { // pad the "0" into the tens position
      outlinedText(minutes +":0"+seconds,width-8, height-10);
    } else {
      outlinedText(minutes +":"+seconds,width-8, height-10);
    }
    
    textAlign(CENTER); // center align the text
    outlinedText("Music by Kevin MacLeod, Code by Chris DeLeon",width/2, 25);
    if(gameWon()) {
      outlinedText("All Items Collected!\nPress R to Reset.",width/2, height/2-12);
    }
  }
}

void keyPressed(KeyEvent evt) {
  theKeyboard.pressKey(evt.getKeyCode());
}

void keyReleased(KeyEvent evt) {
  theKeyboard.releaseKey(evt.getKeyCode());
}

void stop() { // automatically called when program exits. here we'll stop and unload sounds.
  music.close();
  sndJump.close();
  sndCoin.close();
 
  minim.stop();

  super.stop(); // tells program to continue doing its normal ending activity
}
/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */
import java.awt.event.KeyEvent;
class Keyboard {
  // used to track keyboard input
  Boolean holdingUp,holdingRight,holdingLeft,holdingSpace,holdingFast;
  
  Keyboard() {
    holdingUp=holdingRight=holdingLeft=holdingSpace=holdingFast=false;
  }
  
  /* The way that Processing, and many programming languages/environments, deals with keys is
   * treating them like events (something can happen the moment it goes down, or when it goes up).
   * Because we want to treat them like buttons - checking "is it held down right now?" - we need to
   * use those pressed and released events to update some true/false values that we can check elsewhere.
   */

  void pressKey(int key) {
    if(key == KeyEvent.VK_R) { // never will be held down, so no Boolean needed to track it
      if(gameWon()) { // if the game has been won...
        resetGame(); // then R key resets it
      }
    }
   
    if (key == KeyEvent.VK_UP) {
      holdingUp = true;
    }
    if (key == KeyEvent.VK_SHIFT) {
      holdingFast = true;
    }
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = true;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = true;
    }
    if (key == KeyEvent.VK_SPACE) {
      holdingSpace = true;
    }
  }
  void releaseKey(int key) {
    if (key == KeyEvent.VK_UP) {
      holdingUp = false;
    }
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = false;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = false;
    }
    if (key == KeyEvent.VK_SPACE) {
      holdingSpace = false;
    }
    if (key == KeyEvent.VK_SHIFT) {
      holdingFast = false;
    }
  }
}
/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */

class NPC {
  PVector position,velocity; // PVector contains two floats, x and y

  Boolean isOnGround; // used to keep track of whether the player is on the ground. useful for control and animation.
  Boolean facingRight; // used to keep track of which direction the player last moved in. used to flip player image.
  int animDelay; // countdown timer between animation updates
  int animFrame; // keeps track of which animation frame is currently shown for the player
  
  
  static final float JUMP_POWER = 5.0; // how hard the player jolts upward on jump
  static final float RUN_SPEED = 2.0; // force of player movement on ground, in pixels/cycle
  static final float AIR_RUN_SPEED = 2.0; // like run speed, but used for control while in the air
  static final float SLOWDOWN_PERC = 0.6; // friction from the ground. multiplied by the x speed each frame.
  static final float AIR_SLOWDOWN_PERC = 0.85; // resistance in the air, otherwise air control enables crazy speeds
  static final int RUN_ANIMATION_DELAY = 3; // how many game cycles pass between animation updates?
  static final float TRIVIAL_SPEED = 1.0; // if under this speed, the player is drawn as standing still
  
  NPC() { // constructor, gets called automatically when the Player instance is created
    isOnGround = false;
    facingRight = true;
    position = new PVector();
    velocity = new PVector();
    reset();
  }
  
  void reset() {
    animDelay = 0;
    animFrame = 0;
    velocity.x = 0;
    velocity.y = 0;
  }
  
  void checkForWallBumping() {
    int guyWidth = npc_stand.width; // think of image size of player standing as the player's physical size
    int guyHeight = npc_stand.height;
    int wallProbeDistance = int(guyWidth*0.3);
    int ceilingProbeDistance = int(guyHeight*0.95);
    
    /* Because of how we draw the player, "position" is the center of the feet/bottom
     * To detect and handle wall/ceiling collisions, we create 5 additional positions:
     * leftSideHigh - left of center, at shoulder/head level
     * leftSideLow - left of center, at shin level
     * rightSideHigh - right of center, at shoulder/head level
     * rightSideLow - right of center, at shin level
     * topSide - horizontal center, at tip of head
     * These 6 points - 5 plus the original at the bottom/center - are all that we need
     * to check in order to make sure the player can't move through blocks in the world.
     * This works because the block sizes (World.GRID_UNIT_SIZE) aren't small enough to
     * fit between the cracks of those collision points checked.
     */
    
    // used as probes to detect running into walls, ceiling
    PVector leftSideHigh,rightSideHigh,leftSideLow,rightSideLow,topSide;
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

    // if any edge of the player is inside a red killblock, reset the round
    if( theWorld.worldSquareAt(topSide)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(leftSideHigh)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(leftSideLow)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(rightSideHigh)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(rightSideLow)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(position)==World.TILE_KILLBLOCK) {
      resetGame();
      return; // any other possible collisions would be irrelevant, exit function now
    }
    
    // the following conditionals just check for collisions with each bump probe
    // depending upon which probe has collided, we push the player back the opposite direction
    
    if( theWorld.worldSquareAt(topSide)==World.TILE_SOLID) {
      if(theWorld.worldSquareAt(position)==World.TILE_SOLID) {
        position.sub(velocity);
        velocity.x=0.0;
        velocity.y=0.0;
      } else {
        position.y = theWorld.bottomOfSquare(topSide)+ceilingProbeDistance;
        if(velocity.y < 0) {
          velocity.y = 0.0;
        }
      }
    }
    
    if( theWorld.worldSquareAt(leftSideLow)==World.TILE_SOLID) {
      position.x = theWorld.rightOfSquare(leftSideLow)+wallProbeDistance;
      if(velocity.x < 0) {
        velocity.x = 0.0;
      }
    }
   
    if( theWorld.worldSquareAt(leftSideHigh)==World.TILE_SOLID) {
      position.x = theWorld.rightOfSquare(leftSideHigh)+wallProbeDistance;
      if(velocity.x < 0) {
        velocity.x = 0.0;
      }
    }
   
    if( theWorld.worldSquareAt(rightSideLow)==World.TILE_SOLID) {
      position.x = theWorld.leftOfSquare(rightSideLow)-wallProbeDistance;
      if(velocity.x > 0) {
        velocity.x = 0.0;
      }
    }
   
    if( theWorld.worldSquareAt(rightSideHigh)==World.TILE_SOLID) {
      position.x = theWorld.leftOfSquare(rightSideHigh)-wallProbeDistance;
      if(velocity.x > 0) {
        velocity.x = 0.0;
      }
    }
  }


  void checkForFalling() {
    // If we're standing on an empty or coin tile, we're not standing on anything. Fall!
    if(theWorld.worldSquareAt(position)==World.TILE_EMPTY ||
       theWorld.worldSquareAt(position)==World.TILE_COIN) {
       isOnGround=false;
    }
    
    if(isOnGround==false) { // not on ground?    
      if(theWorld.worldSquareAt(position)==World.TILE_SOLID) { // landed on solid square?
        isOnGround = true;
        position.y = theWorld.topOfSquare(position);
        velocity.y = 0.0;
      } else { // fall
        velocity.y += GRAVITY_POWER;
      }
    }
  }

  void move() {
    
    inputCheck();
    position.add(velocity);
    
    checkForWallBumping();
    
    checkForFalling();
    
  }
  void inputCheck() {
    // keyboard flags are set by keyPressed/keyReleased in the main .pde
    Boolean goingSide;
    float speedHere = (isOnGround ? RUN_SPEED : AIR_RUN_SPEED);
    float frictionHere = (isOnGround ? SLOWDOWN_PERC : AIR_SLOWDOWN_PERC);
    if((frameCount%240)<239 && (frameCount%240)>120)
    {
      goingSide=true;
    }
      else
      {
        goingSide=false;
      }
    if(goingSide) {
      velocity.x -= speedHere;
    } else if(!goingSide) {
      velocity.x += speedHere;
    } 
    velocity.x *= frictionHere; // causes player to constantly lose speed
    
    if(isOnGround) { // player can only jump if currently on the ground
      if(false) { // either up arrow or space bar cause the player to jump
        sndJump.trigger(); // play sound
        velocity.y = -JUMP_POWER; // adjust vertical speed
        isOnGround = false; // mark that the player has left the ground, i.e. cannot jump again for now
      }
    }
  }
  
  void draw() {
    int guyWidth = npc_stand.width;
    int guyHeight = npc_stand.height;
    
    if(velocity.x<-TRIVIAL_SPEED) {
      facingRight = false;
    } else if(velocity.x>TRIVIAL_SPEED) {
      facingRight = true;
    }
    
    pushMatrix(); // lets us compound/accumulate translate/scale/rotate calls, then undo them all at once
    translate(position.x,position.y);
    if(facingRight==false) {
      scale(-1,1); // flip horizontally by scaling horizontally by -100%
    }
    translate(-guyWidth/2,-guyHeight); // drawing images centered on character's feet

    if(isOnGround==false) { // falling or jumping
      image(npc_run, 0,0); // this running pose looks pretty good while in the air
    } else if(abs(velocity.x)<TRIVIAL_SPEED) { // not moving fast, i.e. standing
      image(npc_stand, 0,0);
    } else { // running. Animate.
      if(animDelay--<0) {
        animDelay=RUN_ANIMATION_DELAY;
        if(animFrame==0) {
          animFrame=1;
        } else {
          animFrame=0;
        }
      }
      
      if(animFrame==0) {
        image(npc_run, 0,0);
      } else {
        image(npc_stand, 0,0);
      }
    }
    
    popMatrix(); // undoes all translate/scale/rotate calls since the pushMatrix earlier in this function
  }
}

/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */

class Player {
  PVector position,velocity; // PVector contains two floats, x and y

  Boolean isOnGround; // used to keep track of whether the player is on the ground. useful for control and animation.
  Boolean facingRight; // used to keep track of which direction the player last moved in. used to flip player image.
  int animDelay; // countdown timer between animation updates
  int animFrame; // keeps track of which animation frame is currently shown for the player
  int coinsCollected; // a counter to keep a tally on how many coins the player has collected
  
  static final float JUMP_POWER = 11.0; // how hard the player jolts upward on jump
  static final float RUN_SPEED = 5.0; // force of player movement on ground, in pixels/cycle
  static final float WALK_SLOW = 2.0; // walk slow
  static final float AIR_RUN_SPEED = 2.0; // like run speed, but used for control while in the air
  static final float SLOWDOWN_PERC = 0.6; // friction from the ground. multiplied by the x speed each frame.
  static final float AIR_SLOWDOWN_PERC = 0.85; // resistance in the air, otherwise air control enables crazy speeds
  static final int RUN_ANIMATION_DELAY = 3; // how many game cycles pass between animation updates?
  static final float TRIVIAL_SPEED = 1.0; // if under this speed, the player is drawn as standing still
  
  Player() { // constructor, gets called automatically when the Player instance is created
    isOnGround = false;
    facingRight = true;
    position = new PVector();
    velocity = new PVector();
    reset();
  }
  
  void reset() {
    coinsCollected = 0;
    animDelay = 0;
    animFrame = 0;
    velocity.x = 0;
    velocity.y = 0;
  }
  
  void inputCheck() {
    
    
    float speedHere = (isOnGround ?(theKeyboard.holdingFast ? RUN_SPEED : WALK_SLOW) : AIR_RUN_SPEED);
    float frictionHere = (isOnGround ? SLOWDOWN_PERC : AIR_SLOWDOWN_PERC);
    
    if(theKeyboard.holdingLeft) {
      velocity.x -= speedHere;
    } else if(theKeyboard.holdingRight) {
      velocity.x += speedHere;
    } 
    velocity.x *= frictionHere; // causes player to constantly lose speed
    
    if(isOnGround) { // player can only jump if currently on the ground
      if(theKeyboard.holdingSpace || theKeyboard.holdingUp) { // either up arrow or space bar cause the player to jump
        sndJump.trigger(); // play sound
        velocity.y = -JUMP_POWER; // adjust vertical speed
        isOnGround = false; // mark that the player has left the ground, i.e. cannot jump again for now
      }
    }
  }
  
  void checkForWallBumping() {
    int guyWidth = guy_stand.width; // think of image size of player standing as the player's physical size
    int guyHeight = guy_stand.height;
    int wallProbeDistance = int(guyWidth*0.3);
    int ceilingProbeDistance = int(guyHeight*0.95);
    
    /* Because of how we draw the player, "position" is the center of the feet/bottom
     * To detect and handle wall/ceiling collisions, we create 5 additional positions:
     * leftSideHigh - left of center, at shoulder/head level
     * leftSideLow - left of center, at shin level
     * rightSideHigh - right of center, at shoulder/head level
     * rightSideLow - right of center, at shin level
     * topSide - horizontal center, at tip of head
     * These 6 points - 5 plus the original at the bottom/center - are all that we need
     * to check in order to make sure the player can't move through blocks in the world.
     * This works because the block sizes (World.GRID_UNIT_SIZE) aren't small enough to
     * fit between the cracks of those collision points checked.
     */
    
    // used as probes to detect running into walls, ceiling
    PVector leftSideHigh,rightSideHigh,leftSideLow,rightSideLow,topSide;
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

    // if any edge of the player is inside a red killblock, reset the round
    if( theWorld.worldSquareAt(topSide)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(leftSideHigh)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(leftSideLow)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(rightSideHigh)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(rightSideLow)==World.TILE_KILLBLOCK ||
         theWorld.worldSquareAt(position)==World.TILE_KILLBLOCK) {
      resetGame();
      return; // any other possible collisions would be irrelevant, exit function now
    }
    
    // the following conditionals just check for collisions with each bump probe
    // depending upon which probe has collided, we push the player back the opposite direction
    
    if( theWorld.worldSquareAt(topSide)==World.TILE_SOLID) {
      if(theWorld.worldSquareAt(position)==World.TILE_SOLID) {
        position.sub(velocity);
        velocity.x=0.0;
        velocity.y=0.0;
      } else {
        position.y = theWorld.bottomOfSquare(topSide)+ceilingProbeDistance;
        if(velocity.y < 0) {
          velocity.y = 0.0;
        }
      }
    }
    
    if( theWorld.worldSquareAt(leftSideLow)==World.TILE_SOLID) {
      position.x = theWorld.rightOfSquare(leftSideLow)+wallProbeDistance;
      if(velocity.x < 0) {
        velocity.x = 0.0;
      }
    }
   
    if( theWorld.worldSquareAt(leftSideHigh)==World.TILE_SOLID) {
      position.x = theWorld.rightOfSquare(leftSideHigh)+wallProbeDistance;
      if(velocity.x < 0) {
        velocity.x = 0.0;
      }
    }
   
    if( theWorld.worldSquareAt(rightSideLow)==World.TILE_SOLID) {
      position.x = theWorld.leftOfSquare(rightSideLow)-wallProbeDistance;
      if(velocity.x > 0) {
        velocity.x = 0.0;
      }
    }
   
    if( theWorld.worldSquareAt(rightSideHigh)==World.TILE_SOLID) {
      position.x = theWorld.leftOfSquare(rightSideHigh)-wallProbeDistance;
      if(velocity.x > 0) {
        velocity.x = 0.0;
      }
    }
  }

  void checkForCoinGetting() {
    PVector centerOfPlayer;
    // we use this to check for coin overlap in center of player
    // (remember that "position" is keeping track of bottom center of feet)
    centerOfPlayer = new PVector(position.x,position.y-guy_stand.height/2);

    if(theWorld.worldSquareAt(centerOfPlayer)==World.TILE_COIN) {
      theWorld.setSquareAtToThis(centerOfPlayer, World.TILE_EMPTY);
      sndCoin.trigger();
      coinsCollected++;
    }
  }

  void checkForFalling() {
    // If we're standing on an empty or coin tile, we're not standing on anything. Fall!
    if(theWorld.worldSquareAt(position)==World.TILE_EMPTY ||
       theWorld.worldSquareAt(position)==World.TILE_COIN) {
       isOnGround=false;
    }
    
    if(isOnGround==false) { // not on ground?    
      if(theWorld.worldSquareAt(position)==World.TILE_SOLID) { // landed on solid square?
        isOnGround = true;
        position.y = theWorld.topOfSquare(position);
        velocity.y = 0.0;
      } else { // fall
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
    
    if(velocity.x<-TRIVIAL_SPEED) {
      facingRight = false;
    } else if(velocity.x>TRIVIAL_SPEED) {
      facingRight = true;
    }
    
    pushMatrix(); // lets us compound/accumulate translate/scale/rotate calls, then undo them all at once
    translate(position.x,position.y);
    if(facingRight==false) {
      scale(-1,1); // flip horizontally by scaling horizontally by -100%
    }
    translate(-guyWidth/2,-guyHeight); // drawing images centered on character's feet

    if(isOnGround==false) { // falling or jumping
      image(guy_run1, 0,0); // this running pose looks pretty good while in the air
    } else if(abs(velocity.x)<TRIVIAL_SPEED) { // not moving fast, i.e. standing
      image(guy_stand, 0,0);
    } else { // running. Animate.
      if(animDelay--<0) {
        animDelay=RUN_ANIMATION_DELAY;
        if(animFrame==0) {
          animFrame=1;
        } else {
          animFrame=0;
        }
      }
      
      if(animFrame==0) {
        image(guy_run1, 0,0);
      } else {
        image(guy_run2, 0,0);
      }
    }
    
    popMatrix(); // undoes all translate/scale/rotate calls since the pushMatrix earlier in this function
  }
}

/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */
import java.lang.*;
class World {
  PImage denemetexture, wall, window, wallhanging, door, chest,table ;
  int coinsInStage; // when we load a level, we count how many coins are in the level
  int coinRotateTimer; // number cycles, and is used to give coins a simple spinning effect

  static final int TILE_EMPTY = 0;
  static final int TILE_SOLID = 1;
  static final int TILE_COIN = 2;
  static final int TILE_KILLBLOCK = 3;
  static final int TILE_START = 4; // the player starts where this is placed
  static final int TILE_NPC_START = 5;
  static final int TILE_WALL = 6;
  static final int TILE_DOOR = 7;
  static final int TILE_WINDOW = 8;
  static final int TILE_WALLHANGING = 9;
  static final int TILE_CHEST = 10;
  static final int GRID_UNIT_SIZE = 60; // size, in pixels, of each world unit square
  // if the above number becomes too small, how the player's wall bumping is detected may need to be updated

  // these next 2 numbers need to match the dimensions of the example level grid below
  static final int GRID_UNITS_WIDE = 42;
  static final int GRID_UNITS_TALL = 5;

  int[][] worldGrid = new int[GRID_UNITS_TALL][GRID_UNITS_WIDE]; // the game checks this one during play
  
  // the game copies this into worldGrid each reset, returning coins that have since been cleared
  int[][] start_Grid = { {6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6},
                         {6, 6, 6, 6, 6, 6, 6, 9, 6, 6, 6, 6, 6, 6, 6, 9, 6, 6, 6, 6, 6, 6, 6, 9, 6, 6, 6, 6, 6, 6, 6, 9, 6, 6, 6, 6, 6, 6, 6, 9, 6, 6},
                         {6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8, 6, 6, 6, 8},
                         {6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 2, 6, 6, 6, 6},
                         {6, 6, 7, 4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,10, 6, 6, 6, 6, 6}, };
  // try changing numbers in that grid to make the level different! Look for the "static final int TILE_" lines
  // up above in this same file for a key of what each number corresponds to.

  World() { // this gets called when World is created.
    coinRotateTimer = 0; // initializing coinRotateTimer to a reasonable start value.
  }
  
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
    coinsInStage = 0; // we count them while copying in level data
    
    for(int i=0;i<GRID_UNITS_WIDE;i++) {
      for(int ii=0;ii<GRID_UNITS_TALL;ii++) {
        if(start_Grid[ii][i] == TILE_START) { // player start position
          worldGrid[ii][i] = TILE_WALL; // put an empty tile in that spot
  
          // then update the player spot to the center of that tile
          thePlayer.position.x = i*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2);
          thePlayer.position.y = ii*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2);
        } else {
          if(start_Grid[ii][i]==TILE_COIN) {
            coinsInStage++;
          }
          else
          {
            if(start_Grid[ii][i] == TILE_NPC_START) { // npc start position
              worldGrid[ii][i] = TILE_WALL; // put an empty tile in that spot
  
              // then update the npc spot to the center of that tile
              npc1.position.x = i*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2);
              npc1.position.y = ii*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2);
            }
          }
          worldGrid[ii][i] = start_Grid[ii][i];
        }
      }
    }
  }
  
  void render() { // draw the world
      denemetexture = loadImage("denemetexture.png");
      wall = loadImage("wall.jpg");
      wallhanging = loadImage("wallhanging.jpg");
      door = loadImage("door.jpg");
      window = loadImage("window.jpg");
      chest = loadImage("chest.jpg");
      table = loadImage("table.jpg");
    // these next few lines cycle a number we use to make it look like coins are spinning
    coinRotateTimer--;
    if(coinRotateTimer<-GRID_UNIT_SIZE/3) {
      coinRotateTimer = GRID_UNIT_SIZE/3;
    }
    
    for(int i=0;i<GRID_UNITS_WIDE;i++) { // for each column
      for(int ii=0;ii<GRID_UNITS_TALL;ii++) { // for each tile in that column
        switch(worldGrid[ii][i]) { // check which tile type it is
          case TILE_SOLID:
            //stroke(40); // faint dark outline. set to 0 (black) to remove entirely.
            //fill(0); // black
            image(table,(i*GRID_UNIT_SIZE),(ii*GRID_UNIT_SIZE)  ); // load the solid texture
            break;
          case TILE_KILLBLOCK:
            stroke(255,0,0); // red outline, blends in with the red fill
            fill(255,0,0); // black
            break;
            case TILE_WINDOW:
            image(window,(i*GRID_UNIT_SIZE),(ii*GRID_UNIT_SIZE)  ); // load the solid texture
            break;
            case TILE_DOOR:
            image(door,(i*GRID_UNIT_SIZE),(ii*GRID_UNIT_SIZE)  ); // load the solid texture
            break;
            case TILE_WALLHANGING:
            image(wallhanging,(i*GRID_UNIT_SIZE),(ii*GRID_UNIT_SIZE)  ); // load the solid texture
            break;
            case TILE_CHEST:
            image(chest,(i*GRID_UNIT_SIZE),(ii*GRID_UNIT_SIZE)  ); // load the solid texture
            break;
          default:
            //stroke(245); // faint light outline. set to 255 (white) to remove entirely.
            //fill(255); // white
            
           noStroke();
           noFill();
           image(wall,(i*GRID_UNIT_SIZE),(ii*GRID_UNIT_SIZE) );
            break;
           
        }
        // then draw a rectangle
        rect(i*GRID_UNIT_SIZE,ii*GRID_UNIT_SIZE, // x,y of top left corner to draw rectangle
             GRID_UNIT_SIZE-1,GRID_UNIT_SIZE-1); // width, height of rectangle
        
        if(worldGrid[ii][i]==TILE_COIN) { // if it's a coin, draw the coin
          stroke(0); // black outline
          fill(255,255,0); // yellow
          ellipse(i*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2),ii*GRID_UNIT_SIZE+(GRID_UNIT_SIZE/2), // center of grid spot
                  abs(coinRotateTimer),GRID_UNIT_SIZE/2); // spin size wide, 1/2 height of box tall
          
        }
      }
    }
  }
}


