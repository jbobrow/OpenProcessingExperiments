
/*
Kaito Gengo
Exercise 2: Repetition and Variation
This program creates random shapes everytime it launches
*/

size(400, 400);
int originX = 200; // origin X point of the line
int originY = 0; // origin Y point of the line
int endX = 400; // end X point of the line
int endY = 200; // end Y point of the line

int ellipLoc = 200; // location of ellipses

colorMode(HSB, 360, 100, 100, 100); // (360 degree, 100%, 100%, 100%)
float hue, sat, bright, alpha;
background(0, 0, 10, 100);
hue = random(360); // sets random color
sat = 25;
bright = 100;
alpha = 25;
int countA = 0; // substraction number for Alpha
float addHue = 4; // add hue by 4


noFill();

// background pattern based on different size of ellipses
for(int k = 0; k <= 50; k++){
  float randXY = random(-400, 400); //location of random X and Y
  float randWidth = random(400);
  float randHeight = random(400, 800);
  float randFill = (100);
  noStroke();
  fill(0, 0, randFill, 2);
  ellipse (200 + randXY, 200 + randXY, randWidth, randHeight);
  
}

//bezier line patterns
float bezierRand = random(300); // random number for bezier shape
for(int i = 0; i <= 200; i = i + 5){
  countA++;
  stroke(hue, sat, bright, alpha - countA);
  bezier(originX + i, originY, originX + i, originY + bezierRand, endX, endY + i - bezierRand, endX, endY + i);
  bezier(endX, endY + i, endX - bezierRand, endY + i, originX - i + bezierRand, endX, originX - i, endX);
  bezier(originX - i, endX, originX - i, endX - bezierRand, originY, endY - i + bezierRand, originY, endY - i);
  bezier(originY, originX - i, originY + bezierRand, originX - i, endY + i - bezierRand, originY, endY + i, originY);
  hue = hue + addHue;
  if(hue > 356){
    hue = 0;
  }
}

alpha = 100; // resets alpha
float randomLorF = random(4);
// random numbers of circle shapes of line or fill in the center
float ellipRand = random(50, 350); // random number for ellipse
for(float j = ellipRand; j >= 0; j = j - 10){
  float LocRandX = random(-5, 5);
  float LocRandY = random(-5, 5);
  if(randomLorF <= 2){
  noStroke();
  fill(hue, 75, bright, alpha - 50 - countA);
  } else {
  noStroke();
  stroke(hue, 75, bright, alpha - countA);
  }
  ellipse (ellipLoc + LocRandX, ellipLoc + LocRandY, ellipRand - j, ellipRand - j);
  hue = hue + addHue;
  if(hue > 356){
    hue = 0;
  }
}
/*
//text
fill(hue, 75, bright, alpha - countA);
PFont font;
font = loadFont("Didot-48.vlw");
textFont(font, 24);
textAlign(CENTER);
int d = day();
int m = month();
int y = year();
String s = String.valueOf(m) + "."  + String.valueOf(d) + "." + String.valueOf(y);
textAlign(CENTER);
text(s, 200, 360);
textSize(18);
s = "REPETITION and VARIATION";
text(s, 200, 385);
*/


