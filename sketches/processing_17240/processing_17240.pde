
/* Jungle phone by Cecile van der Waal
   Make your own jungle sound by pressing the numbers 1-9 on the mobile phone
   The sound repeats itself until u press the same button again
   Enjoy!*/

import ddf.minim.*; 
Minim minim; 
AudioPlayer [] sounds = new AudioPlayer[9]; 
int sound0=0, sound1=0, sound2=0, sound3=0, sound4=0, sound5=0, sound6=0, sound7=0, sound8=0; 
int mouse_x, mouse_y;
int start0, start1, start2, start3, start4, start5, start6, start7, start8;
PImage bg;

void setup() {
  size (312,600);
  frameRate(400);
  smooth();
  bg = loadImage("phone.jpg");
  minim = new Minim(this);
  //load the sounds
  sounds[0] = minim.loadFile ( "bird.wav", 2048);
  sounds[1] = minim.loadFile ( "elephant.wav", 2048);
  sounds[2] = minim.loadFile ( "frog.wav", 2048);
  sounds[3] = minim.loadFile ( "insect.wav", 2048);
  sounds[4] = minim.loadFile ( "jungle_drum.wav", 2048);
  sounds[5] = minim.loadFile ( "rain.WAV", 2048);
  sounds[6] = minim.loadFile ( "lion.wav", 2048);
  sounds[7] = minim.loadFile ( "monkey.wav", 2048);
  sounds[8] = minim.loadFile ( "parrot.wav", 2048);
} // end of void setup

void mouseReleased() {
  //check on which position the mouse is
  if (mouse_x==1 && mouse_y==1) {
    if (sound0==1)  sound0=0;
    else sound0=1;
  }


  if (mouse_x==1 && mouse_y==2) {
    if (sound1==1)  sound1=0;
    else sound1=1;
  }

 
  if (mouse_x==1 && mouse_y==3) {
    if (sound2==1)  sound2=0;
    else sound2=1;
  }

 
  if (mouse_x==2 && mouse_y==1) {
    if (sound3==1)  sound3=0;
    else sound3=1;
  }
  

  if (mouse_x==2 && mouse_y==2) {
    if (sound4==1)  sound4=0;
    else sound4=1;
  }
  

  if (mouse_x==2 && mouse_y==3) {
    if (sound5==1)  sound5=0;
    else sound5=1;
  }
  

  if (mouse_x==3 && mouse_y==1) {
    if (sound6==1)  sound6=0;
    else sound6=1;
  }
  

  if (mouse_x==3 && mouse_y==2) {
    if (sound7==1)  sound7=0;
    else sound7=1;
  }
  

  if (mouse_x==3 && mouse_y==3) {
    if (sound8==1)  sound8=0;
    else sound8=1;
  }
} // end of void mouseReleased

void draw() {
  background(bg);
  noStroke();
  //the color changes when the sound is 'on'
  if (sound0==1) {
    fill(255,255,0);
  }
  else {
    fill(245,70,255,50);
  }
  rect (35,305,77,70); //sound0
 
  if (sound1==1) {
    fill(162,162,156);
  }
  else {
    fill(245,70,255,50);
  }
  rect (35,378,77,70); //sound1
 
  if (sound2==1) {
    fill(6,188,34);
  }
  else {
    fill(245,70,255,50);
  }
  rect (35,445,77,70); //sound2
  
  if (sound3==1) {
    fill(92,255,0);
  }
  else {
    fill(245,70,255,50);
  }
  rect (115,305,77,70); //sound3
 
  if (sound4==1) {
    fill(134,91,0);
  }
  else {
    fill(245,70,255,50);
  }
  rect (115,378,77,70); //sound4
 
  if (sound5==1) {
    fill(0,27,255);
  }
  else {
    fill(245,70,255,50);
  }
  rect (115,445,77,70); //sound5
 
  if (sound6==1) {
    fill(255,5,5);
  }
  else {
    fill(245,70,255,50);
  }
  rect (195,305,77,70); //sound6
 
  if (sound7==1) {
    fill(170,120,27);
  }
  else {
    fill(245,70,255,50);
  }
  rect (195,378,77,70); //sound7
 
  if (sound8==1) {
    fill(255,0,255);
  }
  else {
    fill(245,70,255,50);
  }
  rect (195,445,77,70); //sound8

  //x_position of the mouse
  if (mouseX>0) { 
    mouse_x = 0;
  }
  if (mouseX>35) { 
    mouse_x = 1;
  }
  if (mouseX>115) { 
    mouse_x = 2;
  }
  if (mouseX>195) {
    mouse_x = 3;
  }
   if (mouseX>275) {
    mouse_x = 0;
  }
  //y_position of the mouse
  if (mouseY>0) { 
    mouse_y = 0;
  }
  if (mouseY>305) { 
    mouse_y = 1;
  }
  if (mouseY>378) { 
    mouse_y = 2;
  }
  if (mouseY>445) {
    mouse_y = 3;
  }
  if (mouseY>515) {
    mouse_y = 0;
  }

  //the sound plays when the button is pressed
  if (sound0==1) {
    sounds[0].play();
  
    if( (millis() - start0) > 2000) {
      start0 = millis();
      sounds[0].rewind();
    }
  }
  if (sound1==1) {
    sounds[1].play();

    if( (millis() - start1) > 2400) {
      start1 = millis();
      sounds[1].rewind();
    }
  }
  if (sound2==1) {
    sounds[2].play();

    if( (millis() - start2) > 2000) {
      start2 = millis();
      sounds[2].rewind();
    }
  }
  if (sound3==1) {
    sounds[3].play();

    if( (millis() - start3) > 2200) {
      start3 = millis();
      sounds[3].rewind();
    }
  }
  if (sound4==1) {
    sounds[4].play();

    if( (millis() - start4) > 3000) {
      start4 = millis();
      sounds[4].rewind();
    }
  }
  if (sound5==1) {
    sounds[5].play();

    if( (millis() - start5) > 2500) {
      start5 = millis();
      sounds[5].rewind();
    }
  }
  if (sound6==1) {
    sounds[6].play();

    if( (millis() - start6) > 2500) {
      start6 = millis();
      sounds[6].rewind();
    }
  }
  if (sound7==1) {
    sounds[7].play();

    if( (millis() - start7) > 2500) {
      start7 = millis();
      sounds[7].rewind();
    }
  }
  if (sound8==1) {
    sounds[8].play();

    if( (millis() - start8) > 1800) {
      start8 = millis();
      sounds[8].rewind();
    }
  }
} //end of void draw

void stop() {
  for (int i = 0; i<sounds.length ; i++) {
    sounds[i].close();
  }
  
  minim.stop();
  super.stop();
} //end of void stop


