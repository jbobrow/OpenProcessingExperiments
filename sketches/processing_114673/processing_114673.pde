
// Xavier Wong 53077176
// CMS3 Coding Assignment4 (8/10/2013)
// "Where Is My Candy?"
//This little game aims to teach little children of cognition


PFont font;
PImage img0;
PImage img1;
PImage img2; 
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;

import ddf.minim.*;
Minim minim;
AudioSample effect1;
AudioSample effect2;
AudioPlayer bgsound;

void setup() {
  size(600,600);
  noStroke();
  noCursor();
  img0 = loadImage("mycandy.png");
  img1 = loadImage("bulkcandy.png");
  img2 = loadImage("chups.png");
  img3 = loadImage("jellybelly.png");
  img4 = loadImage("candyapple.png");
  img5 = loadImage("roccandy.png");
  img6 = loadImage("watermeloncandy.png");
  img7 = loadImage("gummybear.png");
  img8 = loadImage("whiterabitcandy.png");
  img9 = loadImage("confeito.png");
  img10 = loadImage("girlcry.png");
  
  minim = new Minim(this);
  effect1 = minim.loadSample("springsound.mp3");
  effect2 = minim.loadSample("bingosound.mp3");
  bgsound = minim.loadFile("sunnysong.mp3");
  bgsound.loop();
}

//Sunny song souces from AlumoMusic
//Spring sound souces from SoundCli.ps
//Bingo sound souces from Sounddogs

void draw() {
  background(253,168,19);
  image(img3, 200, 280, 200, 200);
  font = loadFont("CenturyGothic-Bold-24.vlw");
  textFont (font, 24);
  text("←MY CANDY!!!",410,380);
  
  font = loadFont("CenturyGothic-Bold-24.vlw");
  textFont (font, 50);
  text("Where Is My Candy?",50, 100);
  
  font = loadFont("CenturyGothic-Bold-24.vlw");
  textFont (font, 24);
  text("How To Play?", 230, 170);
  text("The player need to press and hold", 115, 200);
  text("number 1-9 on their keybroad to select", 85, 230);  
  text("the correct 'Candy' for a little girl.", 120, 260);
    
  font = loadFont("CenturyGothic-Bold-24.vlw");
  textFont (font, 28);
  text("Press <ENTER> to start the game", 100, 520);
  

  if (keyCode== ENTER) {
  background(253,168,19);
  smooth(); 
  image(img1, 0, 0, 200, 200);
  image(img2, 200, 0, 200, 200);
  image(img3, 400, 0, 200, 200);
  image(img4, 0, 200, 200, 200);
  image(img5, 200, 200, 200, 200);
  image(img6, 400, 200, 200, 200);
  image(img7, 0, 400, 200, 200);
  image(img8, 200, 400, 200, 200);
  image(img9, 400, 400, 200, 200);
 }  
  
// To introduce the game and the player can press ENTER key to start it 
 
 if(keyPressed) {
 background(253,168,19);
   if(key == '1'){
        image(img10, 0, 0, 200, 200);  
        effect1.trigger();
     }else
        image(img1, 0, 0, 200, 200);
 }   
 if(keyPressed) {  
   if(key == '2'){
        image(img10, 200, 0, 200, 200);
        effect1.trigger();
     }else
        image(img2, 200, 0, 200, 200);
       
 }
 if(keyPressed) {  
   if(key == '3'){
        image(img0, 400, 0, 200, 200);
        effect2.trigger();
     }else
        image(img3, 400, 0, 200, 200); 
 }
 if(keyPressed) {  
   if(key == '4'){
        image(img10, 0, 200, 200, 200);
        effect1.trigger();
     }else
        image(img4, 0, 200, 200, 200); 
 }
 if(keyPressed) {  
    if(key == '5'){
        image(img10, 200, 200, 200, 200);
        effect1.trigger();
     }else
        image(img5, 200, 200, 200, 200);
 }
 if(keyPressed) {  
    if(key == '6'){
        image(img10, 400, 200, 200, 200);
        effect1.trigger();
     }else
        image(img6, 400, 200, 200, 200);
 }
 if(keyPressed) {  
    if(key == '7'){
        image(img10, 0, 400, 200, 200);
        effect1.trigger();
     }else
        image(img7, 0, 400, 200, 200);
 } 
 if(keyPressed) {  
    if(key == '8'){
        image(img10, 200, 400, 200, 200);
        effect1.trigger();
     }else
        image(img8, 200, 400, 200, 200);
 }
 if(keyPressed) {  
    if(key == '9'){
        image(img10, 400, 400, 200, 200);
        effect1.trigger();
     }else
        image(img9, 400, 400, 200, 200);
 }

// Click on the window to give it focus,
// and press the '1-9' key. 

}





