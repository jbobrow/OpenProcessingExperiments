
//redesign land use along my creek

PImage jigsaw;
PImage outlinemap;
PImage lu_town;
PImage lu_cities;
PImage lu_industry;
PImage lu_pastures;
PImage lu_orchards;
PImage lu_solutions;
PImage drawing;

import ddf.minim.*;
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
AudioSample currentAudio;
Timer timer;
Timer audiotimer;
Timer introtimer;

int stepX;
int stepY;
int screenWidth = 900;
int screenHeight = 710;
float diameter = 15;
int colorSwitch = #000000;
boolean mainscreendidload = false;
boolean drawingMode = false;
boolean keyIsPressed = false;
boolean audioIsFinished = true;
boolean introOnProgress = true;
boolean introTownIsShowed = false;
boolean introPasturesIsShowed = false;
boolean introDrawIsShowed = false;
boolean introJigsawIsShowed = false;
boolean introJigsaw1IsShowed = false;
boolean showTownOnce = true;
boolean showPasturesOnce = true;
boolean showDrawOnce = true;
boolean showJigsawOnce = true;
boolean showJigsaw1Once = true;

void setup() {
  
  timer = new Timer(100);
  audiotimer = new Timer(8000);
  introtimer = new Timer(2000);
  timer.start();
  size(screenWidth,screenHeight);
  jigsaw = loadImage("0_1_jigsaw.jpg");
  
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  water = minim.loadSample("creek.wav");
  town = minim.loadSample("town.wav");
  city = minim.loadSample("city.wav");
  industry = minim.loadSample("industry.wav");
  pasture = minim.loadSample("pasture.wav");
  orchard = minim.loadSample("orchard.wav");
  forest = minim.loadSample("forest.wav");
  eraser = minim.loadSample("eraser.wav");
  
}

void showTown() {
  if ( showTownOnce == true ) { 
  introtimer.start();
 introTownIsShowed = true;
 lu_town = loadImage("0_2_lu_town.jpg");
 image(lu_town, 0, 0, screenWidth, screenHeight);
 showTownOnce = false;
 }
}

void showPastures() {
  if ( showPasturesOnce == true ) { 
    introtimer.start();
 introPasturesIsShowed = true;
 lu_pastures = loadImage("0_5_lu_pastures.jpg");
 image(lu_pastures, 0, 0, screenWidth, screenHeight); 
 showTownOnce = false;
 }
}

void showDraw() {
  if ( showDrawOnce == true ) { 
    introtimer.start();
 introDrawIsShowed = true;
 outlinemap = loadImage("0_7_painting.jpg");
 image(outlinemap, 0, 0, screenWidth, screenHeight);
 showDrawOnce = false;
 }
}

void showJigsaw() {
  if ( showJigsawOnce == true ) { 
    introtimer.start();
 introJigsawIsShowed = true;
 loadImage("0_1_jigsaw.jpg");
 image(jigsaw, 0, 0, screenWidth, screenHeight); 
 showJigsawOnce = false;
 }
}

void showJigsaw1() {
  if ( showJigsaw1Once == true ) { 
    introtimer.start();
 introJigsaw1IsShowed = true;
 loadImage("0_1_jigsaw.jpg");
 image(jigsaw, 0, 0, screenWidth, screenHeight); 
 showJigsaw1Once = false;
 }
}

