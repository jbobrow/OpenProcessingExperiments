
// sound------------------------------------------------
import ddf.minim.*;
Minim minim;
AudioPlayer music;
AudioSample bonus;
AudioSample gameover;
AudioSample go;

//array for peas----------------------------------------
Object[] peas = new Object[0];

//starts the score  at zero-----------------------------------
int score = 0;

boolean gameOver;

//image------------------------------------------
PImage bg;
PImage man;
PImage pea;

//functions for the man ------------------------------------
float manY;
float manX;
float manWidth = 100;
float manHeight = 10;
float manxSpeed = 6;

void setup() {
  size(800, 400);
  smooth();
  bg = loadImage("bg.png");
  man = loadImage("man.png");
  pea = loadImage("pea.png");
  // sound
  minim = new Minim(this);
  
  bonus = minim.loadSample("bonus.mp3", 512);
  gameover = minim.loadSample("gameover.mp3", 512);
  go = minim.loadSample("go.mp3", 512);
  setupGame(); 
}

void draw() {
  //image for background--------------------------------------
  image(bg, 0, 0 ); 
  //displays the score ---------------------------------
  textAlign(CORNER);
  textSize(26); 
  fill(0);
  text("score:" + score, 20, 40);
  
  //the falling peas-------------------------------------
  if ((gameOver == false) && (frameCount % 100 == 0)) {
    Object pea = new Object();
    peas = (Object[]) append(peas, pea);
  } 

  if ((gameOver == false) && (peas.length>10)) {
    peas = (Object[]) subset(peas, 1);
  }

  for (int i = 0; i<peas.length; i++) {
    peas[i].update();
  } 

  //when falling pea hits the target, one piont is added and pea dissapears------------------------------------
  for (int i = 0; i<peas.length; i++) {
    Object pea = peas[i];

    if ((pea.x >= manX) && (pea.x + pea.w <= manX + manWidth) && (pea.y == manY -60)) {
      score++;
      // play sound
      bonus.trigger();
      peas = (Object[]) subset(peas, 1);
    }
  }

  //moves the man right when right key is pressed--------------------------------
  if (keyPressed && keyCode == 39) {
    manX = manX + manxSpeed;
  }
  //moves the man left when left key is pressed----------------------------------
  if (keyPressed && keyCode == 37) {
    manX = manX - manxSpeed;
  }   
  //displays the image of the man---------------------------------------
  image(man, manX -100, manY - 120 );


  //stops the man going outside the main screen-------------------------------
  if (manX< 0) {
    manX+=manxSpeed;
  }
  if ( manX> width - manWidth) {
    manX-=manxSpeed;
  }

  //game over if pea hits the floor-----------------------------------------------------------------
  if (!gameOver) { 

    for (int i = 0; i<peas.length; i++) {
      Object pea = peas[i];

      if ((pea.x >= 0) && (pea.x + pea.w <= width) && (pea.y == height)) {
        gameOver = true;
        peas = (Object[]) subset(peas, peas.length);
        // play game over sound
        gameover.trigger();
        music.close();
      }
    }
  }
  else if (gameOver == true) {
    // if it's game over then this message shows--------------------------------------
    image(bg, 0, 0 ); 
    textAlign(CENTER);
    textSize(20); 
    fill(0);
    text("SCORE:" + score, width/2, height/2-50);

    textSize(30);
    fill(255, 0, 0); 
    text("GAME OVER", width/2, height/2-10);

    fill(255);
    textSize(20);
    fill (0);
    text("CLICK MOUSE TO PLAY AGAIN", width/2, height/2 +20);
  }
  
}//-------------- end of draw -----------------------------------------------------------

// lets the user restart the game by calling setupGame()-----------------------------

void mousePressed() {
  //only lets the mouse click work once game is over 
  if (gameOver) {
    //calls setup to restart the game
    setupGame();
   go.trigger();
  }
}


//resets the game once mouse is pressed
void setupGame() {
  gameOver = false;
  score=0;
  manY = height - 30;
  manX = width/2 - manWidth/2;
  
  music = minim.loadFile("music.mp3");
  //play bg music
  music.loop();
}

//class for the falling objects-------------------------------------
class Object {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;

  Object() {
    x = random(40, width - 80);
    y = -50;
    w = 40;
    h = 40;
    velX = 0;
    velY = 2;
  } 

  void update() {
    x+=velX;
    y+=velY;

    image(pea, x, y, w, h );
  }
}



