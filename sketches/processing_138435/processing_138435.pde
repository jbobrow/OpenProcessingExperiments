
/*Scott Bell scott.k.bell@gmail.com
Interactive Motion Graphics
Dec 5, 2012
the purpose of this sketch is to add a degree of interactions to a normally non-interactive medium, motion graphics

Colours  - Coney Island from Kulur.com user Cassob hex
 Blue - #053B44 - Green - #06736C - Red - #A53539 - Orange #B9543C - Yellow #EAD075
 */

import ddf.minim.*; // import minim library

Minim minim; 
AudioPlayer player; //call up audio player

//timing and variables for each animation sequence

//Inital delay
int delay = 3000; //3000
  //delay variables
  float colour1 = 255;
  float targetColour1 = 0;

//Scene 1
int AniT1 = 8500;  //8000
  // 1 ellipse growing variable
  float diam3 = 10;
  
//Scene 2
int AniT2 = 13000;
  // 2 Ellipses Growing
  float diam1 = 0;
  float targetDiam1 = 1400;
  
//Scene 3
int AniT3 = 16000;

//Scene 4
int AniT4 = 20000;
  //Ellipse Matrix with Scaling
  float targetSF1 = 4; //target end for scaling algorithim 
  float sF1 = 0; // start of scaling algorithim 
  
//Scence 5
int AniT5 = 24000;
  float i = 0;

//Scene 6
int AniT6 = 28500;
//Scene 7
int AniT7 = 32000;
  // Rectangular Cube Matrix with Stroke Mouse Int and Scaling
   float targetSF2 = 3; // target end after scaling factor for the for loop rectangular matrix
   float sF2 = 0; // begining of the scaling factor
   
//Scene 8
int AniT8 = 37000;
//Scene 9
int AniT9 = 42000;
  //Animation 9 - shrinking rectangular lines
  float rW2 = 1200; // rectangle width
  float rH2 = height; // rectangle height
  float targetRH2 = 0; // target rectangle height
  float targetRW2 = 0; // target rectangle width

//Scene 10
int AniT10 = 49000;
  //Parallel lines with growing stroke weight
  float sW1  = 0; // inital stroke weight
  float targetSW1 = 20; // target stroke weight
  
  
//Scene 11
int AniT11 = 62000;
  //Rectangluar Matrix with Line Matrix behind
  float targetSF3 = 4; //for scaling algorithim 
  float sF3 = 0;

//Scene 12 // fade out
int AniT12 = 64000;
  //fade to white variables
  float colour2 = 255;
  float targetColour2 = 0;


//TEST VARIABLES
    // this spot was to place variables currently used for debugging.




void setup() {
  size(2560, 1440);
  smooth();
  rectMode(CENTER);
  minim = new Minim(this); // initate the audio player
  player = minim.loadFile("Coronado Edit.mp3", 2048); // load the track in buffers that are 2048 long
  player.play();   //play the file 
}


void draw() {
  background(55);
  if ((millis() > 0) && (millis() < delay)) { // inital delay timing
    Delay();
  }
  if ((millis() > delay) && (millis() < AniT1)) { //Animation 1 Timing as well as placment of AnimationTets();
    Animation1();
    //AnimationTest(); I used this to sub in a peice of the code I was working on in the place of Animation1(); so I could debug without waiting through the rest of the animations
  }
  if ((millis() > AniT1) && (millis() < AniT2)) { //Animation Timing 2
    Animation2();
  }
  if ((millis()  > AniT2) && (millis() < AniT3)) {// Animation Timing 3
    Animation3();
  }
  if ((millis()  > AniT3) && (millis() < AniT4)) { // Animation Timing 4
    Animation4();
  }
  if ((millis()  > AniT4) && (millis() < AniT5)) { // Animation Timing 5
    Animation5();
  } 
  if ((millis() > AniT5) && (millis() < AniT6)) {  // Animation Timing 6
    Animation6();
  }
  if ((millis() > AniT6) && (millis() < AniT7)) {  // Animation Timing 7
    Animation7();
  }
  if ((millis() > AniT7) && (millis() < AniT8)) {  // Animation Timing 8
    Animation8();
  }
  if ((millis() > AniT8) && (millis() < AniT9)) {  // Animation Timing 9
    Animation9();
  }
  if ((millis() > AniT9) && (millis() < AniT10)) {  // Animation Timing 10
    Animation10();
  }
  if ((millis() > AniT10) && (millis() < AniT11)) {  // Animation Timing 11
    Animation11();
  }
  if ((millis() > AniT11) && (millis() < AniT12)) {  // Animation Timing 12
    Animation12();
  }
}


