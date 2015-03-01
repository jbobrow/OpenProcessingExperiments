
//code by Miri Park

import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context
int startTime;
final int DISPLAY_DURATION = 4000; //4 seconds
PImage dots;

float button1X = 50;
float buttonY = 650;
float button2X = 120;
float button3X = 190;
float buttonSize = 50;
PShape head;
float xpos = 600;
float ypos = 300;

float tintR;
float tintG;
float tintB;

float freq;
float scale;

float headSize;
float earWidth;
float earHeight;
float eyeSize;
float headPosX;
float headPosY;
float leftEarPosX;
float leftEarPosY;
float rightEarPosX;
float rightEarPosY;
float leftEyePosX;
float leftEyePosY;
float rightEyePosX;
float rightEyePosY;
float rectWidth;
float rectHeight;

boolean playerPaused;

void setup() {
  background(0);
  size(1200, 800, P2D);
  background(0);
  headSize = 100;
  earWidth = headSize / 5;
  earHeight = headSize * (.9);
  eyeSize = headSize / 11;
  rectWidth = 100;
  rectHeight = 60;
  
  startTime = millis();
  
  dots = loadImage("dots.png");
  
  minim = new Minim(this);
  player = minim.loadFile("livingInThe80s.mp3", 2048);
  player.play();
  playerPaused = false;
  

  PFont f = createFont("Helvetica", 100);
  textFont(f);
}

void draw() {

  
  if (frameCount % 9 == 0) {
    fill(0,0,0,45);
    rect(0,0,1200,800);
  }
  fill(0,0,0,0);
  stroke(255);
  strokeWeight(5);
  rect(10, 600, 220, 100);
//button 1
  ellipse(button1X, buttonY, buttonSize, buttonSize);
//button 2
  ellipse(button2X, buttonY, buttonSize, buttonSize);
//button 3
  ellipse(button3X, buttonY, buttonSize, buttonSize);
  noStroke();
  for (int i = 530; i < 670; i += 5) {
    for (int j = -5; j < 130; j+= 5) {
      float pulse = sin(frameCount* .01 ) * 100;
      float distance = dist(i, j, mouseX, mouseY - 300);
      float tint = map(distance, 0, 300, 0, 255);
      fill(tint + pulse, 255, 255);
      rect(i, j, 4, 4);
    }
  }
  

  stroke (0);
  strokeWeight(50);

  fill( 0, 0, 0, 0);
  ellipse (600, 65, 150, 150);

  noStroke();


  if (millis()-startTime < DISPLAY_DURATION) { 
    fill(random(255), random(255), random(255));
    text("Party Time!", width/2 - 250, height/2);
  }

      
//  if (keyPressed ==true) {
//    if (key =='w') {
//      ypos -=10;
//    }
//    else if (key =='a') {
//      xpos -=10;
//    }
//    else if(key == 's') {
//      ypos +=10;
//    }
//    else if (key == 'd') {
//      xpos += 10;
//    }
//    else {
//      xpos = 100;
//      ypos = 100;
//    }
//  }
  
//first set of tiles  
  fill(mouseY-mouseX/180,mouseY/3,mouseX/3, 200);
  rect(250, 500, rectWidth , rectHeight);
  rect(250 + rectWidth, 500+rectHeight, rectWidth, rectHeight);
  rect(250 + rectWidth * 2, 500, rectWidth, rectHeight);
  rect(250 + rectWidth * 3, 500+rectHeight, rectWidth, rectHeight);
  rect(250 + rectWidth * 4, 500, rectWidth, rectHeight);
  rect(250 + rectWidth * 5, 500+rectHeight, rectWidth, rectHeight);
  rect(250 + rectWidth * 6, 500, rectWidth, rectHeight);

//alternating color set of tiles
  fill(mouseY-200,mouseY-200,mouseX-200);
  rect(250 + rectWidth, 480, rectWidth, rectHeight);
  rect(250 + rectWidth * 2, 520+rectHeight, rectWidth, rectHeight);
  rect(250 + rectWidth * 4, 520+rectHeight, rectWidth, rectHeight);
  rect(250 + rectWidth * 5, 480, rectWidth, rectHeight);

//final set of tiles  
  fill(mouseY*.6,mouseX*.3,mouseX*.2, 180);
  rect(250, 520+rectHeight, rectWidth , rectHeight);
  rect(250 + rectWidth * 3, 480, rectWidth, rectHeight);
  rect(250 + rectWidth * 6, 520+rectHeight, rectWidth, rectHeight);

//body
  fill(mouseY/2,mouseX/2,mouseY+mouseX/300);
  noStroke();
  ellipse(headPosX,473,80,120);
  ellipse(headPosX - 20,524,25,90);
  ellipse(headPosX + 21,524,25,90);
  
//head and ears unit
head = createShape();
head.beginShape();
  fill(mouseX/2,mouseY/2,mouseY+mouseX/1000);
  noStroke();
//head
  headPosX = 600;
  headPosY = 400;
  ellipse(headPosX,headPosY+mouseY*.01,headSize,headSize);
//left ear
  ellipse(headPosX-30,350+mouseY*.03,earWidth,earHeight);
//right ear
  ellipse(headPosX+30,350+mouseY*.03,earWidth,earHeight);
//eyes
  eyeSize = 9;
  fill(0);
  ellipse(582, 397+mouseY*.02, eyeSize, eyeSize-mouseY*.01);
  ellipse(618, 397+mouseY*.02, eyeSize, eyeSize-mouseY*.01);
head.endShape(CLOSE);
//hands
  fill(mouseX/3,mouseY/3,mouseY+mouseX/700);
  ellipse(520+mouseX*.08,480-mouseY*.2,15,15);
  ellipse(690-mouseX*.08,399+mouseY*.2,18,18);
  
  tintR = map(mouseY, 0, height, 0, 255);
  tintG = map(frameCount, 0, 400, 0, 255);
  tintB = map(mouseX, 0, width, 0, 255);
  
  freq = map(mouseX, 0, width, .0001, 1);
  scale = map(sin(frameCount * freq), -1, 1, 100, 500);
  
  pushMatrix();
  imageMode(CENTER);
  
  tint(tintR,tintG,tintB);
  translate(width/2, height/2);
  rotate(radians(frameCount * freq));
  image(dots, 0, 0, scale, scale);
  
  popMatrix();

  if (mouseX >= button1X - 25 && mouseX <= button1X + buttonSize -25 && mouseY > buttonY && mouseY < buttonY + buttonSize) {
    stroke(0);
    strokeWeight(8);
    fill(0,0,255,100);
    ellipse(button1X, buttonY, buttonSize, buttonSize);
  }
  if (mouseX >= button2X - 25 && mouseX <= button2X + buttonSize - 25 && mouseY >buttonY && mouseY < buttonY + buttonSize) {
    stroke(0);
    strokeWeight(8);
    fill(255, 0,0,100);
    ellipse(button2X, buttonY, buttonSize, buttonSize);
  } 
    if (mouseX >= button3X - 25 && mouseX <= button3X + buttonSize - 25 && mouseY >buttonY && mouseY < buttonY + buttonSize) {
    stroke(0);
    strokeWeight(8);
    fill(0, 255, 0,100);
    ellipse(button3X, buttonY, buttonSize, buttonSize);
  } 

//scren capture
if(keyPressed) {
     if(key == 's') {
       saveFrame();
     }
}
}
void keyReleased() {
  if (playerPaused == false) {
    player.pause();
    playerPaused = true;
  }
  else {
    player.play();
    playerPaused = false;
  }
  head.rotate(100);
  
  
  
  
}




