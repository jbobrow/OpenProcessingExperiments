
import ddf.minim.*;
AudioPlayer missle;
AudioPlayer bgMusic;
int game = 1;
PImage home, UFO, rocket;
Minim minim;

//text
PFont font;
float textx1 =450;
float textx2 =450;

//center rectangle
float rectx = 240;
float recty = 160;
float rectwidth = 220;
float rectheight = 10;
float rectSize = 110;
float rectspeed = random (2, 5);
int rectdirection = 1;

// top ball
float circlex = 500;
float circley = 80;
int circlesize;
int circledirection = 1;
float circlespeed = random (2, 3);

//bottom ball
int ballX = -1;
int ballY = 350;
float radius = 20;

//shooting device
int shootx = 240;
int shooty = 250;
int shootwidth = 8;
int shootheight = 20;

//lives
int lives = 6;

int rectcolor = 255;

//booleans
boolean missilemoving = false;


void setup () {
  size (900, 450);
  font = loadFont ("LiGothicMed-48.vlw");
  textFont (font);
  smooth();
  noStroke ();
  textAlign (CENTER);
  
 minim = new Minim(this);
 missle = minim.loadFile("Big Bomb-SoundBible.com-1219802495.mp3");
 bgMusic = minim.loadFile("Motorhead.mp3");
  bgMusic.play();

  rectMode (CENTER);
  home = loadImage ("shootinggame.jpg");
  rocket = loadImage ("rocket.png");
  UFO = loadImage ("UFO.png");
}


void draw () {

  if (game == 1) {
    gameOne();
  }
  else if (game == 2) {
    gameTwo();
  }
}

//my mouse function
void mousePressed() {
}


//game one
void gameOne () {
  image (home, 0, 0);

  if (mousePressed) {
    game = 2;
  }
}


//game two
void gameTwo () {

  background (0);
  fill (73, 50, 50);
  textSize (18);
  text ("LIVES: " + lives, 410, 305);


  //drawing our elements
  fill (255, rectcolor, rectcolor);
  rect (rectx, recty, rectwidth, rectheight);
  //top balls

  fill(random(255), mouseX, mouseY);  
  ellipseMode(RADIUS);

  image (UFO, circlex, circley, 50, 50);


  image (rocket, ballX, ballY, 100, 100);
  rect (shootx+50, shooty+10, shootwidth, shootheight);

  //moving the center rect
  rectx += rectspeed * rectdirection;
  if ((rectx > width - rectSize) || (rectx < rectSize)) {
    rectdirection = -rectdirection;
  }

  // moving top ball
  circlex += circlespeed * circledirection;
  if ((circlex > width - circlesize) || (circlex < circlesize)) {
    circledirection = -circledirection;
  }

  //moving the shooter
  if (missilemoving == true) {
    shooty = shooty - 10;
  }

  if (shooty < -10) {
    missilemoving = false;
  }

  //center rect
  // collision for barrier
  if (rectRectIntersect(rectx-rectSize, recty-5, rectx-rectSize+rectwidth, 
  recty-5+rectheight, shootx-1.5, shooty-10, 
  shootx-1.5+10, shooty-10+20) == true) {

    missilemoving = false;
    lives -= 1;
    if (lives < 0) {
      lives = 0;
    }
    rectcolor -= 85;
    println (lives);
  }

  if (lives <= 0) {
    textSize (32);
    text ("Game Over", textx1, 200);
    textSize (14);
    text ("click to play again", textx1, 250);
  }

  //CIRCLE INTERSECTION
  //collision for UFO
  
  float minDist = 50;
  
  float missleDist = dist(shootx, shooty, circlex, circley);
  println(missleDist);
  
  if (missleDist < minDist) {
    missilemoving = false;
    circlesize = 0; //0
    println (circlesize);
  }

  if (circlesize <= 0) {
    textSize (32);
    text ("YOU WIN", textx2, 200);
    textSize (14);
    text ("click to play again", textx2, 250);
  }

  //shooter start over
  if (missilemoving == false) {
    shooty = 250;
  }

  //movements
  if (keyPressed == true) {

    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (keyPressed == true) {
          ballX = ballX + 5;
          shootx= shootx + 5;
        }
      }
    }

    if (key == CODED) {
      if (keyCode == LEFT) {
        if (keyPressed == true) {
          ballX = ballX - 5;
          shootx = shootx - 5;
        }
      }
    }
  }

  if (mousePressed) {
    rectx = 300;
    circlex = 300;
    circlesize = 15;
    ballX = 300;
    shootx = 300;
    lives = 5;

    rectcolor = 280;
  }
}

//RECT/RECT
boolean rectRectIntersect(float left, float top, float right, float bottom, 
float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


//start the game

void keyPressed() {


  if (key == ' ') {
    missilemoving = true;
    missle.play();
    missle.rewind();
    println(key);
  }

}



void stop(){
missle.close();
minim.stop();
super.stop();
}
  


