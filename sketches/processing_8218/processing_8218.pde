


// This makes usage of a fly-class LinePath by quark.
// It shows a sentence letter by letter. 
// When there's a space as a letter, the screen is blank.
// Each letter consists of boxes. They fly to build 
// the new letter. 
// There are 'cool' letters L, H and E which can be 
// seen from 4 sides, and normal letters such as O or 
// W which can be seen only from the front. 
// Between letters a random pattern is shown
// (because otherwise, with double L like in Hello
// from L to L nothing would happen).
// To Do: Do a shuffle of Box-Positions, so there's
// more movement. 
// You can use PeasyCam (Mouse). 

//  sentence to display
String Word1 = "Hello World!"; 

// imports ================================================

import shapes3d.utils.*;
import shapes3d.*;

/** PeasyCam **/
import peasy.*;

// variables =============================================

// Camera
PeasyCam cam;

int depthSize = 36;
int bufferSize = 1256;
int bufferWritePosition = 0;
int depthWritePosition = 0 ; 
String[][] buffer = new String[bufferSize][depthSize];

final int MaxBoxes = 599; 

Box [] MyBoxes = new Box [MaxBoxes]; // array
Shape3D SwapBoxHelp ; 

int factorBetweenBoxes = 3;
int factorBetweenLetters = 30;
float angle = 0.0;
float angleAdd = 0.009;

// letterSpacing: use -6 for 'W' to put more space after the W 
int letterSpacing = 0;   // not in use

int BoxCount = 0; 

LinePath [] lp = new LinePath [MaxBoxes];

boolean AllDestReached = true; 
boolean FirstTime=true; 

int WordPosition = 0; 
int LetterCount=0;

// functions =============================================

void setup () {

  size (800,600, P3D);
  //size (screen.width,screen.height, P3D);
  cam = new PeasyCam(this, 400.0 );
  cam.pan(-61,390);  
  cam.setDistance(31);
  cam.setResetOnDoubleClick (false);   
  noSmooth(); 
  noStroke(); 
  background(0);
  int BoxWidth=3; 
  // Init
  for (int i = 0; i < MaxBoxes; i = i+1) {
    MyBoxes[i] = new Box(this, BoxWidth,BoxWidth,BoxWidth ); 
    MyBoxes[i].visible(false);    
  }  // for
  AllDestReached = true; 
  Word1.toUpperCase();  
  angleAdd = 0.0; 

} // setup 

void draw () {
  background(0);
  ShowWord(Word1); 
}

void ShowWord(String Word1) {
  // if all destinations are reached:
  // Move to next letter. 
  if (AllDestReached == true) {
    // if end of sentence 
    if (WordPosition>=Word1.length()) { 
      // end of sentence: wait
      delay (1000);
      WordPosition = 0; 
      LetterCount=0;
      // exit(); // or could exit here 
    }
    // After each letter random pattern
    if (LetterCount%2==0) {
      // wait to show real letter (that has been painted before)
      delay (1000);
      // random pattern 
      WordPaintRandom( ); 
    } 
    else {
      // normal letter 
      WordPaint(Word1.charAt(WordPosition) );
      WordPosition++; 
    }
    LetterCount++;
  } // if 

  int millisAll = millis(); 
  AllDestReached = true;
  for (int i = 0; i < BoxCount; i = i+1) {
    lp[i].updatePos(millisAll);
    MyBoxes[i].draw();
    // if only one is false, all are not yet finished 
    if (lp[i].destReached==false) { 
      AllDestReached = false;  
    } 
  }  
} // func 

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      factorBetweenBoxes-=1;
      if (factorBetweenBoxes<=0) {
        factorBetweenBoxes=0;
      }
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
    else {
      // nothing
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
    else if (key == 'n') {    
      WordPosition = 0; 
    }
    else 
    {
      // nothing
    }
  } // else not coded 
} // func 

