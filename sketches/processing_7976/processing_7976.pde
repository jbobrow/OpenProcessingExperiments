



// imports ================================================


/** PeasyCam **/
import peasy.*;

// variables =============================================

// Camera
PeasyCam cam;

int bufferSize = 1256;
int bufferWritePosition = 0;
String[] buffer = new String[bufferSize];

int factorBetweenBoxes = 3;
int factorBetweenLetters = 30;
float angle = 0.0;
float angleAdd = 0.009;

// letterSpacing: use -6 for 'W' to put more space after the W 
int letterSpacing = 0; 

// functions =============================================

void setup () {

  size (900,800, P3D);
  cam = new PeasyCam(this, 400.0 );
  cam.pan(70,400);  
  noSmooth(); 
  fill(color(254,0,0));
  stroke(color(25,25,0));  
}

void draw () {
  background(111);
  rotateY(angle);
  WordPaint("Hello World");
  angle += angleAdd;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      factorBetweenBoxes-=1;
    } 
    else if (keyCode == DOWN) {
      factorBetweenBoxes+=1;
    } 
    if (keyCode == LEFT) {
      factorBetweenLetters-=1;
    } 
    else if (keyCode == RIGHT) {
      factorBetweenLetters+=1;
    }     
  } 
  else {
    // not coded 
    if (key == ' ') {
      if (angleAdd==0.0) {
        angleAdd=0.009;
      } 
      else {
        angleAdd=0.0;
      };
    } // SPACE
    else if (key == 'm') {
      angleAdd=0.009;
    }
  } // else not coded 
} // func 

void WordPaint(String InputWordOfFunction) {
  final int BoxWidth=3; 
  letterSpacing=0;
  for (int i = 0; i < InputWordOfFunction.length(); i = i+1) {
    buffer = new String[bufferSize];
    bufferWritePosition=0;
    letterSpacing=0; 
    keyPaintHelper(InputWordOfFunction.charAt(i));
    for (int  j = 0; j < bufferWritePosition; j = j+1) {
      for (int  k = 0; k < buffer[j].length(); k = k+1) {
        if (buffer[j].charAt(k) == '*') {
          pushMatrix();
          translate((j*factorBetweenBoxes)+(i*factorBetweenLetters)-100+letterSpacing, 
          300-(k*factorBetweenBoxes)+100, 
          -1); 
          // rotateY(0.3); //  ;-) 
          box (BoxWidth,BoxWidth,BoxWidth+BoxWidth+BoxWidth);
          popMatrix();
        }
      }
    }
  }
}

