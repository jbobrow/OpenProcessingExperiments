
/* FINAL: FLOPPY DISK THE GAME by Leiah Fournier
 A HUGE thank you to Laurenz Rau to help me with this mess. You are a code Angel sent down by the Code God.
 */

//Import Minim *CREDIT: Processing Forum
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer theme;
AudioPlayer flap;
AudioPlayer hit;
AudioPlayer gameoverSound;
AudioPlayer youwinSound;

int wallSpeed = 3;

ArrayList walls;

//Counting Up Every Frame (60 frames a sec)
float counter = 0;

PFont atariFont;

PImage start;
PImage window;
PImage disk;
PImage hitdisk;
PImage youwin;
PImage gameover;
PImage diskdrive;
PImage diskslot;

//Death Pause (just a brief moment to really feel that butthurt)
int pauseLength = 40;
int pauseTimer = 0;
boolean wasHit=false;

//How Many Times You've Failed
int failingCounter=0;

//Variable To Change Faces
PImage currentFace;


String gamestate = "startScreen";
int xPlayer; 
int yPlayer; 
int gravity;

//The Timer for the Break Between Walls
int wallTimer;
//The Change of Position X in the Winning Scene
int insert = 0;

void setup() {

  size(500, 500, P2D);

  xPlayer = 200;
  yPlayer = 0;
  gravity = 0; //I know it's not really gravity because it's not a force, but gimme a break will ya?

  walls = new ArrayList();

  //Font
  //String[] fontList = PFont.list(); //Thank you Processing
  //printLn(fontList);
  atariFont = createFont("Emulogic",12);
  textFont (atariFont);

  //Images
  start = loadImage("start.png");
  window = loadImage ("window.png");
  hitdisk = loadImage("hitdisk.png");
  disk = loadImage("disk.png");
  youwin = loadImage("youwin.png");
  gameover = loadImage ("gameover.png");
  diskdrive = loadImage("diskdrive.png");
  diskslot = loadImage("diskslot.png");

  //A Disk With Many Faces
  disk.resize (0, 60);
  hitdisk.resize (0, 60);
  currentFace = disk;

  //Sounds
  minim = new Minim(this);
  theme = minim.loadFile("floppydisktheme.mp3");
  flap = minim.loadFile("flapsound.mp3");
  hit = minim.loadFile("hitsound.mp3");
  gameoverSound = minim.loadFile("gameoversound.mp3");
  youwinSound = minim.loadFile("youwinsound.mp3");
}

