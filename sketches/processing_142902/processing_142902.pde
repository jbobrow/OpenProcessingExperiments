

//declare global variables
float eyeSize=30;
float eyebrowMovin=-85;
float movinMouth=-120;
float noseMove=20;
float earsUp=-40;
float hatBrim=0;
float hatTop=0;
float shoulderUp=230;
float bodyUp=250;
boolean clicked = false;

//run Once
void setup(){
  size(500,500);
  background(255,255,255);
  noStroke();
}


//run forever
void draw(){
    
    //eyebrowMovin = -85;
    //movinMouth = -120;
    //noseMove = 20;
    //earsUp = -40;
    //hatBrim = -120;
    //hatTop = -190;
    //shoulderUp = 230;
    //bodyUp = 260;
 
  makeFace();
  
}

void makeFace(){
     background(255,255,255);

  translate(250,250);
  
  //body
fill(hatBrim,0,hatTop);
rectMode(CENTER);
rect(0,260,280,200,30);

//arm right
fill(hatBrim,0,hatTop);
ellipse(140,shoulderUp,50,130);
  
  //left arm
  fill(hatBrim,0,hatTop);
ellipse(-140,shoulderUp,50,130);

  //head
  fill(225,206,169);
  ellipse(0,0,bodyUp,300);

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
  fill(hatBrim,0,hatTop);
  rectMode(CENTER);
  rect(0,-120,260,20);

//hat top
  rectMode(CENTER);
  rect(0,-190,210,140);

//neck
fill(225,206,169);
rectMode(CENTER);
rect(0,120,110,30,50);

//collar left
  pushMatrix();
  translate(-40,120);
  fill(hatBrim,0,hatTop);
  triangle(-80,-30,-60,20,30,20);
  popMatrix();

//collor right
  pushMatrix();
  translate(40,120);
  fill(hatBrim,0,hatTop);
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
  //clicked =! clicked;
  
  eyeSize= random(5,30);
  eyebrowMovin= random(-85,-70);
  movinMouth= random(-120,70);
  noseMove= random(20,30);
  hatBrim= random(0,255);
  hatTop= random(0,255);
  shoulderUp= random(220,240);
  bodyUp= random(220,270);
  earsUp= random(-60,-40);
}





