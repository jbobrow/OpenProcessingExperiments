

/**
 * typewriter. uses input (text) as blueprint for a visual composition.
 * 
 * MOUSE
 * drag                : move canvas
 * 
 * KEYS
 * a-z                 : text input (keyboard)
 * ,.!? and return     : curves
 * space               : small curve with random direction
 * del, backspace      : remove last letter
 * arrow up            : zoom canvas +
 * arrow down          : zoom canvas -
 * alt                 : new random layout
 * ctrl                : save png + pdf
 */

//import processing.pdf.*;
//boolean savePDF = false;


PFont font;
String textTyped = "";

PShape shapeSpace, shapeSpace2, shapePeriod, shapeComma, shapeA,
shapeB, shapeC, shapeD, shapeE, shapeF, shapeG, shapeH, shapeI,
shapeJ, shapeK, shapeL, shapeM, shapeN, shapeO, shapeP, shapeQ,
shapeR, shapeS, shapeT, shapeU, shapeV, shapeW, shapeX, shapeY,
shapeZ, shapenull;
PShape shapeQuestionmark, shapeExclamationmark, shapeReturn;

int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;
float zoom = 0.94;


int actRandomSeed = 6;


void setup() {
  size(800, 600);
  // make window resizable
  frame.setResizable(true); 
  
  // text to begin with
  //textTyped += "The\nQuick\nBrown\nFox\nJumps\nOver\nThe\nLazy\nDog";
  //textTyped += "Synesthetic\nFont\nFive\nminutes\nto\nbe\na\nsynesthete";
  //textTyped += "Hello!\nWorld!";
  textTyped += "Synesthetic\nFont";
  //textTyped += "The\noriginal\nidea\nof\nthis\nfont\ncomes\nfrom\nsynesthesia.";
  //textTyped += "Synesthesia is a neurological condition in which stimulation of one sensory or cognitive pathway leads to automatic, involuntary experiences in a second sensory or cognitive pathway.";
 //textTyped += "In one of the most common forms of synesthesia, grapheme color synesthesia, individual letters of the alphabet and numbers , are shaded or tinged with a color.grapheme color synesthesia is involuntary, consistent, and memorable.";
 //textTyped += "Synesthetes often report that they were unaware their experiences were unusual until they realized other people did not have them, while others report feeling as if they had been keeping a secret their entire lives, as has been documented in interviews with synesthetes on how they discovered synesthesia in their childhood.The automatic and ineffable nature of a synesthetic experience means that the pairing may not seem out of the ordinary. This involuntary and consistent nature helps define synesthesia as a real experience. Most synesthetes report that their experiences are pleasant or neutral, although, in rare cases, synesthetes report that their experiences can lead to a degree of sensory overload.";
 //textTyped += "designed by\nJieen Gao";
 //textTyped += "Wuppertal is a city in North Rhine-Westphalia, Germany. It is located in and around the Wupper river valley, and is situated east of the city of Duesseldorf and south of the Ruhr area.";
 // centerX = width/2;
    centerY = height-(height-85);  

  font = createFont("miso-bold.ttf",10);
  //font = createFont("Arial",10);

  shapeA = loadShape("shapeA.svg");
  shapeB = loadShape("shapeB.svg");
  shapeC = loadShape("shapeC.svg");
  shapeD = loadShape("shapeD.svg");
  shapeE = loadShape("shapeE.svg");
  shapeF = loadShape("shapeF.svg");
  shapeG = loadShape("shapeG.svg");
  shapeH = loadShape("shapeH.svg");
  shapeI = loadShape("shapeI.svg");
  shapeJ = loadShape("shapeJ.svg");
  shapeK = loadShape("shapeK.svg");
  shapeL = loadShape("shapeL.svg");
  shapeM = loadShape("shapeM.svg");
  shapeN = loadShape("shapeN.svg");
  shapeO = loadShape("shapeO.svg");
  shapeP = loadShape("shapeP.svg");
  shapeQ = loadShape("shapeQ.svg");
  shapeR = loadShape("shapeR.svg");
  shapeS = loadShape("shapeS.svg");
  shapeT = loadShape("shapeT.svg");
  shapeU = loadShape("shapeU.svg");
  shapeV = loadShape("shapeV.svg");
  shapeW = loadShape("shapeW.svg");
  shapeX = loadShape("shapeX.svg");
  shapeY = loadShape("shapeY.svg");
  shapeZ = loadShape("shapeZ.svg");
  shapenull = loadShape("shapenull.svg");
  shapeSpace = loadShape("space.svg");
  shapeSpace2 = loadShape("space2.svg");
  shapePeriod = loadShape("period.svg");
  shapeComma = loadShape("comma.svg"); 
  shapeExclamationmark = loadShape("exclamationmark.svg");
  shapeQuestionmark = loadShape("questionmark.svg");
  shapeReturn = loadShape("return.svg");

  cursor(HAND);
}


