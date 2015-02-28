
//color
int blck;
int white;

//lane variables
int laneWIDTH;
int laneHEIGHT;
int lanecolorR;
int lanecolorG;
int lanecolorB;
int lanelineY;
int laneline1_X;
int laneline2_X;
int laneline3_X;
int laneline4_X;
int laneline5_X;
//lane stroke variables
int strokeMODE;
int strokecolorG;
int strokecolorB;

//hole variables
int holeY_1;
int holeY_2;
int holeDIAM;
int holeLEFT;
int holeMID;
int holeRIGHT;
int holeSTROKE;

//shadow variables
int shadowX;
int shadowY;
int shadowDIAM;
int shadowcolorR;
int shadowcolorG;
int shadowcolorB;

//ball variables
int ballX;
int ballSTROKE;
int ballY;
int ballDIAM;

//boolean
boolean black;


void setup() {
  //setup
  size(200,200); //i tried subbing variables here but it kept giving me illegal argument when width or height is <=0...
  smooth();
  black = true;
  
   //lane variables
  laneWIDTH = (200);
  laneHEIGHT = (200);
  lanecolorR = mouseY;
  lanecolorG = 0;
  lanecolorB = mouseY;
  lanelineY = 0;
  laneline1_X = 20;
  laneline2_X = 60;
  laneline3_X = 100;
  laneline4_X = 140;
  laneline5_X = 180;
  
    //lane stroke variables;
    strokeMODE = RGB; // couldn't get laneline stroke to respond to this variable
  strokecolorG = mouseX; // couldn't get laneline stroke to respond to this variable
 strokecolorB = mouseY; // couldn't get laneline stroke to respond to this variable, so i wrote out RGB, mouseX,mouseY
  
  //color
  blck = 0;
  white = 250;
  
  //hole variables
  holeY_1 = 60;
  holeY_2 = 80;
  holeDIAM = 15;
  holeLEFT = 80;
  holeMID = 100;
  holeRIGHT = 120;
  holeSTROKE = 4;
  
  //shadow variables
  shadowX = 100;
  shadowY = 65;
  shadowDIAM = 145;
  shadowcolorR = 93;
  shadowcolorG = 69;
  shadowcolorB = 19;
  
  //ball variables
  ballX = 100;
  ballY = 20;
  ballDIAM = 150;
  ballSTROKE = 2;
}
 
void draw(){
  //lane
  background(lanecolorR,lanecolorG,lanecolorB);
  noStroke();
   
  //lanelines
  stroke(RGB,mouseX,mouseY);
  line(laneline1_X,lanelineY,laneline1_X,laneHEIGHT);
  line(laneline2_X,lanelineY,laneline2_X,laneHEIGHT);
  line(laneline3_X,lanelineY,laneline3_X,laneHEIGHT);
  line(laneline4_X,lanelineY,laneline4_X,laneHEIGHT);
  line(laneline5_X,lanelineY,laneline5_X,laneHEIGHT);
   
  //ball shadow
    fill(shadowcolorR,shadowcolorG,shadowcolorB);
    noStroke();
    ellipse(shadowX,mouseY/2+shadowY,shadowDIAM,shadowDIAM);
    
  if (black) {
   
        // ball
    fill(blck,mouseX,mouseY);
        stroke(white);
    strokeWeight(ballSTROKE);
    ellipse(ballX,mouseY+ballY,ballDIAM,ballDIAM);
     
    //holes
    stroke(white);
    strokeWeight(holeSTROKE);
    ellipse(holeLEFT,mouseY/2+ holeY_1,holeDIAM,holeDIAM);
    ellipse(holeMID,mouseY/2+ holeY_2,holeDIAM,holeDIAM);
    ellipse(holeRIGHT,mouseY/2+ holeY_1,holeDIAM,holeDIAM);
        
  }else {
    
    //ball turns colors
    fill(blck);
    stroke(white);
    strokeWeight(ballSTROKE);
    ellipse(ballX,mouseY+ballY,ballDIAM,ballDIAM);
   
    //holes also turn colors
    stroke(white);
    strokeWeight(holeSTROKE);
    ellipse(holeLEFT,mouseY/2+ holeY_1,holeDIAM,holeDIAM);
    ellipse(holeMID,mouseY/2+ holeY_2,holeDIAM,holeDIAM);
    ellipse(holeRIGHT,mouseY/2+ holeY_1,holeDIAM,holeDIAM);
  }
 }
 
void mousePressed(){
  black = false;
}

void mouseReleased() {
  black = true;
}