void WordPaint(char InputWordOfFunction) { 
  final int BoxWidth=3; 
  //  for (int i = 0; i < MaxBoxes; i = i+1) {
  //    MyBoxes[i].visible(false);
  //  }  // for  
  letterSpacing=0;
  BoxCount=0;
  //  for (int i = 0; i < InputWordOfFunction.length(); i = i+1) {
  buffer = new String[bufferSize][depthSize];
  bufferWritePosition=0;
  depthWritePosition=0;
  letterSpacing=0; 
  keyPaintHelper(InputWordOfFunction);// .charAt(i));
  for (int  depth = 0; depth < depthWritePosition; depth = depth+1) {    
    for (int  j = 0; j < bufferWritePosition; j = j+1) {
      for (int  k = 0; k < buffer[j][depth].length(); k = k+1) {
        // Move the object to a new position over the next 5 seconds
        lp [BoxCount] = new LinePath(MyBoxes[BoxCount], 
        new PVector((j*factorBetweenBoxes)+(1*factorBetweenLetters)-100+letterSpacing, 
        300-(k*factorBetweenBoxes)+100, 
        depth*-3), 
        5000);            
        if (buffer[j][depth].charAt(k) == '*') {
          // has a * 
          MyBoxes[BoxCount].visible(true);
          BoxCount++;
        }
        else {
          // no * 
          // Box invisible 
          MyBoxes[BoxCount].visible(true); 
        } // else 
        // BoxCount++;
      } // for 
    }
  }
  // } // for 

  if (InputWordOfFunction==' ') {
    // Space: All invisible 
    for (int i = 0; i < MaxBoxes; i = i+1) {
      MyBoxes[i].visible(false);
    } // for 
  } // if 
  else {
    // All visible 
    for (int i = BoxCount; i < MaxBoxes; i = i+1) {
      // MyBoxes[i].visible(false);
      MyBoxes[i].visible(true);
      lp[i] = new LinePath(MyBoxes[i], 
      lp[3].d, 
      5000);          
    }  // for  
    for (int i = 0; i < MaxBoxes-14; i = i+1) {
      if (lp[i].s==lp[i].d) {
        println ("Needs to shuffle");
        Shape3D MyShape3D = lp[i].shape; 
        lp[i].shape = lp[i+12].shape; 
        lp[i+12].shape = MyShape3D; 
      }
    } // for    
  } // else 
  BoxCount=MaxBoxes;
}  // function 

void WordPaintRandom () { // (String InputWordOfFunction, boolean IsNew ) {
  final int BoxWidth=3; 
  letterSpacing=0;
  BoxCount=0;
  buffer = new String[bufferSize][depthSize];
  bufferWritePosition=0;
  depthWritePosition=0;
  letterSpacing=0; 
  for (int  depth = 0; depth < 8; depth = depth+1) {    
    for (int  j = 0; j < 8; j = j+1) {
      for (int  k = 0; k < 8; k = k+1) {
        if (random(1000)>700) { 
          // MyBoxes[BoxCount].visible(true);
          lp [BoxCount] = new LinePath(MyBoxes[BoxCount], 
          new PVector(
          (random(8)*factorBetweenBoxes)+(1*factorBetweenLetters)-100+letterSpacing, 
          300-(random(8)*factorBetweenBoxes)+100, 
          random(8)*-3), 
          5000);       
          // full random works only with OPENGL (not P3D)     
          // lp [BoxCount] = new LinePath(MyBoxes[BoxCount], 
          // new PVector(random(width),random(height),random(depth)),3000);           
          BoxCount++; 
        }
        else {
          // MyBoxes[BoxCount].visible(false);  
        } // else 
      }
    }
  }
}

