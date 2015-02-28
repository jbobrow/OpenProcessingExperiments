
//Andres Kõpper
//Processing class, IED Barcelona, Week 4
//15.11.2010

//The sketch immitates, how people with sinestesia "see" music and relate certain tastes or things with different colours & sounds etc.

//Here it is possible to build a sketch to your liking, by pressing r,g,b,o,a or w  to get different colours for the waveform(explained later on).
//And whenever a key is released some words appear which represent either tastes or other memories.


//First, I show what things I have in "the box".

float x = 0; //Starting point of float x is 0. (Left edge)
float b;
float g;
int k;
float q;
float c;
float p;
float y;
float u;
float i;
float h;

float f;
float l;
float r; 
float t;
float e;
float w;
float j;  



PFont fontA;
void setup() 
{
  //Set the size of my project
  size(1240, 480);
  //Load Font
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");

  // Set the font and its size 
  textFont(fontA, random(30));

 
  //I load an image for my background
  
  PImage o;
  o = loadImage("proov3.jpg");
  image(o,0,0);
  
  //Set the primary color of my waveform
  stroke(240,60);
  //Set the width of the lines
  strokeWeight(4);
  //smooth it up.
  smooth();
  //Set very high framerate to immitate waveforms(but I think there is a limit somewhere).
  frameRate(92000);
 
}

void draw() {
  
  textFont(fontA, random(4,33));
  
  //I set the value for al my floats, things in the box.
  
  t = random(200,255);
  r = random(0);
  e = random(0);
  w = random(50,70);
  
  p = random(255);
  y = random(255);
  u = random(170,255);
  
  l = random(100,170);
  
 
  
  h = random(255);
  f = random(255);
  k = 20;
  
   
  
 
  

  
  //This ise the waveform when "There is no sound"
  stroke(245);
  //I set how fast the lines are moving
  x = x + 1.6;
  g = b + 100;
  //I set the lenghts of the lines. Variable in and out points.
  b = height/2 -random(5);
  c = height/2 +random(5);
  k = height/2; 
  

  //I make the sketch work the way, that if some certain key is pressed
  // a certaincolour of waveform appeares. For example b = blue, o = orange,
  // r = red, g = green, a= all mixed colors, w = gray.
  
  //I used void keyPressed with the conditional if()
   if(keyPressed) {
     //I also use switch(key) to enable usage of variable cases.
  switch(key) {
    
  case 'b': //I choose letters for colours.
    b = b + random(145); // For different colours I use different max lenghts.
    b = b - random(145);
     x = x + 1;

    stroke(e,l,u,w); //I change the value of R,G,B,A - scale,
                     // to get the desired colours.
    }
    switch(key) {
    case 'r': 
    b = b + random(110);
    b = b - random(110);
     x = x + 1;

    stroke(t,e,e,w);
   
    }
    switch(key) {
    case 'g': 
    b = b + random(80);
    b = b - random(80);
     x = x + 1;

    stroke(e,t,w,w);
   
    }
    switch(key) {
    case 'o': 
    b = b + random(170);//Orange is the talles waveform.
    b = b - random(170);
     x = x + 1;

    stroke(t,t,e,w);
   
    }
    switch(key) {
  case 'a': 
    b = b + random(100);
    b = b - random(100);
     x = x + 1;

    stroke(f,p,y,w);
    }
    switch(key) {
  case 'w': 
    b = b + random(40);
    b = b - random(40);
     x = x + 1;

    stroke(w,w,w,w);
    }
    switch(key) {
  case 'q':        // if letter Q is pressed, everything is cleared.
  PImage o;
  o = loadImage("proov3.jpg");
  image(o,0,0);
  x=0;
    
    }
    }

    //I use other part of coniditi onal else(), to draw SILENCE (whitout colour)
    else {
      stroke(245,50);
   
  }
  //I set the coniditon that if the waveform reaches the border it starts from the beginning.
  if (x > 1280) { 
    x = 0; 
  }
   

  line(x, b, x,c);
  
   }
   
   //I use void keyReleased() to kind of randomly generate some words
   //whenever a key is released.
   void keyReleased() {
  
  // Use fill() to change the value or color of the text
  noFill();

  if(x<400){
    
    //I mostly use words to express the taste, but also random things,
    // because synestesia is also related to other memories 
    //(like: weather, locations, sound, words, dates, numbers)
    
    //I also set random size for every text that appears.
    
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
   text ("CREAMY" ,random(1080), random(480)); //I set the text, and its position (random)
   } else {
  
  }
  //I set the value, after what the text starts appearing(When key is released)
  if(x<500){
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
  
   text ("SALTY" ,random(1080), random(480));
   } else {
  
  }
  if(x<400){
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
  
  
   text ("SWEET" ,random(1080), random(480));
   } else {
  
  }
  if(x<300){
    textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
  
  
  
   text ("SOUR" ,random(1080), random(480));
   } else {
  
  }
  if(x<400){
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
 
  
   text ("BITTER" ,random(1080), random(480));
   } else {
  
  }
  if(x<600){
  
  
 textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
   text ("1               7           9                           5                           2                         4              0                  6              3                 8       " ,random(-4000,1080), random(480));
   } else {
  
  }
  if(x>400){
  
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
   text ("SPICY" ,random(1080), random(480));
   } else {
  
  }if(x>500){
  
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
   text ("12.11.1974" ,random(1080), random(480));
   } else {
  
  }if(x>600){
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
 
   text ("BARCELONA" ,random(1080), random(480));
   } else {
  
  }if(x>700){
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
 
  
   text ("OH SAY CAN YOU SEE" ,random(1080), random(480));
   } else {
  
  }if(x>900){
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
  
  
   text ("SPICY" ,random(1080), random(480));
   } else {
  
  }
  if(x>1000){
  
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
   text ("9.9.1990, SUNNY, 23'" ,random(1080), random(480));
   } else {
  
  }if(x>900){
  textFont(fontA, random(4,33));
  fill(f,p,y,40);
  
  text ("BLUE" ,random(1080), random(480));
   } else {
  
  }
 
  }
  
 //I give an opportunity to draw on DARK background also.
 //IT IS POSSIBLE TO CHANGE THE IMAGE FOR EXAMPLE GREEN ,
// BY CHANGIN THE NAME proov1.img to Proov2.img
 void mousePressed () {
    PImage o;
  o = loadImage("proov1.jpg");
    image(o,0,0);
    
    x=0;
    
    }







