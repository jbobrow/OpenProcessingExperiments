


// CREDITS
// Geomerative library by Ricard Marxer.
// FreeSans.ttf (GNU FreeFont), see the readme files in data folder.

/**
 * fontgenerator with static elements (svg files)
 * 
 * MOUSE
 * position x          : module rotation
 * position y          : module size
 *
 * KEYS
 * a-z                 : text input (keyboard)
 * alt                 : toggle modules
 * del, backspace      : remove last letter
 * ctrl                : save png + pdf
 */

import processing.pdf.*;
import processing.video.*;
Movie myMovie;
//MovieMaker mm;

boolean doSave = false;

import geomerative.*;
RFont font;

String textTyped = "words, words, words!";

int shapeSet = 0;
PShape module1, module2;



void setup() {
  size(1100,600);  
 //   mm = new MovieMaker(this, width, height, "wordswordswords.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
  // make window resizable
  frame.setResizable(true); 
myMovie = new Movie(this, "storm.mp4");
  myMovie.play();

  smooth();

  module1 = loadShape("A_01.svg");
  module2 = loadShape("A_02.svg");
  module1.disableStyle();
  module2.disableStyle();

  // allways initialize the library in setup
  RG.init(this);

  // load a truetype font
  font = new RFont("FreeSans.ttf", 100, RFont.LEFT);

  // ------ set style and segment resolution  ------
  //RCommand.setSegmentStep(10);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);

  RCommand.setSegmentLength(6);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);
}


void draw() {
//    mm.addFrame();
  
  image(myMovie, 0, 0);
  if (doSave) beginRecord(PDF, timestamp()+".pdf");
//  background(255);
  noStroke();
  shapeMode(CENTER);

  // margin border
  translate(60, 300);

  if (textTyped.length() > 0) {
    // get the points on font outline
    RGroup grp;
    grp = font.toGroup(textTyped);
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();

    // ------ svg modules ------
    // module1
    fill(181, 157, 0, 200);
    float diameter = 90;
    for (int i=0; i < pnts.length-1; i++ ) {
      // on every third point
      if (i%3 == 0) {
        // rotate the module facing to the next one (i+1)
        pushMatrix();
        float angle = atan2(pnts[i].x-pnts[i+1].x, pnts[i].y-pnts[i+1].y);
        translate(pnts[i].x, pnts[i].y);
        rotate(angle);
        rotate(radians(-mouseX));
        shape(module1, 0,0, diameter+(mouseY/5),diameter+(mouseY/2.5));
        popMatrix();
      }
    }

    // module2
    fill(0, 130, 164, 200);
    diameter = 18;
    for (int i=0; i < pnts.length-1; i++ ) {
      // on every third point
      if (i%3 == 0) {
        // rotate the module facing to the next one (i+1)
        pushMatrix();
        float angle = atan2(pnts[i].y-pnts[i+1].y, pnts[i].x-pnts[i+1].x);
        translate(pnts[i].x, pnts[i].y);
        rotate(angle);
        rotate(radians(mouseY));
        shape(module2, 0,0, diameter+(mouseY/55),diameter+(mouseY/55));
        popMatrix();
      }
    }

    if (doSave) {
      doSave = false;
      endRecord();
      saveFrame(timestamp()+".png");
    }
  }
}


void keyReleased() {
  if (keyCode == CONTROL) doSave = true;
}


void keyPressed() {
 //  if (key == ' ') {
  //  mm.finish();  // Finish the movie if space bar is pressed!
  //}
  if (key != CODED) {
    switch(key) {
    case '1':
    case DELETE:
    case BACKSPACE:
      textTyped = textTyped.substring(0,max(0,textTyped.length()-1));
      break;
    case TAB:    
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      textTyped += key;
    }
  }

  if (keyCode == ALT) {
    shapeSet = (shapeSet+1) % 4;
    switch(shapeSet) {
    case 0: 
      module1 = loadShape("A_01.svg");
      module2 = loadShape("A_02.svg");
      break; 
    case 1: 
      module1 = loadShape("B_01.svg");
      module2 = loadShape("B_02.svg");
      break; 
    case 2: 
      module1 = loadShape("C_01.svg");
      module2 = loadShape("C_02.svg");
      break; 
    case 3: 
      module1 = loadShape("D_01.svg");
      module2 = loadShape("D_02.svg");
      break; 
    }
    module1.disableStyle();
    module2.disableStyle();
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}





void movieEvent(Movie m) {
  m.read();
}












