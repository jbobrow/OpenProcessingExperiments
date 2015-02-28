
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


