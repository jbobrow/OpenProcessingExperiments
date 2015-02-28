
//
//
//
//


boolean affordanceOn = false;
boolean moreAffordanceOn = false;

import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage checkin, information3, kontakt2, klode, egg;
boolean showinformation3 = false;
boolean showkontakt2 = false;
boolean showEgg = false;
boolean playMusic = false;


void setup()
{
  size(1030, 678);
  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("Star_Spangled_Banner_instrumental.mp3");
  //player = minim.loadFile("tysklyd.mp3");
  checkin = loadImage("checkin.png");
  information3 = loadImage("information3.png");
  kontakt2 = loadImage("kontakt2.png");
  klode = loadImage("klode.png");
  egg = loadImage("Ufo_400x200.gif");
}

void draw()
{ 
  background(0);
  image(checkin, 0, 0, 1030, 678);
  image(klode, 400, 80, 400, 400);  

  if (showinformation3) {
    image(information3, 30, 30, 350, 350);
  };
  if (showkontakt2) {
    image(kontakt2, 700, 300, 300, 350);
  };
  if (showEgg) {
    image(egg, 250, 420, 50, 25);
    image(egg, 70, 220, 50, 25);
    image(egg, 20, 240, 100, 50);
  };
  noFill();
  stroke(255);
  if (moreAffordanceOn && inside(mouseX, mouseY, 10, 10, 280, 380) ) {
    rect(20, 20, 54, 50);
    rect(140, 100, 25, 40);
    rect(100, 20, 30, 30);
    rect(145, 355, 7, 7);
  };
  if (affordanceOn) {
    cursor(ARROW);
    if (inside(mouseX, mouseY, 20, 20, 54, 50)) {  // inside klode ?
      rect(20, 20, 54, 50);
      cursor(HAND);
    };    
    if (inside(mouseX, mouseY, 485, 220, 25, 28)) {  // inside information3 area ?
      fill(153);
      rect(485, 220, 25, 28);
      stroke(255);
      cursor(HAND);
    };  
    if (inside(mouseX, mouseY, 695, 251, 25, 28)) {  // inside kontakt2 area ?
      rect(695, 251, 25, 28);
      cursor(HAND);
    };
    if (inside(mouseX, mouseY, 541, 344, 25, 28)) {  // inside easter egg area ?
      rect(541, 344, 25, 28);
      cursor(HAND);
    };    
  };
  
  strokeWeight(4);
  stroke(61, 220, 249);  // hovede
  fill(61, 220, 249);
  rect(485, 220, 25, 28);
 
  strokeWeight(4);
  stroke(61, 220, 249);  // fakkel
  noFill();
  rect(695, 251, 25, 28);
  
  strokeWeight(4);
  stroke(61, 220, 249);  // ufo
  noFill();
  rect(541, 344, 25, 28);
  
  strokeWeight(4);
  stroke(61, 220, 249);  // lyd
  noFill();
  rect(603, 216, 25, 28);
  
  
}

void mousePressed() {
  if (inside(mouseX, mouseY, 603, 216, 25, 28)) {  // inside klode ?
    if (playMusic) {
      player.pause();
      player.rewind();
      playMusic = false;
    } 
    else {
      player.play();
      playMusic = true;
    }
  };
  if (inside(mouseX, mouseY, 485, 220, 25, 28)) {  // inside information3 area ?
    showinformation3 = !showinformation3;
  };
  if (inside(mouseX, mouseY, 695, 251, 25, 28)) {  // inside kontakt2 area ?
    showkontakt2 = !showkontakt2;
  }; 
  if (inside(mouseX, mouseY, 541, 344, 25, 28)) {  // inside easter egg area ?
    showEgg = !showEgg;
  }; 
}

boolean inside(int x, int y, int x0, int y0, int w, int h) {
  return (((x >= x0) && (x < (x0+w))) && 
    ((y >= y0) && (y < (y0+h))));
}



