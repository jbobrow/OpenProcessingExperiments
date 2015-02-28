
// Dev : Benjamin Poynter
// Title : Blueprint for All the Lost Souls
// Syn : Just as title says. An engine/boolean
// test for a possible massive project to come.
// A sandbox world/RPG where a survivor
// of genocidal doom investigates 'why?'.


boolean train = true; //Starts the initial screen/room as in the train.
PImage inner; //Variable for inside bg image.
PImage innerf; //Variable for train seats in front of action inside..
PImage innerp;//Variable for person in front of action inside.
PImage outer;//Variable for the outside room/image.
PImage talk;//Variable for command icon 'talk'.
PImage ex;//Variable for command icon 'exit'.
PImage ex2;//Variable for command icon 'exit2'.
PImage speech;//Variable for text box where words go in.
PImage cigs;//Variable for drawn box of cigarettes.
PImage think;//Variable for command icon 'think'.
PImage worldmap;//Variable for command map.
int numFrames = 2; //Variables to call amt of frames per animation loop.
int frame = 0; //Begins animation loop at frame '0'.
PImage[] image = new PImage [numFrames]; //Loads all loop images in 'one'.
int stand = 255; //Initial stand motion before moving, and it goes to 0.
PFont font; //Loads the font to be used. FFDIN Medium.

import ddf.minim.*; //
AudioPlayer player; //
Minim minim; //Loads the minim music program.


int x = 50; //Sets initial protagonist's place.
int y = 200; //Ditto.


void setup () {
  size (640, 360); //Size of canvas/program. Widescreen ratio.
  frameRate (10); //Sets the slowness/fastness of way character moves.
  font = loadFont("din.vlw"); //Loads all following data into variables set.
  inner = loadImage("bg02.jpg"); //
  innerf = loadImage("bg02fg.png"); //
  innerp = loadImage("bg02people.png"); //
  outer = loadImage("bg01.jpg"); //
  talk = loadImage("talk.png"); // 
  speech = loadImage("speech.png"); // 
  ex = loadImage("exit.png"); // 
  ex2 = loadImage("exit2.png"); // 
  cigs = loadImage("cigs.png"); // 
  think = loadImage("think.png");//
  worldmap = loadImage("worldmap.png"); //
  imageMode(CENTER); //Image center alligns with x/y coordinates set for it.
  minim = new Minim(this); //
  player = minim.loadFile("promise.mp3"); //
  player.play(); //
  player.loop(); // Loads the music from data folder to be played.
  
} //**********VOIDSETUP*********


void draw () {
  
  if (!train){ //the following code activates if our boolean is false
  image(outer, 320, 180);
    image(cigs, 100, 275);
  tint (255, stand);
  stand = 255; //makes animation appear after turned to 0 by walk
  image[0] = loadImage("acestand2.png");
  image[1] = loadImage("acestand2.png"); //stand animation
  frame = (frame + 1) % numFrames;
  image (image[frame], x, y);

  }else{ //the following code activates if our boolean is true
  image(inner, 320, 180);
  image(innerf, 320, 180);
  image(innerp, 320, 180);
  tint (255, stand);
  stand = 255; //makes animation appear after turned to 0 by walk
  image[0] = loadImage("acestand.png");
  image[1] = loadImage("acestand.png"); //stand animation
  frame = (frame + 1) % numFrames;
  image (image[frame], x, y); 

  }


    if (keyPressed && (key == CODED)) { //if its a coded key
  
  if (keyCode == LEFT) {
    x = x - 20;
    y = y + 5; //two coordinates are sloped to go southwest
  tint (255, 255);
  stand = 0;
  image[0] = loadImage("acewalk3.png");
  image[1] = loadImage("acewalk4.png"); //walk cycle left
  frame = (frame + 2) % numFrames;
  image (image[frame], x, y);

  } else if (keyCode == RIGHT) {
    x = x + 20;
    y = y + -5; //two coordinates are sloped to go northeast
    tint (255, 255);
    stand = 0;
  image[0] = loadImage("acewalk1.png");
  image[1] = loadImage("acewalk2.png"); //walk cycle right
  frame = (frame + 2) % numFrames;
  image (image[frame], x, y);
  
  }//IF LEFT/RIGHT TRUE
  
    }//IF KEY PRESSED AND CODED
    
      if (train){
  image(innerf, 320, 180);
  image(innerp, 320, 180); //another 'true'; calls foreground above animation
  }
  
  if (x >= 150 && x <= 200 && train == true) {
  image (talk, 100, 50);
  }
  
    if (x >= 275 && x <= 325 && train == true) {
  image (talk, 400, 200);
  }
  
    if (x >= 475 && x <= 550 && train == true) {
  image (ex, 500, 100);
  }
  
    if (x >= 150 && x <= 250 && train == false) {
  image (think, 100, 200);
  }
  
      if (x >= 475 && x <= 550 && train == false) {
  image (ex2, 500, 100);
  }
  
    if (keyPressed) {
    
    if (key == 'a' && x >= 150 && x <= 200 && train == true) {
  tint (255, 150);    
  image (speech, 450, 150);
  fill (0);
  textFont(font, 20);
  text("Things sure were better before the", 250, 145);
  text("bomb dropped and all the souls departed.", 250, 170);
  }
  
    if (key == 'a' && x >= 275 && x <= 325 && train == true) {
  tint (255, 150);    
  image (speech, 250, 300);
  fill (0);
  textFont(font, 20);
  text("You're only imagining our spirits, stranger.", 50, 295);
  text("We are memories of the dead in your mind.", 50, 320);
  }
  
    if (key == 'a' && x >= 475 && x <= 550 && train == true) { 
  train = !train;
  minim = new Minim(this);
  player = minim.loadFile("whoosh.mp3");
  player.play();
  }
  
      if (key == 'c' && x >= 150 && x <= 250 && train == false) {
  tint (255, 150);    
  image (speech, 450, 300);
  fill (0);
  textFont(font, 20);
  text("(Gabriel the homeless stockbroker posted up", 250, 295);
  text("on this corner. Could be a clue...)", 250, 320);
  }
  
    if (key == 'b' && x >= 475 && x <= 550 && train == false) {
  minim = new Minim(this);
  player = minim.loadFile("whoosh.mp3");
  player.play();
  train = !train;
  }
  
  if (key == 'm' && train == true) {
   tint (255, 150); 
   image (worldmap, width/2, height/2);
   rect (300, 180, 25, 25);
  }
  
    if (key == 'm' && train == false) {
   tint (255, 150);
   image (worldmap, width/2, height/2);
   rect (330, 190, 25, 25);
  }
  
  }//KEYPRESSED
  
}//*********VOIDDRAW*********

