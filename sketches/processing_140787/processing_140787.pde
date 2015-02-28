

//declare global variables
float eyeSize=30;
float eyebrowMovin;
float movinMouth;
float noseMove;
float earsUp;
float hatBrim;
float hatTop;
float shoulderUp;
float bodyUp;
boolean clicked = false;

//run Once
void setup(){
  size(500,500);
  background(94,144,226);
  noStroke();
}


//run forever
void draw(){
    
    eyebrowMovin = -85;
    movinMouth = -120;
    noseMove = 20;
    earsUp = -40;
    hatBrim = -120;
    hatTop = -190;
    shoulderUp = 230;
    bodyUp = 260;
 
  makeFace();
  
}

void makeFace(){
     background(94,144,226);

  translate(250,250);
  
  //body
fill(0,0,0);
rectMode(CENTER);
rect(0,bodyUp,280,200,30);

//arm right
fill(0,0,0);
ellipse(140,shoulderUp,50,130);
  
  //left arm
  fill(0,0,0);
ellipse(-140,shoulderUp,50,130);

  //head
  fill(225,206,169);
  ellipse(0,0,250,300);

//right eye
  fill(255,255,255);
  ellipse(40,-20,50,50);

//left eye
  fill(255,255,255);
  ellipse(-40,-20,50,50);

//nose
  pushMatrix();
  translate(0,noseMove);
  fill(193,183,154);
  triangle(0,-30,-30,20,30,20);
  popMatrix();

//eyepupil right
  fill(0,0,0);
  ellipse(40,-20,eyeSize,eyeSize);

// eye pupil left
  fill(0,0,0);
  ellipse(-40,-20,eyeSize,eyeSize);

//mouth
  translate(0,30);
  fill(218,21,63);
  rect(0,45,movinMouth,30);

//eyebrow left
  rectMode(CENTER);
  fill(0,0,0);
  rect(-40,eyebrowMovin,50,10);

//eyebrow right
  rectMode(CENTER);
  fill(0,0,0);
  rect(40,eyebrowMovin,50,10);

//hat brim
  rectMode(CENTER);
  rect(0,hatBrim,260,20);

//hat top
  rectMode(CENTER);
  rect(0,hatTop,210,140);

//neck
fill(225,206,169);
rectMode(CENTER);
rect(0,120,110,30,50);

//collar left
  pushMatrix();
  translate(-40,120);
  fill(0,0,0);
  triangle(-80,-30,-60,20,30,20);
  popMatrix();

//collor right
  pushMatrix();
  translate(40,120);
  fill(0,0,0);
  triangle(80,-30,60,20,-40,20);
  popMatrix();

//ear left
  fill(225,206,169);
  ellipse(-120,-40,50,earsUp);

//ear right
  fill(225,206,169);
  ellipse(120,-40,50,earsUp);
}

void keyPressed(){
  clicked =! clicked;
  
  eyeSize= random(-30,30);
  
}