void keyPaintHelper(char InputKeyOfFunction) {
  char k = Character.toUpperCase(InputKeyOfFunction);
  letterSpacing=0;
  switch(k) {
  case 'A':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "   *   * ";
      buffer[bufferWritePosition + 3] = "   *   * ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = " ******  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'B':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *  *  * ";
      buffer[bufferWritePosition + 3] = " *  *  * ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = "  ** **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'C':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " *     * ";
      buffer[bufferWritePosition + 4] = " *     * ";
      buffer[bufferWritePosition + 5] = "  *   *  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'D':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " **   ** ";
      buffer[bufferWritePosition + 4] = "  *****  ";
      buffer[bufferWritePosition + 5] = "   ***   ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'E':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *  *  * ";
      buffer[bufferWritePosition + 3] = " *  *  * ";
      buffer[bufferWritePosition + 4] = " *  *  * ";
      buffer[bufferWritePosition + 5] = " *     * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'F':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    *  * ";
      buffer[bufferWritePosition + 3] = "    *  * ";
      buffer[bufferWritePosition + 4] = "    *  * ";
      buffer[bufferWritePosition + 5] = "       * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'G':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " ** *  * ";
      buffer[bufferWritePosition + 3] = " ** *  * ";
      buffer[bufferWritePosition + 4] = " **** ** ";
      buffer[bufferWritePosition + 5] = " **** *  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'H':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    *    ";
      buffer[bufferWritePosition + 3] = "    *    ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = " ******* ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'I':
    if (thereAreEnoughSlots(6)) {
      buffer[bufferWritePosition + 0] = "         ";
      buffer[bufferWritePosition + 1] = " *     * ";
      buffer[bufferWritePosition + 2] = " ******* ";
      buffer[bufferWritePosition + 3] = " ******* ";
      buffer[bufferWritePosition + 4] = " *     * ";
      buffer[bufferWritePosition + 5] = "         ";
      bufferWritePosition += 6;
    }
    break;
  case 'J':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  **     ";
      buffer[bufferWritePosition + 1] = " ***     ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " ******* ";
      buffer[bufferWritePosition + 4] = "  ****** ";
      buffer[bufferWritePosition + 5] = "       * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'K':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "   ***   ";
      buffer[bufferWritePosition + 3] = "  ** **  ";
      buffer[bufferWritePosition + 4] = " **   ** ";
      buffer[bufferWritePosition + 5] = " *     * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'L':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *       ";
      buffer[bufferWritePosition + 3] = " *       ";
      buffer[bufferWritePosition + 4] = " *       ";
      buffer[bufferWritePosition + 5] = " *       ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'M':
    if (thereAreEnoughSlots(9)) {
      buffer[bufferWritePosition + 0] = " ******  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    **** ";
      buffer[bufferWritePosition + 3] = "  ****   ";
      buffer[bufferWritePosition + 4] = "  ****   ";
      buffer[bufferWritePosition + 5] = "    **** ";
      buffer[bufferWritePosition + 6] = " ******* ";
      buffer[bufferWritePosition + 7] = " ******  ";
      buffer[bufferWritePosition + 8] = "         ";
      bufferWritePosition += 9;
    }
    break;
  case 'N':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    **   ";
      buffer[bufferWritePosition + 3] = "   **    ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = " ******* ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'O':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *     * ";
      buffer[bufferWritePosition + 3] = " *     * ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = "  *****  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'P':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "    *  * ";
      buffer[bufferWritePosition + 3] = "    *  * ";
      buffer[bufferWritePosition + 4] = "    **** ";
      buffer[bufferWritePosition + 5] = "     **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Q':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  *****  ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " **    * ";
      buffer[bufferWritePosition + 3] = " **    * ";
      buffer[bufferWritePosition + 4] = "******** ";
      buffer[bufferWritePosition + 5] = "* *****  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'R':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " ******* ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = "   **  * ";
      buffer[bufferWritePosition + 3] = "  ***  * ";
      buffer[bufferWritePosition + 4] = " ** **** ";
      buffer[bufferWritePosition + 5] = " *   **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'S':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  ** **  ";
      buffer[bufferWritePosition + 1] = " ** **** ";
      buffer[bufferWritePosition + 2] = " *  *  * ";
      buffer[bufferWritePosition + 3] = " *  *  * ";
      buffer[bufferWritePosition + 4] = " **** ** ";
      buffer[bufferWritePosition + 5] = "  ** **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'T':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "       * ";
      buffer[bufferWritePosition + 1] = "       * ";
      buffer[bufferWritePosition + 2] = " ******* ";
      buffer[bufferWritePosition + 3] = " ******* ";
      buffer[bufferWritePosition + 4] = "       * ";
      buffer[bufferWritePosition + 5] = "       * ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'U':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "  ****** ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " *       ";
      buffer[bufferWritePosition + 3] = " *       ";
      buffer[bufferWritePosition + 4] = " ******* ";
      buffer[bufferWritePosition + 5] = "  ****** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'V':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "   ***** ";
      buffer[bufferWritePosition + 1] = "  ****** ";
      buffer[bufferWritePosition + 2] = " **      ";
      buffer[bufferWritePosition + 3] = " **      ";
      buffer[bufferWritePosition + 4] = "  ****** ";
      buffer[bufferWritePosition + 5] = "   ***** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'W':
    letterSpacing=-6 ; // -6 for 'W'
    if (thereAreEnoughSlots(9)) {
      buffer[bufferWritePosition + 0] = "  ****** ";
      buffer[bufferWritePosition + 1] = " ******* ";
      buffer[bufferWritePosition + 2] = " **      ";
      buffer[bufferWritePosition + 3] = "  ****   ";
      buffer[bufferWritePosition + 4] = "  ****   ";
      buffer[bufferWritePosition + 5] = " **      ";
      buffer[bufferWritePosition + 6] = " ******* ";
      buffer[bufferWritePosition + 7] = "  ****** ";
      buffer[bufferWritePosition + 8] = "         ";
      bufferWritePosition += 9;
    }
    break;
  case 'X':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " **   ** ";
      buffer[bufferWritePosition + 1] = " *** *** ";
      buffer[bufferWritePosition + 2] = "   ***   ";
      buffer[bufferWritePosition + 3] = "   ***   ";
      buffer[bufferWritePosition + 4] = " *** *** ";
      buffer[bufferWritePosition + 5] = " **   ** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Y':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "     *** ";
      buffer[bufferWritePosition + 1] = "    **** ";
      buffer[bufferWritePosition + 2] = " ****    ";
      buffer[bufferWritePosition + 3] = " ****    ";
      buffer[bufferWritePosition + 4] = "    **** ";
      buffer[bufferWritePosition + 5] = "     *** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Z':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = " **    * ";
      buffer[bufferWritePosition + 1] = " ***   * ";
      buffer[bufferWritePosition + 2] = " * **  * ";
      buffer[bufferWritePosition + 3] = " *  ** * ";
      buffer[bufferWritePosition + 4] = " *   *** ";
      buffer[bufferWritePosition + 5] = " *    ** ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case '.':
    if (thereAreEnoughSlots(3)) {
      buffer[bufferWritePosition + 0] = " **      ";
      buffer[bufferWritePosition + 1] = " **      ";
      buffer[bufferWritePosition + 2] = "         ";
      bufferWritePosition += 3;
    }
    break;
  case ',':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "*        ";
      buffer[bufferWritePosition + 1] = "***      ";
      buffer[bufferWritePosition + 2] = " **      ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '\'':
    if (thereAreEnoughSlots(3)) {
      buffer[bufferWritePosition + 0] = "     *** ";
      buffer[bufferWritePosition + 1] = "     *** ";
      buffer[bufferWritePosition + 2] = "         ";
      bufferWritePosition += 3;
    }
    break;
  case '?':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0] = "      *  ";
      buffer[bufferWritePosition + 1] = "      ** ";
      buffer[bufferWritePosition + 2] = " * *   * ";
      buffer[bufferWritePosition + 3] = " * **  * ";
      buffer[bufferWritePosition + 4] = "    **** ";
      buffer[bufferWritePosition + 5] = "     **  ";
      buffer[bufferWritePosition + 6] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case '!':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "         ";
      buffer[bufferWritePosition + 1] = " * ***** ";
      buffer[bufferWritePosition + 2] = " * ***** ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '-':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "   **    ";
      buffer[bufferWritePosition + 1] = "   **    ";
      buffer[bufferWritePosition + 2] = "   **    ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case ' ':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0] = "         ";
      buffer[bufferWritePosition + 1] = "         ";
      buffer[bufferWritePosition + 2] = "         ";
      buffer[bufferWritePosition + 3] = "         ";
      bufferWritePosition += 4;
    }
    break;
  default:
    /*
    if (key == CODED) {
     if (keyCode == UP) {
     timeToWait += 10;
     } 
     else if (keyCode == DOWN && timeToWait >= 10) {
     timeToWait -= 10;
     if (timeToWait < 0) {
     timeToWait = 0;
     }
     } 
     } 
     break;
     */
  }
}

boolean thereAreEnoughSlots(int slotsRequired) {
  /*
  if((bufferSize - bufferWritePosition) <= slotsRequired + 4) {
   return false;
   }
   else return true;
   */
  return true;
}