////////AUDIO FUNCTION ///////// - to stop music

void stop()
{
  // close Minim audio classes 
  player.close();
  // stop Minim before exiting
  minim.stop();

  super.stop();
}


///ANIMATION FUNCTIONS/////

void AnimationTest() { //  this was used so I could place the code I was currently working on in the front of the animations and I would not have to wait
    // through the rest of the animations to check if something worked and debug

}  


void Delay() { // delay before video begins - fade in
  fill(colour1);
  rect(width/2, height/2, width, height);
  colour1 = colour1 - (targetColour1 + colour1) * 0.01; // fade from white to black
}


void Animation1() { // one ellipse moving forward
  fill(255, 0);
  stroke(#053B44);
  strokeWeight(15);
  quadrantBackground();

  ellipse(width/2, height/2, diam3, diam3); 
  diam3++;
  ellipse(width/2, height/2, diam3, diam3);
  diam3++; // increase diameter
}

void Animation2() {  // two ellipses moving forward (growing in diam)
  strokeWeight(2);
  quadrantBackground();
  fill(#A53539, mouseX/6);
  ellipse(width/2+50, height/2, diam1, diam1);

  fill(#B9543C, (1-mouseX/6));
  ellipse(width/2-50, height/2, diam1, diam1);
  diam1 = diam1 + (targetDiam1 - diam1) * 0.001; // increase diameter using easing
}
void Animation3() { // Random Ellipses
  quadrantBackground();
  strokeWeight(mouseX/20); // interactive stroke weight
  ellipse(random(width), random(height), 200, 200);
}

void Animation4() { // Ellipse For Loop Matrix
  quadrantFill();
  quadrantBackground();
  strokeWeight(2);
  background(#053B44);
  scale(sF1);
  for (int i = 0; i < width ; i += 15) {
    for (int j = 0; j < height ; j += 15) { // nested forloop to create grid of ellipses
      ellipse(i, j, 8, 8);
    }
    sF1 = sF1 + (targetSF1 + sF1) * 0.001; // sclaing easing equation to used to give motion to the grid
  }
}


void Animation5 () {
  
  quadrantBackground();
  //biggest ellipse
  fill(0, 0); 
  stroke(255, mouseY/4);
  ellipse((i*3)*sin(i/0.4)+mouseX, (i*3)*cos(i/0.4)+mouseY, mouseX/2, mouseX/2);

  // biggest ellipse's psuedo stroke
  stroke(255-mouseX/4, mouseY/4, mouseX/4, 255-mouseY/4);
  strokeWeight(1); 
  ellipse((i*3)*sin(i/0.4)+mouseX, (i*3)*cos(i/0.4)+mouseY, mouseX/2+10, mouseX/2+10);

  // 2rd biggest ellipse
  fill(0, mouseY/4);
  strokeWeight(1);
  stroke(mouseX/4, 255-mouseY/4);
  ellipse((i*3)*sin(i/0.4)+mouseX, (i*3)*cos(i/0.4)+mouseY, mouseX/3, mouseX/3);
  i+= 0.5;


  // 3rd biggest ellipse
  stroke(255-mouseX/4, mouseY/4);
  ellipse((i*3)*sin(i/0.4)+mouseX, (i*3)*cos(i/0.4)+mouseY, mouseX/4, mouseX/4);

  //4th biggest ellipse 
  stroke(42, 175, 50);
  stroke(mouseX/4, 255-mouseY/4);
  ellipse((i*3)*sin(i/0.4)+mouseX, (i*3)*cos(i/0.4)+mouseY, 150, 150);


  // smallest ellipse
  stroke(255-mouseX/4, mouseY/4, mouseX/4, 255-mouseY/4);
  ellipse((i*3)*sin(i/0.4)+mouseX, (i*3)*cos(i/0.4)+mouseY, 100, 100);
}






void Animation6() { // Random Squares Animation
  quadrantFill();
  strokeWeight(mouseY/20); // interactive with mouse stroke weight

  quadrantBackground();
  rect(random(width), random(height), 375, 375);
}
void Animation7() { // Rectangular Cube Matrix with Stroke Mouse Interaction
  quadrantBackground();
  fill(#053B44); 
  background(#A53539, mouseY/4);
  strokeWeight(1);
  scale(sF2);
  for (int i = 0; i < width + 40 ; i += 40) {
    for (int j = 0; j < height + 40 ; j += 40) { // nested for loop to create rectangular grid
      rect(i, j, mouseX/10, mouseY/10);
    }

    sF2 = sF2 + (targetSF2 - sF2) * 0.0005; // scaling equation with easing to give motion to the grid
  }
}

void Animation8() { // random lines some with mouse interaction
  quadrantBackground();
  strokeWeight(15);
  fill(#053B44);
  line(random(mouseX), random(mouseY), width/2, height/2);



  strokeWeight(15);
  fill(#053B44);
  line(mouseX, random(-mouseY), width/2, height/2);

  strokeWeight(15);
  fill(#053B44);
  line(random(mouseX), mouseY, width/2, height/2);

  strokeWeight(15);
  fill(#053B44);
  line(random(mouseY), random(width), width/2, height/2);
}

void Animation9() { // line of rectangle that shrink and are mouse interactive
  fill(255, 0);
  stroke(#053B44);
 quadrantBackground();
  strokeWeight(mouseY/50);
  fill(#EAD075, mouseX/6); // fill with yellow
  for (int i = 0; i < width ; i += 15) { // loop to create lots of rectangles
    rect(width/2, i, rW2, rH2);
  }
  rW2 = rW2 + (targetRW2 - rW2) * 0.007;  // easing algorithm to control the shrinking of the rectangles
}
void Animation10() { // lines of parrallel rectangles that's stroke grows over the course of the animation
  fill(#EAD075);
  background(#053B44); 

  for (int i = -20; i < width +20 ; i += 20) { // loop to create rectangles
    rect(i, 0, 3, height*2);
    if ((mouseY > height/2) && (mouseX > width /2)) { // interactive stroke colouring depending on quadrants
      //background(#EAD075);
      stroke(#A53539);
    }
    if ((mouseY > height/2) && (mouseX < width /2)) {
      stroke(#B9543C);
    }
    if ((mouseY < height/2) && (mouseX < width /2)) {
      stroke(#06736C);
    }
    if ((mouseY < height/2) && (mouseX > width/2)) {
      stroke(#EAD075);
    }
  }
  strokeWeight(sW1);
  sW1 = sW1 + (targetSW1 - sW1) * 0.005; // stroke weight scalling equation with easing

}



void Animation11() {
  quadrantBackground();
  stroke(5);
  for (int k = 0; k < width*4 ; k += 15) {// loop to back lines (rectangles)
  rect(k, 0, 20, height*4);
  }
  quadrantFill();
  strokeWeight(2);
  scale(sF3);
  for (int i = 0; i < width ; i += 20) {
    for (int j = 0; j < width ; j += 20) { // nested forloop to create the front grid of squares
      rect(i, j, 10, 10);
    }
    sF3 = sF3 + (targetSF3 + sF3) * 0.0003; // easing algorithm for scaling the front grid of rectangles
  }
}
void Animation12() { //fade out
  fill(colour2);
  rect(width/2, height/2, width, height);
  colour2 = colour2 + (targetColour2 + colour2) * 0.01; // easing equation to control the change from black to white of the screen
}

void quadrantBackground() { // function to make the 4 quadrants of the screen turn different colours depending on the mouse position
  if ((mouseY > height/2) && (mouseX > width /2)) {
    //background(#EAD075);
    background(#A53539);
  }
  if ((mouseY > height/2) && (mouseX < width /2)) {
    background(#B9543C);
  }
  if ((mouseY < height/2) && (mouseX < width /2)) {
    background(#06736C);
  }
  if ((mouseY < height/2) && (mouseX > width/2)) {
    background(#EAD075);
  }
}

void quadrantFill() { // function to make the fill of the animations relative to the mouse position within on of the 4 quadrants
  if ((mouseY > height/2) && (mouseX > width /2)) {
    //background(#EAD075);
    fill(#EAD075);
  }
  if ((mouseY > height/2) && (mouseX < width /2)) {
    fill(#A53539);
  }
  if ((mouseY < height/2) && (mouseX < width /2)) {
    fill(#B9543C);
  }
  if ((mouseY < height/2) && (mouseX > width/2)) {
    fill(#06736C);
  }
}



