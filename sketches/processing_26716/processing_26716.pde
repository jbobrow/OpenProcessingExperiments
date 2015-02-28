
//Clarisse Djaja
//Lesson 2 Project

float r = 155;
float g = 153;
float b = 160;

float HandH = 75;
float HandW = 75;

float circleCentre = 100;

float eyeR;
float eyeB;
float eyeG;

//

void setup(){
size(200,200);
smooth();
}

void draw(){
background(eyeR,eyeG,eyeB);
for (float w = width; w > 0; w = w - 20) {
stroke(0);
fill(w);
ellipse(width/2,height/2,w,w);
}
ellipseMode(CENTER);
rectMode(CENTER);

///left hand
if (mousePressed) {HandH = 85; HandW = 85;}
else {HandH = 75; HandW = 75;}
if(mouseX>width/2 && mouseY<height/2 || mousePressed) {HandH = random(75,95); HandW = random(75,95);}
else {HandH = 75; HandH = 75;}

line(40,50,HandH,HandW);

///right hand
line(160,70,HandH,HandW);

///body
fill(255);
ellipse(circleCentre,150,100,100);

///body
fill(255);
ellipse(circleCentre,90,70,70);

///head
fill(255);
ellipse(circleCentre,50,50,50);
  
///left eye
eyeR = random (255);
eyeB = random (255);
eyeG = random (255);
fill(eyeR,eyeB,eyeG);
ellipse(85,45,10,10);
 
///right eye
eyeR = random (255);
eyeB = random (255);
eyeG = random (255);
fill(eyeR,eyeB,eyeG);
ellipse(105,45,10,10);
 
///nose;
fill(245,163,10);
triangle(95,60,70,65,88,53);

///hat
fill(0);
stroke(0);
rect(mouseX,mouseY+20,60,5);
 
///top hat
fill(0);
stroke(0);
rect(mouseX,mouseY,50,40);

}


