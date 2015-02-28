
// Title: "Billy Bear Ham Disco" - 14/11/12
// Author: Joseph Dominic McLaughlin 
// 
// Description:
// An animated and interactive version of the "Ham Bear" created in my previous Creative Coding assignment. 
// The bear now bounces across the screen with a colourful and changing psychedelic grid in the background. 
//
// Mouse controls: 
// Left/Right: controls direction of bear / also changes the background colour.
// Click: Makes the bear bounce higher.
//
// Keyboard controls: 
// Q - Stretch bear
// A - Shrink bear

///////////////////////////////////////////////////////

// GLOBAL VARIABLES

// initial x/y positions of bear
float x = 200; // 
float y = 0; // 

// variables used for the physics in "bearBounce" function
float ySpeed = 2; // 
float yGravity = 0.09; // 

// variables used for the speed of the strokeweight change in the "grid" function
int s = 0; //  
int strokeSpeed = 1; // 

// variable to enable stretching of the bears face
int wide = 10; 

///////////////////////////////////////////////////////

// SKETCH INITIALISATION 

void setup() {
  size (1000, 750); 
  background(0); 
  //smooth();  /* with smooth on, the sketch framerate slowed too much, so I chose to leave it off. */ 
  ellipseMode(CENTER); 
  rectMode(CENTER);
}


void draw() {
  background(255, mouseX/4, mouseX/8); // mouseX position manipulates the background color 
  grid();
//neck();  /* I created a neck for the bear, but chose to leave it out. */
  bear();
  bearBounce();
  stretch();
  movement();
  lifter();
}

///////////////////////////////////////////////////////

// FUNCTIONS 

void disco() {
  // Used to animate the strokeWeight of shapes created within the "grid" function.
  strokeWeight(abs(s));
  if (s > -50) {
    s = s + strokeSpeed; 
    if (s > 50 || s <= -49) {
      strokeSpeed = strokeSpeed * -1;
    }
  }
}


void grid() {
  // A grid of rectangles used as the background for the sketch. Includes a call to the "disco" function to enable animation.
  disco(); 
  stroke(0);
  for (int i = 0; i < width+40; i+=50) {
    for (int j = 0; j < height+40; j+=50) {
      noFill();
      rect(i, j, 100, 100);
    }
  }
} 


void bearBounce() {
  // Physics used to bounce the bear's y position.
  y = y + ySpeed;
  ySpeed = ySpeed + yGravity;
  if (y > height-540) {
    y = height-540;
    ySpeed = ySpeed * -.85;
  }
}


void lifter() {
  // When the mouse is clicked, the bear's y position will decrease and cause the bear to bounce higher.
  if (mousePressed) {
    y = y - 3;
  }
}


void movement() { 
  // Enables the bear to move left and right depending on the position of mouseX.
  if (mouseX > width/2) { // Left
    x = x + 3;
  } 
  else if (mouseX < width/2) { // Right
    x = x - 3;
  }
  // Limits the function to keep the x position of the bear within the confines of the sketch window.
  x = constrain(x, -30, 445);
}


void stretch() {
  // Enables the bear to grow or shrink using the using the "A" + "Q" keys.  
  if (keyPressed) { 
    if (key == 'a' || key == 'A') { // Shrink
      wide = wide - 2;
    } 
    else if (key == 'q' || key == 'Q') { // Grow
      wide = wide + 2;
    }
  }
 // Limits the function to stop the bear's face stretching too much.
  wide = constrain(wide, 0, 80);
}


void bear() {
  // Shapes used to create the bear. 
  // The x position of the bear is controlled by mouseX (see the "movement" function).
  // It's y position is controlled by the ySpeed and yGravity variables (see the "bearBounce" function) and also the "lifter" function. 
  // The width and height of the bear are manipulated using the "wide" variable (see the "stretch" function).
  noStroke();
  // Head 
  fill(173, 136, 118);  
  ellipse(x+294, y+209, 440+wide, 340+wide); // Forehead
  ellipse(x+294, y+380, 530+wide, 395+wide); // Lower head
  ellipse (x+156, y+112, 164+wide, 183+wide); // Left ear
  ellipse (x+434, y+112, 164+wide, 183+wide); // Right ear
  // Face
  fill(223, 175, 150);
  ellipse (x+300, y+394, 282+wide, 261+wide); // Cheeks 
  ellipse (x+300, y+464, 171+wide, 163+wide); // Lower mouth
  ellipse (x+232, y+234, 102+wide, 136+wide); // Left eye socket
  ellipse (x+372, y+234, 102+wide, 136+wide); // Right eye socket
  // Eyeballs
  fill(138, 89, 82);
  ellipse(x+239, y+230, 65+wide, 100+wide); // Left eyeball
  ellipse(x+367, y+230, 65+wide, 100+wide); // Right eyeball
  // Eyeball fix 
  fill(223, 175, 150);         
  ellipse(x+300, y+367, 242+wide, 242+wide);
  // Bear's nose and mouth
  fill(138, 89, 82);
  ellipse(x+300, y+318, 93+wide, 93); // Nose
  ellipse(x+300, y+477, 93+wide, 93+wide); // Mouth
  // Mouth fix
  fill(223, 175, 150);
  rect(x+300, y+450, 108+wide, 64+wide);
}


void neck() {
  // A 'neck' for the bear that stretches from it's current x/y position to the bottom-middle of the screen.
  stroke(173, 136, 118); 
  strokeWeight(300);
  line(x+300, y+477, width/2, height+200);
}

