
/* Avatar sketch using variables and conditionals
   January 18, 2011
   Art 479
*/

//boolean
boolean dance = false;

//color and alpha variables
int r = 255; 
int g = 255; 
int b = 255;
int a = 100;
int h = 359;
int s = 100;
int hsB = 100;
int black = 0;
int white = color(255);
int dkPurple = color(155,80,138);
int purple = color(216,120,196);
int danceH = 311; //HSB color codes for when monster dances
int danceS = 44;
int danceB = 83;

//background image variables
float backColor = 175;
float backRect;
float backRectColor = 100;
float backY = 140;

//monster variables
float head = 121;
float monsterX = 100;
float monsterY = 100;
float bodyW = 121;
float bodyH = 67;
float feetW = 148;
float feetH = 44;
float eyesX = 81;
float eyesY = 81;
float eyesD = 15;
float highlight = 2.5;
float mouthStroke = 15;
float mouthXa = 64.689; //bezier curve coordinates
float mouthYa = 125.919;
float mouthXb = 84.588;
float mouthYb = 140.286;
float mouthXc = 117.074;
float mouthYc = 110.964;
float mouthXd = 135.153;         
float mouthYd = 120.834;
float arcX = 100;
float arcY = 156;

//dance variables
float change = 3;
float colorChange = 1;

void setup() {
  size(200,200);
  rectMode(CENTER);
  background(backColor);
  noStroke();
  smooth();
}

 void keyPressed(){ //change color of background when 'b' key is pressed
  colorMode(HSB,h,s,hsB,a);
  
  if ((key == 'b') || (key == 'B')) {
      background(random(h),random(s - 75, s),random(hsB - 40,hsB)); 
      }
 }

void draw() {
  //wall stripes, move mouse left and right to add lines of varying width, 
  //move mouse up and down to increase and decrease brightness
  backRect = random(.5,2);
  colorMode(HSB,h,s,hsB,a);
  fill(random(h - 271,h - 175),s - 30,mouseY+(hsB - 75),random(a));
  rect(pmouseX,height/2,backRect,height);
  
  //click with the mouse to make the monster dance
  if (dance) { 
    colorMode(RGB,255,255,255);
    background(r - 77, g - 26, b - 172);
    
    frameRate(mouseX);
    
    colorMode(HSB,359,100,100); // monster gets red when dances faster
    purple = color(danceH + colorChange, danceS + colorChange, danceB);
      if (frameRate >= 51) {
        colorChange = colorChange +1;
      }
    
     if (frameRate <= 50) { //returns to normal color when dances at normal speed
        purple = color(danceH, danceS, danceB);
      }
  
    arcX = arcX + change;
      if (arcX >= 108 || arcX <= 92) {
        change = change * -1;
      }
    
    monsterX = monsterX + change;
      if (monsterX >= 108 || monsterX <= 92) {
        change = change * -1; 
      }
    
    eyesX = eyesX + change;
      if (eyesX >= 83 || eyesX <= 77) {
        change = change * -1;
      }
    
   mouthXa = mouthXa + change;
      if (mouthXa >= 63 || mouthXa <= 63) {
        change = change * -1;
      }
      
   mouthXb = mouthXb + change;
      if (mouthXb >= 84 || mouthXb <= 84) {
        change = change * -1;
      }
   
   mouthXc = mouthXc + change;
      if (mouthXc >= 117 || mouthXc <= 117) {
        change = change * -1;
      }
      
   mouthXd = mouthXd + change;
      if (mouthXd >= 134 || mouthXd <= 134) {
        change = change * -1;
      }
    
 }
  
  //ground
  backRect = 65;
  colorMode(RGB);
  fill(backRectColor);
  rect(width/2,height - height/7,width,backRect);
  
  backRect = 3;
  fill(backRectColor - 75);
  rect(width/2,backY,width,backRect);
  
  //Monster Black Outline
  fill(0);
  ellipse(monsterX,monsterY - 5, head + 18, head + 18);  //head
  rect(monsterX,monsterY + 29, bodyW + 18, bodyH + 18);  //body
  ellipse(monsterX,monsterY + 60, feetW + 18, feetH + 18);  //feet...not feet, just didn't know what to classify as
  
  //Monster Dark Purple Outline
  fill(dkPurple);
  ellipse(monsterX,monsterY - 5, head + 10, head + 10);  //head
  rect(monsterX,monsterY + 29, bodyW + 10, bodyH + 10);  //body
  ellipse(monsterX,monsterY + 60, feetW + 10, feetH + 10);  //feet...not feet, just didn't know what to classify as
  
  //Monster Body
  fill(purple);
  ellipse(monsterX,monsterY - 5, head,head);  
  rect(monsterX,monsterY + 29, bodyW,bodyH);  
  ellipse(monsterX,monsterY + 60, feetW,feetH); 
  strokeWeight(5);
  stroke(dkPurple);
  arc(arcX, arcY, 110, 30, PI/2, PI); //highlight
  arc(arcX, arcY, 110, 30, 0, PI/2);
  noStroke();
  
  //Eyes
  fill(dkPurple); 
  ellipse(eyesX,eyesY, eyesD + 38, eyesD + 38);//left eye
  ellipse(eyesX + 40, eyesY -9, eyesD + 24, eyesD  + 24);//right eye
  
  fill(black); 
  ellipse(eyesX,eyesY, eyesD + 29, eyesD + 29);//left eye
  ellipse(eyesX + 40, eyesY -9, eyesD + 15, eyesD  + 15);//right eye
  
  fill(white); 
  ellipse(eyesX,eyesY, eyesD + 21, eyesD + 21);
  ellipse(eyesX + 40, eyesY -9, eyesD + 7, eyesD  + 7);
  
  fill(black); 
  ellipse(eyesX,eyesY, eyesD + 11, eyesD + 11);
  ellipse(eyesX + 40, eyesY -9, eyesD - 2, eyesD  - 2);
  
  fill(white); 
  ellipse(eyesX,eyesY, eyesD + 6, eyesD + 6);
  
  fill(black); 
  ellipse(eyesX,eyesY, eyesD, eyesD);
  
  //Eye highlights
  fill(white);
  ellipse(eyesX + 2, eyesY - 2, highlight + .5, highlight + .5);
  ellipse(eyesX + 42, eyesY - 11, highlight, highlight);
  
  //mouth
  noFill();
  strokeWeight(mouthStroke);
  stroke(dkPurple);
  bezier(mouthXa, mouthYa, mouthXb, mouthYb, mouthXc, mouthYc, mouthXd, mouthYd);
  
  noFill();
  strokeWeight(mouthStroke - 10);
  stroke(black);
  bezier(mouthXa, mouthYa, mouthXb, mouthYb, mouthXc, mouthYc, mouthXd, mouthYd);
  noStroke();
}

void mousePressed() {
  dance = true;
}

void mouseReleased() {
  dance = false;
}


