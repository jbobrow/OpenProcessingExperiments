

//import ddf.minim.*;
//Minim minim = new Minim(this);
//AudioPlayer level1;
//AudioPlayer level2;
//AudioPlayer level3;
//AudioPlayer level4;
//AudioPlayer level5;

PFont font;
PFont font2;
// VARIABLES
int pos1;           // x-coordinate of the first object
int pos2;           // x-coordinate of the second object
int pos3;           // y-coordinate of the first object
int pos4;           // y-coordinate of the second object
int time;           // counts seconds
int counter;        // counts frames
int lvl;            // switch variable
int s;              // get side-length
int g;              // number of runs through level
int speed;          // speed
float f;            // feedback variable
String again;       // end text
boolean clicked1;   // is the first object clicked?
boolean clicked2;   // is the second object clicked?
boolean won;        // did the player win?

// STATIC VARIABLES
int start = 75;    // font size for start and end screens
int num = 400;      // font size for the countdown
int k = 40;         // side-length of objects
int level = 0;      // level counter
int frame = 60;     // framerate
int firstSpeed = 3;
color fade1 = color (255, 255, 255, 40);
color fade2 = color (0, 0, 0, 200);
color fade3 = color (255, 255, 255, 20);
color fade4 = color (255, 0, 0, 220);
color fade5 = color (255, 255, 255);
int width = 600;    // screen width
int height = 600;   // screen height

// SETUP
void setup() {

  size(600, 600);
  noStroke();
  smooth();
  rectMode(CORNER);
  ellipseMode(CORNER);
  textAlign(CENTER, CENTER);
  font = loadFont ("Loudnoise-100.vlw");
  font2 = loadFont ("Chalkduster-48.vlw");
  clicked1 = false;
  clicked2 = false;
  speed = 1;
  s = k;
  f = 0;          // opacity of feedback indicator
  lvl = 0;
  counter = 5*frame; //start at 5 seconds and count down

//  level1 = minim.loadFile("level1.mp3");
//  level2 = minim.loadFile("level2.mp3");
//  level3 = minim.loadFile("level3.mp3");
//  level4 = minim.loadFile("level4.mp3");
//  level5 = minim.loadFile("level5.mp3");
//  level1.loop();
//  level1.pause();
}


