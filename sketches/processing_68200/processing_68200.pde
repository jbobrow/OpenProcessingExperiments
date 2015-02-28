
import gifAnimation.*; //prepare for gif awesomeness by importing the necessary library to animate gifs.
import ddf.minim.*; //prepare for music by importing the necessary library to play audio.

PFont pipe; //state the font.
PImage bg; //state the background.
Gif loopingGif; //state the gif and name it.

Minim minim; //state the Minim library or something.
AudioPlayer song; //state the audio player and name what it will play.

int gameState; // 0 = pregame / 1 = level / 2 = won
int score;
int enough; // use to affect gameplay based on score.
boolean schmaltz; // control schmaltz mode.

ball myBall = new ball(); //prepare for new object (instance of class on separate tab)
mouseBall myMouseBall = new mouseBall(); //ditto
platform myPlatform = new platform(); //ditto
goal myGoal = new goal(); //ditto

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  score = 0;
  enough = 0;
  schmaltz = false;
  pipe = loadFont("pipe.vlw"); //prep the font.
  bg = loadImage("data/background.jpg"); //prep the background. Thanks to PadBlogger for the image (http://blog.padmapper.com/2010/10/11/best-music-cities/).
  loopingGif = new Gif(this, "catparty.gif"); //prep the gif. Thanks to the Inquisitr for the gif (http://www.inquisitr.com/62642/12-awesome-cat-animated-gifs/).
  loopingGif.loop(); //tell gif to loop.
  minim = new Minim(this); //prep the minim.
  song = minim.loadFile("music.mp3"); //Thanks to WillRock and Overclocked Remix for the music (http://ocremix.org/remix/OCR02326/).
  song.play(); //play the song (go figure).
  gameState = 0; //set the initial game screen.

  myBall.setupBall(); //prep function
  myMouseBall.setupMouseBall(); //ditto
}

void draw() {
  frameRate(60);//debug

if (schmaltz == false) {
  background(250);
} else if (schmaltz == true) {
  background(bg);
}

if (keyPressed && key == '0') { //debug - skip to screen 0.
  gameState = 0;
}

if (keyPressed && key == '1') { //debug - skip to screen 1.
  gameState = 1;
}

if (keyPressed && key == '2') { //debug - skip to screen 2.
  gameState = 2;
}

if (keyPressed && key == '3') { //debug - skip to screen 3.
  gameState = 3;
}

if (gameState == 0) { //start screen
  fill(0);
  textFont(pipe);
  text("Bounce", 10, 150);
  textFont(pipe, 24);
  text("(by Matt Griffis)", 5, 185);
  textFont(pipe);
  text("a physics platform game", 250, 275);
  text("with balls", 560, 350);
  textFont(pipe, 24);
  text("Starring: ", 250, 700);
  text("as 'Ball'", 450, 700);
  textFont(pipe, 36);
  fill(random(0, 255), random(0, 255), random(0, 255));
  text("press 'B' to begin.", 250, 500);

  myBall.updateBall();//call functions
  myBall.drawBall();

  if (keyPressed && key == 'b') { //player chooses to start the game.
    gameState = 1;
  }
  
  if (keyPressed && key == 's') { //enable schmaltz mode.
    schmaltz = true;
  }
}

if (gameState == 1) { //level 1 (practice mode)
  myBall.updateBall();//call functions
  myBall.drawBall();

  myMouseBall.updateMouseBall( myBall );//call functions
  myMouseBall.drawMouseBall();

  fill(0);
  textFont(pipe, 24);
  if (score >= 7) {
    enough = 1;
  }

  fill(#F00505);
  text("Goal   : 7", 15, height-15);
  fill(0, 152, 255);
  text("Tally : " + score, 15, height-45);
  if (enough == 1) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    text("Press 'C.'", width/2-45, height-15);
    fill(0);
    text("(You know, if you want to.)", width/2+90, height-15);
  }

  if (keyPressed && key == 'c' && enough == 1) { //player chooses to move to the next level.
    gameState++;
  }
}

if (gameState == 2) { //level 2.
  myBall.updateBall();//call functions
  myBall.drawBall();

  myMouseBall.updateMouseBall( myBall );//call functions
  myMouseBall.drawMouseBall();

  myPlatform.drawPlatform(250, 300, 200, 50);
  myPlatform.drawPlatform(450, 150, 200, 50);

  myGoal.drawGoal(500, 140, 100, 10);
}

if (gameState == 3) { //end screen
  fill(0);
  textFont(pipe);
  text("That's some mighty-fine bouncing.", 25, 75);
  fill(random(0, 255), random(0, 255), random(0, 255));
  text("Nice work.", 275, 225);
  fill(0);
  text("Press 'R' to restart", 10, 375);
  text("or hold 'P' to claim your prize...", 100, 475);

  if (keyPressed && key == 'r') { //player chooses to start the game.
    gameState = 0;
    song.close(); //stop the song so it doesn't start playing again on top of itself.
    setup(); //refresh the initial conditions.
  }

  if (keyPressed && key == 'p') { //player wants a prize.
    image(loopingGif, width /2 - loopingGif.width / 2, height - loopingGif.height - 15); //play the gif when the player holds 'p'.
  }
}
}

void stop() //master stop to make sure the music doesn't cause problems shutting down the sketch.
{
  song.close();
  minim.stop();

  super.stop();
}