void keyPaintHelper(char InputKeyOfFunction) {
  // Building letters from sets of stars (*).
  // There are cool letters such as L, H and E and 
  // normal letters such as 'O' or 'W'.
  char k = Character.toUpperCase(InputKeyOfFunction);
  letterSpacing=0;
  int depth = 0; 
  boolean IsCoolLetter = false; 

  // Init complete letter with complete depths
  for (int  depth1 = 0; depth1 < 8; depth1 = depth1+1) {   
    bufferWritePosition=0; 
    buffer[bufferWritePosition + 0][depth1] = "         ";
    buffer[bufferWritePosition + 1][depth1] = "         ";
    buffer[bufferWritePosition + 2][depth1] = "         ";
    buffer[bufferWritePosition + 3][depth1] = "         ";
    buffer[bufferWritePosition + 4][depth1] = "         ";
    buffer[bufferWritePosition + 5][depth1] = "         ";
    buffer[bufferWritePosition + 6][depth1] = "         ";
  } 

  switch(k) {
  case 'A':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******  ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "   *   * ";
      buffer[bufferWritePosition + 3][depth] = "   *   * ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = " ******  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'B':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = "  ** **  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'C':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  *****  ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *     * ";
      buffer[bufferWritePosition + 3][depth] = " *     * ";
      buffer[bufferWritePosition + 4][depth] = " *     * ";
      buffer[bufferWritePosition + 5][depth] = "  *   *  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'D':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *     * ";
      buffer[bufferWritePosition + 3][depth] = " **   ** ";
      buffer[bufferWritePosition + 4][depth] = "  *****  ";
      buffer[bufferWritePosition + 5][depth] = "   ***   ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'E':
    if (thereAreEnoughSlots(7)) {
      IsCoolLetter = true; 
      // Init complete letter with complete depths
      for (int  depth1 = 0; depth1 < 7; depth1 = depth1+1) {   
        bufferWritePosition=0; 
        buffer[bufferWritePosition + 0][depth1] = "         ";
        buffer[bufferWritePosition + 1][depth1] = "         ";
        buffer[bufferWritePosition + 2][depth1] = "         ";
        buffer[bufferWritePosition + 3][depth1] = "         ";
        buffer[bufferWritePosition + 4][depth1] = "         ";
        buffer[bufferWritePosition + 5][depth1] = "         ";
        buffer[bufferWritePosition + 6][depth1] = "         ";
      }      

      depth=0; // front 
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " *     * ";
      buffer[bufferWritePosition + 6][depth] = "         ";

      depth=1; // front + 1 inside
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " *     * ";
      buffer[bufferWritePosition + 6][depth] = "         ";      

      depth=6; // back
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " *     * ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = " ******* ";

      depth=5; // back + 1 inside 
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " *     * ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";      

      // left and right side...
      bufferWritePosition = 0; // one side 
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, " *     * ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " ******* ");
      AddStars(bufferWritePosition,6, " ******* ");    

      bufferWritePosition = 1; // one side (one more inside)
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, " *     * ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " ******* ");
      AddStars(bufferWritePosition,6, "         ");  

      bufferWritePosition = 6; // other side 
      AddStars(bufferWritePosition,0, " ******* ");
      AddStars(bufferWritePosition,1, " ******* ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " *     * ");
      AddStars(bufferWritePosition,6, "         ");        

      bufferWritePosition = 5; // other side (one more inside)
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, " ******* ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " *     * ");
      AddStars(bufferWritePosition,6, "         ");       

      /*
      bufferWritePosition = 0;
       depth++;
       buffer[bufferWritePosition + 0][depth] = " *     * ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " *     * ";
       buffer[bufferWritePosition + 6][depth] = " ******* ";
       bufferWritePosition = 0;
       depth++;
       buffer[bufferWritePosition + 0][depth] = " *  *  * ";
       buffer[bufferWritePosition + 1][depth] = " *     * ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " *     * ";
       buffer[bufferWritePosition + 6][depth] = " ******* ";      
       bufferWritePosition = 0;
       depth++;
       buffer[bufferWritePosition + 0][depth] = " *  *  * ";
       buffer[bufferWritePosition + 1][depth] = " *  *  * ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " *     * ";
       buffer[bufferWritePosition + 6][depth] = " *  *  * ";
       bufferWritePosition = 0;
       depth++;      
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " *     * ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " ******* ";
       buffer[bufferWritePosition + 6][depth] = " ******* "; 
       */
      bufferWritePosition = 7;     
      depthWritePosition = 7; // depth+1; 
    }
    break;
  case 'F':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    *  * ";
      buffer[bufferWritePosition + 3][depth] = "    *  * ";
      buffer[bufferWritePosition + 4][depth] = "    *  * ";
      buffer[bufferWritePosition + 5][depth] = "       * ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'G':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  *****  ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " ** *  * ";
      buffer[bufferWritePosition + 3][depth] = " ** *  * ";
      buffer[bufferWritePosition + 4][depth] = " **** ** ";
      buffer[bufferWritePosition + 5][depth] = " **** *  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'H':
    if (thereAreEnoughSlots(7)) {
      IsCoolLetter = true; 
      depth=0;
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    *    ";
      buffer[bufferWritePosition + 3][depth] = "    *    ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition = 0;
      depth++;            
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    *    ";
      buffer[bufferWritePosition + 3][depth] = "    *    ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition = 0;

      depth++;      
      buffer[bufferWritePosition + 0][depth] = "    *    ";
      buffer[bufferWritePosition + 1][depth] = "    *    ";
      buffer[bufferWritePosition + 2][depth] = "    *    ";
      buffer[bufferWritePosition + 3][depth] = "    *    ";
      buffer[bufferWritePosition + 4][depth] = "    *    ";
      buffer[bufferWritePosition + 5][depth] = "    *    ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition = 0;
      depth++;      
      buffer[bufferWritePosition + 0][depth] = "    *    ";
      buffer[bufferWritePosition + 1][depth] = "    *    ";
      buffer[bufferWritePosition + 2][depth] = "    *    ";
      buffer[bufferWritePosition + 3][depth] = "    *    ";
      buffer[bufferWritePosition + 4][depth] = "    *    ";
      buffer[bufferWritePosition + 5][depth] = "    *    ";
      buffer[bufferWritePosition + 6][depth] = "         ";

      depth++;            
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    *    ";
      buffer[bufferWritePosition + 3][depth] = "    *    ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition = 0;      
      depth++;            
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    *    ";
      buffer[bufferWritePosition + 3][depth] = "    *    ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";      
      bufferWritePosition = 7;
      depthWritePosition = depth+1;
    }
    break;
  case 'I':
    if (thereAreEnoughSlots(6)) {
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " *     * ";
      buffer[bufferWritePosition + 2][depth] = " ******* ";
      buffer[bufferWritePosition + 3][depth] = " ******* ";
      buffer[bufferWritePosition + 4][depth] = " *     * ";
      buffer[bufferWritePosition + 5][depth] = "         ";
      bufferWritePosition += 6;
    }
    break;
  case 'J':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  **     ";
      buffer[bufferWritePosition + 1][depth] = " ***     ";
      buffer[bufferWritePosition + 2][depth] = " *     * ";
      buffer[bufferWritePosition + 3][depth] = " ******* ";
      buffer[bufferWritePosition + 4][depth] = "  ****** ";
      buffer[bufferWritePosition + 5][depth] = "       * ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'K':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "   ***   ";
      buffer[bufferWritePosition + 3][depth] = "  ** **  ";
      buffer[bufferWritePosition + 4][depth] = " **   ** ";
      buffer[bufferWritePosition + 5][depth] = " *     * ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'L':
    if (thereAreEnoughSlots(7)) {
      IsCoolLetter = true; 
      // Init complete letter with complete depths
      for (int  depth1 = 0; depth1 < 7; depth1 = depth1+1) {   
        bufferWritePosition=0; 
        buffer[bufferWritePosition + 0][depth1] = "         ";
        buffer[bufferWritePosition + 1][depth1] = "         ";
        buffer[bufferWritePosition + 2][depth1] = "         ";
        buffer[bufferWritePosition + 3][depth1] = "         ";
        buffer[bufferWritePosition + 4][depth1] = "         ";
        buffer[bufferWritePosition + 5][depth1] = "         ";
        buffer[bufferWritePosition + 6][depth1] = "         ";
      }

      depth=0;  // normal, front 
      bufferWritePosition=0;
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *       ";
      buffer[bufferWritePosition + 3][depth] = " *       ";
      buffer[bufferWritePosition + 4][depth] = " *       ";
      buffer[bufferWritePosition + 5][depth] = "         ";
      buffer[bufferWritePosition + 6][depth] = "         ";

      depth=1;  // normal, front 
      bufferWritePosition=0;
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " *       ";
      buffer[bufferWritePosition + 2][depth] = " *       ";
      buffer[bufferWritePosition + 3][depth] = " *       ";
      buffer[bufferWritePosition + 4][depth] = " *       ";
      buffer[bufferWritePosition + 5][depth] = "         ";
      buffer[bufferWritePosition + 6][depth] = "         ";

      depth=6;  // back
      bufferWritePosition=0;
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = "         ";
      buffer[bufferWritePosition + 2][depth] = " *       ";
      buffer[bufferWritePosition + 3][depth] = " *       ";
      buffer[bufferWritePosition + 4][depth] = " *       ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = " ******* ";

      depth=5; // normal, front 
      bufferWritePosition=0;
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = "         ";
      buffer[bufferWritePosition + 2][depth] = " *       ";
      buffer[bufferWritePosition + 3][depth] = " *       ";
      buffer[bufferWritePosition + 4][depth] = " *       ";
      buffer[bufferWritePosition + 5][depth] = " *       ";
      buffer[bufferWritePosition + 6][depth] = "         ";

      /*
      bufferWritePosition=0; 
       depth++;  // 2
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *       ";
       buffer[bufferWritePosition + 3][depth] = " *       ";
       buffer[bufferWritePosition + 4][depth] = " *       ";
       buffer[bufferWritePosition + 5][depth] = " *       ";
       buffer[bufferWritePosition + 6][depth] = "         ";
       
       bufferWritePosition=0; 
       depth++;  // 3
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *       ";
       buffer[bufferWritePosition + 3][depth] = " *       ";
       buffer[bufferWritePosition + 4][depth] = " *       ";
       buffer[bufferWritePosition + 5][depth] = " *       ";
       buffer[bufferWritePosition + 6][depth] = "         ";
       
       
       
       bufferWritePosition=0; 
       depth++;  // 4
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *       ";
       buffer[bufferWritePosition + 3][depth] = " *       ";
       buffer[bufferWritePosition + 4][depth] = " *       ";
       buffer[bufferWritePosition + 5][depth] = " *       ";
       buffer[bufferWritePosition + 6][depth] = "         ";
       
       bufferWritePosition=0; 
       depth++;  // 5
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *       ";
       buffer[bufferWritePosition + 3][depth] = " *       ";
       buffer[bufferWritePosition + 4][depth] = " *       ";
       buffer[bufferWritePosition + 5][depth] = " *       ";
       buffer[bufferWritePosition + 6][depth] = "         ";
       
       bufferWritePosition=0; 
       depth++;   // 6 
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *       ";
       buffer[bufferWritePosition + 3][depth] = " *       ";
       buffer[bufferWritePosition + 4][depth] = " *       ";
       buffer[bufferWritePosition + 5][depth] = " *       ";
       buffer[bufferWritePosition + 6][depth] = "         ";
       */

      bufferWritePosition = 6; 
      AddStars(bufferWritePosition,0, " ******* ") ;
      AddStars(bufferWritePosition,1, " ******* ");
      AddStars(bufferWritePosition,2, " *       ");
      AddStars(bufferWritePosition,3, " *       ");
      AddStars(bufferWritePosition,4, " *       ");
      AddStars(bufferWritePosition,5, "         ");
      AddStars(bufferWritePosition,6, "         ");    

      bufferWritePosition = 5 ;
      AddStars(bufferWritePosition,0, "         ") ;
      AddStars(bufferWritePosition,1, "         ");
      AddStars(bufferWritePosition,2, " *       ");
      AddStars(bufferWritePosition,3, " *       ");
      AddStars(bufferWritePosition,4, " *       ");
      AddStars(bufferWritePosition,5, "         ");
      AddStars(bufferWritePosition,6, "         ");   

      bufferWritePosition = 0; 
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, "         ");
      AddStars(bufferWritePosition,2, " *       ");
      AddStars(bufferWritePosition,3, " *       ");
      AddStars(bufferWritePosition,4, " *       ");
      AddStars(bufferWritePosition,5, " ******* ");
      AddStars(bufferWritePosition,6, " ******* ");   

      bufferWritePosition = 1; 
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, "         ");
      AddStars(bufferWritePosition,2, " *       ");
      AddStars(bufferWritePosition,3, " *       ");
      AddStars(bufferWritePosition,4, " *       ");
      AddStars(bufferWritePosition,5, "         ");
      AddStars(bufferWritePosition,6, "         ");

      bufferWritePosition = 7;
      depthWritePosition = 7;      
    }
    break;
  case 'M':
    if (thereAreEnoughSlots(9)) {
      buffer[bufferWritePosition + 0][depth] = " ******  ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    **** ";
      buffer[bufferWritePosition + 3][depth] = "  ****   ";
      buffer[bufferWritePosition + 4][depth] = "  ****   ";
      buffer[bufferWritePosition + 5][depth] = "    **** ";
      buffer[bufferWritePosition + 6][depth] = " ******* ";
      buffer[bufferWritePosition + 7][depth] = " ******  ";
      buffer[bufferWritePosition + 8][depth] = "         ";
      bufferWritePosition += 9;
    }
    break;
  case 'N':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    **   ";
      buffer[bufferWritePosition + 3][depth] = "   **    ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'O':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  *****  ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *     * ";
      buffer[bufferWritePosition + 3][depth] = " *     * ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = "  *****  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'P':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "    *  * ";
      buffer[bufferWritePosition + 3][depth] = "    *  * ";
      buffer[bufferWritePosition + 4][depth] = "    **** ";
      buffer[bufferWritePosition + 5][depth] = "     **  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Q':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  *****  ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " **    * ";
      buffer[bufferWritePosition + 3][depth] = " **    * ";
      buffer[bufferWritePosition + 4][depth] = "******** ";
      buffer[bufferWritePosition + 5][depth] = "* *****  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'R':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " ******* ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = "   **  * ";
      buffer[bufferWritePosition + 3][depth] = "  ***  * ";
      buffer[bufferWritePosition + 4][depth] = " ** **** ";
      buffer[bufferWritePosition + 5][depth] = " *   **  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'S':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  ** **  ";
      buffer[bufferWritePosition + 1][depth] = " ** **** ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " **** ** ";
      buffer[bufferWritePosition + 5][depth] = "  ** **  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'T':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "       * ";
      buffer[bufferWritePosition + 1][depth] = "       * ";
      buffer[bufferWritePosition + 2][depth] = " ******* ";
      buffer[bufferWritePosition + 3][depth] = " ******* ";
      buffer[bufferWritePosition + 4][depth] = "       * ";
      buffer[bufferWritePosition + 5][depth] = "       * ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'U':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "  ****** ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *       ";
      buffer[bufferWritePosition + 3][depth] = " *       ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = "  ****** ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'V':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "   ***** ";
      buffer[bufferWritePosition + 1][depth] = "  ****** ";
      buffer[bufferWritePosition + 2][depth] = " **      ";
      buffer[bufferWritePosition + 3][depth] = " **      ";
      buffer[bufferWritePosition + 4][depth] = "  ****** ";
      buffer[bufferWritePosition + 5][depth] = "   ***** ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'W':
    letterSpacing=-6 ; // -6 for 'W'
    if (thereAreEnoughSlots(9)) {
      buffer[bufferWritePosition + 0][depth] = "  ****** ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " **      ";
      buffer[bufferWritePosition + 3][depth] = "  ****   ";
      buffer[bufferWritePosition + 4][depth] = "  ****   ";
      buffer[bufferWritePosition + 5][depth] = " **      ";
      buffer[bufferWritePosition + 6][depth] = " ******* ";
      buffer[bufferWritePosition + 7][depth] = "  ****** ";
      buffer[bufferWritePosition + 8][depth] = "         ";
      bufferWritePosition += 9;
    }
    break;
  case 'X':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " **   ** ";
      buffer[bufferWritePosition + 1][depth] = " *** *** ";
      buffer[bufferWritePosition + 2][depth] = "   ***   ";
      buffer[bufferWritePosition + 3][depth] = "   ***   ";
      buffer[bufferWritePosition + 4][depth] = " *** *** ";
      buffer[bufferWritePosition + 5][depth] = " **   ** ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Y':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "     *** ";
      buffer[bufferWritePosition + 1][depth] = "    **** ";
      buffer[bufferWritePosition + 2][depth] = " ****    ";
      buffer[bufferWritePosition + 3][depth] = " ****    ";
      buffer[bufferWritePosition + 4][depth] = "    **** ";
      buffer[bufferWritePosition + 5][depth] = "     *** ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case 'Z':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = " **    * ";
      buffer[bufferWritePosition + 1][depth] = " ***   * ";
      buffer[bufferWritePosition + 2][depth] = " * **  * ";
      buffer[bufferWritePosition + 3][depth] = " *  ** * ";
      buffer[bufferWritePosition + 4][depth] = " *   *** ";
      buffer[bufferWritePosition + 5][depth] = " *    ** ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case '.':
    if (thereAreEnoughSlots(3)) {
      buffer[bufferWritePosition + 0][depth] = " **      ";
      buffer[bufferWritePosition + 1][depth] = " **      ";
      buffer[bufferWritePosition + 2][depth] = "         ";
      bufferWritePosition += 3;
    }
    break;
  case ',':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0][depth] = "*        ";
      buffer[bufferWritePosition + 1][depth] = "***      ";
      buffer[bufferWritePosition + 2][depth] = " **      ";
      buffer[bufferWritePosition + 3][depth] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '\'':
    if (thereAreEnoughSlots(3)) {
      buffer[bufferWritePosition + 0][depth] = "     *** ";
      buffer[bufferWritePosition + 1][depth] = "     *** ";
      buffer[bufferWritePosition + 2][depth] = "         ";
      bufferWritePosition += 3;
    }
    break;
  case '?':
    if (thereAreEnoughSlots(7)) {
      buffer[bufferWritePosition + 0][depth] = "      *  ";
      buffer[bufferWritePosition + 1][depth] = "      ** ";
      buffer[bufferWritePosition + 2][depth] = " * *   * ";
      buffer[bufferWritePosition + 3][depth] = " * **  * ";
      buffer[bufferWritePosition + 4][depth] = "    **** ";
      buffer[bufferWritePosition + 5][depth] = "     **  ";
      buffer[bufferWritePosition + 6][depth] = "         ";
      bufferWritePosition += 7;
    }
    break;
  case '!':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " * ***** ";
      buffer[bufferWritePosition + 2][depth] = " * ***** ";
      buffer[bufferWritePosition + 3][depth] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '-':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0][depth] = "   **    ";
      buffer[bufferWritePosition + 1][depth] = "   **    ";
      buffer[bufferWritePosition + 2][depth] = "   **    ";
      buffer[bufferWritePosition + 3][depth] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case ' ':
    if (thereAreEnoughSlots(4)) {
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = "         ";
      buffer[bufferWritePosition + 2][depth] = "         ";
      buffer[bufferWritePosition + 3][depth] = "         ";
      bufferWritePosition += 4;
    }
    break;
  case '$':
    if (thereAreEnoughSlots(7)) {
      IsCoolLetter = false; 
      // Init complete letter with complete depths
      for (int  depth1 = 0; depth1 <= 7; depth1 = depth1+1) {   
        bufferWritePosition=0; 
        buffer[bufferWritePosition + 0][depth1] = "         ";
        buffer[bufferWritePosition + 1][depth1] = "         ";
        buffer[bufferWritePosition + 2][depth1] = "         ";
        buffer[bufferWritePosition + 3][depth1] = "         ";
        buffer[bufferWritePosition + 4][depth1] = "         ";
        buffer[bufferWritePosition + 5][depth1] = "         ";
        buffer[bufferWritePosition + 6][depth1] = "         ";
        buffer[bufferWritePosition + 7][depth1] = "         ";        
      }      

      depth=0; // front 
      bufferWritePosition=0; 
      buffer[bufferWritePosition + 0][depth] = "   ***   ";
      buffer[bufferWritePosition + 1][depth] = "  *******";
      buffer[bufferWritePosition + 2][depth] = " ******* ";
      buffer[bufferWritePosition + 3][depth] = "*******  ";
      buffer[bufferWritePosition + 4][depth] = " ******* ";
      buffer[bufferWritePosition + 5][depth] = "  *******";
      buffer[bufferWritePosition + 6][depth] = "   ***   ";

      depth=1; // front + 1 inside
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " ******* ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " *     * ";
      buffer[bufferWritePosition + 6][depth] = "         ";      

      depth=6; // back
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " *     * ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = " ******* ";

      depth=5; // back + 1 inside 
      buffer[bufferWritePosition + 0][depth] = "         ";
      buffer[bufferWritePosition + 1][depth] = " *     * ";
      buffer[bufferWritePosition + 2][depth] = " *  *  * ";
      buffer[bufferWritePosition + 3][depth] = " *  *  * ";
      buffer[bufferWritePosition + 4][depth] = " *  *  * ";
      buffer[bufferWritePosition + 5][depth] = " ******* ";
      buffer[bufferWritePosition + 6][depth] = "         ";      

      // left and right side...
      bufferWritePosition = 0; // one side 
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, " *     * ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " ******* ");
      AddStars(bufferWritePosition,6, " ******* ");    

      bufferWritePosition = 1; // one side (one more inside)
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, " *     * ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " ******* ");
      AddStars(bufferWritePosition,6, "         ");  

      bufferWritePosition = 6; // other side 
      AddStars(bufferWritePosition,0, " ******* ");
      AddStars(bufferWritePosition,1, " ******* ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " *     * ");
      AddStars(bufferWritePosition,6, "         ");        

      bufferWritePosition = 5; // other side (one more inside)
      AddStars(bufferWritePosition,0, "         ");
      AddStars(bufferWritePosition,1, " ******* ");
      AddStars(bufferWritePosition,2, " *  *  * ");
      AddStars(bufferWritePosition,3, " *  *  * ");
      AddStars(bufferWritePosition,4, " *  *  * ");
      AddStars(bufferWritePosition,5, " *     * ");
      AddStars(bufferWritePosition,6, "         ");       

      /*
      bufferWritePosition = 0;
       depth++;
       buffer[bufferWritePosition + 0][depth] = " *     * ";
       buffer[bufferWritePosition + 1][depth] = " ******* ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " *     * ";
       buffer[bufferWritePosition + 6][depth] = " ******* ";
       bufferWritePosition = 0;
       depth++;
       buffer[bufferWritePosition + 0][depth] = " *  *  * ";
       buffer[bufferWritePosition + 1][depth] = " *     * ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " *     * ";
       buffer[bufferWritePosition + 6][depth] = " ******* ";      
       bufferWritePosition = 0;
       depth++;
       buffer[bufferWritePosition + 0][depth] = " *  *  * ";
       buffer[bufferWritePosition + 1][depth] = " *  *  * ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " *     * ";
       buffer[bufferWritePosition + 6][depth] = " *  *  * ";
       bufferWritePosition = 0;
       depth++;      
       buffer[bufferWritePosition + 0][depth] = " ******* ";
       buffer[bufferWritePosition + 1][depth] = " *     * ";
       buffer[bufferWritePosition + 2][depth] = " *  *  * ";
       buffer[bufferWritePosition + 3][depth] = " *  *  * ";
       buffer[bufferWritePosition + 4][depth] = " *  *  * ";
       buffer[bufferWritePosition + 5][depth] = " ******* ";
       buffer[bufferWritePosition + 6][depth] = " ******* "; 
       */
      bufferWritePosition = 7;     
      depthWritePosition = 0; // depth+1; 
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

  // If it is not L, H or E : 
  if (! IsCoolLetter) {
    // Init complete letter with complete depths
    for (int  depth1 = 1; depth1 < 7; depth1++) {   
      for (int  bufferWritePosition2 = 0; bufferWritePosition2 < bufferWritePosition; bufferWritePosition2++) {       
        buffer[bufferWritePosition2][depth1] = 
          buffer[bufferWritePosition2][0] ;
      }
    }
    depthWritePosition = 7;
    //    buffer[bufferWritePosition + 1][depth1] = "         ";
    //    buffer[bufferWritePosition + 2][depth1] = "         ";
    //    buffer[bufferWritePosition + 3][depth1] = "         ";
    //    buffer[bufferWritePosition + 4][depth1] = "         ";
    //    buffer[bufferWritePosition + 5][depth1] = "         ";
    //    buffer[bufferWritePosition + 6][depth1] = "         ";

  } // if  

}// func 

boolean thereAreEnoughSlots(int slotsRequired) {
  /*
  if((bufferSize - bufferWritePosition) <= slotsRequired + 4) {
   return false;
   }
   else return true;
   */
  return true;
}

void AddStars(int bufferWritePosition, int depth, String Line ) {
  // can only add stars but can not remove previous stars.
  // Good tool to add stars to an existing letter without 
  // removing existing stars. 
  for (int i = 0; i < Line.length(); i = i+1) {
    // if buffer[bufferWritePosition][depth] 
    if (Line.charAt(i) == '*') {
      // buffer[bufferWritePosition][depth].setCharAt(i, "*");
      //println("before " + buffer[bufferWritePosition][depth] ) ;
      buffer[bufferWritePosition][depth] = ReplaceCharAt ( buffer[bufferWritePosition][depth], '*', i );
      //println("after " + buffer[bufferWritePosition][depth] ) ;      
    }
  }

} // func 

String ReplaceCharAt(String Word, char ReplacingLetter, int AtPos ) {        
  // Replace a Char At A Position.
  // "Word" is the word in which we replace.     
  // "ReplacingLetter" is the letter we insert at Position "AtPos". 
  // Crashes when AtPos is bigger than length of Word. 
  // Using a StringBuffer to make use of the convenient setCharAt-command.
  StringBuffer StringBufferName = new StringBuffer(Word);
  // replace 
  StringBufferName.setCharAt( AtPos, ReplacingLetter );    
  // back from StringBuffer to String 
  return (StringBufferName.toString());
} // func

























