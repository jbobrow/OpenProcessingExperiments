
int numJellyfish = 3; //number of jellyfish you want in the game
Jellyfish[] jellyfishArray; //array of jellyfish
PImage bg; //background image
PImage jf; //jellyfish image
PImage sb; //spongebob image
int jellyfishSize = 50; //size of target jellyfish
int score = 0; //current score
int timeLeft = 2000; //duration of each game (app. timeLeft / 100 in seconds)
boolean gameStart = false; //if true, game is in progress
PFont spongeFont; //declaring the font used in the gameplay text
int endOfGameDelayCycles = 300; //how long the end screen lasts
boolean endScreenActive = false; //is the end screen currently showing? true if yes

//setting up the game, this only runs once
void setup() {
  size(320, 480);
  noCursor();

  //initializing the array
  jellyfishArray = new Jellyfish[numJellyfish]; 
  for (int i = 0; i < numJellyfish; i++)
  {  
    jellyfishArray[i] = new Jellyfish();
  }

  //loading the images
  bg = loadImage("background.jpg");
  jf = loadImage("jellyfish.png");
  sb = loadImage("spongebob.png");

  //loading font
  spongeFont = createFont("buzzFont.ttf", 15);
  textFont(spongeFont);
}

//this is the loop which will keep running again and again until you stop playing
void draw() {
  background(bg);
  textSize(11);
  text("treehouseprojects.ca", 180, 455);

  //start game menu
  if (gameStart == false) {
    fill(255);
    rect(35, 195, 250, 100);

    fill(0);
    textSize(15);
    text("Press A on the Keyboard", 60, 220); 
    text("to Use the Mouse", 85, 240);
    text("Press A on Your Controller", 55, 265); 
    text("to Use it Instead", 88, 285);

    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        gameStart = true;
      }
    }
  }

  //while the game is on, between the start and end screen
  if ((gameStart == true) && (endScreenActive == false)) {

    for (int i = 0; i < numJellyfish; i++)
    {  
      jellyfishArray[i].drawJellyfish();
    }
    moveSpongebob();

    fill(0);
    textSize(15);
    text("Score: " + score, 20, 20);
    text("Time Left: " + timeLeft/100, 200, 20);
  }

  //end screen
  if (timeLeft < 10) {
    endScreenActive = true;
    fill(255);
    rect(35, 200, 262, 50);

    fill(0);
    textSize(15);
    text("Congratulations, Your Score Is:", 50, 220); 
    textSize(30);
    text(score, 152, 245);

    endOfGameDelayCycles--;

    if (endOfGameDelayCycles < 5) {
      timeLeft = 2000;
      endOfGameDelayCycles = 300;

      gameStart = false;
      score = 0;
      endScreenActive = false;
    }
  }
}

//this function moves spongebob when called
void moveSpongebob() {

  //put the spongebob image on the screen
  image(sb, mouseX, mouseY, 102, 153);

  //check whether spongebob is overlapping any of the jellyfish, if so, add the score and delete the jellyfish
  for (int i = 0; i < numJellyfish; i++) {
    if ((abs(mouseX - jellyfishArray[i].getXLoc()) < 35) && (abs(mouseY - jellyfishArray[i].getYLoc()) < 35)) {
      jellyfishArray[i].setLifeStatus(false);
      fill(224, 27, 96);
      score++;
    }
  }
  timeLeft--;
}

//create a jellyfish object
class Jellyfish {

  //x location, y location, how long it will stay on screen, dead (0) or alive (1)
  float xLoc, yLoc, lifeDuration;
  boolean lifeStatus;

  Jellyfish() {
    xLoc = random(jellyfishSize, width - (jellyfishSize + 10));
    yLoc = random(jellyfishSize, height - (jellyfishSize + 10));

    lifeDuration = random(25, 100);

    lifeStatus = true;
  }

  float getXLoc() {
    return xLoc;
  }

  float getYLoc() {
    return yLoc;
  }

  void setLifeStatus(boolean tempLifeStatus) {
    lifeStatus = tempLifeStatus;
  }

  void drawJellyfish() {
    lifeDuration--;

    if ((lifeDuration >= 0) && (lifeStatus == true))
      image(jf, xLoc, yLoc, jellyfishSize, jellyfishSize);

    else {
      xLoc = random(jellyfishSize, width - (jellyfishSize + 10));
      yLoc = random(jellyfishSize, height - (jellyfishSize + 10));

      lifeDuration = random(25, 100);

      lifeStatus = true;
    }
  }
}


