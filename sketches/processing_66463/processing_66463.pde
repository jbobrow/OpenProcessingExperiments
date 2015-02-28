
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

Minim minim;

PFont font1, font2, font3, font4;

float xpos; 
float ypos;
int sz;
float angle;

PImage img;
PImage backimg;
PImage backimgred;
PImage backimgyellow;
PImage backimgblue;
PImage backimgboom;
PImage backimgvroom;

void setup() {
  minim = new Minim(this);

  player1 = minim.loadFile("boomfinal.mp3", 2048);
  //   player1.play();

  player2 = minim.loadFile("powfinal.mp3", 2048);

  player3 = minim.loadFile("vroomfinal4.mp3", 2048);

  player4 = minim.loadFile("whoompfinal.mp3", 2048);

  frameRate(8);
  size(456, 609, P2D);
  smooth();
  xpos = 150;
  ypos= 100;
  sz = width/6;
  
  img =loadImage("marclay.jpg");
  backimg =loadImage("marclaybkgnd.jpg");
  backimgred =loadImage("marclaybkgndred.jpg");
  backimgyellow =loadImage("marclaybkgndyellow.jpg");
  backimgblue =loadImage("marclaybkgndblue.jpg");
  backimgboom =loadImage("boom2.jpg");
  backimgvroom =loadImage("vroom2.jpg");

  font1 = loadFont ("Futura-CondensedExtraBold-16.vlw");
  textFont(font1, 34);
  font4 = loadFont("RosewoodStd-Regular-24.vlw");
  textFont(font4, 75);
}

void draw() {

  background(img);
 println("X=" +mouseX + "  Y="+ mouseY);
 
  //white box
  fill(255);
  rect(175, 220, 140, 160);

  //top red button- BOOM
  fill(255, 0, 0);
  rect(190, 230, 110, 30);

  //grey buttons- POW, VROOM
  fill(118, 115, 115);
  rect(190, 265, 110, 30);
  rect(190, 300, 110, 30);

  //bottom red button- WHOOMP
  fill(255, 0, 0);

  rect(190, 335, 110, 30);

  angle += PI/24;

  pushMatrix();

  //BOOM!!!
  fill(0);
  textFont(font1);
  text("BOOM !!!", 200, 252);

  //POW !!!
  fill(0);
  textFont(font1);
  text("POW !!!", 200, 286);

  //VROOM !!!
  fill(0);
  textFont(font1);
  text("VROOM !!!", 200, 321);

  //WHOOMP !!!
  fill(0);
  textFont(font1);
  text("WHOOMP !!!", 200, 355);

  translate(width/2, height/2);
  rotate(angle);

  Star();
  popMatrix();
}

void mousePressed() {
  //if (mouseX > width/2 )
  //&& mouseX)
  //BOOM BUTTON
  if (mouseX>190 && mouseX<300 && mouseY>230 && mouseY< 261){
   player1.rewind();
 // player1.close();
 // player2.close();
//  player3.close();
 // player4.close();
    player1.play();
    background(backimgboom);
// 
  
}

  //POW BUTTON
  if (mouseX>190 && mouseX<300 && mouseY>266 && mouseY< 295){
player2.rewind();
    player2.play();
    background(backimgyellow);
 // 
  }
  //VROOM BUTTON
   if (mouseX>190 && mouseX<300 && mouseY>302 && mouseY< 331){
    player3.rewind();
    player3.play();
  //player3.rewind();
  background(backimgvroom);
   }
  //WHOOMP BUTTON
   if (mouseX>190 && mouseX<300 && mouseY>337 && mouseY< 366){
    player4.rewind();
    player4.play();
    background(backimgred);
 
   }
  {
   
  }
  
  } 


  void Star() {

    fill(0xFFFF0000);
    noStroke();

    beginShape();
    vertex(xpos, ypos-sz/2);
    vertex(xpos+sz/6, ypos-sz/6);
    vertex(xpos+sz/2, ypos-sz/11);
    vertex(xpos +sz/4, ypos+sz/8);
    vertex(xpos+sz/3, ypos+sz/2);
    vertex(xpos, ypos+sz/3);
    vertex(xpos-sz/3, ypos+sz/2);
    vertex(xpos-sz/4, ypos+sz/6);
    vertex(xpos-sz/2, ypos-sz/9);
    vertex(xpos-sz/6, ypos-sz/6);
    endShape(CLOSE);
  }

  void stop() {
    player1.close();
    player2.close();
    player3.close();
    player4.close();
    minim.stop();

    super.stop();
  }  


