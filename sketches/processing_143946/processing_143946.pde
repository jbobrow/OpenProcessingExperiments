
//Sketch por Emely Jensen (:

float rval=0;

float r=0;
float g=0;
float b=0;
float a=0;

PFont f;

PImage dad;

void setup(){
size(800,600);
background(0);
smooth();
noFill();
f=loadFont("Georgia-Italic-48.vlw");
textFont (f,48);
textSize(12);
textAlign(CENTER);
text("DESIGN + PROGRAMAÇÃO | INTRODUÇÃO AO PROCESSING\n16.04.2014 | 20:00 - 22:00",400,300);
imageMode(CENTER);
dad=loadImage("dad.png");
tint(127);
image(dad,400,560);
}

void draw(){
rval += .05;
translate(mouseX,mouseY); 
ellipseMode(CENTER);
rotate(rval);
ellipse(0,0,80,180);
stroke(r,g,b,a);
line(40,90,80,400);
}

void mouseClicked() {
r=random(155);
g=random(255);
b=random(255);
a=random(50);
}