void draw() {
  
  if (mainscreendidload == false) {
    drawing = loadImage("0_7_painting.jpg");
    intro = minim.loadFile("intro.wav");
    intro.play();
    showJigsaw1();
    currentAudio = industry;
  //image(jigsaw, 0, 0, screenWidth, screenHeight);
  outlinemap = loadImage("0_1_jigsaw.jpg");
  image(outlinemap, 0, 0, screenWidth, screenHeight);
  mainscreendidload = true;
  fill(colorSwitch);
  noStroke();
  }
  
  
  if ( introJigsaw1IsShowed == true ) { 
    if ( introtimer.isFinished() == true ) { introJigsaw1IsShowed = false; showTown(); }
  } 
  
  if ( introTownIsShowed == true ) { 
    if ( introtimer.isFinished() == true ) { introTownIsShowed = false; showPastures(); }
  }
  
  if ( introPasturesIsShowed == true ) { 
    if ( introtimer.isFinished() == true ) { introPasturesIsShowed = false; showDraw();}
  }
  
  if ( introDrawIsShowed == true ) { 
    if ( introtimer.isFinished() == true ) { drawing = get(); introDrawIsShowed = false; showJigsaw();}
  }
  
  if ( introJigsawIsShowed == true ) { 
    if ( introtimer.isFinished() == true ) { introJigsawIsShowed = false; introOnProgress = false; }
  } 
  
    if ( mousePressed  && introOnProgress == false) {
    if ( drawingMode == true) {
      if (mouseX > 127 && mouseX < 889 && mouseY > 151 && mouseY < 690 ) {
        ellipse(mouseX,mouseY,diameter, diameter);
        if ( audioIsFinished == true ) {
          audioIsFinished = false;
          audiotimer.start();
          print(currentAudio);
          currentAudio.trigger();
        }
        
        if ( timer.isFinished() ) {
          addCreek();
        }
      }
    } else {
    }
   }
   if ( drawingMode == true) {
     fill(#D1D2D4);
     rect(436,20,50,50);
     fill(colorSwitch);
     ellipse(461,45,diameter, diameter);
   }
   if ( audioIsFinished == false ) {
   audioIsFinished = audiotimer.isFinished();
   }
}

void mouseClicked() {
 if ( drawingMode == true && introOnProgress == false) {
   
   if ( mouseY > 20 && mouseY < 70 ) {
    if ( mouseX > 225 && mouseX < 315 ) { diameter = diameter - 5; }
    else if ( mouseX > 322 && mouseX < 410 ) {  diameter = diameter + 5; }
    else if ( mouseX > 608 && mouseX < 699 ) { 
    colorSwitch = #FFFFFF; 
    currentAudio = eraser;
    }
    else if ( mouseX > 800 && mouseX < 891 ) { 
      outlinemap = loadImage("0_7_painting_blank.jpg");
      image(outlinemap, 0, 0, screenWidth, screenHeight);
      drawing = get();
      drawingMode = true;
      audioIsFinished = true;
      try { currentAudio.stop(); } finally {  }
    }
    if ( diameter > 60 ) { diameter = 60;
    } else if ( diameter < 5 ) { diameter = 5; }
   }
   if ( mouseY > 82 && mouseY < 135 ) {
     if ( mouseX > 120 && mouseX < 890 ) {
     audioIsFinished = true;
     try { currentAudio.stop(); } finally {  }
    if ( mouseX > 120 && mouseX < 218 ) { 
     colorSwitch = #00FFFF;
     currentAudio = water; } //delete
    else if ( mouseX > 224 && mouseX < 314 ) { 
    colorSwitch = #FFFFFF; 
    currentAudio = eraser;
    }
    else if ( mouseX > 319 && mouseX < 410 ) { 
    colorSwitch = #FF1926; 
    currentAudio = town;
    }
    else if ( mouseX > 417 && mouseX < 506 ) { 
    colorSwitch = #7C4D26; 
    currentAudio = city;
    }
    else if ( mouseX > 513 && mouseX < 602 ) { 
    colorSwitch = #000000; 
    currentAudio = industry;
    }
    else if ( mouseX > 609 && mouseX < 699 ) { 
    colorSwitch = #CCFF00; 
    currentAudio = pasture;
    }
    else if ( mouseX > 705 && mouseX < 795 ) { 
    colorSwitch = #80FF00; 
    currentAudio = orchard;
    }
    else if ( mouseX > 800 && mouseX < 890 ) { 
    colorSwitch = #47C900; 
    currentAudio = forest;
    } 
    }
  }
   
 }
 fill(colorSwitch);
 
 if (mouseX < 110 && introOnProgress == false) {
    
    if (mouseY > 621 && mouseY < 693) {
    outlinemap = drawing;
    image(outlinemap, 0, 0, screenWidth, screenHeight);
    drawingMode = true;
    } else {
      if ( drawingMode == true ) { drawing = get(); }
      drawingMode = false;
    if (mouseY > 20 && mouseY < 134) {jigsaw = loadImage("0_1_jigsaw.jpg");image(jigsaw, 0, 0, screenWidth, screenHeight); }
    else if (mouseY > 153 && mouseY < 224) {lu_town = loadImage("0_2_lu_town.jpg");image(lu_town, 0, 0, screenWidth, screenHeight); }
    else if (mouseY > 231 && mouseY < 302) {lu_cities = loadImage("0_3_lu_cities.jpg");image(lu_cities, 0, 0, screenWidth, screenHeight); }
    else if (mouseY > 311 && mouseY < 380) {lu_industry = loadImage("0_4_lu_industry.jpg");image(lu_industry, 0, 0, screenWidth, screenHeight); }
    else if (mouseY > 387 && mouseY < 458) {lu_pastures = loadImage("0_5_lu_pastures.jpg");image(lu_pastures, 0, 0, screenWidth, screenHeight); }
    else if (mouseY > 465 && mouseY < 536) {lu_orchards = loadImage("0_6_lu_orchards.jpg");image(lu_orchards, 0, 0, screenWidth, screenHeight); }
    else if (mouseY > 546 && mouseY < 615) {lu_solutions = loadImage("0_6_lu_solutions.jpg");image(lu_solutions, 0, 0, screenWidth, screenHeight); }
    }
  }
  
}
void keyPressed() {
  
  if ( keyIsPressed == false && introOnProgress == false) {
    
  if ( key == BACKSPACE || key == DELETE) eraser.trigger();
  
  if ( drawingMode == true ) {
    drawing = get();
    if ( key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' ) {
      drawingMode = false;
    }
    if ( key == ENTER || key == RETURN) {
      drawingMode = true;
    }
    if ( key == 's'|| key =='S' ) { drawing = get();}
  }
  
  if (key == ENTER || key == RETURN) {
  //outlinemap = loadImage("0_7_painting.jpg");
  outlinemap = drawing;
  image(outlinemap, 0, 0, screenWidth, screenHeight);
  drawingMode = true;
  }
  }
  
    keyIsPressed = true;
}

void keyReleased(){
  keyIsPressed = false;
}

void addCreek() {
 outlinemap = loadImage("0_8_creek.png");
 image(outlinemap, 0, 0, screenWidth, screenHeight); 
 timer.start();
}

class Timer {
 
  int savedTime;
  int totalTime;
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  void start() {
    savedTime = millis(); 
  }
  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

