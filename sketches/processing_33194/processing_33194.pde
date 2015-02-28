
// The Parade, Code homework 5
// Mani Nilchiani
// N00208257

import gifAnimation.*; //we need this library to handle animated gif

PImage[] animation;
Gif redInvader;
Gif orangeInvader;
Gif yellowInvader;
Gif greenInvader;
Gif tealInvader;
Gif blueInvader;
Gif purpleInvader;

boolean pause = false; //no pauses!
int invaderX = -100; //initial x position for all invaders
PFont Apple;


void setup(){
  size(1280,800);
  background(#000000);
  frameRate(100);
  Apple = loadFont("Apple-20.vlw");
  textFont(Apple);
  
  //Creae the GifAnimation object for playback
  redInvader = new Gif(this,"red.gif");
  orangeInvader = new Gif(this,"orange.gif");
  yellowInvader = new Gif(this,"yellow.gif");
  greenInvader = new Gif(this,"green.gif");
  tealInvader = new Gif(this,"teal.gif");
  blueInvader = new Gif(this,"blue.gif");
  purpleInvader = new Gif(this,"purple.gif");
  
  //loop 'em all!
  redInvader.loop();
  orangeInvader.loop();
  yellowInvader.loop();
  greenInvader.loop();
  tealInvader.loop();
  blueInvader.loop();
  purpleInvader.loop();

  
}
 
void draw(){
  background(#000000);
  fill(#ffffff);
  text("BootCamp", 100,700);
  text("Invaders", 100,720);
  
  invaderX = invaderX + 1;
  
  //red space invaders
  image(redInvader,invaderX,100);
  image(redInvader,invaderX-107,100);
  image(redInvader,invaderX-214,100);
  image(redInvader,invaderX-321,100);
  image(redInvader,invaderX-428,100);
  
  //orange space invaders
  image(orangeInvader,invaderX,180);
  image(orangeInvader,invaderX-107,180);
  image(orangeInvader,invaderX-214,180);
  image(orangeInvader,invaderX-321,180);
  image(orangeInvader,invaderX-428,180);
  
  //yellow space invaders
  image(yellowInvader,invaderX,260);
  image(yellowInvader,invaderX-107,260);
  image(yellowInvader,invaderX-214,260);
  image(yellowInvader,invaderX-321,260);
  image(yellowInvader,invaderX-428,260);
  
  //green space invaders
  image(greenInvader,invaderX,340);
  image(greenInvader,invaderX-107,340);
  image(greenInvader,invaderX-214,340);
  image(greenInvader,invaderX-321,340);
  image(greenInvader,invaderX-428,340);
  
  //teal space invaders
  image(tealInvader,invaderX,420);
  image(tealInvader,invaderX-107,420);
  image(tealInvader,invaderX-214,420);
  image(tealInvader,invaderX-321,420);
  image(tealInvader,invaderX-428,420);
  
  //blue space invaders
  image(blueInvader,invaderX,500);
  image(blueInvader,invaderX-107,500);
  image(blueInvader,invaderX-214,500);
  image(blueInvader,invaderX-321,500);
  image(blueInvader,invaderX-428,500);
  
  //purple space invaders
  image(purpleInvader,invaderX,580);
  image(purpleInvader,invaderX-107,580);
  image(purpleInvader,invaderX-214,580);
  image(purpleInvader,invaderX-321,580);
  image(purpleInvader,invaderX-428,580);
  
 
  
}

