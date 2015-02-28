
// Uses the "bounce" example
int sizew = 220; // Width of the shape
int sizeh = 150;
float xpos, ypos;    // Starting position of shape
float xpos1, ypos1;

float xspeed; // Speed of the shape
float yspeed; // Speed of the shape
float xspeed1;
float yspeed1;

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int xdirection1 = -1;
int ydirection1 = -1;

PImage img1;
PImage img2;
PImage img3;
PImage img4;

int r;
int g;
int b;
import ddf.minim.*;

PFont fontA;

boolean endGame;

int score;

Minim minim;
AudioPlayer song;


void setup() 
{
  size(1000, 600);
  minim = new Minim(this);
  song = minim.loadFile("devilPig.mp3");
  r = (int)random(100, 255);
  g = (int)random(0, 100);
  b = (int)random(0, 100);
  //noStroke();
  frameRate(30);
  smooth();
  xspeed = 10;
  yspeed = 10;
  xspeed1 = 10;
  yspeed1 = 10;
  xpos = width/2;
  ypos = height/2;
  xpos1 = width/3;
  ypos1 = height/1.5;
  img1 = requestImage("suitSmall.png");
  img2 = requestImage("bennySmall.png");
  img3 = requestImage("capitalismSmall.png");
  img4 = requestImage("babySmall.png");
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  xpos1 = xpos1 + ( xspeed1 * xdirection1 );
  ypos1 = ypos1 + ( yspeed1 * ydirection1 );
  
  image(img1, mouseX - 100, mouseY - 100, 200, 200);
  float weight = dist(mouseX, mouseY, xpos, ypos);
  float weight1 = dist(mouseX, mouseY, xpos1, ypos1);
  image(img2, xpos, ypos, sizew, sizeh);
  image(img2, xpos1, ypos1, sizew, sizeh);
  
  fontA = loadFont("LucidaSans-TypewriterBold-100.vlw");
  textFont(fontA, 100);
  
  endGame = false;
  score = 0;
}

void draw() 
{
  r = (int)random(150, 255);
  g = (int)random(0, 100);
  b = (int)random(0, 100);
  frameRate(20);
  background(r, g, b);
  song.play();
  textSize(50);
  text("score: " + score, 10, 580);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  xpos1 = xpos1 + ( xspeed1 * xdirection1 );
  ypos1 = ypos1 + ( yspeed1 * ydirection1 );
  image(img1, mouseX - 100, mouseY - 100, 200, 200);
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-sizew || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-sizeh || ypos < 0) {
    ydirection *= -1;
  }
  if (xpos1 > width-sizew || xpos1 < 0) {
    xdirection1 *= -1;
  }
  if (ypos1 > height-sizeh || ypos1 < 0) {
    ydirection1 *= -1;
  }
  
  //Increase speed if player mouses over image
  if (xpos > mouseX-sizew && xpos < mouseX) {
    if (ypos > mouseY-sizeh && ypos < mouseY) {
      image(img3, 0, 0, 1000, 600);
      xspeed += random(1, 4);
      yspeed += random(1, 4);
      score++;
      textSize(50);
      text("score: " + score, 10, 580);
    }
  }
  if (xpos1 > mouseX-sizew && xpos1 < mouseX) {
    if (ypos1 > mouseY-sizeh && ypos1 < mouseY) {
      image(img3, 0, 0, 1000, 600);
      xspeed1 += random(1, 4);
      yspeed1 += random(1, 4);
      score++;
      textSize(50);
      text("score: " + score, 10, 580);
    }
  }
    
  // Draw the shape
  image(img2, xpos, ypos, sizew, sizeh);
  image(img2, xpos1, ypos1, sizew, sizeh);
  
  if (xspeed > 80 || xspeed1 > 80) {
    endGame = true;
    image(img4, 0, 0, 1000, 600);
    fill(0);
    textSize(80);
    text("YOU CAN'T WIN...", 50, 480);
    fill(255);
    textSize(30);
    text("play again", 10, 550);
  }
}

void mousePressed() {
  if (endGame == true) {
    if (mouseY > height/3 && mouseX < width/2) {
      song.pause();
      song.rewind();
      setup();
    }
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

