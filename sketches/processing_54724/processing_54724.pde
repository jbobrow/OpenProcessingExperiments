
//Program made by Colin Wiencek for Clement Valla's 2D Design Foundations class at the Rhode Island school of design. 
//Contact at cwiencek@risd.edu
 
 
PFont arial;
String slogan_real = "I'm loving it!";
String slogan_fake = "It's killing me.";
int value = 0;
 
 
void setup(){
  size(600,600);
  arial=loadFont("arial.vlw");
}
 
void draw(){
  //displays the morgan stanley logo
  PImage b;
  if (keyPressed){   b = loadImage("mcevil.jpg");
  } else {b = loadImage("mcdonalds.jpg"); }
  image(b,0,0);
   
  //begin real slogan section
  //defines variables of slogan
  int sloganx;
  sloganx = 300;
  int slogany;
  slogany = 500;
  
  //style settingss
  textFont(arial);
  textSize(50);
  textAlign(CENTER);
   
 
   
//begin fake slogan section 
if (keyPressed) {
    fill(20,20,20,80);
  text(slogan_fake,sloganx+10,slogany-30);
  fill(255,255,255);
  text(slogan_fake,sloganx, slogany);
  //begin drop shadow
  fill(255,255,255);
  text(slogan_fake,sloganx, slogany-50);

   
   
 //begin real slogan
  } else {
     
 
   
  fill(255,255,255);
  text(slogan_real,sloganx,slogany);
  //creates drop shaow
  fill(255,255,255,80);
  text(slogan_real,sloganx+2,slogany+2);
  }
   
}


