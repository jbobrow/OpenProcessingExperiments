
/*

ALPHA BLOG VERSION 

*/


import processing.opengl.*;
import processing.video.*;
import pitaru.sonia_v2_9.*;

Sample player;


Capture video;
PImage prevFrame;

float threshold = 50;

void setup() {
  size( 1024, 768, OPENGL );

  font = loadFont ( "Gulim-48.vlw" );

  video = new Capture(this, 320, 280, 15);
  prevFrame = createImage(video.width, video.height, RGB);

  Sonia.start(this);
  player = new Sample("introscreen.wav");

  attackerX = 0;
  princessX = 1600;

  cam     = new PanningOrthoCamera();
  loadImages();
}

void draw() {  
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  background(blankScreen);

  cam.beginFrame();

  if ( state == start_screen ) {
    introControls();
  }

  else if ( state == play_screen ) {

    display(); 
    attackerMovement();
    princessController();
    image( screen5, 1600+312, windowH/2 );

    if ( princessX >= attackerXMove-130 ) {
      princessX = princessX;
      attackerXMove = attackerXMove;
      controlToggle = false;
      cam.updateXY( 0, 0 );
      displayLoser();
      elapsedTime = 30;
      if ( ( millis() - introTimer ) >= 5000 ) { 
        introTimer = millis();
        tintTimer = 1000;
        z = 255;
        introState = 8;
        state = start_screen;
      }
    }

    if ( elapsedTime  <= 0 ) {
      princessX = princessX;
      attackerXMove = attackerXMove;
      controlToggle = false;
      cam.updateXY( 0, 0 );
      displayWinner();
      if ( ( millis() - tintTimer ) >= 4000 ) {
        introTimer = millis();
        tintTimer = 1000;
        z = 255;
        elapsedTime = 30;
        introState = 1;
        state = start_screen;
      }
    }
  }
}