void draw() {
 // if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  
 
  background(255);
  smooth();
  noStroke();
  textAlign(LEFT);

  if (mousePressed == true) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
  } 

  // allways produce the same sequence of random numbers
  randomSeed(actRandomSeed);

  translate(centerX,centerY);
  scale(zoom);

  float x = 0, y = 0;
  for (int i = 0; i < textTyped.length(); i++) {
    float fontSize = 25;
    textFont(font,fontSize);
    char letter = textTyped.charAt(i);
    float letterWidth = textWidth(letter);

   if (x > width) {
      // start new line and add line height
      x = 0;
      y += 85; 
    }  
    
    // ------ letter rule table ------
    switch(letter) {
    case ' ': // space
      shape(shapenull, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'A':
      shape(shapeA, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'B':
      shape(shapeB, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'C':
      shape(shapeC, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'D':
      shape(shapeD, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'E':
      shape(shapeE, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'F':
      shape(shapeF, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'G':
      shape(shapeG, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'H':
      shape(shapeH, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'I':
      shape(shapeI, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'J':
      shape(shapeJ, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'K':
      shape(shapeK, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'L':
      shape(shapeL, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'M':
      shape(shapeM, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'N':
      shape(shapeN, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'O':
      shape(shapeO, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'P':
      shape(shapeP, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'Q':
      shape(shapeQ, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'R':
      shape(shapeR, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'S':
      shape(shapeS, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'T':
      shape(shapeT, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'U':
      shape(shapeU, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'V':
      shape(shapeV, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'W':
      shape(shapeW, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'X':
      shape(shapeX, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'Y':
      shape(shapeY, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'Z':
      shape(shapeZ, x, y);
      x += 85;
      //translate(85, 0);
      break;      
    case 'a':
      shape(shapeA, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'b':
      shape(shapeB, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'c':
      shape(shapeC, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'd':
      shape(shapeD, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'e':
      shape(shapeE, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'f':
      shape(shapeF, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'g':
      shape(shapeG, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'h':
      shape(shapeH, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'i':
      shape(shapeI, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'j':
      shape(shapeJ, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'k':
      shape(shapeK, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'l':
      shape(shapeL, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'm':
      shape(shapeM, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'n':
      shape(shapeN, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'o':
      shape(shapeO, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'p':
      shape(shapeP, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'q':
      shape(shapeQ, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'r':
      shape(shapeR, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 's':
      shape(shapeS, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 't':
      shape(shapeT, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'u':
      shape(shapeU, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'v':
      shape(shapeV, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'w':
      shape(shapeW, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'x':
      shape(shapeX, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'y':
      shape(shapeY, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case 'z':
      shape(shapeZ, x, y);
      x += 85;
      //translate(85, 0);
      break;
    case ',':
      shape(shapenull, x, y);
      x += 85;
      //translate(85, 0);
      break;

    case '.':
      shape(shapenull, x, y);
      x += 85;
      //translate(85, 0);
      break;

    case '!':  
      shape(shapenull, x, y);
      x += 85;
      //translate(85, 0);
      break;

    case '?':  
      shape(shapenull, x, y);
      x += 85;
      //translate(85, 0);
      break;

    case '\n': // return  
      shape(shapenull, x, y);
      x = 0;
      y += 85;
      //translate(85, 0);
      break;

    default: // all others
      fill(0);
      text(letter, x, y);
      x += 85;
      //translate(letterWidth, 0);
    }

}

  // blink cursor after text
  fill(0);
  if (frameCount/6 % 2 == 0) rect(x, y, 15, 2);

 /* if (savePDF) {
    savePDF = false;
    endRecord();
    saveFrame(timestamp()+".png");
  }*/
}


void mousePressed(){
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}


void keyReleased() {
//  if (keyCode == CONTROL) savePDF = true;
  if (keyCode == ALT) actRandomSeed++;
  println(actRandomSeed);
}

void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case DELETE:
    case BACKSPACE:
      textTyped = textTyped.substring(0,max(0,textTyped.length()-1));
      break;
    case TAB:
      break;
    case ENTER:
    case RETURN:
      // enable linebreaks
      textTyped += "\n";
      break;
    case ESC:
      break;
    default:
      textTyped += key;
    }
  }

  // zoom
  if (keyCode == UP) zoom += 0.05;
  if (keyCode == DOWN) zoom -= 0.05;  
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}






















