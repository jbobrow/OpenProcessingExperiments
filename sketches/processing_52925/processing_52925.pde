
/* Piecing it together. A puzzle created from a picture of the CN Tower construction site. The user can rotate parts of the picture in order to reasemble it. 
once the picture is completed the user can submit their solution, starting a video of several stages of the CN Tower's construction. The user can reset the puzzle at this point

Written by Oscar Hazelaar.

libraries used: Processing Serial, Minim, Processing Video
*/


//Calling the libraries used, serial is mainly used for debugging
import processing.serial.*;
import ddf.minim.*;
import processing.video.*;

//setting up the sound and video variables
AudioPlayer click, rotateClick, success,wrong;
Minim minim; 
Movie myMovie;
//counters used during the end of the program for the purpose of timing, also sets the state of the program to 0
int counter, counter2 = 0;
int stage = 0;
// the image variables for the pieces and their masks, and various other images.
PImage puzzle1, puzzle2, puzzle3, puzzle4, puzzle5, backdrop,intro, ending;
PImage puzzleMask1, puzzleMask2, puzzleMask3,puzzleMask4,puzzleMask5;

//the starting posistions of the puzzle, converting degrees to radians
int selection = 4;
int rotation1 = -40;
float rad1 = radians(rotation1);
int rotation2 = 200;
float rad2 = radians(rotation2);
int rotation3 = 20;
float rad3 = radians(rotation3);
int rotation4 = 60;
float rad4 = radians(rotation4);
int rotation5 = 60;
float rad5 = radians(rotation5);

// loading the images, setting up the size of the program
void setup() {
  minim = new Minim(this);
  click = minim.loadFile("click.mp3");
  rotateClick = minim.loadFile("rotateClick.mp3");
  success = minim.loadFile("success.mp3");
  wrong = minim.loadFile("wrong.mp3");
  myMovie = new Movie(this,"finish.mov");
  myMovie.stop();
  myMovie.loop();

  imageMode(CENTER);
  background(0);
  intro = loadImage("intro.jpg");
  backdrop = loadImage("backdrop.jpg");
  ending = loadImage("ending.jpg");
  puzzle5 = loadImage("puzzle5.jpg");
  puzzle4 = loadImage("puzzle4.jpg");
  puzzle3 = loadImage("puzzle3.jpg");
  puzzle2 = loadImage("puzzle2.jpg");
  puzzle1 = loadImage("puzzle1.jpg");
  puzzleMask5 = loadImage("puzzle5mask.jpg");
  puzzleMask4 = loadImage("puzzle4mask.jpg");
  puzzleMask3 = loadImage("puzzle3mask.jpg");
  puzzleMask2 = loadImage("puzzle2mask.jpg");
  puzzleMask1 = loadImage("puzzle1mask.jpg");
  
  size(1000,732,P2D);
}

