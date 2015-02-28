
//Mani Nilchiani
//N00208257

import gifAnimation.*; //we need this library to handle animated gif

PImage[] animation;
Gif msPacman; //Declare Ms. Pacman
boolean pause = false; //no pauses!
float msPacmanX; //X coordinate of Ms. Pacman
float msPacmanY; //Y coordinate of Ms. Pacman
float leftEyeXPos; //X coordinate of Monster's left eye
float leftEyeYPos; //Y coordinate of Monster's left eye
float rightEyeXPos; //X coordinate of Monster's right eye
float rightEyeYPos; //Y coordinate of Monster's left eye
int monsterX = 250;
int monsterY = 250;

void setup(){
  size(1024,768);
  background(#ffffff);
  smooth();
  msPacman = new Gif(this,"pacman.gif");
  msPacman.loop();
  msPacmanX = random(width-50);
  msPacmanY = random(height-50); 
}



void draw(){
  background(255);
  fill(#D5372F);
  rect(40,height-70,100,30);
  PFont font;
  font = loadFont("04b03-15.vlw");
  textFont(font,15);
  fill(#ffffff);
  text("Ms. Pacman",50,height-50);
  fill(#D5372F);
  text("Use the arrow keys", 150, height-50);
  PShape monster;
  monster = loadShape("monster.svg");
  noStroke();
  if(!mousePressed){
    leftEyeXPos = map(mouseX,0,width,50+monsterX,150+monsterX);
    leftEyeYPos = map(mouseY,0,height,monsterY+72,monsterY+150);
    rightEyeXPos = map(mouseX,0,width,175+monsterX,275+monsterX);
    rightEyeYPos = map(mouseY,0,height,monsterY+72,monsterY+150);
  } else {
    leftEyeXPos = map(msPacmanX,0,width,50+monsterX,150+monsterX);
    leftEyeYPos = map(msPacmanY,0,height,monsterY+72,monsterY+150);
    rightEyeXPos = map(msPacmanX,0,width,175+monsterX,275+monsterX);
    rightEyeYPos = map(msPacmanY,0,height,monsterY+72,monsterY+150);
  }
  fill(#6687ff);
  rect(leftEyeXPos,leftEyeYPos,40,40);
  rect(rightEyeXPos,rightEyeYPos,40,40);
  shape(monster, monsterX,monsterY,350,350);
  if(mousePressed && mouseX > 40 && mouseX < 140 && mouseY > 698 && mouseY < 728){
    //background(#ff0033);
    image(msPacman,msPacmanX,msPacmanY);
  }
  }

  
  
void keyPressed(){
  if(keyCode == RIGHT){
    monsterX += 10;
  }
  if(keyCode == LEFT){
    monsterX -= 10;
  }
  if(keyCode == UP){
    monsterY -= 10;
  }
  if(keyCode == DOWN){
    monsterY += 10;
  }
}

void mouseReleased(){
  msPacmanX = random(width);
  msPacmanY = random(height);
}

