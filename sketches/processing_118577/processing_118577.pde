
/* @pjs font = "CETIMES.ttf"; preload = "Background.jpg"; "Score.jpg"; */

int myState=0;
int x=0;
int rightleft=10;
int updown=30;
PFont myFont;
PImage Background;
PImage Score;

 
void setup() {
  size(720, 526);
  myFont=createFont("CETIMES.ttf");
  textFont(myFont, 20);
  Background=loadImage("Background.jpg");
  Score = loadImage("Score.jpg");
  noStroke();
}
 
void draw() {
  image(Background, 0, 0);
   
  switch(myState) {
     
    case 0:
      text("Use the arrow keys to shelve the score in the correct place", 170, 20);
      image(Score, 10, 30);
      break;
       
    case 1:
      text("Use the arrow keys to shelve the score in the correct place", 170, 20);
      image(Score, rightleft, updown);
      break;
       
    case 2:
      text("Use the arrow keys to shelve the score in the correct place", 170, 20);
      image(Score, rightleft, updown);
      break;
       
    case 3:
      text("Use the arrow keys to shelve the score in the correct place", 170, 20);
      image(Score, rightleft, updown);
      break;
       
    case 4:
      text("Use the arrow keys to shelve the score in the correct place", 170, 20);
      image(Score, rightleft, updown);
      break; 
 }
}
 
void keyPressed() {
   
  if(key==CODED) {
    if (keyCode==RIGHT) {
      rightleft=rightleft + 5;
    }
     if (keyCode==LEFT) {
      rightleft=rightleft - 5;
    }
    if (keyCode==UP) {
      updown=updown - 5;
 
    }
    if (keyCode==DOWN) {
      updown=updown + 5;
    }
  }
  
  switch(keyCode) {
     
    case 37:
    myState=1;
    break;

    case 38:
    myState=2;
    break;
     
    case 39:
    myState=3;
    break;
     
    case 40:
    myState=4;
    break;
  }
}



