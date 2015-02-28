
PFont sketchy;
PFont fontA;
PImage DINO;
PImage FERG;
int oldMouseX, oldMouseY;
int myPenWeight;
int R, G, B;
int R1, G1, B1;
int R2, G2, B2;
int R3, G3, B3;
int R4, G4, B4;
int R5, G5, B5;
int R6, G6, B6;
int R7, G7, B7;
int R8, G8, B8;
int R9, G9, B9;
int R10, G10, B10;
int R11, G11, B11;
int R12, G12, B12;
int R13, G13, B13;
float R14, G14, B14;
float R15, G15, B15;

int RAN;
int x, y;
int velocityX, velocityY;

color myPenStroke;

void setup(){
  size (560, 720);
  DINO = loadImage("DINO.png");
  FERG = loadImage("FERG.png");
  R15 = 255; 
  G15 = 255;
  B15 = 255;
  background(R15, G15, B15);
  smooth();
  fontA = loadFont("sketchy16_2.vlw");
  sketchy = loadFont("sketchy30_font.vlw");
  oldMouseX = 0;
  oldMouseY = 0;
  myPenStroke = (2);
  myPenWeight = (1);
  R = 255;
  G = 0;
  B = 0;
  R1 = 0; 
  G1 = 0;
  B1 = 255;
  R2 = 0;
  G2 = 255;
  B2 = 0;
  R3 = 255;
  G3 = 255;
  B3 = 0;
  R4 = 255;
  G4 = 100;
  B4 = 0;
  R5 = 150; 
  G5 = 0;
  B5 = 255;
  R6 = 220; 
  G6 = 0;
  B6 = 0;
  R7 = 0;
  G7 = 0;
  B7 = 220;
  R8 = 0; 
  G8 = 220;
  B8 = 0;
  R9 = 255; 
  G9 = 255;
  B9 = 0;
  R10 = 255; 
  G10 = 150; 
  B10 = 0;
  R11 = 150; 
  G11 = 0;
  B11 = 255;
  R12 = 255; 
  G12 = 255;
  B12 = 255;
  R13 = 0;
  G13 = 0;
  B13 = 0;
  R14 = random(255);
  G14 = random(255);
  B14 = random(255);
  x = 75;
  y = 150;
  velocityX = int(random(-5,5));
  velocityY = int(random(-4,4));
  
  
}

