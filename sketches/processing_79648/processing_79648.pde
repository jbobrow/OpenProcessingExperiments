
import ddf.minim.*;
AudioPlayer music;
Minim minim;

PImage[] images = new PImage[18];
float canx;
float cany;
float paperx;
float papery;
float bagx;
float bagy;
float waterx;
float watery;
float gumx;
float gumy;

float mxcan;
float mycan;
float mxpaper;
float mypaper;
float mxbag;
float mybag;
float mxwater;
float mywater;
float mxgum;
float mygum;

float dist1;
float dist2;
float dist3;
float dist4;
float dist5;

int pic = 7;
int counter = 2000;
int oscar = 0;

void setup() {
  size(800, 500);
  smooth();
  noCursor();
  canx = random(50, 750);
  cany = random(50, 450);
  paperx = random(50, 750);
  papery = random(50, 450);
  bagx = random(50, 750);
  bagy = random(50, 450);
  waterx = random(50, 750);
  watery = random(50, 450);
  gumx = random(50, 750);
  gumy = random(50, 450);

  
  images[1] = loadImage("can.png");
  images[2] = loadImage("paper.png");
  images[3] = loadImage("bag.png");
  images[4] = loadImage("broom.png");
  images[5] = loadImage("oscar1.png");
  images[6] = loadImage("oscar2.png");
  images[7] = loadImage("garbage.png");
  images[8] = loadImage("winning1.png");
  images[9] = loadImage("winning2.png");
  images[10] = loadImage("winning3.png");
  images[11] = loadImage("winning4.png");
  images[12] = loadImage("winning5.png");
  images[13] = loadImage("winning6.png");
  images[14] = loadImage("water.png");
  images[15] = loadImage("pbag.png");
  images[16] = loadImage("winner.png");
  images[17] = loadImage("loser.png");
  
  minim = new Minim(this);
  music = minim.loadFile("ilovetrash.mp3", 1024);
  music.loop();
}


void draw() {

  //background\\
  image(images[pic], 0, 0);
  
//oscar\\
  oscar = oscar + 1;
  if(oscar > 0) {
    image(images[5], 25, 200);
  }
  if(oscar > 150) {
    image(images[pic], 0, 0);
    image(images[6], 18, 175);
    image(images[4], mouseX-25, mouseY-210);
  } else {   //mouse on oscar when down\\
    if(mouseX > 15 && mouseX < 205) {
    if(mouseY > 175 && mouseY < 290) {
      
      counter = counter - 50;
    }
    }
  }
  if(oscar > 200) {
    oscar = 0;
  }  
  
  
//clumsy trash man\\
  image(images[4], mouseX-25, mouseY-210);  


//can screen  
 if(canx < 5 || canx > 795 || cany < 5 || cany > 495) {
   counter = counter + 1;
 } else {
   image(images[1], canx, cany);
   counter = counter - 1;
 }
//paper screen 
 if(paperx < 5 || paperx > 795 || papery < 5 || papery > 495) {
   counter = counter + 1;
 } else {
   image(images[2], paperx, papery);
   counter = counter - 1;
 }
//bag screen 
 if(bagx < 5 || bagx > 795 || bagy < 5 || bagy > 495) {
   counter = counter + 1;
 } else {
   image(images[3], bagx, bagy);
   counter = counter - 1;
 }
//water screen
  if(waterx < 5 || waterx > 795 || watery < 5 || watery > 495) {
    counter = counter + 1;
  } else {
    image(images[14], waterx, watery);
    counter = counter - 1;
  }
//gum screen
  if(gumx < 5 || gumx > 795 || gumy < 5 || gumy > 495) {
    counter = counter + 1;
  } else {
    image(images[15], gumx, gumy);
    counter = counter - 1;
  }
 

//pushing the can\\
  dist1 = dist(mouseX, mouseY, canx, cany);
  if(dist1 < 50) {
    canx = canx + mxcan;
    cany = cany + mycan;
    mxcan = mouseX - pmouseX;
    mycan = mouseY - pmouseY;
  }
  
//pushing the paper\\
  dist2 = dist(mouseX, mouseY, paperx, papery);
  if(dist2 < 50) {
    paperx = paperx + mxpaper;
    papery = papery + mypaper;
    mxpaper = mouseX - pmouseX;
    mypaper = mouseY - pmouseY;
  }
  
//pushing the bag\\
  dist3 = dist(mouseX, mouseY, bagx, bagy);
  if(dist3 < 50) {
    bagx = bagx + mxbag;
    bagy = bagy + mybag;
    mxbag = mouseX - pmouseX;
    mybag = mouseY - pmouseY;
  }

//pushing the water\\
  dist4 = dist(mouseX, mouseY, waterx, watery);
  if(dist4 < 50) {
    waterx = waterx + mxwater;
    watery = watery + mywater;
    mxwater = mouseX - pmouseX;
    mywater = mouseY - pmouseY;
  }
  
//pushing the gum\\
  dist5 = dist(mouseX, mouseY, gumx, gumy);
  if(dist5 < 50) {
    gumx = gumx + mxgum;
    gumy = gumy + mygum;
    mxgum = mouseX - pmouseX;
    mygum = mouseY - pmouseY;
  }
    //rect(15, 175, 190, 115);

if(counter < 0) {
   image(images[17], 0, 0);
 }
if(counter > 0 && pic > 12) {
  image(images[16], 0, 0);
}
}

void mouseClicked() {
  if(mouseX > 15 && mouseX < 205 && oscar > 150) {
    if(mouseY > 175 && mouseY < 290) {
      pic = pic + 1;
    }
  }
}



