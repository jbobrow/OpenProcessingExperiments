
/* @pjs font="Montaga-Regular.ttf" */

int myState=0;
int x=0;
int directionx=0;
int directiony=200;
PFont mont;
PImage myBackground;
PImage spriteR;
PImage spriteL;

void setup() {
  size(1260, 264);
  mont=createFont("Montaga-Regular.ttf", 50);
  textFont(mont);
  myBackground=loadImage("8bit-backdrop.png");
  spriteR=loadImage("spriteR.png");
  spriteL=loadImage("spriteL.png");
  noStroke();
}

void draw() {
  image(myBackground, 0, 0);
  
  switch(myState) {
    
    case 0:
      fill(0);
      textSize(20);
      text("Controls:", 80, 30);
      textSize(15);
      text("Press the right arrow to move right", 170, 30);
      text("Press the left arrow to move left", 170, 50);
      text("Press the up arrow to move up", 170, 70);
      text("Press the down arrow to move down", 170, 90);
      image(spriteR, directionx, 200);
      break; 
      
    case 1:
      image(spriteR, directionx, directiony);
      break;
      
    case 2:
      image(spriteL, directionx, directiony);
      break;
      
    case 3:
      image(spriteR, directionx, directiony);
      break;
      
    case 4:
      image(spriteL, directionx, directiony);
      break;  
 }
}

void keyPressed() {
  println(keyCode);
  
  if(key==CODED) {
    if (keyCode==RIGHT) {
      println("Right");
      directionx=directionx+1;
    }
     if (keyCode==LEFT) {
      println("Left");
      directionx=directionx-1;
    }
    if (keyCode==UP) {
      println("Up");
      directiony=directiony-1;

    }
    if (keyCode==DOWN) {
      println("Down");
      directiony=directiony+1;
    }
  }
  switch(keyCode) {
    
    case 38:
    myState=3;
    break;
    
    case 39:
    myState=1;
    break;
    
    case 40:
    myState=4;
    break;
    
    case 37:
    myState=2;
    break;
  }
}
  


