
/* Assignment #3
 * Name: Justin Wei
 * E-mail: jwei@haverford.edu
 * Course: CS 110 - Section #2
 * Submitted: 2/15/12
 
 * I used for-loops to create the pacman game environment, including the barriers
 and the pacdots that Pacman is trying to eat. I used primitives to create Pacman 
 himself and used conditionals to make Pacman move around the environment. I did 
 run into a problem, in that Pacman will exit the environment after making one
 loop around the box. */

//speed in X and Y directions
float spdX, spdY; 
float px, py, pw, ph;
 
void setup() {
  size(900, 750); 
  background(0);
  
  px = random(width/16, width-width/16); 
  py = height-height/16;
  pw = width/12;
  ph = height/12;
  //specifies speeds in X and Y directions
  spdX = 4;
  spdY = 0;
}

void drawbarriers (float x, float y, float w, float h) {
  rectMode(CENTER);
  fill(0);
  stroke(83, 63, 215);
  strokeWeight(4);

  //for-loop draws 3 barriers on the left
  for (int i=0; i<3; i++) {
    rect(x, y+i*(7*height/24), w, h);
  }

  //for-loop draws 3 barriers on the right
  for (int i=0; i<3; i++) {
    rect(x+4*width/9, y+i*(7*height/24), w, h);
  }
}

//creates a function to draw the small white pacdots
void drawpacdots (float x1, float y1, float w1, float h1) {
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  smooth();

  //for-loop draws first row of pacdots
  for (int i=0; i<13; i++) {
    ellipse(x1+x1*1.33*i, y1, w1, h1);
  }

  //for-loops draw second row of pacdots
  for (int i=1; i<6; i++) {
    ellipse(x1+x1*1.33*i, 17*y1/3, w1, h1);
  }
  for (int i=7; i<12; i++) {
    ellipse(x1+x1*1.33*i, 17*y1/3, w1, h1);
  }

  //for-loops draw third row of pacdots
  for (int i=1; i<6; i++) {
    ellipse(x1+x1*1.33*i, 31.5*y1/3, w1, h1);
  }
  for (int i=7; i<12; i++) {
    ellipse(x1+x1*1.33*i, 31.5*y1/3, w1, h1);
  }

  //for-loops draw fourth row of pacdots
  for (int i=1; i<6; i++) {
    ellipse(x1+x1*1.33*i, 45.5*y1/3, w1, h1);
  }
  for (int i=7; i<12; i++) {
    ellipse(x1+x1*1.33*i, 45.5*y1/3, w1, h1);
  }

  //for-loop draws first column of pacdots
  for (int i=1; i<12; i++) {
    ellipse(x1, y1+y1*1.287*i, w1, h1);
  }

  //for-loop draws second column of pacdots
  for (int i=1; i<12; i++) {
    ellipse(x1+x1*7.98, y1+y1*1.287*i, w1, h1);
  }

  //for-loop draws third column of pacdots
  for (int i=1; i<12; i++) {
    ellipse(x1+x1*15.96, y1+y1*1.287*i, w1, h1);
  }
}

void draw(){
  background(0);
  
  //creates blue outer boundary
  rectMode(CENTER);
  fill(0);
  stroke(83, 63, 215);
  strokeWeight(8);
  rect(width/2, height/2, width, height);

  //executes function to draw the 6 barriers within the boundary
  drawbarriers(5*width/18, 5*height/24, width/3, height/6);

  //executes function to draw the white pac-dots or pellets
  drawpacdots(width/18, height/16, width/60, height/60);

  //draws the large pac-dot in the upper-left hand corner 
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  smooth();
  ellipse(width/18, height/16, width/18, height/18);


  //creates pacman's shape
  fill(232, 239, 40);
  ellipseMode(CENTER);
  noStroke();
  ellipse(px, py, pw, ph);
  fill(0);
  triangle(px, py, px+pw/1.828427125, py-pw/1.828427125,
  px+pw/1.828427125, py+pw/1.828427125);
  
  
  px = px + spdX;
  py = py + spdY;
  
  //reaching right edge, go up
  if (px + pw/2 > width-width/60) {
    spdX = 0; 
    spdY = -4;
  }
  
  //reaching top edge, go left
  if (py - ph/2 < height/50) {
    spdY = 0;
    spdX = -4;
  }
  
  //reaching left edge, go down
  if (px - pw/2 < width/60) {
    spdX = 0;
    spdY = 4;
  }

  //reaching bottom edge, go right
  if (py + ph/2 > height-height/50) {
    spdY = 0;
    spdX = 4;
  }  
  
  
   
  

  
}
 
 