void mousePressed() {
  if (mouseX >= button1X - 25 && mouseX <= button1X + buttonSize -25 && mouseY > buttonY && mouseY < buttonY + buttonSize) {
    player.pause();
    minim = new Minim(this);
    player = minim.loadFile("impromptu.mp3", 2048);
    player.play();
    playerPaused = false;
    stroke(0);
    strokeWeight(8);
    fill(0, 0, 255);
    ellipse(button1X, buttonY, buttonSize, buttonSize);
  }
  if (mouseX >= button2X - 25 && mouseX <= button2X + buttonSize - 25 && mouseY >buttonY && mouseY < buttonY + buttonSize) {
    player.pause();
    minim = new Minim(this);
    player = minim.loadFile("rainingBlood.mp3", 2048);
    player.play();
    playerPaused = false;
    stroke(0);
    strokeWeight(8);
    fill(255, 0, 0);
    ellipse(button2X, buttonY, buttonSize, buttonSize);
    tintR= 255;
    tintG = 0;
    tintB= 0;
  } 
    if (mouseX >= button3X - 25 && mouseX <= button3X + buttonSize - 25 && mouseY >buttonY && mouseY < buttonY + buttonSize) {
    player.pause();
    minim = new Minim(this);
    player = minim.loadFile("livingInThe80s.mp3", 2048);
    player.play();
    playerPaused = false;
    stroke(0);
    strokeWeight(8);
    fill(0, 255, 0);
    ellipse(button3X, buttonY, buttonSize, buttonSize);
  } 
}
void stop() {
  player.close();
  minim.stop();
  super.stop();
}

//void mouseDragged () {
  




