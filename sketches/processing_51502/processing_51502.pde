
/*****************************************
 * Assignment #2
 * Name:         Amanda Guadalupe
 * E-mail:       aguadalupe@brynmawr.edu
 * Course:       CS 110 - Section #2
 * Submitted:    2-7-2012
 * 
 * This is an interactive simulation of the old super mario game! When you click the sky, the clouds with 
 eyes will appear. When you click from the horizon and towards the corners
 bomboms (the bombs with eyes in the game) will apear closer and far away, giving the 
 illusion of perspective. When you press "c" coins will appear above the question mark box.
 When you press "m" mario will appear and say something! Music will also appear when you press
 "s" !!
 
 ***********************************************/



import ddf.minim.*; //importing music files using Minim
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int horizonY = 350;
PImage img;
Minim minim;
AudioSample supermario;
AudioSample mariocoin;
AudioSample mariomusic;


void setup() {
  size(600, 600);
  smooth();
  noStroke();
  background(108, 207, 255); //sky
  fill(184, 91, 7);
  rect(0, 350, 600, 600); //ground
  img = loadImage("mario.png"); //pixel picture of mario

  //mario game sound setup
  minim = new Minim(this);
  supermario = minim.loadSample("sm64_memario.wav");
  mariocoin = minim.loadSample("smw_coin.wav");
  mariomusic = minim.loadSample("smb-overworld.mp3"); //makes the program start a bit delayed, but the program will start, just wait a bit!


  //horizon
  line(0, horizonY, 600, horizonY);


  //hills
  noStroke();
  fill(61, 217, 15);
  curve(240, 230, 242, 50, 359, 50, 367, 228);
  rect(242, 50, 117, 300);
  curve(340, 530, 432, 157, 552, 157, 503, 374);
  rect(432, 157, 120, 193);

  //hill eyes
  noStroke();
  fill(0);
  ellipse(280, 100, 10, 30);
  ellipse(320, 100, 10, 30);
  ellipse(470, 170, 10, 30);
  ellipse(515, 170, 10, 30);

  //mario coin block up close
  stroke(10);
  smooth();
  fill(253, 154, 6);
  rect(30, 305, 115, 115);
  noStroke();
  fill(162, 98, 2);
  rect(35, 310, 105, 105);
  fill(0);
  rect(78, 395, 15, 15); //starts the question mark
  rect(78, 375, 15, 15);
  rect(88, 365, 15, 15);
  rect(99, 355, 15, 15);
  rect(105, 345, 15, 15);
  rect(105, 335, 15, 15);
  rect(96, 325, 15, 15);
  rect(83, 325, 15, 15);
  rect(70, 325, 15, 15);
  rect(58, 335, 15, 15);
}


void draw() {
}

void mousePressed() {
  if (mouseY < horizonY ) { 
    float scal = (mouseY - horizonY)*.3; //scales the clouds
    noStroke();
    smooth();
    fill(255);
    ellipse(mouseX, mouseY, 2*scal, 1*scal); //clouds
    fill(0);
    ellipse(mouseX - .10*scal, mouseY, .1*scal, .2*scal); //cloud's right eye
    ellipse(mouseX +.5*scal, mouseY, .1*scal, .2*scal);   // cloud's left eye
  }

  if (mouseY > horizonY) {
    float bombom = (horizonY - mouseY)*.3; //bombs being placed further away towards the horizon
    fill(0);
    ellipse(mouseX, mouseY, bombom, bombom); //bombom!
    fill(255);
    float bomeye = (horizonY - mouseY)*.3;
    ellipse(mouseX-.40*bomeye, mouseY, .1*bomeye, .2*bomeye); //bomb eyes
    ellipse(mouseX-.10*bomeye, mouseY, .1*bomeye, .2*bomeye); //bomb eyes
  }
}

void keyPressed() {

  if (keyCode == 77) {
    supermario.trigger(); //when you press "m" mario says "it's a me! mario!"
  }

  if (key == 'c') {
    mariocoin.trigger(); //when you press "c" the coin sound effect comes out with the coin
  }

  if (key == 's') {
    mariomusic.trigger();// when you  press "s" mario's theme song will appear
  }




  if (keyCode == 77) { //when you press "m" the pixel image of mario pops up along with the sound
    image(img, 200, 300);
    fill(0);
    textSize(30 );
    text("wahoo!!", 450, 250); //what mario is saying
  }

  if (key == 'c') { //coins
    for (int i = 0; i <=2; i++) { //coins will appear above the coin question mark box
      stroke(6);
      smooth();
      fill(226, 176, 5);
      ellipse(95, 50+i*100, 50, 80);
    }
  }
}


