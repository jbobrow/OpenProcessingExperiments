
//background memes slideshow
String [] photos = {
  "01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpeg", "09.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg"
};
PImage [] images = new PImage[photos.length];
int imageStart = 0;

//Timer slideshow
int savedTime;
int totalTime = 2000; //slide duration

//Memes
PImage meme08;
PImage meme10;
PImage meme11;
PImage meme13;

//result
PImage correct;
PImage wrong;

//Game States
int gameState; 

//meme selection
boolean isCorrect;
boolean isWrong;

//Caption
PFont bigFont;
PFont smallFont;

//Troll
float xPos = 50;
float yPos = 50;
float xVel = 7;
float yVel = 3;
float gravity = 0.3;
PImage troll;


void setup() {
  smooth();
  size(600, 400);
  bigFont = loadFont("bigFont.vlw");
  smallFont = loadFont("smallFont.vlw");
  textAlign(CENTER);
  gameState = 0;
  savedTime = millis ();
  //load images for slideshow
  for (int i = 0; i < photos.length; i++)
  {
    images [i] = loadImage(photos[i]);
  }

  //load images for actual game
  meme08 = loadImage("08.jpeg");
  meme10 = loadImage("10.jpg");
  meme11 = loadImage("11.jpg");
  meme13 = loadImage("13.jpg");
  correct = loadImage("correct.jpg");
  wrong = loadImage("wrong.jpg");
  troll = loadImage("troll.png");
}

