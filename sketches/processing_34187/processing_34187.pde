
int numClick;
int i=0;
float kidXpos = -100;
float kidYpos = -100;

float dadXpos= -100;
float dadYpos= -100;
  

//float[] dadStepNumber= new float[200];


//float[] dadSpeed = new float[200];
float dadSpeed;
//float[] dadSpeed = new float[200];

float dadLocation;
float dadStepNumber;

//int jumpahead=1;


PImage kid;
PImage dad;
PImage bg;
PImage boy;
PImage bdad;


PFont mydisplayfont;


float[] stairXPosition = new float[500];
float[] stairYPosition = new float[500];
int stairCounter = 0;

boolean drawNewStair = false;

void setup() {
  size(800, 800);
  background(255);
  smooth();

  kid=loadImage("kid.gif");
  dad=loadImage("dad.gif");
  dad.resize(50,50);
  bg=loadImage("bg.gif");
  bg.resize(1200,942);

boy=loadImage("Boy.gif");
boy.resize(200,200);
bdad=loadImage("bdad.gif");
bdad.resize(250,250);


 // dadSpeed[i]=1.2;
   dadSpeed=1.1;
  
}


void draw() {

  background(255);
  imageMode(CORNER);
  image(bg,-170,-120);
  
  
  println(dadStepNumber);
  //draw all the stairs that have assigned positions
  for ( int i = 0; i<stairCounter; i++) {
    rect(stairXPosition[i], stairYPosition[i], 40, 10);

  }

    // if there are enough stairs to allow the kid to be 1 step back then draw the kid
  if (stairCounter >= 2) {
    kidXpos = stairXPosition[stairCounter-2]+5;
    kidYpos = stairYPosition[stairCounter-2]-44.7;
   image(boy,10,450);


  }
    // if there are enough stairs to allow the dad to be 4 steps back then draw the dad
  if (stairCounter >=5) {
    
    
//    dadXpos = stairXPosition[stairCounter-5]+15+dadStepNumber;
//    dadYpos = stairYPosition[stairCounter-5]-10+dadStepNumber;
    dadLocation=dadSpeed*(stairCounter-5);
    dadStepNumber=floor(dadLocation);
    image(bdad,550,0);

   
    dadXpos = stairXPosition[int(dadStepNumber)]+8;
    dadYpos = stairYPosition[int(dadStepNumber)]-50;
    

    
    //dadLocation += dadSpeed;
//    dadXpos[i] = stairXPosition[stairCounter-5]+15+dadStepNumber[i];
//    dadYpos[i] = stairYPosition[stairCounter-5]-10+dadStepNumber[i];
//
//
//  for(int i=0; i<stairCounter-5;i++){
//    
//    dadSpeed[stairCounter-5]=i*1.2;
//    
//    dadLocation=dadSpeed[stairCounter-5];
//    dadStepNumber[i]=floor(dadLocation);}
  }
//  if(stairCounter==5&10){
//    
//   dadXpos = stairXPosition[stairCounter-5]+15+jumpahead;
//    
//  jumpahead=1;
//  jumpahead++;
//  
//  }
    //dadSpeed[i]=1.2*[stairCounter];


//    dadSpeed[i]++;
//     dadSpeed[i]++;    
    
//    dadSpeed[stairCounter-5]=1.2;   
//    dadLocation=dadSpeed[stairCounter-5]*1.2;
    
//    
//    for(i=0;i<stairCounter-5;i++){
//    

//
//    dadXpos = stairXPosition[stairCounter-5]+15+dadStepNumber[i];
//    dadYpos = stairYPosition[stairCounter-5]-10+dadStepNumber[i];


   
  
  //} 
 // 1)
//    dadSpeed[i]=1.2;
//    //dadSpeed[i]=1.2*[stairCounter];
//
//  2)
//    //dadSpeed[stairCounter-5]=1.2;   
//    //dadLocation=dadSpeed[stairCounter-5]*1.2;
//  3)
//    dadLocation=dadSpeed[stairCounter-5];
//    dadStepNumber=floor(dadLocation);
//       

  image(kid, kidXpos, kidYpos);
  image(dad, dadXpos, dadYpos);
  
  
  



  if (drawNewStair) {
    fill(#7c5200);
    strokeWeight(2);

    // next time you go through draw loop, draw this stair too at these coordinates:
    stairXPosition[stairCounter] = mouseX;
    stairYPosition[stairCounter] = mouseY;

    drawNewStair = false;

    stairCounter++;

//    println("X Position:");
//    println(stairXPosition);
//
//    println("Y Position:");
//    println(stairYPosition);
  }
  
  
} 


void mouseReleased() {
  drawNewStair = true;
 
}


