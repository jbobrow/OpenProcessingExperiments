
//Declaring all global variables
float xPos=0;
float yPos=0;
float yPosInvert=0;
float xPosInvert=0;
float xline=0;
int circlesize=0;
int circlex=0;
int circlesize2=0;
int circlex2=0;
float i=50;
float r=50;

//-----------------------------------------------------
void setup() {//Start of void setup
frameRate(20);  // slows frame rate to 20
background(0);
smooth();
size(600, 600);
yPos=height/2;
xPos=height/2;
yPosInvert=height/2-50;
xPosInvert=height/2+50;
circlex=height;
float i=50;
}//End of void setup
//-----------------------------------------------------
void draw() {//Start of void draw
fill(0, 0, 0, 25);
rect(0, 0, width, height);
drawupperdots();
drawupperdots();
drawupperdots();
drawlowerdots();
drawlowerdots();
drawlowerdots();

circle();
circletop();
}//End of void draw
//----------------------------------------------------
void ring() {//Start of void ring
colorMode(RGB);
noStroke();
fill(random(255),random(255),random(255));
ellipse(height/2, width/2, i, i);
i += 40*cos(radians(r)) ;
i += 40*sin(radians(r));
r +=20;
}//End of void Ring
//-----------------------------------------------------
void drawupperdots() {//Start of void drawupperline
noStroke();
fill(158, 158, 158);
ellipse(xPos, yPos-random(height), 4, 4); 
xPos = xPos + random(9);
if (yPos<300) {//Start of "if" statement
yPos = yPos+1;
}//End of "if" statement
else {//Start of "else" statement
yPos = yPos-25;
xPos+=25;
}//End of "else" statement
if (xPos<width) {//Start of "else" statement
xPos+=1;
}//End of "if" statement
else {//Start of "else" statement
xPos=0;
}//End of "else" statement
}//End of void drawupperline

//-----------------------------------------------------
void drawlowerdots() {//Start of void drawlowerline
noStroke();
fill(158, 158, 158);
ellipse(xPosInvert, yPosInvert+random(height), 4, 4);
xPosInvert = xPosInvert + (random(9));
if (yPosInvert>300) {//Start of "if" statement
yPosInvert = yPosInvert-1;
}//End of "if" statement
else {//Start of "else" statement
yPosInvert = yPosInvert+25;
xPosInvert+=25;
}//End of "else" statement
if (xPosInvert<width) {//Start of "if" statement
xPosInvert+=1;
}//End of "if" statement
else {//Start of "else" statement
xPosInvert=0;
}//End of "else" statement
}//End of void drawlowerline
//-----------------------------------------------------

void circle() {//Start of void circle
colorMode(RGB);
fill(255, 255, 255);
textSize(35);
text("Group 3\nHSB Meets RGB", 50, 50, 12);
fill(random(255), 255, 255);
if (circlex > width/2) {//Start of "if" statement
ellipse((circlex)=(circlex)-5, (width/2), circlesize++, circlesize++);
}//End of "if" statement
else {//Start of "else" statement
circlex = width;
circlesize=0; 

}//End of "else" statement
}//End of void circle
//------------------------------------------------------
void circletop() {//Start of void circletop
colorMode(HSB);
fill(random(255), 255, 255);
if (circlex2 < width/2) {//Start of "if" statement
ellipse((circlex2)=(circlex2)+5, (width/2), circlesize2++, circlesize2++);
}//End of "if" statement
else {//Start of "else" statement
circlex2 = 0;
circlesize2=0;
for (int x=0; x<10; x++){
  ring();// creates crash effect
}
}//End of "else" statement
}//End of void circletop

