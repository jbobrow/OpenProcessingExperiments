
//redesign land use along my creek

//load jigsaw puzzle from my 'data' folder
PImage jigsaw;
PImage outlinemap;
PImage lu_town;
PImage lu_cities;
PImage lu_industry;
PImage lu_pastures;
PImage lu_orchards;

//Import 'Minim' library for audio
import ddf.minim.*;
//declare global variables for access audio file
Minim minim;
AudioPlayer intro;
AudioSample water;
AudioSample town;
AudioSample city;
AudioSample industry;
AudioSample pasture;
AudioSample orchard;
AudioSample forest;
AudioSample eraser;

//introduce brush parameters as global variable
int stepX;
int stepY;
int screenWidth = 800;
int screenHeight = 710;
float diameter = 15;
int colorSwitch = #000000;
boolean mainscreendidload = false;
boolean drawingMode = false;
boolean keyIsPressed = false;

//setup screen
void setup() {
  
  //draw jigsaw for opening
  size(screenWidth,screenHeight);
  jigsaw = loadImage("0_1_jigsaw.jpg");
  
  //load audio file to play from desktop
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  //play as soon as the jigsaw appear
  intro.play();
  
  //to play audio for key press
  water = minim.loadSample("creek.wav");
  town = minim.loadSample("city.wav");
  city = minim.loadSample("city.wav");
  industry = minim.loadSample("industry.wav");
  pasture = minim.loadSample("pasture.wav");
  orchard = minim.loadSample("orchard.wav");
  forest = minim.loadSample("forest.wav");
  eraser = minim.loadSample("eraser.wav");
  
}


//draw the image to the screen at (0,0)
//and shrink its size to the canvas size
void draw() {
  
  if (mainscreendidload == false) {
  image(jigsaw, 0, 0, screenWidth, screenHeight);
  mainscreendidload = true;
  fill(colorSwitch);
  noStroke();
  }
  
  // give the different color brushes for the various land uses
    switch(key) {
    
      //water blue M
      case 'w':
      fill(#00FFFF);
      break;
      
      //town red L
      case 't':
      fill(#FF1926);
      break;
      
      //city brush brown L
      case 'c':
      fill(#7C4D26);
      break;
      
      //industry brush black L
      case 'i':
      fill(#000000);
      break;
      
      //pasture brush yellowish green L
      case 'p':
      fill(#CCFF00);
      break;
      
      //orchard brush green L
      case 'o':
      fill(#80FF00);
      break;
      
      //forest brush dark green L
      case 'f':
      fill(#47C900);
      break;
      
      //details white S
      case 'd':
      fill(#FFFFFF);
      break;
      
    }
    //key imput reactions
    if (mousePressed) {
    if ( drawingMode == true ) {
    ellipse(mouseX,mouseY,diameter, diameter);
    }
  }
}

//create a key trigger to play different sounds
void keyPressed() {
  //for sounds
  
  if ( keyIsPressed == false ) {
    
  if ( key == 'w' ) water.trigger();
  if ( key == 't' ) city.trigger();
  if ( key == 'c' ) city.trigger();
  if ( key == 'i' ) industry.trigger();
  if ( key == 'p' ) pasture.trigger();
  if ( key == 'o' ) orchard.trigger();
  if ( key == 'f' ) forest.trigger();
  if ( key == 'n' ) diameter = diameter - 5;
  if ( key == 'm' ) diameter = diameter + 5;
  if ( key == BACKSPACE || key == DELETE) eraser.trigger();
  
  //information material
  //for information press
  if ( drawingMode == true ) {
    saveFrame("data/0_7_painting.jpg");
    if ( key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' ) {
      drawingMode = false;
    }
    if ( key == ENTER || key == RETURN) {
      drawingMode = true;
    }
  }
  
  if (key == '0') {jigsaw = loadImage("0_1_jigsaw.jpg");
  image(jigsaw, 0, 0, screenWidth, screenHeight);}
  if (key == '1') {lu_town = loadImage("0_2_lu_town.jpg");
  image(lu_town, 0, 0, screenWidth, screenHeight);}
  if (key == '2') {lu_cities = loadImage("0_3_lu_cities.jpg");
  image(lu_cities, 0, 0, screenWidth, screenHeight);}
  if (key == '3') {lu_industry = loadImage("0_4_lu_industry.jpg");
  image(lu_industry, 0, 0, screenWidth, screenHeight);}
  if (key == '4') {lu_pastures = loadImage("0_5_lu_pastures.jpg");
  image(lu_pastures, 0, 0, screenWidth, screenHeight);}
  if (key == '5') {lu_orchards = loadImage("0_6_lu_orchards.jpg");
  image(lu_orchards, 0, 0, screenWidth, screenHeight);}
  if (key == ENTER || key == RETURN) {
  outlinemap = loadImage("0_7_painting.jpg");
  image(outlinemap, 0, 0, screenWidth, screenHeight);
  drawingMode = true;
  }
  
  }
    keyIsPressed = true;
}

//clean the board
//save png
void keyReleased(){
  keyIsPressed = false;
  //if you press delete the outlinemap should appear as clean surface
  if ( key == BACKSPACE || key == DELETE) {
  outlinemap = loadImage("0_7_painting_blank.jpg");
  drawingMode = true;
  saveFrame("data/0_7_painting.jpg");
  image(outlinemap, 0, 0, screenWidth, screenHeight);}
  if ( key == 's'|| key =='S' ) saveFrame("data/0_7_painting.jpg");
}

