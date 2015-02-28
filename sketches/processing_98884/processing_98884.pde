
// Joseph Oak joak
// Joseph Oak © 2013
// Final Project 2: Video Props
// Press 'a' to toggle between eye-Wear
// Press 's' to turn moustache on and off
// Press ENTER to turn this message on and off

import hypermedia.video.*;
import java.awt.Rectangle;

PImage picture, picture2, picture3, picture4, picture5, displayed, displayed2;
int j, mButton, mButton2;
String message1, message2, message3;

OpenCV opencv;

void setup() {

    size(480,360);
    opencv = new OpenCV(this);
    opencv.capture(width, height);
    opencv.cascade(OpenCV.CASCADE_FRONTALFACE_DEFAULT);
    j = 1;
    mButton = 0;
    mButton2 = 0;
  
    picture = loadImage("data/moustache.png");
    picture2 = loadImage("data/monocle.png");
    picture3 = loadImage("data/glasses.png");
    picture4 = loadImage("data/hearts.png");
    picture5 = loadImage("data/empty.png");
    
}

void draw() {
    
    opencv.read();
    imageMode(CORNER);
    image( opencv.image(), 0, 0 );
    
    Rectangle[] faces = opencv.detect();
    
    for( int i=0; i<faces.length; i++ ) {
      
        int faceX = faces[i].x;
        int faceY = faces[i].y;
        int faceW = faces[i].width;
        int faceH = faces[i].height;
        
        imageMode(CENTER);
        
        if (j == 1) {
          displayed = picture5;
        } else if (j == 2) {
          displayed = picture2;
        } else if (j == 3) {
          displayed = picture3;
        } else if (j == 4) {
          displayed = picture4;
        }
        
        image( displayed, faceX + (faceW*.5), faceY + (faceH*.41), faceW/1.125, faceH/2.25);
        
        if (mButton == 1) {
          displayed2 = picture;
        } else if (mButton == 0) {
          displayed2 = picture5;
        }
        
        image( displayed2, faceX + (faceW*.5), faceY + (faceH*.75), faceW/1.25, faceH/2.5);
        
        if (mButton2 == 0) {
          message1 = "Press 'a' to toggle between eye-Wear";
          message2 = "Press 's' to turn moustache on and off";
          message3 = "Press ENTER to turn this message on and off";
        } else if (mButton2 == 1) {
          message1 = " ";
          message2 = " ";
          message3 = " ";
        }
        
        fill(255);
        textAlign(CENTER, CENTER);
        text(message1, width/2, height*.05);
        text(message2, width/2, height*.1);
        text(message3, width/2, height*.15);
        
    }
}

void keyPressed() {
  
  if (key == 'a') {
    if (j < 4) {
      j++;
    } else {
      j = 1;
    }
  }
  
  if (key == 's') {
    if (mButton == 0) {
      mButton += 1;
    } else if (mButton == 1) {
      mButton -= 1;
    }
  }
  
  if (key == ENTER) {
    if (mButton2 == 0) {
      mButton2 += 1;
    } else if (mButton2 == 1) {
      mButton2 -= 1;
    }
  }
  
}

