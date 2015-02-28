
CanonBug cb1;

float calmillis;
float speed;
float s=1;
float sdifference=.1;
float i;
int gameMode;  //3, for START SCREEN, GAME PLAY, GAME OVER
float duration = 4000; //THE DELAY ON THE CANON LAUNCH

int candir1=1;
int candir2=1;
int jellodir1=1;
int jellodir2=1;

int totalCanonNumber = 2;

int testValue;

float jellorotationSpeed=.0005;
float jelloRad1=100;
float jelloRad2=90;
float jelloRad1speed=.07;  
float jelloRad2speed=.07;  
float jellox;
float jelloy;


int quadrant;
float x;  //prep for velocity/track canon
float y;  //prep for velocity/track canon
float angle;
float x1;
float y1; 
float angle1;
float x2;
float y2;
float angle2;
float x3;
float y3; 
float angle3;
float x4;
float y4; 
float angle4;
float x5;
float y5;
float angle5;
float x6;
float y6; 
float angle6;
float x7;
float y7; 
float angle7;
float x8;
float y8;
float angle8;
float x9;
float y9; 
float angle9;


//float speed x;
//float speed y;

color canonColor;
float canonRad1=100;
float canonRad2=90;
float canonrotationSpeed=.0005;
float canonRad1speed=.03;  
float canonRad2speed=.02;  
float scaled=.2;
float canonRad1scaled=20;
float canonRad2scaled=18;

//gameover
PFont font;
PFont font2;  //apple gothic
PFont font3;  //arial mt
PFont font4;  //century gothic
PFont font5;
PFont font6; //letter Gothic Std
PFont font7;
//float xX=width/2;         // Bug x-coordinate
//float yY=height/2;         // Bug y-coordinate
//float angleCanonBug=PI+HALF_PI;     // Bug angleCanonBug
float xX;         // CanonBug x-coordinate
float yY;         // CanonBug y-coordinate
//float angleCanonBug;     // angle CanonBug
int offset = 10;



int gameplayoffset = 0;


void setup(){
  size (800, 480);
  noCursor();
  smooth();
  ellipseMode(RADIUS);
  font2=loadFont("AppleGothic-100.vlw");  //BEST THUS FAR
  font4=loadFont("CenturyGothic-100.vlw");  
  font5=loadFont("Geneva-100.vlw");
  font6=loadFont("LetterGothicStd-100.vlw");
  font7=loadFont("OratorStd-48.vlw");
  
  gameMode=0;
  
  cb1=new CanonBug(x,y);
} //END VOID



void draw(){
  background(255); 
  
  calmillis = millis() - gameplayoffset;
  
  if(gameMode==0){
    gameStart();
  } else 
  if(gameMode==1){
    gameSetup();
  }
  else if(gameMode==2){
    gamePlay();
  }
  else if(gameMode==3){
    gameEnd();
  } 
  else if(gameMode==4){
    gameLost();
  } 
//  else if(gameMode=5){
//    gameRestart();
//  }
}   //END VOID DRAW


