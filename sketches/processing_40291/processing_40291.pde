
//Code to create a web version of an art 
//installation for the "Where we're at" art
//exhibition held in the Big Picture Tallaght 
//from September 16th to 22rd 2011.
//
//The audio and images were captured 
//in the Tallaght between September 
//6th and 16th 2011 . The audio was 
//recorded using binaural microphones.
//
//This project was created by Sara Amido, 
//David Collier, Thom Conaty and Shane Finan.
//
//Code by David Collier
//Email :: davidjbcollier@gmail.com

import ddf.minim.*;

//Main images
PImage library;
PImage squareTallaght;
PImage tesco;
PImage luas;

//Images for buttons
PImage libraryButton;
PImage squareTallaghtButton;
PImage tescoButton;
PImage luasButton;

//Transparency
int t=100;

//Random opacity
int randOpacity = 240;

//Audio
Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;

//Current state of the button
boolean A1 = false;
boolean A2 = false;
boolean A3 = false;
boolean A4 = false;

float target1, target2, target3, target4;
float target;

//Easing factor for the random transparency of
//the main images.
float imageEasing = 0.05;
float buttonEasing = 0.1;
float butTrans = 120;

//Transparency of the main images
float a, b, c, d;

//Transparency of the buttons
float l = 255, m = 255, n = 255, o = 255;

void setup(){
  size(400, 400);
  frameRate(24);
  
  //Load main images
  luas = loadImage("Luas.jpg");
  squareTallaght = loadImage("Square.jpg");
  library = loadImage("Library.jpg"); 
  tesco = loadImage("Tesco.jpg");
  
  //Load button images
  luasButton = loadImage("LuasButton.JPG");
  squareTallaghtButton = loadImage("SquareButton.JPG");
  libraryButton = loadImage("LibraryButton.JPG"); 
  tescoButton = loadImage("TescoButton.JPG"); 
  
  minim = new Minim(this);
  
  //Load audio files
  song1 = minim.loadFile("Luas.mp3");
  song2 = minim.loadFile("Square.mp3");
  song3 = minim.loadFile("Library.mp3");
  song4 = minim.loadFile("Tesco.mp3");
  
  noStroke();
}

void draw(){
    background(0); 
  
  //Assign a value to the opacity of the images
  if(A1){
    target1 = random(100, randOpacity);
    a+= (target1 - a) * imageEasing;
    tint(255, a);
    image(luas, 0, 0, width, 3*height/4);
  }else if(A1 ==false && a >  0){
    target1 = 0;
    a+= (target1 - a) * imageEasing;
    tint(255, a);
    image(luas, 0, 0, width, 3*height/4);
  }
  if(A2){
    target2 = random(100, randOpacity);
    b+= (target2 - b) * imageEasing;
    tint(255, b);
    image(squareTallaght, 0, 0, width, 3*height/4);
  }else if(A2 ==false && b >  0){
    target2 = 0;
    b+= (target2 - b) * imageEasing;
    tint(255, b);
    image(squareTallaght, 0, 0, width, 3*height/4);
  }
  if(A3){
    target3 = random(100, randOpacity);
    c+= (target3 - c) * imageEasing;
    tint(255, c);
    image(library, 0, 0, width, 3*height/4);
  }else if(A3 ==false && c >  0){
    target3 = 0;
    c+= (target3 - c) * imageEasing;
    tint(255, c);
    image(library, 0, 0, width, 3*height/4);
  }
  if(A4){
    target4 = random(100, randOpacity);
    d+= (target4 - d) * imageEasing;
    tint(255, d);
    image(tesco, 0, 0, width, 3*height/4);
  }else if(A4 ==false && d >  0){
    target4 = 0;
    d+= (target4 - d) * imageEasing;
    tint(255, d);
    image(tesco, 0, 0, width, 3*height/4);
  }

  //Display button images
  tint(255, l);
  image(luasButton, 0, 3*height/4, width/4, height/4);
  tint(255, m);
  image(squareTallaghtButton, width/4, 3*height/4, width/4, height/4);
  tint(255, n);
  image(libraryButton, 2*width/4, 3*height/4, width/4, height/4);
  tint(255, o);
  image(tescoButton, 3*width/4, 3*height/4, width/4, height/4);
  
  
  //Colour the buttons if activated
  if(A1){
    fill(252, 4, 3, t);
    rect(0, 3*height/4, width/4, height/4);
    target = butTrans;
    m+= (target - m) * buttonEasing;
    n+= (target - n) * buttonEasing;
    o+= (target - o) * buttonEasing;
  }    
  if(A2){
    fill(255, 168, 0, t);
    rect(width/4, 3*height/4, width/4, height/4);
    target = butTrans;
    l+= (target - l) * buttonEasing;
    n+= (target - n) * buttonEasing;
    o+= (target - o) * buttonEasing;
  }
  if(A3){
    fill(1, 137, 252, t);
    rect(2*width/4, 3*height/4, width/4, height/4);
    target = butTrans;
    l+= (target - l) * buttonEasing;
    m+= (target - m) * buttonEasing;
    o+= (target - o) * buttonEasing;
  }
  if(A4){
    fill(112, 253, 5, t);
    rect(3*width/4, 3*height/4, width/4, height/4);
    target = butTrans;
    l+= (target - l) * buttonEasing;
    m+= (target - m) * buttonEasing;
    n+= (target - n) * buttonEasing;
    
  }
  if(A1 == false && A2 == false && A3 == false && A4 == false){
    target = 255;
    l+= (target - l) * buttonEasing;
    m+= (target - m) * buttonEasing;
    n+= (target - n) * buttonEasing;
    o+= (target - o) * buttonEasing;
  }
}


void mousePressed(){
  //Row 1
  if(mouseX>= 0 && mouseX<= width/4 && mouseY>=3*height/4 && mouseY<=4*height/4){
    A1 = !A1;
    if(A1){
      A2 = false;
      A3 = false;
      A4 = false;
    }
  }else if(mouseX>= width/4 && mouseX<= 2*width/4 && mouseY>=3*height/4 && mouseY<=4*height/4){
    A2 = !A2;
    if(A2){
      A1 = false;
      A3 = false;
      A4 = false;
    }
  }else if(mouseX>= 2*width/4 && mouseX<= 3*width/4 && mouseY>=3*height/4 && mouseY<=4*height/4){
    A3 = !A3;
    if(A3){
      A1 = false;
      A2 = false;
      A4 = false;
    }
  }else if(mouseX>= 3*width/4 && mouseX<= 4*width/4 && mouseY>=3*height/4 && mouseY<=4*height/4){          //ROW 2
    A4 = !A4;
    if(A4){
      A1 = false;
      A2 = false;
      A3 = false;
    }
  }
  audio();
}

void audio(){
     
    if(A1 == true){
      song1.loop();
    }else if(A2 == true){
      song2.loop();
    }else if(A3 == true){
      song3.loop();
    }else if(A4 == true){
      song4.loop();
    }
    
    if(A1 == false){
      song1.pause();
      song1.cue(0);
    }
    if(A2 == false){
      song2.pause();
      song2.cue(0);
    }
    if(A3 == false){
      song3.pause();
      song3.cue(0);
    }
    if(A4 == false){
      song4.pause();
      song4.cue(0);
    }   
}

void stop()
{
  song1.close();
  song2.close();
  song3.close();
  song4.close();
  minim.stop(); 
  super.stop();
}

