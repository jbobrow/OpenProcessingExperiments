
/*

 a very simple example that draws the camera pixels
 to the screen using the pixel[] array.
 
 last tested to work in Processing 0090
 
 JTNIMOY
 
 */

import JMyron.*;

import krister.Ess.*;

//Changes made from Prototype: 
//Different Menus
//Lose condition and win condition is changed. 
//more scenes, music and sounds, and better graphics.

//Used color tracking from globe assignment.
//But made only the color red followed.
//Audio was originally from the ballcatch. 
//but I had to double check on the internet.
//Used different sounds for different purposes.
//Scenes, fonts, and images were learned from the hand gun game.
//They were improved upon here.
//I exchanged sprite movement for sprite magnification.
//I added scenes for menu, game, credits, instructions, win, and lose scene.
//The scoring system is a bit different.
//Instead of enemy scoring, health was subtracted for each missed enemy.

//Plus the use of Song and Bonus as back music is original
//Also original coding was the use of line, the keyboard toggle
// music toggle
//and health subtract.
//I experimented with making sure a sprite can only die after reaching a certain size.
//I also experimented with sprites disappearing after reaching a certain size.

//It was hard to control Sprite spawning. 
//I had to make the spawning random enough without going off screen.

//What I am most pround of is the sword creation.  
//The sword itself is a line thickened to a sword. 
//But the motion which follows the color red is very life-like.
//I at first wanted the sword to follow my fingers like the hand gun.
//But I found that using color tracking was more accurate.
//Also the collisions are as realistic as possible.


AudioChannel swing; 
AudioChannel demon;
AudioChannel song;
AudioChannel bonus;


JMyron m;//a camera object

float brightest;
float brightX;
float brightY;
int redX;
int redY;
int reddest;
float robjx = 160;
float robjy = 120;
float robjdestx = 160;
float robjdesty = 120;

PImage back;
PImage enemy;
PImage winner;
PImage loser;
PImage playbutton;
PImage titlebutton;
PImage startbutton;
PImage directbutton;
PImage creditsbutton;
PImage directtext;
PImage storytext;
PImage creditstext;


int playerScore;
int computerScore = 10;
int targetX = 320;
int targetY = 240;
int targetSpeed = 5;
int targetWidth = 75;
int targetHeight = 100;


int scene = 0;   // 0 = menu,  1 = game
PFont fontA;


void setup() {
  size(640, 480);
  m = new JMyron();//make a new instance of the object
  m.start(width, height);//start a capture at 320x240

  m.findGlobs(0);//disable the intelligence to speed up frame rate
  println("Myron " + m.version());

  frameRate(30);

  back = loadImage ("back.png");
  enemy = loadImage ("enemy.png");
  winner = loadImage ("winner.png");
  loser = loadImage ("loser.png");
  titlebutton = loadImage ("menu.png");
  startbutton = loadImage ("start.png");
  creditsbutton = loadImage ("CREDITS.png");
  playbutton = loadImage ("PLAY.png");
  directbutton = loadImage ("DIRECTIONS.png");
  directtext = loadImage ("TextInstruct.png");
  storytext = loadImage ("TextStory.png");
  creditstext = loadImage ("TextCredits.png");


  fontA = loadFont("myFont.vlw");
  textFont(fontA, 32);

  Ess.start(this);
  demon = new AudioChannel("throw.wav");
  swing = new AudioChannel("swordraw.wav");
  song = new AudioChannel("Honnoji.wav");
  bonus = new AudioChannel("Dead.wav");
  song.play(Ess.FOREVER);
}

