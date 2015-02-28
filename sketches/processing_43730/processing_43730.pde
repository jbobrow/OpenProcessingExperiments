
PFont sketchy;
PFont fontA;
PImage DINO;
PImage BACK;
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
int x, y, x1, y1;
int velocityX, velocityY;
 
color myPenStroke;

float angle = 0.0; // Current angle
float speed = 0.05; // Speed of motion
float radius = 40.0; // Range of motion
int myPenFill;
float XX = 50.0; // X-coordinate
float YY = 80.0; // Y-coordinate
 
void setup(){
  size (560, 720);
  DINO = loadImage("DINO.png");
  BACK = loadImage("BACK.jpg");
  R15 = 255;
  G15 = 255;
  B15 = 255;
  image(BACK, 0, 0);
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
  x1 = 5;
  y1 = 5;
  velocityX = int(random(-5,5));
  velocityY = int(random(-4,4));
  XX = random(560);
  YY = random(720);
   
  myPenFill = myPenStroke;
  
  randomSeed(0);
   
}
 
void draw () {
 noStroke();
 fill(200,200,200);
 rect(20, 26, 514, 27);
 strokeWeight(myPenWeight);
 stroke(myPenStroke);
 if (mousePressed){
  if (oldMouseX != mouseX || oldMouseY != mouseY) {
   line(mouseX, mouseY, oldMouseX, oldMouseY);
  }
 }
 
oldMouseX = mouseX;
oldMouseY = mouseY;
 
/*//top bar colors
fill(157,133,108);
noStroke();
ellipse(20, 40, 35, 35);
rect(20, 22, 518, 36);
ellipse(540, 40, 35, 35);
//bottom bar additionals
ellipse(20, 680, 35, 35);
rect(20, 662, 518, 36);
ellipse(540, 680, 35, 35);*/
 
//Color red tints
if(button(35, 27, R, G, B, 25, 25)) {
  G = G + 5;
  B = B + 5;
  if( G > 200 && B > 200){
    G = 0;
    B = 0;
  }
  myPenStroke = color(R,G,B);
}
 
//Color blue tints
if(button(65, 27, R1, G1, B1, 25, 25)) {
  R1 = R1 + 5;
  G1 = G1 + 5;
  if( R1 > 200 && G1 > 200){
    R1 = 0;
    G1 = 0;
  }
  myPenStroke = color(R1,G1,B1);
}
 
//Color green tints
if(button(95, 27, R2, G2, B2, 25, 25)) {
  R2 = R2 + 5;
  B2 = B2 + 5;
  if( R2 > 200 && B2 > 200){
    R2 = 0;
    B2 = 0;
  }
  myPenStroke = color(R2, G2, B2);
}
 
//Color yellow tints
if(button(125, 27, R3, G3, B3, 25, 25)) {
B3 = B3 + 5;
   
  if(B3 > 200){
    R3 = 255;
    G3 = 255;
    B3 = 0;
  }
  myPenStroke = color(R3, G3, B3);
}
 
//Color orange tint
if(button(155, 27, R4, G4, B4, 25, 25)) {
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
if(button(185, 27, R5, G5, B5, 25, 25)) {
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
if(button(240, 27, R6, G6, B6, 25, 25)) {
R6 = R6 - 5;
   
  if(R6 < 75){
    R6 = 220;
    G6 = 0;
    B6 = 0;
  }
  myPenStroke = color(R6, G6, B6);
}
 
//Color blue shade
if(button(270, 27, R7, G7, B7, 25, 25)) {
B7 = B7 - 5;
   
  if(B7 < 75){
    R7 = 0;
    G7 = 0;
    B7 = 220;
  }
  myPenStroke = color(R7, G7, B7);
}
   
//Color green shade
if(button(300, 27, R8, G8, B8, 25, 25)) {
G8 = G8 - 5;
   
  if(G8 < 75){
    R8 = 0;
    G8 = 220;
    B8 = 0;
  }
  myPenStroke = color(R8, G8, B8);
}
  
//Color yellow shade
if(button(330, 27, R9, G9, B9, 25, 25)) {
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
if(button(360, 27, R10, G10, B10, 25, 25)) {
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
if( button(390, 27, R11, G11, B11, 25, 25) ) {
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
  
//Color random non-boolean
fill(R14, G14, B14);
stroke(R14, G14, B14);
strokeWeight(1);
rect(500, 27, 25, 25);
if(mousePressed && mouseX > 500 && mouseX < 525 && mouseY > 27 && mouseY < 52 ) {
R14 = random(255);
G14 = random(255);
B14 = random(255);

myPenStroke = color(R14, G14, B14);
}

//needs circle boolean 
//background reset button
noFill();
noStroke();
strokeWeight(1);
ellipse(50, 680, 35, 35);
if(mousePressed && dist(50, 680, mouseX, mouseY) < 18){
  image(BACK, 0, 0);
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
if(button2(263, 670, 65, 35)){ 
  noFill();
  rect(0, 0, width, height);
  fill(myPenStroke);
  angle += speed;
  float sinval = sin(angle);
  float yoffset = sinval * radius;
  ellipse(x, y + yoffset, x1, y1);
  x += velocityX;
  y += velocityY;
 
  if (x > width - 5 || x < 5) {
    velocityX *= -1;
  }
  if (y > width - 5 || y < 5) {
    velocityY *= -1;
  }
  }
 
//circlephase
noFill();
noStroke();
strokeWeight(1);
ellipse(380, 680, 35, 35);
if(mousePressed&& dist(380, 680, mouseX, mouseY) < 18){
  stroke(myPenStroke);
  XX += random(-10, 10); // Assign new x-coordinate
  YY += random(-10, 10); // Assign new y-coordinate
  ellipse(x, y, XX, YY);
  }
 

//dinosaur button
noFill();
noStroke();
strokeWeight(1);
ellipse(464, 680, 60, 35);
if(mousePressed && dist(468, 680, mouseX, mouseY) < 25){
  image(DINO, 0, 0);
 
 
}
} 

void circlePhase(float phase) {
  float diameter = 350 + (sin(angle + phase) * 75);
  ellipse(280, 360, diameter, diameter);
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

  
boolean button2(int buttonx, int buttony, int sX, int sY) {
  noFill();
  noStroke();
  ellipse(buttonx, buttony, sX, 35);
  boolean hit = false;
  if(mousePressed && mouseX > buttonx && mouseX < buttonx+sX && mouseY > buttony && mouseY < buttony+25) hit = true;
  return (hit);
}




