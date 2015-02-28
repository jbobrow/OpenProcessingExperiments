
import netscape.javascript.*;

PImage myImage;
PImage myImage2;
int c1 = 0;
int c2 = 0;
int c3 = 0;
int c4 = 0;
int c5 = 0;
int c6 = 0;
int c7 = 0;
int c8 = 0;
int c9 = 0;
int c10 = 0;
int c11 = 0;
int c12 = 0;


void setup(){
  size (1200, 800);
  //background (#FFFFFF);
  myImage=loadImage("table.jpg");
 // myImage2=loadImage(“Spider.jpg”)


}
void draw () {
  background (myImage);
//position of mouse
 println ("mouse position:" + mouseX + "," +mouseY);
 
//for the circle to light up when the "ball" aka the mouse goes across/into the "cup" 
if (mouseX >60 && mouseX <120 && mouseY <360 && mouseY >310)
//for the colour to stay on a little bit after the ball is out of the cup
{
  c1 = 1; 
}
if(c1>0 && c1 < 150){
  fill (#5ED8F5);
  ellipse (89,336, 55,55);
  c1++;
} else {
  c1=0;
}
if (mouseX >60 && mouseX <120 && mouseY <430 && mouseY >370)
{
  c2 = 1; 
}
if(c2>0 && c2 < 150){
  fill (#5ED8F5);
  ellipse (90,400, 55,55);
  c2++;
} else {
  c2=0;
}


if (mouseX >60 && mouseX <120 && mouseY <490 && mouseY >435)
{
  c3 = 1; 
}
if(c3>0 && c3 < 150){
  fill (#5ED8F5);
  ellipse (90,462, 55,55);
  c3++;
} else {
  c3=0;
}

if (mouseX >124 && mouseX <180 && mouseY >340 && mouseY <397)
{
  c4 = 1; 
}
if(c4>0 && c4 < 150){
  fill (#5ED8F5);
  ellipse (151,369, 55,55);
  c4++;
} else {
  c4=0;
}


if (mouseX >124 && mouseX <180 && mouseY >403 && mouseY <459)
{
  c5 = 1; 
}
if(c5>0 && c5 < 150){
 fill (#5ED8F5);
 ellipse (151,431, 55,55);
  c5++;
} else {
  c5=0;
}


if (mouseX >184 && mouseX <239 && mouseY >371 && mouseY <427)
{
  c6 = 1; 
}
if(c6>0 && c6 < 150){
  fill (#5ED8F5);
  ellipse (212,400, 55,55);
  c6++;
} else {
  c6=0;
}

//opposite side:

if (mouseX >961 && mouseX <1018 && mouseY >371 && mouseY <427)
{
  c7 = 1; 
}
if(c7>0 && c7 < 150){
  fill (#FF453B);
  ellipse (990,400, 55,55);
  c7++;
} else {
  c7=0;
}

if (mouseX >1021 && mouseX <1077 && mouseY >340 && mouseY <397)
{
  c8 = 1; 
}
if(c8>0 && c8 < 150){
  fill (#FF453B);
  ellipse (1049,369, 55,55);
  c8++;
} else {
  c8=0;
}


if (mouseX >1022 && mouseX <1078 && mouseY >403 && mouseY <459)
{
  c9 = 1; 
}
if(c9>0 && c9 < 150){
 fill (#FF453B);
 ellipse (1050, 432, 55,55);
  c9++;
} else {
  c9=0;
}
if (mouseX >1082 && mouseX <1139 && mouseY <360 && mouseY >310)
{
  c10 = 1; 
}
if(c10>0 && c10 < 150){
  fill (#FF453B);
  ellipse (1112,336, 55,55);
  c10++;
} else {
  c10=0;
}
if (mouseX >1082 && mouseX <1140 && mouseY <430 && mouseY >370)
{
  c11 = 1; 
}
if(c11>0 && c11 < 150){
  fill (#FF453B);
  ellipse (1111,400, 55,55);
  c11++;
} else {
  c11=0;
}


if (mouseX >1084 && mouseX <1140 && mouseY <490 && mouseY >435)
{
  c12 = 1; 
}
if(c12>0 && c12 < 150){
  fill (#FF453B);
  ellipse (1113,462, 55,55);
  c12++;
} else {
  c12=0;
}



//mouse:
fill (#FFFFFF);
ellipse (mouseX, mouseY, 20,20);
//if (mouseX < 50 & mouseY < 100)
   //image(myImage2, 50, 50, 50, 50);
}

