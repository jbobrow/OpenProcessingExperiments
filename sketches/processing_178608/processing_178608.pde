
int page = 0;
PImage []imgL = new PImage[8];
PImage []imgR = new PImage[8];
PImage imgVs;
PImage imgPlay;
color colorTintLeft = color(255);
color colorTintRight = color(255);
color colorNormal = color(255);
color colorOver = color(247, 147, 197);
color colorPress = color(250, 124, 132);
float imgX, imgY;

boolean isBtnPressed = false;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;

void setup() {
  size(1000, 600);
  for (int i=0; i<8; i++) {
    imgL[i] = loadImage("imgL_"+i+".png"); 
    // for example, imgL_0.png
    imgR[i] = loadImage("imgR_"+i+".png"); 
    // for example, imgR_7.png
  }
  imageMode(CENTER);
  imgVs = loadImage("imgV_0.png");
  imgPlay = loadImage("play_button.png");
}

void draw() {
  background(255);
  drawPage(page);
}

void goNextPage() {
  if (page<8) {
    page++;
  } else if (page<9)
  {
    page++;
  }
}

void drawPage(int page) {
  if (page<8) {
    //select Page
    tint(colorTintLeft);
    image(imgL[page], width/4, height/2); 

    tint(colorTintRight);
    image(imgR[page], width/4*3, height/2);

    tint(255);
    image(imgVs, width/2, height/2, imgVs.width/6, imgVs.height/6);
  } else {
    //convert Page
    image(imgPlay, width/2, height/2);
  }
}


boolean over(PImage img, boolean isLeft) {
  if (isLeft){
  imgX = width/4-img.width/2;
  }
  else{
    imgX = width/4*3-img.width/2;
  }
  imgY = height/2 - img.height/2;
  if ((mouseX >= imgX ) && (mouseX <= imgX+img.width) &&
    (mouseY >= imgY) && (mouseY <= imgY+img.height)) {
    return true;
  } else {
    return false;
  }
}

void mouseMoved() {
  if (page<8) {
    colorTintLeft = colorNormal;
    colorTintRight = colorNormal;
    if (over(imgL[page], true)) {
      colorTintLeft = colorOver;
    } else if (over(imgR[page], false)) {
      colorTintRight = colorOver;
    }
  }
}

void mouseReleased() {
  if (isBtnPressed) {

    goNextPage();
    isBtnPressed = false;
  }
}

void mousePressed() {
  if (page<8) {
    colorTintLeft = colorNormal;
    colorTintRight = colorNormal;
    if (over(imgL[page], true)) {
      isBtnPressed = true;
      colorTintLeft = colorPress;
    } else if (over(imgR[page], false)) {
      isBtnPressed = true;
      colorTintRight = colorPress;
    }
  } else if(page == 8){
    
      minim = new Minim(this);
      song = minim.loadFile("00798.mp3");
      song.loop();
    }
}



