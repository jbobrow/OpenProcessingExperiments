
/*
Inspired by:
"DA Traditional Etch-a-sketch" by Liviu-Stefan Luca, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
 Work: http://openprocessing.org/visuals/?visualID= 76553
 License:
 http://creativecommons.org/licenses/by-sa/3.0/
 http://creativecommons.org/licenses/GPL/2.0/
 
 Removed functionality to make it really simple
 added colors
 changed drawing calculations
 */
int cursorX = 200;
int cursorY = 100;
int cursorWidth = 1;
int cursorLength = 1;
int speed = 1, j;
boolean[] keyDown = new boolean[4];
void setup() {
  background (162, 181, 205);
  size(400, 300);
}

void draw() {
  //Going right
  if (keyDown[0]==true && keyDown[1]==false && keyDown[2]==false && keyDown[3]==false )
    for (j=1; j<=speed; j++) {
      if (cursorX-1<0) break;
      cursorX = cursorX-1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going left 
  if (keyDown[1]==true && keyDown[0]==false && keyDown[2]==false && keyDown[3]==false )
    for (j=1; j<=speed; j++) { 
      if (cursorX+1>398) break;
      cursorX = cursorX+1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going up 
  if (keyDown[2]==true && keyDown[1]==false && keyDown[0]==false && keyDown[3]==false)
    for (j=1; j<=speed; j++) {
      if (cursorY-1<0) break;
      cursorY = cursorY-1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going down 
  if (keyDown[3]==true && keyDown[1]==false && keyDown[2]==false && keyDown[0]==false)
    for (j=1; j<=speed; j++) {
      if (cursorY+1>298) break;
      cursorY = cursorY+1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going NE
  if (keyDown[0]==true && keyDown[1]==false && keyDown[2]==true && keyDown[3]==false) 
    for (j=1; j<=speed; j++) {
      if (cursorX-1<0 || cursorY-1<0) break;
      cursorX = cursorX-1;
      cursorY = cursorY-1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going NW
  if (keyDown[1]==true && keyDown[0]==false && keyDown[2]==true && keyDown[3]==false) 
    for (j=1; j<=speed; j++) {
      if (cursorX+1>398 || cursorY-1<0) break;
      cursorX = cursorX+1;
      cursorY = cursorY-1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going SE
  if (keyDown[0]==true && keyDown[1]==false && keyDown[3]==true && keyDown[2]==false)
    for (j=1; j<=speed; j++) {
      if (cursorX-1<0 || cursorY+1>298) break;
      cursorX = cursorX-1;
      cursorY = cursorY+1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }

  //Going SW
  if (keyDown[1]==true && keyDown[0]==false && keyDown[3]==true && keyDown[2]==false)
    for (j=1; j<=speed; j++) {
      if (cursorX+1>398 || cursorY+1>298) break;
      cursorX = cursorX+1;
      cursorY = cursorY+1;
      rect(cursorX, cursorY, cursorLength, cursorWidth);
    }
}

void keyPressed() {
  if (key == 'a') {
    keyDown[0]=true;
  }  
  if (key == 'd') {
    keyDown[1]=true;
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      keyDown[3]=true;
    }
    else
      if (keyCode == RIGHT) {
        keyDown[2]=true;
      }
  }
}

void keyReleased() {

  if (key == 'a') keyDown[0]=false;
  if (key == 'd') keyDown[1]=false;
  if (key == CODED) {
    if (keyCode == LEFT) {
      keyDown[3]=false;
    }
    else
      if (keyCode == RIGHT) {
        keyDown[2]=false;
      }
  }

  //Clearing screen 
  if (key == 127) {
    background (162, 181, 205) ;
  }
  //red stroke
  if (key == 'r') {
    stroke (225, 0, 0) ;
  }
  //green stroke
  if (key == 'g') {
    stroke (0, 225, 0) ;
  }
  //blue stroke
  if (key == 'b') {
    stroke (0, 0, 225) ;
  }
  //yellow stroke
  if (key == 'y') {
    stroke (225, 225, 0) ;
  }
  //purple stroke
  if (key == 'p') {
    stroke (225, 0, 255) ;
  }
  //cyan stroke
  if (key == 'c') {
    stroke (0, 225, 255) ;
  }
  //white stroke
  if (key == 'w') {
    stroke (225, 225, 255) ;
  }
  //black stroke
  if (key == 's') {
    stroke (0, 0, 0) ;
  }
}



