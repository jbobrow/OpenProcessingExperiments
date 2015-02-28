
//declare global variables
int mouthMove; 
boolean clicked = false;

void setup(){
size(500,500);
background(0,144,0);
noStroke();
}

void keyPressed(){
clicked =! clicked;
}



void draw(){
if (clicked == false){
  mouthMove = 50;
 

}
if (clicked == true){
  mouthMove = 20;
}
translate(250,250);
fill(246,199,255);
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
ellipse(40,-20,10,10);
 
// eye pupil left
fill(0,0,150);
ellipse(-40,-20,10,10);
 
//mouth
translate(0,30);
fill(218,21,63);
ellipse(0,50,100,mouthMove);
 
//ear left
fill(246,199,255);
ellipse(-120,-40,50,80);
 
//ear right
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



