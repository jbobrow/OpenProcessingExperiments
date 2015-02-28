
import ddf.minim.*;
import ddf.minim.ugens.*;
AudioPlayer backgroundMusic;
AudioPlayer Scream;
Minim minim;

PImage Stalagmite;
PImage Scare;

boolean pageStarted = false;
boolean isClicked = false;
boolean levelOneBeat = false;
boolean levelTwoBeat = false;
boolean levelThreeBeat = false;

float x;
float y;


void setup() {
  size(800, 600);
  background(60);
  frameRate(120);
  minim = new Minim(this);
  backgroundMusic = minim.loadFile("Jazzy Elevator Music.mp3", 2048);
  Scream = minim.loadFile("Scream.mp3", 2048); 
  
  backgroundMusic.play();
  backgroundMusic.loop(); 
  Stalagmite = loadImage("Stalagmite.png");
  Scare = loadImage("fero.png");
}
void draw() {
  if (!pageStarted) {
    //Start Page
    background(0, 255, 255);
    fill(0, 0, 0);
    textSize(40);
    text("Welcome to the Not Scary Maze Game!", 25, 150);
    text("4 Levels Total!", 250, 250);
    textSize(20);
    text("Note: Turn volume to max for the best gaming experience", 150, 350);
    rect(30, 500, 150, 60);
    fill(255, 255, 255);
    textSize(45);
    text("Start", 50, 550);
    if ( mouseX > 30 && mouseX < 180 && mouseY > 500 && mouseY < 560 ) {
      if (mousePressed && (mouseButton == LEFT)) {
        pageStarted = true;
      }
    }
  } else if (pageStarted = true) {
    noCursor();
    //LevelOne
    //levelOneBeat = true;
    background(60);
    fill(0, 255, 255);
    stroke(0);
    ellipse(mouseX, mouseY, 10, 10);
    fill(0, 0, 0);
    rect(0, 0, 700, 200);
    rect(200, 300, 600, 300);
    rect(0, 200, 50, 400);
    rect(750, 0, 50, 400);
    fill(0, 255, 255);
    rect(700, 0, 50, 30);
    fill(0);
    rect(700, 0, 50, 10);
    //Falling Blocks of death
    Stalagmites();
    display();

    if (mouseX < x + 25 && mouseX > x - 25 && mouseY < y + 45 && mouseY > y - 45 ) {
      pageStarted = false;
      cursor();
    }  
    //boundaries
    if ( mouseX > 750 || (mouseX < 700 && mouseY < 200) || mouseX < 50 || ( mouseX > 200 && mouseY > 300) ) {
      pageStarted = false;
      cursor();
    }
    //win
    if ( mouseX > 700 && mouseX < 750 && mouseY < 30 && mouseY > 10 ) {
      levelOneBeat = true;
    }
    //Cheater Detection
    if ( mouseX > 700 && mouseX < 750 && mouseY < 10 ) {
      pageStarted = false;
      cursor();
    }
  }
  //levelTwoBeat = true; 
  if ( levelOneBeat != false ) {
    //LevelTwo 
    background(60);
    fill(0, 255, 255);
    stroke(0);
    ellipse(mouseX, mouseY, 10, 10);
    fill(0, 0, 0);
    rect(0, 0, 20, 600);
    rect(750, 0, 50, 530);
    rect(0, 0, 700, 20);
    rect(50, 60, 700, 30);
    rect(0, 130, 730, 30);
    rect(50, 200, 700, 30);
    rect(0, 270, 730, 30);
    rect(50, 340, 700, 30);
    rect(0, 410, 730, 30);
    rect(50, 480, 700, 30);
    rect(0, 550, 800, 50);
    fill(0, 255, 255);
    rect(770, 530, 30, 20);
    //Falling Blocks of death
    Stalagmites();
    display();

    if ((mouseX < x + 25 && mouseX > x - 25) && (mouseY < y + 40 && mouseY > y - 40 )) {
      levelOneBeat = false;
      pageStarted = false;
      cursor();
    }

    fill(0);
    rect(790, 530, 10, 20);
    //boundaries
    if (( mouseX < 20 ) || (mouseX < 700 && mouseY < 20) 
      || ( mouseX > 750 && (mouseY < 530 || mouseY > 550 )) 
      || (mouseX > 50 && (mouseY > 60 && mouseY < 90)) 
      || (mouseX < 730  && (mouseY > 130 && mouseY < 160 ))
      || (mouseX > 50 && (mouseY > 200 && mouseY < 230 ))
      || (mouseX < 730 && (mouseY > 270 && mouseY < 300))
      || (mouseX > 50 && (mouseY > 340 && mouseY < 370))
      || (mouseX < 730 && (mouseY > 410 && mouseY < 440))
      || (mouseX > 50 && (mouseY > 480 && mouseY < 510))
      || (mouseY > 550 )
      || (mouseX > 790)) { 
      levelOneBeat = false;
      pageStarted = false;
      cursor();
    }
    //Win Level Two
    if (mouseX > 770  && mouseX < 790 && mouseY > 530 && mouseY < 550) {
      levelTwoBeat = true;
    }
  }

  if ( levelTwoBeat != false ) {
  //LevelThree
  //levelThreeBeat = true;
  noCursor();  
  background(60);
  fill(0, 255, 255);
  stroke(0);
  ellipse(mouseX, mouseY, 10 , 10);
  fill(0, 0, 0);
  rect(0, 300, 400, 300);
  //topright
  rect(450, 0, 350, 125);  
  rect(0, 0, 150, 300);
  rect(400, 580, 450, 20);
  rect(150, 0, 250, 100);
  rect(600, 150, 200, 150);
  rect(450, 300, 400, 200);
  rect(150, 250, 250, 100);
  rect(400, 250, 175, 25);
  rect(180, 200, 420, 25);
  rect(150, 150, 50, 25);
  rect(200, 150, 375, 25);
  rect(600, 0, 250, 500);
  rect(165, 115, 450, 20);
  rect(400, 90, 40, 10);
  rect(410, 70, 40, 10);
  rect(400, 50, 40, 10);
  rect(410, 30, 40, 10);
  rect(400,0,50,15);

  fill(0, 255, 255);
  rect(400, 15, 50, 15);

  //Boundaries
  if (( mouseY > 580 )
    || (mouseX < 150 ) 
    || (mouseX > 600 && mouseY < 500 ) 
    || (mouseX > 450 && mouseY > 300 && mouseY < 500)
    || (mouseX > 150 && mouseX < 400 && mouseY > 250)
    || (mouseX > 400 && mouseX < 575 && mouseY > 250 && mouseY < 275)
    || (mouseX > 180 && mouseX < 600 && mouseY > 200 && mouseY < 225) 
    || (mouseX > 150 && mouseX < 575 && mouseY > 150 && mouseY < 175)
    || (mouseX > 165 && mouseX < 615 && mouseY > 115 && mouseY < 135)
    || (mouseX > 150 && mouseX < 400 && mouseY < 100) 
    || (mouseX > 450 && mouseY < 125)
    || (mouseX > 400 && mouseX < 440 && mouseY > 90 && mouseY < 100 ) 
    || (mouseX > 410 && mouseX < 450 && mouseY > 70 && mouseY < 80) 
    || (mouseX > 400 && mouseX < 440 && mouseY > 50 && mouseY < 60) 
    || (mouseX > 410 && mouseX < 450 && mouseY > 30 && mouseY < 40) 
    || (mouseX > 400 && mouseX < 450 && mouseY < 15 )) {
      levelOneBeat = false;
      levelTwoBeat = false;
      pageStarted = false;
      cursor();
    } 

  //Win Level Three
  if (mouseX > 400  && mouseX < 450 && mouseY < 30) {
    levelThreeBeat = true;
    
  }
 }
  if ( levelThreeBeat != false ) {
   //Scary Screen
   backgroundMusic.pause();
   Scream.play();

   background(random(255), random(255), random(255));
   frameRate(10); 
   image(Scare, 200, 0); 
  } 

}  
void Stalagmites() {
  y+=5;
  if ( y > height) {
    y = 0;
    x = random(width);
    if ( x < 30 ) {
      x = 30;
    }
  }
}

void display() {
  fill(0);
  image(Stalagmite, x, y);
}






