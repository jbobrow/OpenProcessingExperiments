

//_____________ IMAGES & FONTS _______________________


PImage dummyOpen, dummyClosed; //2 images to animate opening & closing Dummy mouth

PFont font01, font02, font03;  // three different fonts for three Dummy statements



//_____________ VARIABLES  _______________________

int x = 5;  //variable used to move text off the screen
float oneTwoThree = 0;  // variable to store random 1-3 value
boolean animationActive = false;  // keeps track of text already animating



//_____________ DEFINE FUNCTIONS _______________________

// pick the random integer 1, 2, or 3 by converting float to integer 1, 2 or 3

void pickRandom3(){
  float Float123 = random(1,3)  ;
  int int123 = int(Float123);
}

//animation of three Dummy statements, which can be called by random function when mouth is opened 

void releaseText01() {
  animationActive = true;
  textFont(font01, random(15,60));
  fill(0, 0, 255, 255);
  textAlign(CENTER) ;
  //rotate (random (-5, 5));   
  text("Death camps!", 350 - x, 320 -x);
  
  textFont(font01, random(8,25));
  fill(255, 0, 0, 255);
  //rotate (0.1); 
  text("Obama will kill your grandmother!", 350 + x/2, 350 -x);
}

// Will be used to stop text animation when mouth closes

void returnText01() {
  animationActive = false;
  textFont(font01, random(15,100));
  fill(0, 0, 255,0); // text is invisible
  text("Death camps!", 320, 420); //text returns to mouth but does not move

  textFont(font01, random(15,45));
  fill(255, 0, 0);
  text("Obama will kill your grandmother!", 350 + x/2, 460 -x);
}

//--Use the next two as alternate texts when I get random function working

/*
void releaseText02() {
 animationActive = true;
 textFont(font02, random(15,60));
 fill(0, 0, 255);
 text("Climate Change is a Myth", 350 - x, 420 -x);
 
 textFont(font02, random(8,25));
 fill(255, 0, 0);
 text("The Oil  Companies are your Friends!", 350 + x/2, 460 -x);
 }
 
 void releaseText03() {
 animationActive = true;
 textFont(font03, random(15,60));
 fill(0, 255, 0);
 text("Health care is Communism!", 350 - x, 420 - x);
 
 textFont(font03, random(8,25));
 fill(128, 35, 80);
 text("The insurance Companies are your Friends!", 350 + x/2, 460 -x);
 }
 */



//------------------- SETUP  -------------------------


void setup(){
  size(800, 600);
  smooth();
  mouseX=20;
  mouseY=20;


  frameRate(8);

  font01 = loadFont("Palatino-Roman-48.vlw");
  font02 = loadFont("HoboStd-48.vlw");
  font03 = loadFont("Optima-Regular-48.vlw");

  dummyClosed = loadImage("dummyClosed.jpg");
  dummyOpen = loadImage("dummyOpen.jpg");




}


//------------------- DRAW -------------------------

void draw(){


  /// Open Dummy's mouth when mouse is over it, release one of three text animations.
  if (mouseY > 310 && mouseY <390 && mouseX > 350 && mouseX < 450)  {
    image(dummyOpen, 0,0);
    dummyOpen = loadImage("dummyOpen.jpg");

    // pickRandom3();
    // if (int123 == 1  &&  animationActive == false) {
    releaseText01();
    x = x +6;
  }

  /*  }
   else if (int123 == 2 &&  animationActive == false){
   releaseText02();
   
   }
   else if (int123 == 3 && animationActive == false){
   releaseText03();
   
   }
   }*/

  else {
    image(dummyClosed, 0,0);
    dummyClosed = loadImage("dummyClosed.jpg");
    int x = 3; 
    animationActive = true;


  }

  // Play 1 of 3 text animations when mouth opens






}







