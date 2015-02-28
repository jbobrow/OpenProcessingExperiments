

float t;
PVector currentPos;
PVector oldPos;
int s=10;

//Image
PImage online;
//Set colours
float R = 0;
float G = 0;
float B = 0;
color Bluey = color(50, 50, 200);
color Redy = color(200, 50, 50);
color Greeny = color(50, 200, 50);
color Yellowy = color(200, 200, 50);
color Purply = color(200, 50, 200);
color Tealy = color(50, 200, 200);
color DarkGrey = color(50, 50, 50);
color Grey = color(200, 200, 200);
color Pinky = color(255, 170, 170);
color Orangy = color(255, 69, 0);
color Browny = color(139, 69, 19);
int[] Colours = {Greeny,Yellowy,Purply,Tealy,DarkGrey,Grey,Pinky,Orangy,Browny};
int C=0;
color CC = Greeny;
//Font
PFont font;

void setup(){
size(800,600,P3D);
background(200, 50, 50);
font = loadFont ("AgencyFB-Bold-48.vlw");
stroke(50, 50, 200);
fill(50, 50, 200);
rectMode(CENTER);
rect(400, 25, 700, 50); //Top rectangle
rect(400, 540, 700, 120); //Bot rectangle
rect(25, 300, 50, 600); //Left rectangle
rect(775, 300, 50, 600); //Right rectangle
//Text
textFont(font, 36);
fill(50, 200, 50);
text("1", 60, 40);
fill(200, 200, 50);
text("2", 90, 40);
fill(200, 50, 200);
text("3", 120, 40);
fill(50, 200, 200);
text("4", 150, 40);
fill(50, 50, 50);
text("5", 180, 40);
fill(200, 200, 200);
text("6", 210, 40);
fill(255, 170, 170);
text("7", 240, 40);
fill(255, 69, 0);
text("8", 270, 40);
fill(139, 69, 19);
text("9", 300, 40);
fill(255);
text(">", 720, 40);
text("<", 690, 40);
text("P.T.T LTD", 635, 550);
online = loadImage("http://i53.tinypic.com/34hyjbt.jpg", "jpg");
currentPos=new PVector(400,300,0);
oldPos=new PVector(400,300,0);
}

void clear(){
background(200, 50, 50);
stroke(50, 50, 200);
fill(50, 50, 200);
rectMode(CENTER);
rect(400, 25, 700, 50); //Top rectangle
rect(400, 540, 700, 120); //Bot rectangle
rect(25, 300, 50, 600); //Left rectangle
rect(775, 300, 50, 600); //Right rectangle
//Text
textFont(font, 36);
fill(50, 200, 50);
text("1", 60, 40);
fill(200, 200, 50);
text("2", 90, 40);
fill(200, 50, 200);
text("3", 120, 40);
fill(50, 200, 200);
text("4", 150, 40);
fill(50, 50, 50);
text("5", 180, 40);
fill(200, 200, 200);
text("6", 210, 40);
fill(255, 170, 170);
text("7", 240, 40);
fill(255, 69, 0);
text("8", 270, 40);
fill(139, 69, 19);
text("9", 300, 40);
fill(255);
text(">", 720, 40);
text("<", 690, 40);
text("P.T.T LTD", 635, 550);
}

void keyPressed(){
if (key=='w') {
oldPos.y=currentPos.y;
currentPos.y-=2.0;
}
if (key=='s') {
oldPos.y=currentPos.y; 
currentPos.y+=2.0;
}
if (key=='a') {
oldPos.x=currentPos.x; 
currentPos.x-=2.0;
}
if (key=='d') {
oldPos.x=currentPos.x; 
currentPos.x+=2.0;
}
if (key=='e') {
oldPos.z=currentPos.z; 
currentPos.z-=5.0;
}
if (key=='q') {
oldPos.z=currentPos.z; 
currentPos.z+=5.0;
}
if (key=='c') {
if (C>7) C=0;
else C=C+1;
}
if (key==',') {
s=s-1;
if (s<4) s=4;
}
if (key=='.') {
s=s+1;
if (s>20) s=20;
}
if (key=='b'){
currentPos.x=400;
currentPos.y=300;
currentPos.z=0;
clear();
}
}

void draw() {
image(online,60,490);
pushMatrix();
translate(currentPos.x, currentPos.y, currentPos.z);
fill(Colours[C]);
noStroke();
rect(0,0,s,s);
popMatrix();
t=t+0.01;
}

