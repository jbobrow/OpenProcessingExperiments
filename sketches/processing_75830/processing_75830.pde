
import processing.opengl.*;

PImage main,cover,largeship,mediumship,smallship;
float xloc=1300;  
float speed=1;
float smallspeed=1;
float smallxloc=-500;
float smokespeed=.05;
float mediumspeed=.5;
float mediumxloc=-500;

void setup() {
  size(1500,1000,OPENGL);
  background(0);
  main = loadImage("main.png");
  largeship = loadImage("largeship.png");
  mediumship = loadImage("mediumship.png");
  smallship = loadImage("smallship.png");
  cover=loadImage("cover.png");
} 

void draw(){
image(main,0,0,1500,1000);
largeship();
smallship();
mediumship();
image(cover,0,0,1500,1000);
//smokestacks
smoke(1020,295);
smoke(1040,286);
smoke(1060,277);
smoke(330,410);
smoke(320,400);
}


void largeship() {
xloc=xloc-speed;
if(xloc<=910 && xloc>=850) {
  speed=speed*.99;}
  if(xloc<=0) {
  speed=speed*1.01;}
  if(xloc<=-2000)
  {xloc=1500; speed=1;}
pushMatrix();
rotate(radians(-30));
image(largeship,xloc,800);
popMatrix(); 

}

void smallship() {
smallxloc=smallxloc+smallspeed;
if(smallxloc>=640){
  smallspeed=smallspeed*.99;} else {smallspeed=smallspeed*1.007;}
    if(smallxloc>=1500)
  {smallxloc=-500; smallspeed=1;}
pushMatrix();
rotate(radians(-30));
image(smallship,smallxloc,596);
popMatrix(); 
println(smallxloc);
}

void mediumship() {
mediumxloc=mediumxloc+mediumspeed;
if(mediumxloc>=1500)
  {mediumxloc=-500;}
pushMatrix();
rotate(radians(-30));
image(mediumship,mediumxloc,936);
popMatrix(); 
println(smallxloc);
}

void smoke(int translatex, int translatey) {
pushMatrix();
translate(translatex,translatey); 
noStroke();
fill(255,40);
scale(.8);
ellipse(random(0,10),random(0,10),random(1,10),random(1,10));
ellipse(random(5,12),random(5,12),random(5,15),random(1,10));
for(int i=0;i<200;i++) {
ellipse(random(5,12)+i,random(5,12),random(5,15)-i/20,random(5,15)-i/20);}
fill(255,30);
for(int i=0;i<300;i++) {
ellipse(random(8,10)+i,random(8,10),random(5,15)-i/30,random(5,15)-i/30);
}
fill(255,4);
scale(.4);
for(int i=0;i<400;i++) {
ellipse(random(8,10)+i,random(8,10),random(5,15)-i/30,random(5,15)-i/30);
}
popMatrix();
}



