
//***2014 FULL PARSONS MEDIA STUDY COLLAB: EXPERIMENTAL SPACE
//  CREATED BY SHU YU LIN 
//  THANKS TO SOOHYUN PARK***//

/*Based on a single line of text to create 
//a communication between brain and body. */

PFont Title;

import processing.video.*;
Capture cam;
String name = "";
int numPic = 0;
PImage pic;
PImage bg0, bg1, bg2, bg3, bg4, bg5;
int value = 0;
int numPoem = 0;
boolean defaultMode = true;
boolean picMode = false;
//boolean showMode = false;

//*COUNTDOWN*//
int countDown = 10;
int time = 0;
int timer = 0;

//*poem*//
String [] poem_1 = {
  "What happens to a dream deferred?", 
  "Does it dry up like a raisin in the sun?", 
  "Or fester like a sore-", 
  "And then run?",
  "Does it stink like rotten meat?",
  "Or crust and sugar over- like a syrupy sweet?",
  "Maybe it just sags like a heavy load",
  "Or does it explode?",
};
String linePoem = "";

PImage [] bgArray = new PImage [6];

void setup() {
  frameRate(60);
  size(420, 700);
  background(0);
  noStroke();
  smooth();
  imageMode(CORNER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  Title = createFont("Georgia", 50, true);
  
  //BACKGROUND IMAGE LOOP
  for(int j = 0; j < bgArray.length; j++){
      bgArray[j] = loadImage("bg" + j + ".JPG");
    }
  //CAMERA SETTING
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
//  cam = new Capture(this, displayWidth/2, displayHeight/2);
  // Start capturing the images from the camera
  cam.start();
}

void draw() {
  if (cam.available() == true){
//    imageMode(CORNER);
    cam.read();
    pushMatrix();
    scale(-1, 1);
    image(cam.get(), width/2, height/2);
    popMatrix();
  }
  if (picMode == true){
      if(numPoem < 8){
        linePoem = poem_1 [numPoem];
        println(numPoem + "/ " + linePoem);
      }else{
        println("running out off lines");
      }
      fill(255);
      rect(width/2, height/2 + 200, 300, 50);
      fill(5, 3, 6);
      textSize(18);
      text(linePoem, width/2, height/2 + 200);
      
      /*AFTER 3 SECS TAKE A PIC*/
      if (countDown - time/60 == -1) {
        time = 0;
        name = "img" +numPic + ".bmp";
        saveFrame(name);
        numPic++;
        picMode = false;
      }else {
        textSize(60);
        if (countDown - time/60 != 0){
          fill(232, 80, 72, 80);
          text(countDown - time/60, width/2, height/2);
        }
        time++;
      }
    }
  /*PUT OUT PIC*/
  if (numPic > 0 && picMode == false) {
    pic = loadImage(name);
//    imageMode(CENTER);
    image(pic, width/2, height/2);
  }
  /*GO BACK TO DEFAULT MODE*/
  if (mousePressed 
      && (mouseButton == LEFT) 
        && (defaultMode == false) 
          && (picMode == false)){
    defaultMode = true;
    numPoem++;
    value = 0;
  }

  if (defaultMode == true && picMode == false) {
    background(0);
    imageMode(CENTER);
    
    if(timer == 0){
      image(bgArray[0],width/2, height/2);
      delay(1000);
      timer++;
    }else if(timer == 1){
      image(bgArray[1],width/2, height/2);
      delay(1000);
      timer++;
    }else if(timer == 2){
      image(bgArray[2],width/2, height/2);
      delay(1000);
      timer++;
    }else if(timer == 3){
      image(bgArray[3],width/2, height/2);
      delay(1000);
      timer++;
    }else if(timer == 4){
      image(bgArray[4],width/2, height/2);
      delay(1000);
      timer++;
    }else if(timer == 5){
      image(bgArray[5],width/2, height/2);
      delay(1000);
      timer = 0;
    }
    textFont(Title);
    fill(232, 80, 72);
    text("Kinetic \n Verse ", width/2, height/2);
    
  } 
}

void keyReleased() {
  if (value == 0) {
    defaultMode = false;
    println("start picMode");
    picMode = true;
    value = 1;
  }else {
    value = 0;
  }
}