void draw () {
 fill(255);
 noStroke();
 rect(0, 0, 580, 45);
 rect(0, 680, 580, 720);
 textFont(fontA, 14);
 fill(215, 215, 215);
 text("sketchy v1.0", 5, 17);
 textFont(fontA, 16);
 fill(0);
 text("TINTS", 102, 17);
 text("SHADES", 305, 17);
 text("W/B/?", 463, 17);
 //text bottom bar
 //text("RESET  ERASER  - WIDTH +     HOLD ME?    PARTY?   MY HUMPS?", 30, 715);
 strokeWeight(myPenWeight);
 stroke(myPenStroke);
 if (mousePressed){
  if (oldMouseX != mouseX || oldMouseY != mouseY) {
   line(mouseX, mouseY, oldMouseX, oldMouseY);
  }
 }

oldMouseX = mouseX;
oldMouseY = mouseY;

//top bar colors
fill(157,133,108);
noStroke();
ellipse(20, 40, 35, 35);
rect(20, 22, 518, 36);
ellipse(540, 40, 35, 35);
//bottom bar additionals
ellipse(20, 680, 35, 35);
rect(20, 662, 518, 36);
ellipse(540, 680, 35, 35);

//Color red tints
fill(R, G, B);
stroke(R, G, B);
strokeWeight(1);
rect(35, 27, 25, 25);
if(mousePressed && mouseX > 35 && mouseX < 60 && mouseY > 27 && mouseY < 52 ) {
  G = G + 5;
  B = B + 5;
  if( G > 200 && B > 200){
    G = 0;
    B = 0;
  }
  myPenStroke = color(R,G,B);
}

//Color blue tints
fill(R1, G1, B1);
stroke(R1, G1, B1);
strokeWeight(1);
rect(65, 27, 25, 25);
if(mousePressed && mouseX > 65 && mouseX < 90 && mouseY > 27 && mouseY < 52 ) {
  R1 = R1 + 5;
  G1 = G1 + 5;
  if( R1 > 200 && G1 > 200){
    R1 = 0;
    G1 = 0;
  }
  myPenStroke = color(R1,G1,B1);
}

//Color green tints
fill(R2, G2, B2);
stroke(R2, G2, B2);
strokeWeight(1);
rect(95, 27, 25, 25);
if(mousePressed && mouseX > 95 && mouseX < 120 && mouseY > 27 && mouseY < 52 ) {
  R2 = R2 + 5;
  B2 = B2 + 5;
  if( R2 > 200 && B2 > 200){
    R2 = 0;
    B2 = 0;
  }
  myPenStroke = color(R2, G2, B2);
}

//Color yellow tints
fill(R3, G3, B3);
stroke(R3, G3, B3);
strokeWeight(1);
rect(125, 27, 25, 25);
if(mousePressed && mouseX > 125 && mouseX < 150 && mouseY > 27 && mouseY < 52 ) {
B3 = B3 + 5;
  
  if(B3 > 200){
    R3 = 255;
    G3 = 255;
    B3 = 0;
  }
  myPenStroke = color(R3, G3, B3);
}

//Color orange tint
fill(R4, G4, B4);
stroke(R4, G4, B4);
strokeWeight(1);
rect(155, 27, 25, 25);
if(mousePressed && mouseX > 155 && mouseX < 180 && mouseY > 27 && mouseY < 52 ) {
G4 = G4 + 3;
B4 = B4 + 5;
  
  if(R4 > 200 && B4 > 100){
    R4 = 255;
    G4 = 100;
    B4 = 0;
  }
  myPenStroke = color(R4, G4, B4);
}
  
//Color purple tint
fill(R5, G5, B5);
stroke(R5, G5, B5);
strokeWeight(1);
rect(185, 27, 25, 25);
if(mousePressed && mouseX > 185 && mouseX < 215 && mouseY > 27 && mouseY < 52 ) {
R5 = R5 + 3;
G5 = G5 + 5;
  
  if(R5 > 225 && G5 > 100){
    R5 = 150;
    G5 = 0;
    B5 = 255;
  }
  myPenStroke = color(R5, G5, B5);
}

//Color red shade
fill(R6, G6, B6);
stroke(R6, G6, B6);
strokeWeight(1);
rect(240, 27, 25, 25);
if(mousePressed && mouseX > 240 && mouseX < 265 && mouseY > 27 && mouseY < 52 ) {
R6 = R6 - 5;
  
  if(R6 < 75){
    R6 = 220;
    G6 = 0;
    B6 = 0;
  }
  myPenStroke = color(R6, G6, B6);
}

//Color blue shade
fill(R7, G7, B7);
stroke(R7, G7, B7);
strokeWeight(1);
rect(270, 27, 25, 25);
if(mousePressed && mouseX > 270 && mouseX < 295 && mouseY > 27 && mouseY < 52 ) {
B7 = B7 - 5;
  
  if(B7 < 75){
    R7 = 0;
    G7 = 0;
    B7 = 220;
  }
  myPenStroke = color(R7, G7, B7);
}
  
//Color green shade
fill(R8, G8, B8);
stroke(R8, G8, B8);
strokeWeight(1);
rect(300, 27, 25, 25);
if(mousePressed && mouseX > 300 && mouseX < 325 && mouseY > 27 && mouseY < 52 ) {
G8 = G8 - 5;
  
  if(G8 < 75){
    R8 = 0;
    G8 = 220;
    B8 = 0;
  }
  myPenStroke = color(R8, G8, B8);
}
 
//Color yellow shade
fill(R9, G9, B9);
stroke(R9, G9, B9);
strokeWeight(1);
rect(330, 27, 25, 25);
if(mousePressed && mouseX > 330 && mouseX < 355 && mouseY > 27 && mouseY < 52 ) {
R9 = R9 - 5;
G9 = G9 - 5;
  
  if(R9 < 75 && G9 < 75){
    R9 = 225;
    G9 = 225;
    B9 = 0;
  }
  myPenStroke = color(R9, G9, B9);
}

//Color orange shade
fill(R10, G10, B10);
stroke(R10, G10, B10);
strokeWeight(1);
rect(360, 27, 25, 25);
if(mousePressed && mouseX > 360 && mouseX < 385 && mouseY > 27 && mouseY < 52 ) {
R10 = R10 - 5;
G10 = G10 - 5;
  
  if(R10 < 75 && G10 < 25){
    R10 = 255;
    G10 = 150;
    B10 = 0;
  }
  myPenStroke = color(R10, G10, B10);
}

//Color purple shade
fill(R11, G11, B11);
stroke(R11, G11, B11);
strokeWeight(1);
rect(390, 27, 25, 25);
if(mousePressed && mouseX > 390 && mouseX < 415 && mouseY > 27 && mouseY < 52 ) {
R11 = R11 - 5;
B11 = B11 - 5;
  
  if(R11 < 25 && B11 < 75){
    R11 = 150;
    G11 = 0;
    B11 = 255;
  }
  myPenStroke = color(R11, G11, B11);
}

//Color white

if( button(440, 27, R12, G12, B12, 27, 20) ) {
R12 = R12 - 3;
G12 = G12 - 3;
B12 = B12 - 3;
  
  if(R12 < 175 && G12 < 175 && B12 < 175){
    R12 = 255;
    G12 = 255;
    B12 = 255;
  }
  myPenStroke = color(R12, G12, B12);
}
  
//Color black


if(button(470, 27, R13, G13, B13, 25, 25) ) {
R13 = R13 + 2;
G13 = G13 + 2;
B13 = B13 + 2;
  
  if(R13 > 175 && G13 > 175 && B13 > 175){
    R13 = 0;
    G13 = 0;
    B13 = 0;
  }
  myPenStroke = color(R13, G13, B13);
}
 
//Color random
fill(R14, G14, B14);
stroke(R14, G14, B14);
strokeWeight(1);
rect(500, 27, 25, 25);
if(mousePressed && mouseX > 500 && mouseX < 525 && mouseY > 27 && mouseY < 52 ) {
R14 = random(255);
G14 = random(255);
B14 = random(255);
/*if(R14 >= 255 || G14 >= 255 || B14 >= 255 ){
  R14 = random(255);
  G14 = random(255);
  B14 = random(255);
}
if(R14 == 0 || G14 == 0 || B14 == 0){
  R14 = random(255);
  G14 = random(255);
  B14 = random(255);
}*/
myPenStroke = color(R14, G14, B14);
}
 
//background reset button
noFill();
noStroke();
strokeWeight(1);
ellipse(50, 680, 35, 35);
if(mousePressed && dist(50, 680, mouseX, mouseY) < 18){
  background(255);
  }
  
//eraser button
noFill();
noStroke();
strokeWeight(1);
ellipse(110, 680, 35, 35);
if(mousePressed && dist(110, 680, mouseX, mouseY) < 18){
  myPenStroke = color(255, 255, 255);
  myPenWeight = 10;
  }
  
//pen stroke decrease
noFill();
noStroke();
strokeWeight(1);
ellipse(155, 680, 10, 10);
if(mousePressed && dist(155, 680, mouseX, mouseY) < 5){
  if(myPenWeight > 0){
  myPenWeight  --;
  }
}

//pen stroke decrease
noFill();
noStroke();
strokeWeight(1);
ellipse(217, 680, 20, 20);
if(mousePressed && dist(217, 680, mouseX, mouseY) < 10){
  if(myPenWeight < 10){
  myPenWeight = myPenWeight + 1;
  }
}

//random draw
noFill();
noStroke();
strokeWeight(1);
ellipse(290, 680, 35, 35);
if(mousePressed && dist(290, 680, mouseX, mouseY) < 18){  
  noStroke();
  fill(myPenStroke);
  ellipse(x, y, 20, 20);
  x += velocityX;
  y += velocityY;
 
  if (x > width - 5 || x < 5) {
    velocityX *= -1;
  }
  if (y > width - 5 || y < 5) {
    velocityY *= -1;
  }

}

//random background
noFill();
noStroke();
strokeWeight(1);
ellipse(380, 680, 35, 35);
if(mousePressed && dist(380, 680, mouseX, mouseY) < 18){
R15 = random(255);
G15 = random(255);
B15 = random(255);
background(R15, G15, B15);

}
//fergie button
noFill();
noStroke();
strokeWeight(1);
ellipse(464, 680, 60, 35);
if(mousePressed && dist(468, 680, mouseX, mouseY) < 25){
  image(FERG, 0, 0);


}
fill(0);
text("RESET  ERASER  - WIDTH +     HOLD ME?    PARTY?   MY HUMPS?", 30, 686);
}

boolean button(int buttx, int butty, int buttR, int buttG,int buttB, int sizeX, int sizeY) {
  fill(buttR, buttG, buttB);
  stroke(buttR, buttG, buttB);
  strokeWeight(1);
  rect(buttx, butty, sizeX, 25);
  boolean hit = false;
  if(mousePressed && mouseX > buttx && mouseX < buttx+sizeX && mouseY > butty && mouseY < butty+25) hit = true;
  return (hit);
}