void draw() {
  frameRate(frame);
  background (fade2);
  // frameCount = frames per second. 
  // to count seconds we need to divide 
  // the number of frames that have passed by the framecount:
  time = int(counter/frame); 
  g = 6+level;

  // putting textSize outside of the switch case makes this the default size,
  // all others are special, conditional sizes
  textFont (font, start);
  textSize(start);

  // putting screenwrap outside of the switch case
  // runs the screen wrapping function in every case
  screenwrap(); 
//  println (level);


  // SWITCH CASE
  // lvl is not equivalent to level.
  // using extra cases allows for reset to happen without looping
  switch(lvl) {

  case 0 :
    // START SCREEN
    // clearly demarcate a clickable box to begin game play
    // the clicking area is dictated in the mouseClick function
    fill(fade5);
    rect(100, 100, width-200, height-200);
    fill(fade2);

    // using a string and a text box allows you 
    // to center text easily on the screen
    String click = " Click to Play";
    text(click, 100, 100, width-200, height-200);
    break;

  case 1 :
    // PHASE 1
    gameScreen(); 
    // instantiate objects at randomized coordinates
    fill(fade4);
    rect(pos1, pos3, s, s);
    rect(pos2, pos4, s, s);
    // if objects aren't clicked, advance them horizontally
    if (clicked1 == false) {
      pos1+=speed;
    }
    if (clicked2 == false) {
      pos2+=speed;
    }   
    break;

  case 2 :
    // RESET FOR PHASE 2
    // because this case calls the reset and then increments lvl
    // this case runs once and does not loop
    reset();
    lvl++;
    break;

  case 3 :
    // PHASE 2
    // exactly the same as phase 1, only circles move vertically
    gameScreen();
    fill(fade4);
    ellipse (pos1, pos3, s, s);
    ellipse (pos2, pos4, s, s);
    if (clicked1 == false) {
      pos3+=speed;
    }
    if (clicked2 == false) {
      pos4+=speed;
    }
    break;

  case 4 :
    // RESET FOR PHASE 3
    reset();
    lvl++;
    break;

  case 5 :
    // PHASE 3
    // one circle moves vertically, one square moves horizontally
    gameScreen();
    fill(fade4);
    ellipse (pos1, pos3, s, s);
    rect (pos2, pos4, s, s);
    if (clicked1 == false) {
      pos3+=speed;
    }
    if (clicked2 == false) {
      pos2+=speed;
    }
    break;

  case 6 :
    // END SCREEN
//    if(level1.isLooping()){
//      level1.play();
//    }
//    else if (level2.isLooping()){
//      level2.play();
//    }
//    else if (level3.isLooping()){
//      level3.play();
//    }
//    else if (level4.isLooping()){
//      level4.play();
//    }
//    else if (level5.isLooping()){
//      level5.play();
//    }
    fill (fade5);
    if (won == false) {
      again = " Try Again?";
    }
    else if (won == true) {
      again = " Play Again?";
    }
    text(again, 100, 100, width-200, height-200);
    break;

  case 7 :
    reset();
    f = 0;
    s = k;
    speed += 1;
    level += 1;
    switch (level) {
    case 1 :
//      level1.loop();
      break;
    case 2 :
//      level1.pause();
//      level2.loop();
      break;
    case 3 :
//      level2.pause();
//      level3.loop();
      break;
    case 4 :
//      level3.pause();
//      level4.loop();
      break;
    case 5 :
//      level4.pause();
//      level5.loop();
//      lvl++;
      break;
    }
    lvl++;

  case 8 :
    // Level Up Screen
    String lines = "Level Up! ";
    text (lines + time, 100, 100, width-200, height-200);
    counter--;
    if (counter<=0) {
      reset();
      lvl = 1;
    } 
    break;
  }
  if (mousePressed) { 
    if (lvl == 0 || lvl == 6) {
      if (mouseX >= 100 && mouseX <= width-100 && mouseY >= 100 && mouseY <= height-100) {
        reset();
        lvl = 1;
        level = 1;
//        level1.loop();
//        level2.pause();
//        level3.pause();
//        level4.pause();
//        level5.pause();
        s = 40;
        f = 0;
        speed = firstSpeed;
      }
    }
    // for all other cases, clicking the object registers it as clicked
    else {
      if (mouseX >= pos1 && mouseX <= pos1+s && mouseY >= pos3 && mouseY <= pos3+s) {
        clicked1 = true;
      }
      if (mouseX >= pos2 && mouseX <= pos2+s && mouseY >= pos4 && mouseY <= pos4+s) {
        clicked2 = true;
      }
    }
  }
  if (f > width) {
    if (level == 5) {
      lvl = 6;
      won = true;
    }
    else {
      lvl = 7;
    }
  }
}

void gameScreen() {
  for (int x = 0; x < width; x += 10) {
   for (int y = 0; y < height; y += 10) {
    fill (fade1);
    rect (x,y,9,9);
   }
  }
  fill(fade4);
  rect (0,height-40,width%g+f,40); 
  noStroke();
  counter--; // begin counting down from 5 seconds   
  // prominently display countdown on game screen
  textFont(font2);
  fill(fade1);
  textSize(num);
  text (time, 300, 250);
  fill(fade3);
  text (time, 310, 250);
  
    // if the time is up, skip directly to the end screen
  if (lvl < 6 && counter <= 0) {
      lvl = 6;
  }
  // if both objects have been clicked, advance case
  else if (clicked1 == true && clicked2 == true) {
    if (lvl == 5) {
    lvl = 1;
    f += width/g;
    s-=2; 
    }
    else {
      lvl++;
    }
  }
}

// RESET FUNCTION
// Runs between levels, unclicks the objects, 
// restarts countdown and re-randomizes the coordinates
void reset() {
  won = false;       // the default setting is that the player did not win
  clicked1 = false;  // objects are not clicked
  clicked2 = false;
  counter = 5*frame;

  // constraining the randomization to different quadrants avoids overlap
  // using variables here means you can change the whole game from your setup
  pos1 = int(random(s+40, width/2-(s+40)));
  pos2 = int(random(width/2, width-(s+40)));
  pos3 = int(random(s+40, height/2-(s+40)));
  pos4 = int(random(height/2, height-(s+40)));
}
// SCREEN WRAPPING FUNCTION
// when the object leaves the window, it should wrap around 
// and come through the other side.  
void screenwrap() {
  if (pos1 >= width) { // because we have used CORNER for the shapemodes
    pos1 = -s;         // the entire object will have left the screen when
  }                    // the corner is at the width or height, and will
  if (pos2 >= width) { // scroll back on smoothly if we bring it back to
    pos2 = -s;         // its side length before 0.
  }
  if (pos3 >= height) {
    pos3 = -s;
  }
  if (pos4 >= height) {
    pos4 = -s;
  }
}


