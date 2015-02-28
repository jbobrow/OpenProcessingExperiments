
//Assigning variables.

float move_x1; //The amount Circle 1 and Rect 1 move left goes along the x-axis.
float move_y1; //The amount Circle 2 and Rect 1 go up goes along the y-axis.
float move_x2;
float move_y2;
float move_x3;
float move_y3;
float move_x4;
float move_y4;
float tug; // Changes ellipse shape. Acts like the radius.
float blink; //Changes black ellipse shape.

float rotAng; //The angle by which the animation rotates.
PImage Majeye; //Identifying variable for eye image.
float eyemove; //The amount the second eye moves.


//Creating Setup.

void setup(){
  size(800,800);
  background(229,0,161);
  frameRate(300);
  move_x1 = 200; //Establishing the initial values for variables.
  move_y1 = 200;
  move_x2 = 600;
  move_y2 = 600;
  move_x3 = 1000;
  move_y3 = 1000;
  move_x4 = 1400;
  move_y4 = 1400;
  rotAng = 0;
  Majeye = loadImage("Majoraeye.jpg");
  eyemove = 400;
  tug = PI;
  blink = PI;
}

//Creating animation.
void draw() {
  translate(width/2, width/2); //Allowing the origin to move about the screen.
  
  rotate(rotAng); //Creating rotation.
  rotAng = rotAng + 0.5;
  
  
  
  //LAYER ONE.

  //L1 Circle 1
  noStroke();
  smooth();
  colorMode(HSB,360,100,100); //Changing to HSB in order to create spectrum of red to yellow.
  fill(random(0,60),80,100);
  ellipse(move_x1,0,50,50);
  move_x1 = move_x1 + 1;
  if(move_x1 > 1600) {
    move_x1 = 200;
  }
  
  //L1 Circle 2
  ellipse(0,move_y1, 50, 50);
  move_y1 = move_y1 + 1;
  if(move_y1 > 1600) {
    move_y1 = 200;
  }
  
  //L1 Rect
  rectMode(CORNER);
  rect(move_x1, 10, 60, 60);
  
  
  
  //LAYER TWO.
  
  //L2 Circle 1
  fill(random(280,320),100,100);
  ellipse(move_x2,0,80,80);
  move_x2 = move_x2 + 1;
  if(move_x2 > 1600) {
    move_x2 = 200;
  }
  
  //L2 Circle 2
  ellipse(0,move_y2, 80, 80);
  move_y2 = move_y2 + 1;
  if(move_y2 > 1600) {
    move_y2 = 200;
  }
  
  //LAYER 3
  
  //L3 Rect 1
  fill(random(120,170),100,80);
  rect(move_x3,0,50,50);
  move_x3 = move_x3 + 1;
  if(move_x3 > 1650) {
    move_x3 = 200;
  }
  
  //L3 Rect 2
  rect(0,move_y3,70,70);
  move_y3 = move_y3 + 1;
  if(move_y3 > 1600) {
    move_y3 = 200;
  }
  
  //LAYER FOUR.
  
  //L4 Rect 1
  fill(53,97,random(30,80));
  rect(move_x4,0,90,110);
  move_x4 = move_x4 + 1;
  if(move_x4 > 1600) {
    move_x4 = 200;
  }
  
  rect(0,move_y4,50,60);
  move_y4 = move_y4 + 1;
  if(move_y4 > 1600) {
    move_y4 = 200;
  }
  
  //CONSTANT ANIMATION.
  
  
  //Center eye
  image(Majeye,0,0);
  
  //Outer eye
  image(Majeye, eyemove, 0);
  eyemove = eyemove - 1;
  if(eyemove < 380) {
    eyemove = 400;
  }
  
  //Inner purple rectangle.
  fill(random(286,317),80,80);
  rectMode(CENTER);
  rect(0,0,50,50);
  
  //Inner changing circle.
  ellipse(0,0,sin(tug)*70,sin(tug)*70);
  tug = tug + 0.01;
  
  fill(0);
  ellipse(0,0,sin(blink)*500,sin(0.5*blink)*500);
  blink = blink + 0.001;
  
  image(Majeye,-110,-110);
  
}

