
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/76950*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PFont font;
PImage img;
PImage img2;
PImage snip1;
PImage snip2;
PImage snip3;
PImage snip4;
PImage bg1;
PImage bg9;
float romneyX=-100;
float romneyY=130;
float obamaX=700;
float obamaY=130;
float rectY=100;
float wordX=60;
boolean boo=true;
boolean boo1=true;
float signY=-30;
int fontSize;
int numFrames=400000;
int frame=0;
float ad=100;
float zero;

boolean overLeftButton = false;
boolean overRightButton = false;
boolean overLeftLeftButton = false;
boolean overRightRightButton = false;


void setup(){
size(800,600);
background(255);

if (boo=true){
img=loadImage("romney.png");
img2=loadImage("Obama.png");
font = loadFont("Georgia-Bold-48.vlw");
}
} //end of void setup


void draw() {
  
   
    
  println(mouseX + " : " + mouseY);
  
  
if (boo=true) {
  //background(255);
  image(img,obamaX,obamaY);
  image(img2,romneyX,romneyY);
  
  obamaX=obamaX-1;
  romneyX=romneyX+1;

}
 
 
 
 
  if (romneyX>120) {
    romneyX=120;
  }
  
  if (obamaX<484) {
    obamaX=484;
  }
  
  
  
  ///////////////////////
  //CLICKING OBAMA/////
  /////////////////////
  
  if ((mousePressed == true) && (mouseX>125 && mouseX<289 )) {
    ///////////////////////////////////
    boo=false;
    boo1=false;
    background(255);
    obamaX=1000000;
    romneyX=-1000;
    romneyY=-900;
    rectY=-100001302;
    wordX=111;
    ////////////////////////////////////
    snip1=loadImage("snippet1.png");
    image(snip1,100,60);
    snip2=loadImage("snippet2.png");
    image(snip2,360,80);
    snip3=loadImage("snippet3.png");
    image(snip3,580,120);
    bg9=loadImage("bg9.png");
    image(bg9,0,0);
    translate(obamaX,obamaY);
    rotateY(obamaY);
    
  }
      
////////////////////
//CLICKING ROMNEY//
///////////////////

 if ((mousePressed == true) && (mouseX>486 && mouseX<653 )) {
   boo=false;
   fill(244,0,222);
    rect(191,138,200,200);
   ///////////////////////////////////
    background(240);
    obamaX=1000000;
    romneyX=-1000;
    romneyY=-900;
    rectY=-100001302;
    wordX=111;
    ////////////////////////////////////
    snip1=loadImage("snippet1.png");
    image(snip1,100,60);
    snip2=loadImage("snippet2.png");
    image(snip2,360,80);
    snip3=loadImage("snippet3.png");
    image(snip3,580,120);
    bg1=loadImage("bg1.png");
    image(bg1,0,0);
    translate(obamaX,obamaY);
    rotateY(obamaY);
    /////////////////////////////
    
    
     
  
  
    
    
    
    
  }
      


rectY=rectY+1;
if (rectY>=429) {
  rectY=429;
  fill(0);
  smooth();
  textFont(font, 35); 
  text("CHOOSE. ONE FACE OR TWO FACE.", wordX, 70);

//////////////////////////////////////////







}

rect(387,rectY,5,20);
  
} //end of void draw


void keyPressed() {
     if ((keyPressed == true) && (key == 'w')) {
     loop();
     frame=0;
     romneyX=-100;
     romneyY=130;
     obamaX=700;
     obamaY=130;
     rectY=100;
     wordX=60;
     background(255);
    
     
     
   
 
 
 
 }
      
   }