void draw() {
  //START SCREEN
  if (gameState == 0) {
    background(0);
    //timer
    int passedTime = millis() - savedTime;

    image(images[imageStart], 0, 0, width, height);

    if (passedTime > totalTime) {
      imageStart++;
      savedTime = millis();
    }
    if (imageStart > photos.length-1)
    {
      imageStart = 0;
    }

    //caption
    //TEXT OUTLINE (only way I figured out to outline the text font)
    fill(0);
    textFont(bigFont);
    text("MEMES MATCH", width/2-2, 48);
    text("MATCH THE CAPTION", width/2-2, 348);
    text("WITH THE CORRECT MEME", width/2-2, 373);
    textFont(smallFont);
    text("TO START PRESS 'SPACEBAR'", width/2-2, height/2-2);

    textFont(bigFont);
    text("MEMES MATCH", width/2-2, 52);
    text("MATCH THE CAPTION", width/2-2, 352);
    text("WITH THE CORRECT MEME", width/2-2, 377);
    textFont(smallFont);
    text("TO START PRESS 'SPACEBAR'", width/2-2, height/2+2);

    textFont(bigFont);
    text("MEMES MATCH", width/2+2, 52);
    text("MATCH THE CAPTION", width/2+2, 352);
    text("WITH THE CORRECT MEME", width/2+2, 377);
    textFont(smallFont);
    text("TO START PRESS 'SPACEBAR'", width/2+2, height/2+2);

    textFont(bigFont);
    text("MEMES MATCH", width/2+2, 48);
    text("MATCH THE CAPTION", width/2+2, 348);
    text("WITH THE CORRECT MEME", width/2+2, 373);
    textFont(smallFont);
    text("TO START PRESS 'SPACEBAR'", width/2+2, height/2-2);

    //TEXT
    fill(255);
    textFont(bigFont);
    text("MEMES MATCH", width/2, 50);
    text("MATCH THE CAPTION", width/2, 350);
    text("WITH THE CORRECT MEME", width/2, 375);
    textFont(smallFont);
    text("TO START PRESS 'SPACEBAR'", width/2, height/2);
  }

  //LEVEL 1
  if (gameState == 1) {
    background(255);
    textFont(bigFont);
    //Caption
    //TEXT OUTLINE
    fill(0);
    text("CAR BEHIND YOU MAKES", width/2-48, 48);
    text("THE SAME TURN", width/2-48, 73);
    text("I'M BEING FOLLOWED", width/2-48, 373);

    text("CAR BEHIND YOU MAKES", width/2-48, 52);
    text("THE SAME TURN", width/2-48, 77);
    text("I'M BEING FOLLOWED", width/2-48, 377);

    text("CAR BEHIND YOU MAKES", width/2-52, 52);
    text("THE SAME TURN", width/2-52, 77);
    text("I'M BEING FOLLOWED", width/2-52, 377);

    text("CAR BEHIND YOU MAKES", width/2-52, 48);
    text("THE SAME TURN", width/2-52, 73);
    text("I'M BEING FOLLOWED", width/2-52, 373);

    //TEXT
    fill(255);
    text("CAR BEHIND YOU MAKES", width/2-50, 50);
    text("THE SAME TURN", width/2-50, 75);
    text("I'M BEING FOLLOWED", width/2-50, 375);

    //Images
    image(meme11, 500, 0, 100, 100);
    image(meme10, 500, 100, 100, 100);
    image(meme08, 500, 200, 100, 100);
    image(meme13, 500, 300, 100, 100);

    //ImageBorders
    stroke(0);
    strokeWeight(2);
    line(500, 0, 500, 400);
    line(500, 100, 600, 100);
    line(500, 200, 600, 200);
    line(500, 300, 600, 300);

    //Correct Answer
    if (isCorrect == true) {
      gameState = 2;
    }
    //Incorrect Answer
    if (isWrong == true) {
      gameState = 3;
    }
  }
  //WIN SCREEN
  if (gameState == 2) {
    background(255);
    image(meme08, 0, 0, 500, 400);
    image(correct, 500, 0);
    textFont(bigFont);
    //Caption
    //TEXT OUTLINE
    fill(0);
    text("CAR BEHIND YOU MAKES", width/2-48, 48);
    text("THE SAME TURN", width/2-48, 73);
    text("I'M BEING FOLLOWED", width/2-48, 373);

    text("CAR BEHIND YOU MAKES", width/2-48, 52);
    text("THE SAME TURN", width/2-48, 77);
    text("I'M BEING FOLLOWED", width/2-48, 377);

    text("CAR BEHIND YOU MAKES", width/2-52, 52);
    text("THE SAME TURN", width/2-52, 77);
    text("I'M BEING FOLLOWED", width/2-52, 377);

    text("CAR BEHIND YOU MAKES", width/2-52, 48);
    text("THE SAME TURN", width/2-52, 73);
    text("I'M BEING FOLLOWED", width/2-52, 373);

    //TEXT
    fill(255);
    text("CAR BEHIND YOU MAKES", width/2-50, 50);
    text("THE SAME TURN", width/2-50, 75);
    text("I'M BEING FOLLOWED", width/2-50, 375);
  }

  //LOSER SCREEN
  if (gameState == 3) {
    background(255);
    image(meme08, 0, 0, 500, 400);
    image(wrong, 500, 0);
    textFont(bigFont);
    //Caption
    //TEXT OUTLINE
    fill(0);
    text("CAR BEHIND YOU MAKES", width/2-48, 48);
    text("THE SAME TURN", width/2-48, 73);
    text("I'M BEING FOLLOWED", width/2-48, 373);

    text("CAR BEHIND YOU MAKES", width/2-48, 52);
    text("THE SAME TURN", width/2-48, 77);
    text("I'M BEING FOLLOWED", width/2-48, 377);

    text("CAR BEHIND YOU MAKES", width/2-52, 52);
    text("THE SAME TURN", width/2-52, 77);
    text("I'M BEING FOLLOWED", width/2-52, 377);

    text("CAR BEHIND YOU MAKES", width/2-52, 48);
    text("THE SAME TURN", width/2-52, 73);
    text("I'M BEING FOLLOWED", width/2-52, 373);

    //TEXT
    fill(255);
    text("CAR BEHIND YOU MAKES", width/2-50, 50);
    text("THE SAME TURN", width/2-50, 75);
    text("I'M BEING FOLLOWED", width/2-50, 375);
  }
  //COMING SOON
  if (gameState == 4) {
    background(0);
    textFont(bigFont);
    text("COMING SOON...", width/2, height/2);
    textFont(smallFont);
    text("MORE LEVELS", width/2, 350);
    image(troll, xPos, yPos, 100, 100);

    yVel=yVel+gravity;
    xPos=xPos+xVel;
    yPos=yPos+yVel;

    //to collide with borders (reverse direction)
    if (xPos>width-50||xPos<50) {
      xVel=-xVel;
    }
    if (yPos>height-50||yPos<50) {
      yVel=yVel*-(.85);
      xVel=xVel*(.85);
    }
    if (yPos>height-50) {
      yPos=height-50;
    }
  }
}
//clicking
void mouseReleased() {
  //Correct Answer Level 1
  if (mouseX > 500 && mouseX < width) {
    if (mouseY > 200 && mouseY < 300) { 
      isCorrect = true;
    }
    else {
      isWrong = true;
    }
  }
}

//starting the game
void keyPressed() {
  if (key == 32) {
    gameState++;
    if (gameState == 1 && isCorrect == true) {
      gameState = 2;
    }
    if (gameState == 1 && isWrong == true) {
      gameState = 3;
    }

//I can't make it work to go from gameState 2 to gameState 4
//when I do, then I can't make it go from gameState 4 to gameState 0
/* if (gameState > 2) {
  gameState = 4;
}
*/


//restarts game on start screen
    if (gameState > 4) {
      gameState = 0;
      isCorrect = false;
      isWrong = false;
    }
  }
}


