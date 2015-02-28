
int LENGTH = 3;
  String BASE_FILENAME = "sample";
Sample[] sounds = new Sample[LENGTH];

PImage pauseIcon;
PImage playIcon;
int offset = 600;
int[] sliderY = new int[LENGTH];

void setup() {
  size(1600,1200);
  println(this);
  //This is a for loop that load the 3 samples and initialises the status to 0 .
  for(int i=0; i < LENGTH; i++) {
  
      String file = BASE_FILENAME + String.valueOf(i) + ".wav";
      Movie sound = new Movie (this,file);
      sounds[i] = new Sample(sound);
      sliderY[i] = 365;
  }
  // here load the pause and play icons 
  println("we are done");
  playIcon = loadImage("play.png");
  pauseIcon = loadImage("pause.png");
  colorMode(RGB, 100);
}

void draw() {
   background(0);
   noStroke();
   drawInterface();
}
// draw ALL the buttons and the sliders for each sound - spacing icons and on off button
void drawInterface() {
  for(int i=0; i < LENGTH; i++) {
    int x = i*140 + offset;
    int y = offset;
    drawButton(i,x,y);
    drawSlider(i,x,y);
   }
}
//differciaion of the buttons
void drawButton(int index, int x, int y) {
    if(sounds[index].getStatus() == 1) {
       fill(25,255,25,60);
       rect(x,y,101,101);
       image(pauseIcon,x,y);
    }
    else {
      fill(255,25,25,60);
      rect(x,y,101,101);
      image(playIcon,x,y);
    }
}

void mouseDragged(){
//  if(mouseX >= x && mouseX <= x+rectW && mouseY>= y && mouseY<=Y+rectH){

  for(int i=0; i < LENGTH; i++) {
    if(mouseX >= (offset+20+140*i) && mouseX <= (offset+80+140*i) ) {
      println(mouseX);
      println(i);
      sliderY[i]= mouseY;
      sliderY[i] = constrain(sliderY[i],200,530);
      //change
      
      float speed = map(sliderY[i],200,530,0.0,2.0);
       sounds[i].changeSpeed(speed);
      
    }
  }   
}

void drawSlider(int index, int x, int y) {
  //stroke(255,0,0,100);
  
  fill(125,125,125,65);
  rect(x+20,y-400,60,360);
  
  //draw the slider button
  fill(255,0,0,60);
  rect(x+20,sliderY[index],60,30);
}


void drawIcon(int index, int status) {
  
}
void mousePressed() {
  
//  if(mouseX >= offset && mouseX <= (140+offset) && mouseY >= offset && mouseY <= offset+101) {
//    toggleSound(0);
//  }
//  else if(mouseX >= offset && mouseX <= (140*2+offset) && mouseY >= offset && mouseY <= offset+101) {
//    toggleSound(1);
//  }
//   else if(mouseX >= offset && mouseX <= (140*3+offset) && mouseY >= offset && mouseY <= offset+101) {
//    toggleSound(2);
//  }
}

void keyPressed() {
   if(key == 'f')
     toggleSound(0);
    else if(key == 'g') {
      toggleSound(1);
    }
    else if(key == 'h') {
      toggleSound(2);
    }
}

//This funtion toggle the sound on and off depending on the status 
void toggleSound(int index) {
  sounds[index].toggleSound();
}

import processing.video.*;
public class Sample
{
  int status;
  Movie sound;
  
  
  public Sample(Movie sound) {
    this.sound = sound;
    status = 0;
  }
  
  public void changeSpeed(float speed) {
     sound.speed(speed);
  }
  
  public void toggleSound() {
    if(status == 0) {
      stopSound();
    }
    else {
      playSound();
    }
  }
  public int getStatus() {
    return status;
  }
  
  protected void stopSound() {
      status = 1;
      sound.stop();
      sound.loop();
  }
  
  protected void playSound() {
      status =  0;
      sound.stop();
  }
}


