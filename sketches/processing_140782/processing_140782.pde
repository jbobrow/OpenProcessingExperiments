
//declare global variables
int mouthMove; 
int pupilMove;
int leftMove;
float faceoneColor = 246;
float facetwoColor = 199;
float facethreeColor = 255;
boolean clicked = false;

void setup(){
size(500,500);
background(244,255,240);

}

void keyPressed(){
clicked =! clicked;
faceoneColor = random(0,255);
facetwoColor = random (0,231);
facethreeColor = random (0,102);
}

void draw(){
if (clicked == false){
  mouthMove = 50;
 

}
if (clicked == true){
  mouthMove = 20;
}

if (clicked == false){
  pupilMove = 50;
}
  
if (clicked == true){
  pupilMove = 20;
}

if (clicked == false){
  leftMove = -50;
}
if (clicked == true){
  leftMove = -20;
}
translate(250,250);
fill(faceoneColor,facetwoColor,facethreeColor);
ellipse(0,0,230,310);
 
//right eye
fill(255,255,255);
ellipse(40,-20,50,50);
 
//left eye
fill(255,255,255);
ellipse(-40,-20,50,50);
 
//nose
pushMatrix();
translate(0,30);
fill(246,141,200);
ellipse(0,-10,40,30);
popMatrix();
 
//eyepupil right
fill(0,0,150);
ellipse(pupilMove,-20,10,10);
 
// eye pupil left
fill(0,0,150);
ellipse(leftMove,-20,10,10);
 
//mouth
translate(0,30);
fill(218,21,63);
ellipse(0,50,100,mouthMove);
 
//ear left
fill(246,199,255);
ellipse(-120,-40,50,80);

//earring
stroke(255,197,5);
fill(244,255,240);
ellipse(-120,20,20,50);
 
//ear right
noStroke(); 
fill(246,199,255);
ellipse(120,-40,50,80);

//hair
fill(190,141,246);
ellipse(0,-180,200,50);

fill(190,141,246);
ellipse(0,-150,250,50);

fill(190,141,246);
ellipse(0,-120,270,50);

//fill(0,0,0);
//rect(-40,-165,160,10);
}