void draw () {
  background(0);
  imageMode(CENTER); 

  //Counting in Seconds
  float  secondCounter=counter/60;
  println(secondCounter);

  //Counts How Many Times You've Failed
  for (int i =0; i<5-failingCounter; i++) {

    //Lives
    image(disk, i*30+40, 50, 30, 30);
  }

  //Cut Scene
  if (secondCounter>21) { //gameplay ends at 21 seconds
    gamestate="win";
  }
  if (gamestate=="win") {

    gravity=0; //gravity is turned off
    if (yPlayer>height/2) { //reposition player to be in middle
      yPlayer-=1;
    }
    if (yPlayer<height/2) {
      yPlayer+=1;
    }

    image(diskslot, 395, 247, 20, 120);

    pushMatrix(); //save the matrix
    insert+=2; //moving at the speed of 2
    translate(200+insert, height/2);
    rotate(radians(90));
    image(currentFace, 0, 0);
    popMatrix(); //reset the matrix 

      image(diskdrive, 445, 250, 90, 120);

    if (insert>300) {
      image(youwin, width/2, height/2);
      youwinSound.play();
    }
  }
  wallTimer++;

  //Adding Wall to List walls
  if (wallTimer> 80 && secondCounter<19) { //Create a new wall after 80 frames until reaching 19 seconds 
    walls.add( new Wall( int(random(140, 360)))); //add to the list of walls a new wall, the y position is randomized
    wallTimer= 0; //reset to run again
  }
  //
  for (int i=walls.size ()-1; i>=0; i--) { //-1 the 0th place holder causing a shift down, counting down from highest number
    Wall wall = (Wall) walls.get(i); //instantiate a new wall from the class Wall, get data from the array list, overrides previous wall
    wall.update(); 
    wall.display();
  } 

  //Over 5 Tries, It's Game Over
  if (failingCounter>4) {
    gamestate ="failScreen";
  }
  if (gamestate =="failScreen") {
    theme.pause();
    gameoverSound.play();
    image(gameover, width/2, height/2);
  }

  //GamePlay
  if (gamestate == "inGame" && wasHit==false) {//if you are in game and not hit, do all this:
    counter++;
    theme.play();
    //Floppy Disk Movement
    gravity += 1;
    yPlayer += gravity;
    image(currentFace, xPlayer, yPlayer);

    if (yPlayer > height || yPlayer < 0 ) { //if you hit borders
      wallSpeed=0; //walls stop
      wasHit=true; //player was hit
      failingCounter+=1; //adding one to the fail counter
      hit.play();
      hit.rewind();
    }
  } else if (gamestate == "inGame" && wasHit==true) {//if you are in game and hit, do all this:
    pauseTimer++;
    gravity = 0;
    currentFace = hitdisk;
    image(currentFace, xPlayer, yPlayer);

    if (pauseTimer>pauseLength) { //if pause is over, return to in game play
      gamestate = "inGame";
      counter = 0; //reset counter
      theme.rewind();
      yPlayer = 10;
      pauseTimer=0; //pause timer is reset
      currentFace=disk;

      for (int i=walls.size ()-1; i>=0; i--) {//remove all the walls = reset 
        walls.remove(i);
      } 
      wallSpeed=3; //reset wall speed back
      wasHit=false; //no longer hit
    }
  } 
  if (gamestate == "startScreen") {
    //Title Menu Background
    imageMode(CENTER);
    image (start, width/2, height/2);
    imageMode(CENTER);
  }
  image(window, width/2, height/2); //drawn always

  //Oh To Flap As The Birds Do
  if (keyPressed) { //Thank you yet again Processing for providing an alternative to onkeypressed
    if (key == ' ') { //spacebar 

      gravity = -10; //pushing player up

      if (gamestate=="inGame") {
        flap.play();
        flap.rewind();
      }
      if (gamestate == "startScreen") {
        yPlayer = height/2; //starting position at new game
        gamestate = "inGame";
      }
    }
  }
}


class Wall {
  //Global Variables
  int WallPosX = 600;
  int WallPosY;
  int WallHeight = 400;
  int WallWidth = 40;

  boolean ableColliding = true;

  int gapSize = 200;

  //It's One-Sided When You're Arguing With A Wall - ha ha
  Wall(int posY) { //what kind of input it needs to exist
    WallPosY = posY;//global variable takes the arugment value
  }

  void update() {
    WallPosX -= wallSpeed; //wall moving direction


    //Wall Constraints aka Player Must Be Within the Gap or Perish
    //if
    //  (                 all that                      )and(either     this            or          this              ) and this         and    this)  is true
    //  (    check if player is at same Xpos as the wall)and(you hit the lower wall     or   you hit the upper wall   )
    if ((xPlayer>WallPosX && xPlayer<WallPosX+WallWidth ) && (yPlayer>WallPosY+gapSize/2 || yPlayer<WallPosY-gapSize/2) && ableColliding && gamestate=="inGame") {
     
      wallSpeed = 0;
      wasHit = true;
      failingCounter+=1;
      hit.play();
      hit.rewind();
      ableColliding = false; //after all this, then turn off
    }
  }

  void display() {
    fill(255);

    //Binary Lower Wall
    for (int column = 0; column < 4; column++) {
      for (int row = 0; row < 30; row++) {
        String  binaryNumber= str(int(random(0, 2))); //float converted to integar coverted to string 
        text(binaryNumber, WallPosX+ column*10, WallPosY+gapSize/2+ row*15);
      }
    }
    //Binary Upper Wall
    for (int column = 0; column < 4; column++) {
      for (int row = 0; row < 30; row++) {
        String  binaryNumber= str(int(random(0, 2)));
        text(binaryNumber, WallPosX+ column*10, WallPosY-WallHeight-40-gapSize/2+ row*15);
      }
    }
  }
}



