
// 20 Second Game Template
// re-design start.gif (start screen) and end.gif (end screen) to give appropriate instructions

import ddf.minim.*;
AudioPlayer player;
Minim minim;            // music

int begin;               // Time the event/game begins
boolean active;          // Flag for event/game status
boolean done;            // Flag for "game over"
PImage beginImage;       // Start with this image
PImage endImage;         // End with this image
PImage scene;            //scenery
float trainerPos;         //trainer moving
PImage trainer;          //pokemon trainer, Gold.
float []xPos = new float[20];// x-position of the pokeball
float []yPos = new float[20];// y-position of the pokeball
PImage pokeball;             //pokeball pic

void setup() {
  minim = new Minim(this);
  player = minim.loadFile("theme.mp3", 2000);
  player.play();
  
  size(700, 700);
  active = false;        // Don't begin with action
  done = false;          // The game has not finished
  beginImage = loadImage("intro.jpg");
  endImage = loadImage("pikachuhappy.jpg");

  pokeball = loadImage("ball.png"); // pokeball from sky set up
  for (int i = 0; i<20; random(i++)) {
    xPos[i] = random(700);
    yPos[i] = random(700);
  }

  trainer= loadImage("HurtPikachu.png"); //Pokemon trainer
  trainerPos = random(700);  //Pokemon trainer starts

  scene = loadImage("land.jpg"); // Scenery

}


void draw() 
{
  image(scene, 0, 0, 700, 700);
  if (active == true) {
    eventGame();         // Run the event/game
    timer();             // Time the event/game
  } 
  else {
    if (done == true) {
      endScreen();       // Show the "end" screen
    } 
    else {
      beginScreen();     // Show the "first" screen
    }}}

void eventGame() {
  
  //avoid the pokeballs
  
  for (int i = 0; i < 20; i++) { 
    image(pokeball, xPos[i], yPos[i], 50, 50);
    yPos[i] +=5;
    if (yPos[i] > height) {
      yPos[i] = random(0);
    }
    
    //Trainer moving
    
    image(trainer, trainerPos, 600 , 70, 70);
   
    if (trainerPos > 700) {
    trainerPos= 0;
    }
    
    if (trainerPos < 0) {
    trainerPos = 700;
    }
  }}
  

void mousePressed() 
{
  if (active == false) {
    active = true;
    begin = millis();
  } 
  else {
    // Your mouse code goes here...
    print("mouse pressed\n");
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      trainerPos = trainerPos - 20;
    }
    if (keyCode == RIGHT) {
      trainerPos = trainerPos +20;
    }}
  print("key pressed\n");
}


void timer(){
  int curTime = millis();
  if (curTime > begin + 20000) {
    active = false;
    done = true;
  }
  noStroke();
  fill(255);
  rect(0, height-5, width, 5);
  fill(0);
  rect(0, height-5, (curTime-begin)/50, 5);
}

// Displays when the game begins
void beginScreen() {
  image(beginImage, 0, 0, 700,700);
}

// Displays when the 10 seconds are over
void endScreen() {
  image(endImage, 0, 0, 700,700);
}


