
//Dan Sztanga
//dan.sztanga@gmail.coM
//(C) 2012 Pittsburgh, PA
//DS_808 Drum Sequencer
//Thank you trashaudio.com for the TR-808 samples!

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
Button[][] grid;
 
int columns = 16;
int rows = 8;
float buttonW = 30;
float buttonH = 30;

int startTime;

//function of BPM and milliseconds
// (60000/tempo) = BMP
int tempo = 500;

float timer;
int step = 0;
boolean play;
   
void setup(){
  size(720, 390);
  
  minim = new Minim(this);
  
  //"newing" the object
  grid = new Button[columns][rows];
  
  //initializes grid
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      translate(50, 0);
      grid[i][j] = new Button(i * 40, j * 40, buttonW, buttonH);
    }
  }
  
  //loads samples
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j].loadSamples(j);
    }
  }
  
}
 
void draw(){
  background(255);
  logo();
  //labels each row with drum sample
  labels();
  
  
  translate(75, 5);
  drawButton();
  playSequence();
}

void logo(){
  pushStyle();
  fill(0);
  textSize(36);
  text("DS_", 10, 380);
  textSize(24);
  text("808 drum sequencer", 80, 380);
  textSize(12);
  textAlign(RIGHT);
  text("enable/disable note | MOUSE", 710, 350);
  text("clear notes |  SPACE", 710, 365);
  text("play/stop | ENTER", 710, 380);
  
  
  popStyle();
}

void labels(){
  pushStyle();
  fill(0);
  textSize(12);
  textAlign(RIGHT);
  text("Crash", 70, 30);
  text("Ride", 70, 70);
  text("Open Hat", 70, 110);
  text("Closed Hat", 70, 150);
  text("Tom One", 70, 190);
  text("Tom Two", 70, 230);
  text("Snare", 70, 270);
  text("Bass", 70, 310);
  popStyle();
}

void drawButton(){
 for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j].colorFill(0);
    }
  } 
}

//plays the pattern
void playSequence(){
  if (play == true){
    timer = (millis() - startTime);
    if (timer > tempo){
      if (step < columns){
        println(step);
        for (int j = 0; j < rows; j++){
          grid[step][j].colorFill(120);
          grid[step][j].trigger(step, j);
        }
        step++;
      } else {
        step = 0;
      }
      startTime = millis();            
    }
  }
}

   
void mousePressed(){
  if ((int(mouseX) / (buttonW + 85)) < columns && (int(mouseY) / (buttonH + 15)) < rows){
    int clickedX = int((mouseX - 75) / (buttonW + 10));
    int clickedY = int((mouseY - 5) / (buttonH + 10));
    grid[clickedX][clickedY].pressed();
    println(clickedX + ", " + clickedY);
  } else {
    //stops NullPointerException
  }
}

void keyPressed(){
  if (key == ' '){
    println("CLEAR");
    for (int i = 0; i < columns; i++){
      for (int j = 0; j < rows; j++){
        grid[i][j].clear();
      }
    }
  }
  if (key == ENTER || key == RETURN){
    startTime = millis();
    step = 0;
    if (play == true){
      play = false;
      println("STOP");
    } else {
      play = true;
      println("PLAY");
    }
  }
}

