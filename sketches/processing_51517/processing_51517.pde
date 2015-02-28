
/* program written by Oscar Hazelaar. The player encounters a sleeping figure, which once
the mouse approaches him begins to expand rapidly. Words will flash accross the screen,
and a roaring sound will grow louder and louder as the ball expands. If the player
backs off in time the roaring will stop, and the ball will shrink back to its original
size. If the player does not do this the ball will expand to a point of no return, where
no matter what it will keep on expanding. Once the ball has reached critical mass it will
explode, giving the player the oppurtunity to reset the program*/

//calling the minim library, and declaring the variables used in the program.

import ddf.minim.*;

AudioPlayer clock,fire,explosion,rumble;
Minim minim;

int objx;
int objy;
int objsize = 25;
int playerx;
int playery;
int distance;
int sensitivity = 10;
int state = 0;
int mood = 0;
int response = 1;
PFont font; 

// the setup for the program, setting the object on a random location, and loading
// the various sound files
void setup() {
  minim = new Minim(this);
  clock = minim.loadFile("clock.mp3");
  fire  = minim.loadFile("fire.mp3");
  explosion = minim.loadFile("explosion.mp3");
  rumble = minim.loadFile("rumble.mp3");
  size(500, 500);
  background(0);
  font = loadFont("Serif-48.vlw");
  objx = int(random(200, 300));
  objy = int(random(200, 300));
  smooth();
  noStroke();
}

// the main program. Various functions are called here
void draw() {
  
  // checking the distance between the mouse and object, converting to an integer
  
  distance = int(dist(objx, objy, mouseX, mouseY));

  //functions that calculate the mood and state variables
  objmood();
  distcheck();
  
  //an if statement that changes the response variable depending on the size of the object
  //this is mainly for the last 2 steps of the program
  if (objsize > 500 && response <11) {
    fill(255);
    rect(0,0,width,height);
    response = 10;
  } else if(response > 10){
    response = 11;
  } else{
  response = mood + state;  
  }
  
  //serial print used to troubleshoot. kept it in here just in case
  println (objsize);


  background(0);
  //drawobject();
  
  //the response function reacts depending on the mood and state variable
  response();

}

//reset button

void keyPressed() {
  objx = int(random(500));
  objy = int(random(500));
  objsize = 25;
  response = 1;
  fire.pause();
  fire.rewind();
}

//function that draws the object. The color changes to red once the creature passes
// a perticular treshold in the response table
void drawobject() {
  fill(255);
  if (response > 7) {
    fill(255, 0, 0);
  }
  ellipse(objx, objy, objsize, objsize);
  fill(0);
  ellipse(objx-5 -( objsize/10), objy-5, objsize/4, objsize/3);
  ellipse(objx+5 +( objsize/10), objy-5, objsize/4, objsize/3);
  fill(255);
  ellipse(objx-5 -( objsize/10), objy-5, objsize/8, objsize/6);
  ellipse(objx+5 +( objsize/10), objy-5, objsize/8, objsize/6);
}

//function that calculates the state variable

void distcheck() {
  if (distance <= objsize + sensitivity) {
    state = 6;
  }
  else if (distance > objsize + sensitivity && distance <= objsize+sensitivity+50) {

    state = 3;
  } 
  else if (distance > objsize+sensitivity+50 && objsize >25 ) {

    state = 0;
  }
}

// function that calculates the mood variable

void objmood() {
  if (objsize <= 25) {
    mood = 1;
  }
  else if (objsize > 25 && objsize <= 100) {
    mood = 2;
  }
  else if (objsize > 100) {
    mood = 3;
  }
}

// the response function, which is made up from a switch structure.
// case 1-9 are switched between through the mood and state variables
//case 10 and 11 will follow each other in order once the program finishes
//creating an ending "cinematic"

void response() {
  switch(response) {
    //the calm and shrinking resonses
  case 1:
    textFont(font);
    clock.play();
    rumble.pause();
    rumble.rewind();
    text("zzz", objx - random(0, 50), objy-int(random(50)));
    delay(1000);
    drawobject();
    fill(200);
    rect(objx-8, objy-8, 18, objsize/5);
    break;

  case 2:
    clock.rewind();
    rumble.pause();
    rumble.rewind();
    objsize--;
    drawobject();
    text("Well Then...", 300, 100);
    break;

  case 3:
    rumble.pause();
    clock.pause();
    objsize--;
    drawobject();
    text("Oh...", 100, 100);
    break;

    //the agitated reactions
  case 4:
    
    clock.pause();
    objx = objx + int(random(-3, 3));
    objy = objy + int(random(-3, 3));
    text("fffff", 100 - random(0, 50), 100-int(random(50)));
    delay(600);
    drawobject();
    break;

  case 5:
  
    clock.pause();
    objx = objx + int(random(-3, 3));
    objy = objy + int(random(-3, 3));
    drawobject();
    text("FFFFFFF", 100- random(0, 50), 100-int(random(50)));
    delay(500);
    break;

  case 6:
    clock.pause();
    objx = objx + int(random(-3, 3));
    objy = objy + int(random(-3, 3));
    drawobject();
    text("FFFFFFFFFUUUUUU-", 100- random(0, 50), 100-int(random(50)));
    delay(300);
    break;

    //the explosive reactions
  case 7:
  
    clock.pause();
    rumble.play();
    objx = objx + int(random(-5, 5));
    objy = objy + int(random(-5, 5));
    objsize++;
    drawobject();
    text("WAIT!", int(random(0, 500)), int(random(500)) );
    delay(100);
    break;

  case 8:
  clock.pause();
    textFont(font);
    for (int i = 0; i < 10;i++) {
      text("NOOO!", int(random(0, 500)), int(random(500)) );
    }
    objx = objx + int(random(-5, 5));
    objy = objy + int(random(-5, 5));
    objsize++;
    drawobject();
    break;

  case 9:
    textFont(font);
    for (int i = 0; i < 10;i++) {
      text("oh shit", int(random(0, 500)), int(random(500)) );
    }
    objx = objx + int(random(-5, 5));
    objy = objy + int(random(-5, 5));
    objsize++;
    drawobject();
    break;
    
    case 10:
    rumble.pause();
    rumble.rewind();
    explosion.play();
    delay(6300);
    response = 11;
    break;

    case 11:
    fire.play();
    explosion.pause();
    explosion.rewind();
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textFont(font);
    text("game over", width/5, height/5);
    text("press any button", width/8, height/2);
    break;
  }
}




