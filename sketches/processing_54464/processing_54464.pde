
//Program made by Colin Wiencek for Clement Valla's 2D Design Foundations class at the Rhode Island school of design.  
//Contact at cwiencek@risd.edu


PFont Helvetica_light;
String slogan_real = "One client at a time.";
String slogan_fake = "Extorting one client at a time.";
int value = 0;


void setup(){
  size(600,600);
  Helvetica_light=loadFont("helvetica48light.vlw");
}

void draw(){
  //displays the morgan stanley logo
  PImage b;
  if (mousePressed){   b = loadImage("msevil.jpg");
  } else {b = loadImage("ms.jpg"); }
  image(b,0,0);
  
  //begin real slogan section
  //defines variables of slogan
  int sloganx;
  sloganx = 525;
  int slogany;
  slogany = 541;
 
  //style settingss
  textSize(10);
  textFont(Helvetica_light);
  textSize(17);
  textAlign(RIGHT);
  

  
//begin fake slogan section  
if (mousePressed) {
  fill(0,0,0);
  text(slogan_fake,sloganx, slogany);
  //begin drop shadow
  fill(0,0,0,80);
  text(slogan_fake,sloganx+2,slogany+2);
  
  
 //begin real slogan
  } else {
    

  
  fill(0,0,0);
  text(slogan_real,sloganx,slogany);
  //creates drop shaow
  fill(0,0,0,80);
  text(slogan_real,sloganx+2,slogany+2);
  }
  
}


