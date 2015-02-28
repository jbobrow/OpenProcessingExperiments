
//VARIABLES
int canvas = 200;
int canvasHalf = canvas/2;
int canvasZero = canvas - canvas;

int bgR = 110;
int bgG = 50;
int bgB = 5;
int bgColor = color(bgR,bgG,bgB);

int cheeseR = 255;
int cheeseG = 235;
int cheeseB = 50;
int cheeseColor = color(cheeseR,cheeseG,cheeseB);
int cheeseStroke = canvas/100;
int cheeseLineX = canvas;
int cheeseSharedY = canvasHalf + canvas/20;

int cheeseTriangleX1 = 15;
int cheeseTriangleX2 = 80;
int cheeseTriangleX3 = 40;
int cheeseTriangleY3 = 140;

int bunsR = 235;
int bunsG = 165;
int bunsB = 2;
int bunsColor = color(235,165,2);
int bunsOrigin = canvasZero;
int bunsTopY = canvasZero;
int bunsWidth = canvas;
int bunsHeight = 40;
int bunsBottomY = 170;

int sesameColor = 255;
int sesameWidth = 5;
int sesameHeight = 7;
int sesameY1 = canvas/20;
int sesameY2 = canvas/10;
int sesameY3 = canvas/8;
int sesameX1 = canvas/10;
int sesameX2 = canvas/4;
int sesameX3 = 65;

int lettuceR = 0;
int lettuceG = 200;
int lettuceB = 0;
int lettuceColor = color(lettuceR,lettuceG,lettuceB);
int lettuceX = 10;
int lettuceXorigin = 10;
int lettuceXIncrement = 20;
int lettuceTopY = 60;
int lettuceBottomY = 160;
int lettuceWidth = 20;
int lettuceHeight = 10;

int tomatoR = 200;
int tomatoG = 0;
int tomatoB = 0;
int tomatoColor = color(tomatoR,tomatoG,tomatoB);
int tomatoY1 = 40;
int tomatoY2 = 160;
int tomatoWidth = canvas;
int tomatoHeight = canvas/20;

int onionR = 140;
int onionG = 10;
int onionB = 160;
int onionColor = color(140,10,160);
int onionY = 50;
int onionHeight = 9;

int eyesColor = 255;
int eyesOtherColor = 0;
int eyesLargestDiameter = 25;
int eyesMediumDiameter = 12;
int eyesSmallestDiameter = 4;
int eyesX1 = 50;
int eyesX2 = 150;
int eyesX3 = eyesX1 + 3;
int eyesX4 = eyesX2 + 3;
int eyesY1 = 85;
int eyesY2 = 93;

int nosePosition = canvasHalf;
int noseWidth = 10;
int noseHeight = 4;

int condimentWidth = 5;
int ketchupR = 200;
int ketchupG = 0;
int ketchupB = 0;
int ketchupColor = color(ketchupR,ketchupG,ketchupB);
int mustardR = 220;
int mustardG = 195;
int mustardB = 0;
int mustardColor = color(mustardR,mustardG,mustardB);

void setup() {
  size(canvas,canvas);
  background(bgColor);
  smooth();
  frameRate(60);
  
  //CHEESE TONGUE
  stroke(cheeseColor);
  strokeWeight(cheeseStroke);
  line(canvasZero,cheeseSharedY,cheeseLineX,cheeseSharedY);
  fill(cheeseColor);
  triangle(cheeseTriangleX1,cheeseSharedY,cheeseTriangleX2,cheeseSharedY,cheeseTriangleX3,cheeseTriangleY3);
}

void draw() {
//BUNS
  noStroke();
  fill(bunsColor);
  rect(bunsOrigin,bunsTopY,bunsWidth,bunsHeight);
  rect(bunsOrigin,bunsBottomY,bunsWidth,bunsHeight);
  
//SESAME
  fill(sesameColor);
  ellipse(canvasHalf,sesameY2,sesameWidth,sesameHeight);
  ellipse(sesameX1,sesameY2,sesameWidth,sesameHeight);
  ellipse(sesameX2,sesameY1,sesameWidth,sesameHeight);
  ellipse(canvas - sesameX1,sesameY2,sesameWidth,sesameHeight);
  ellipse(canvas - sesameX2,sesameY1,sesameWidth,sesameHeight);
  ellipse(sesameX3,sesameY3,sesameWidth,sesameHeight);
  ellipse(canvas - sesameX3,sesameY3,sesameWidth,sesameHeight);
  
  
//LETTUCE
  fill(lettuceColor);
  
  if (lettuceX < canvas){
    //Top
    arc(lettuceX,lettuceTopY,lettuceWidth,lettuceHeight,PI/2,PI);
    arc(lettuceX,lettuceTopY,lettuceWidth,lettuceHeight,0,PI/2);
    
    //Bottom
    arc(lettuceX,lettuceBottomY,lettuceWidth,lettuceHeight,PI,TWO_PI-PI/2);
    arc(lettuceX,lettuceBottomY,lettuceWidth,lettuceHeight,TWO_PI-PI/2,TWO_PI);
    
    lettuceX = lettuceX + lettuceXIncrement;
  }
  
  
//TOMATOES
  fill(tomatoColor);
  rect(canvasZero,tomatoY1,canvas,tomatoHeight);
  rect(canvasZero,tomatoY2,canvas,tomatoHeight);
  
//ONIONS
  fill(onionColor);
  rect(canvasZero,onionY,canvas,onionHeight);
  
//EYES
  fill(eyesColor);
  ellipse(eyesX1,eyesY1,eyesLargestDiameter,eyesLargestDiameter);
  ellipse(eyesX2,eyesY1,eyesLargestDiameter,eyesLargestDiameter);
  fill(eyesOtherColor);
  ellipse(eyesX1,eyesY2,eyesMediumDiameter,eyesMediumDiameter);
  ellipse(eyesX2,eyesY2,eyesMediumDiameter,eyesMediumDiameter);
  fill(eyesColor);
  ellipse(eyesX3,eyesY2,eyesSmallestDiameter,eyesSmallestDiameter);
  ellipse(eyesX4,eyesY2,eyesSmallestDiameter,eyesSmallestDiameter);
  
//NOSE
  ellipse(nosePosition,nosePosition,noseWidth,noseHeight);

//CONDIMENTS
  if (mousePressed == true && keyPressed == false) {
  stroke(ketchupColor);
  strokeWeight(condimentWidth);
  line(pmouseX,pmouseY,mouseX,mouseY);
  }
  else if (mousePressed == true && keyPressed == true && key != 'e'){
    stroke(mustardColor);
    strokeWeight(condimentWidth);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (keyPressed == true && key == 'e'){
    background(bgColor);
    lettuceX = lettuceXorigin;

    //REDRAW CHEESE TONGUE
    stroke(cheeseColor);
    strokeWeight(cheeseStroke);
    line(canvasZero,cheeseSharedY,cheeseLineX,cheeseSharedY);
    fill(cheeseColor);
    triangle(cheeseTriangleX1,cheeseSharedY,cheeseTriangleX2,cheeseSharedY,cheeseTriangleX3,cheeseTriangleY3);
  }
  
} //end draw

