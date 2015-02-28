
import processing.pdf.*;

int x = 0;

//declare global variables
float eyeSize=30;
float eyebrowMovin=-85;
float movinMouth=8;
float noseMove=20;
float earsUp=-40;
float hatBrim=0;
float hatTop=0;
float shoulderUp=230;
float bodyUp=250;


void setup(){
  size(6100,9100);
  background(100,100,100);
 
  noStroke();
  beginRecord(PDF, "dot.pdf");
   translate(192.50,350);
  repeatShape();
  endRecord();
  
}
void draw(){
}

void makeShape(){
  float shapeColor[] = {random(0,255), random(0,255), random(0,255)}; 
  fill(shapeColor[0], shapeColor[1], shapeColor[2]);
  noStroke();
   //body
//fill(hatBrim,0,hatTop);
//rectMode(CENTER);
//rect(0,260,280,200,30);

//arm right
//fill(hatBrim,0,hatTop);
//ellipse(140,shoulderUp,50,130);
  
  //left arm
//fill(hatBrim,0,hatTop);
//ellipse(-140,shoulderUp,50,130);

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
  pushMatrix();
  translate(0,30);
  fill(218,21,63);
  rect(0,45,movinMouth,30);
  popMatrix();

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
 translate(-40,130);
 fill(hatBrim,0,hatTop);
 triangle(-80,-30,-60,20,30,20);
 popMatrix();

//collor right
 pushMatrix();
 translate(40,130);
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

    
   //eyebrowMovin = -85;
    //movinMouth = -120;
    //noseMove = 20;
    //earsUp = -40;
    //hatBrim = -120;
    //hatTop = -190;
    //shoulderUp = 230;
    //bodyUp = 260; 
 
void makeFace(){
 }
  


void repeatShape(){
   for (int i=0; i < 360; i++){
    println("meh" + i);
    makeShape();
  eyeSize= random(5,30);
  eyebrowMovin= random(-85,-70);
  movinMouth= random(-120,70);
  noseMove= random(20,30);
  hatBrim= random(0,255);
  hatTop= random(0,255);
  shoulderUp= random(220,240);
  bodyUp= random(220,270);
  earsUp= random(-60,-40);
    translate(300,0);
    x++;
    if (x == 20){
      x = 0;
      translate(-6000,500);
    }
  }
}