void draw() {
  
  // this program uses a switch to split the user experience into several distinct stages, moving from 0 to 4, creating 5 stages overall
  switch(stage){
  // stage 0 gives the user the intro
  case 0:
  background(0,0,0);
  image(intro,width/2,height/2);
  break;
  //state 1 is the puzzle state
  case 1:
  image(backdrop,width/2,height/2); 
  //this part of the code prevents the rotation variables from exeeding -360 and 360, making the puzzle solvable no matter how much it is rotated
  if(rotation1 >=360){
    rotation1 = 0;
  }
  if(rotation2 >= 360){
    rotation2 = 0;
  }
  if(rotation3 >= 360){
    rotation3 = 0;
  }
  if(rotation4 >= 360){
    rotation4 = 0;
  }
  if(rotation5 >= 360){
    rotation5 = 0;
  }
  
  if(rotation1 <= -360){
   rotation1 = 0;
  }
  if(rotation2 <= -360){
    rotation2 = 0;
  }
  if(rotation3 <= -360){
    rotation3 = 0;
  }
  if(rotation4 <= -360){
    rotation4 = 0;
  }
   if(rotation5 <= -360){
    rotation5 = 0;
  }
    
  //this prevents the user from moving the selection variable above or below the boundary
  if (selection > 4){
    selection = 4;
  }
  if (selection < 0){
    selection = 0;
  } 
  
  // old testing / debugging code
  
 /* if(rotation1 == 0 && rotation2 == 0 && rotation3 == 0 && rotation4 == 0){
  background(255);
  }else{
  background(0);
  }
  fill(0);
  rect(100,100,500,500);
  */
  
  // each of the circles rotates individually, using pop and push matrix to prevent them from affecting each other.\
  // the tint of each piece changes when selected
  
  pushMatrix();
  rad5 = radians(rotation5);
  translate(width/2,height/2);
  if(selection == 4){
  tint(255, 255);
  }else{
  tint(255,153);
  }
  rotate(rad5);
  puzzle5.mask(puzzleMask5);
  image(puzzle5,0,0);
  popMatrix(); 
  
  pushMatrix();
  rad4 = radians(rotation4);
  translate(width/2,height/2);
  if(selection == 3){
  tint(255, 255);
  }else{
  tint(255,153);
  }
  rotate(rad4);
  puzzle4.mask(puzzleMask4);
  image(puzzle4,0,0);
  popMatrix(); 
  
  pushMatrix();
  rad3 = radians(rotation3);
  translate(width/2,height/2);
  if(selection == 2){
  tint(255, 255);
  }else{
  tint(255,153);
  }
  rotate(rad3);
  puzzle3.mask(puzzleMask3);
  image(puzzle3,0,0);
  popMatrix(); 

  
  pushMatrix();
  rad2 = radians(rotation2);
  translate(width/2,height/2);
  if(selection == 1){
  tint(255, 255);
  }else{
  tint(255,153);
  }
  rotate(rad2);
  puzzle2.mask(puzzleMask2);
  image(puzzle2,0,0);
  popMatrix(); 
  
  
  pushMatrix();
  rad1 = radians(rotation1);
  translate(width/2,height/2);
  if(selection == 0){
  tint(255, 255);
  }
  else{
  tint(255,153);
  }
  rotate(rad1);
  puzzle1.mask(puzzleMask1);
  image(puzzle1,0,0);
  popMatrix();
  break;
  
  
  //once the user has completed the puzzle this state will make the screen fade to black
  case 2:
  fill(0,10);
  rectMode(CORNER);
  rect(0,0,width,height);
  counter++;
  println(counter);
  if(counter > 200){
    stage = 3;
  }
  break;

  //this stage plays the movie, allowing the user to reset after a certain time
  case 3:
  background(0);
  println("movieplaying");
  imageMode(CENTER);
  image(myMovie,width/2,height/2);
  counter2++;
  if(counter2 > 500){
    image(ending,500,600);
  }
  break;
  
  //this stage quickly resets the puzzle, and starts stage 0 again, resetting the program
  case 4:
  rectMode(CORNER);
  fill(0,0,0);
  rect(0,0,width,height);
  selection = 4;
  rotation1 = -40;
  rad1 = radians(rotation1);
  rotation2 = 200;
  rad2 = radians(rotation2);
  rotation3 = 20;
  rad3 = radians(rotation3);
  rotation4 = 60;
  rad4 = radians(rotation4);
  rotation5 = 60;
  rad5 = radians(rotation5);
  counter = 0;
  counter2 = 0;
  stage = 0;
  break;
  }
}

//a key part of the program is based around keyPressed(). the keyboard plays a different role depending on what stage the program is in

void keyPressed() {
  // the intro stage, checks to see if the spacebar is pressed to start the next stage
  switch(stage){
  case 0:
  if (key == ' '){
    stage = 1;
  }
  break;
  
  // the puzzle mechanics, checking the arrow keys and enter/return key
    
  case 1:
  if (key == CODED) {
    if (keyCode == DOWN) {
      rotateClick.play();
      selection++;
      rotateClick.rewind();
    }
    if (keyCode == UP) {
      rotateClick.play();
      selection--;
      rotateClick.rewind();
    }

    if(keyCode == RIGHT) {
      click.play();
      if(selection == 0) {
        rotation1 = rotation1 + 10;
        println("derp");
      }
      if(selection == 1){
        rotation2 = rotation2 + 10;
        rotation3 = rotation3 - 10;
      }
      if(selection == 2){
        rotation3 = rotation3 + 10;
        rotation1 = rotation1 + 10;
      }
       if(selection == 3){
        rotation4 = rotation4 + 10;
        rotation3 = rotation3 -10;
      }
       if(selection == 4){
        rotation5 = rotation4 + 10;
        rotation1 = rotation1 +10;
      }
      click.rewind();
    }
      else if(keyCode == LEFT) {
        click.play();
        if(selection == 0){
        rotation1 = rotation1 - 10;
        println("herp");
        } 
       if(selection == 1){
          rotation2 = rotation2-10;
        }
        if(selection == 2){
          rotation3 = rotation3-10;
        }
        if(selection == 3){
          rotation4 = rotation4-10;
        }
         if(selection == 4){
          rotation5 = rotation5-10;
        }
        click.rewind();
      }
    
    }
    if (key == ENTER){
      if(rotation1 == 0 && rotation2 == 0 && rotation3 == 0 && rotation4 == 0 && rotation5 == 0){
         stage = 2;
         success.play();
         delay(2000);
         success.rewind();
      }
     else{
      wrong.play();
      delay(1000);
      wrong.rewind();
     }
    }
       
     break;
     case 3:
     if (key == ENTER){
       stage = 4;
     }
     }
}

void movieEvent(Movie myMovie) {
  myMovie.read();
}