void draw() {
  m.update();//update the camera view
  int[] img = m.image(); //get the normal image of the camera

  loadPixels();

  //background(back);

  brightest = 0;
  reddest = 0;
  int[] flipped = m.image();
  loadPixels();
  for (int y=0;y<height;y++) {
    for (int x=0; x<width; x++) {
      int i = y*width+x;
      int flippedX = constrain(width-x, 0, width-1); // gets the mirror X
      int j = y*width+flippedX; // chooses the corresponding pixel to the mirror X
      pixels[i] = flipped[j];
      color p = pixels[i];
      float r = red(p);
      float g = green(p);
      float b = blue(p);
      if (r-g > reddest)
      {
        reddest = int(r-g);
        redX = x;
        redY = y;
      }
    }
  }


  updatePixels();

  image(back, 0, 0);



  println(brightX +", "+brightY);

  // Circles slowly follow
  if (!(redX==0&&redY==0)) {
    robjdestx = redX;
    robjdesty = redY;
  }
  robjx += (robjdestx-robjx)/2.0f;
  robjy += (robjdesty-robjy)/2.0f;



  //fill(255,0,0,100);
  //ellipse (robjx, robjy, 25, 25);


  if (scene==0)
  {

    //fill(255,255,255);

    fill(255, 255, 255);
    text("SAMURAI", 300, 70);
    text("Slay all demons!", 200, 400);
    text("Use the color red to move dot.", 100, 450);
    image(playbutton, 50, 200);
    image(directbutton, 250, 200);
    image(creditsbutton, 450, 200);
    ellipse(robjx, robjy, 30, 30);

    if (robjx >50 && robjx < 150 && robjy > 200 && robjy < 250)
    {
      
      scene = 6;
    }

    if (robjx >250 && robjx < 350 && robjy > 200 && robjy < 250)
    {
      scene = 4;
    }

    if (robjx > 450 && robjx < 550 && robjy > 200 && robjy < 250)
    {
      scene = 5;
    }
  }

  else if (scene == 1)
  {
    image (enemy, targetX, targetY, targetWidth, targetHeight);
    int targetLeft = targetX - targetWidth/2;
    int targetRight = targetX + targetWidth/2;
    int targetTop = targetY - targetHeight/2;
    int targetBottom = targetY + targetHeight/2;

    if (targetWidth > 380)
    { 
      targetWidth = 75;
      targetHeight = 100;
      computerScore--;

      if (demon.state==Ess.STOPPED) 
      {
        demon.play();
      }

      if (robjx > 400)
        targetX -= 300;

      else
        targetX += 300;
    }
    else
    {
      targetWidth += 8;
      targetHeight += 8;

      if (targetX < 0)
        targetX += 500;

      else if (targetX > 640)
        targetX -= 500;


      targetY = 1;
    }


    if (targetWidth > 300 && targetHeight > 300)
    {
      if (robjx > targetLeft && robjx > targetRight)
      {
        playerScore++;
        targetWidth = 75;
        targetHeight = 100;

        if (swing.state==Ess.STOPPED) {
          swing.play();
        }


        if (robjx > 400)
          targetX -= 300;

        else
          targetX += 300;
      }
    }

    text("Score: " + playerScore, 0, 50);
    text("Health: " + computerScore, 450, 50);

    stroke(20);
    strokeWeight(30.0);
    line(robjx, 0, robjy, height);

    if (playerScore >= 20) 
    {
      scene = 2;
     playerScore = 0; 
     computerScore = 10;
    }
    if (computerScore <= 0)
    { 
      scene = 3;
      playerScore = 0; 
     computerScore = 10;
    }
    


  }


  else if (scene==2)
  {

    text("Victory!", 250, height/2);
    text("Bonus:'C' = on 'V' = off.", 10, 300);
    image(winner, 480, 50, 150, 400);
    ellipse(robjx, robjy, 30, 30);

  image(titlebutton, 250, 400);
     if (robjx >250 && robjx < 350 && robjy > 400 && robjy < 450)
    {
      scene = 0;
    }
  }

  else if (scene==3)
  {

    text("You Lose!", 200, height/2);
    image(loser, 480, 50, 150, 400);
    ellipse(robjx, robjy, 30, 30);

    image(titlebutton, 250, 400);
     if (robjx >250 && robjx < 350 && robjy > 400 && robjy < 450)
    {
      scene = 0;
    }
  }

  else if (scene==4)
  {

   image(directtext, 50, 50);
    image(titlebutton, 250, 400);
     if (robjx >250 && robjx < 350 && robjy > 400 && robjy < 450)
    {
      scene = 0;
    }
    
    ellipse(robjx, robjy, 30, 30);

  }


  else if (scene==5)
  {
    ellipse(robjx, robjy, 30, 30);

    image(creditstext, 50, 50);
    image(titlebutton, 250, 400);
     if (robjx >250 && robjx < 350 && robjy > 400 && robjy < 450)
    {
      scene = 0;
    }
  }
  
  else if (scene==6)
  {
    image(storytext, 50, 50);
    image(titlebutton, 350, 400);
    image(startbutton, 150, 400);
    ellipse(robjx, robjy, 30, 30);

     if (robjx >150 && robjx < 250 && robjy > 400 && robjy < 450)
    {
      scene = 1;
    }
    
       if (robjx >350 && robjx < 450 && robjy > 400 && robjy < 450)
    {
      scene = 0;
    }
  }

    
}


void mousePressed() {
  m.settings();//click the window to get the settings
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } 
  else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    scene = 0;
  }

  if(key == 'c')
  {
    song.stop();
    bonus.play(Ess.FOREVER);
  }

  if(key == 'v')
  {
    bonus.stop();
    song.play(Ess.FOREVER);
  }
}
public void stop() {
  m.stop();//stop the object
  super.stop();
}


