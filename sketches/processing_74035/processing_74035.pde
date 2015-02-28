
PImage mitt;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage obama;
PImage img7;
PImage img8;
PImage img9;
PImage img10;

//flag background that waves with mouseX
PImage usa1; PImage usa2; PImage usa3; PImage usa4; PImage usa5; PImage usa6; PImage usa7; PImage usa8; PImage usa9;

//other images
PImage bigbird;
PImage flag;
PImage prompter;
PImage prompter2;
PImage michelle;
PImage ann;
PImage obamababe;
PImage mittbabe;
PImage love;
PImage vote;

//cursor flag

  float px;
  float py;
  float easing = 0.05;
  float c1 = 0;
  float direction = 1.0;
  float xspeed = 1;
  float yspeed = 5;

  int x = 0;
  int y = 0;

int dx = 3;
int dy = 2;


//OKAY NOW TIME TO SET THIS UP


void setup() {
  size(1170, 400);
  background (231, 235, 236);
  smooth();
  frameRate(17);
  
  mitt = loadImage("mitt.png");
  img2 = loadImage("mitthair.png");
  img3 = loadImage("mitthairleft.png");
  img4 = loadImage("mittnohair.png");
  img5 = loadImage("mittobamahair.png");
  obama = loadImage("obama.png");
  img7 = loadImage("obamahair.png");
  img8 = loadImage("obamahairleft.png");
  img9 = loadImage("obamanohair.png");
  img10 = loadImage("obamamitthair.png");
  bigbird = loadImage("bigbird.png");
  flag = loadImage("flag.png");
  michelle = loadImage("michelle.png");
  ann = loadImage("ann.png");
  obamababe = loadImage("obamababe.png");
  mittbabe = loadImage("mittbabe.png");
  
//flag background that waves with mouseX
   usa1 = loadImage("USA01.png");
   usa2 = loadImage("USA02.png");
   usa3 = loadImage("USA03.png");
   usa4 = loadImage("USA04.png");
   usa5 = loadImage("USA05.png");
   usa6 = loadImage("USA06.png");
   usa7 = loadImage("USA07.png");
   usa8 = loadImage("USA08.png");
   usa9 = loadImage("USA09.png");
   
   prompter = loadImage("prompter.png");
   prompter2 = loadImage("prompter2.png");
   
   love = loadImage("heartcrystal.png");
   vote = loadImage("vote.png");
  
  float x;
  float easing = 0.01;
}





void draw () {
  fill(231, 235, 236);
  noStroke();
  background (231, 235, 236);  
  
//background waving flag with mouseX

if (mouseX < 130) {
  image(usa1, -30, -90, 1500, 540);
}
if (mouseX > 130 && mouseX < 260) {
  image(usa2, -30, -90, 1500, 540);
}
if (mouseX > 260 && mouseX < 390) {
  image(usa3, -30, -90, 1500, 540);
}
if (mouseX > 390 && mouseX < 420) {
  image(usa4, -30, -90, 1500, 540);
}
if (mouseX > 420 && mouseX < 550) {  
  image(usa5, -30, -90, 1500, 540);
}
if (mouseX > 550 && mouseX < 680) {  
  image(usa6, -30, -90, 1500, 540);
}
if (mouseX > 680 && mouseX < 810) {
  image(usa7, -30, -90, 1500, 540);
}
if (mouseX > 810 && mouseX < 940) {
  image(usa8, -30, -90, 1500, 540);
}
if (940 < mouseX) {
  image(usa9, -30, -90, 1500, 540);
}

  
//cursor flag

  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight);
  line(x, y, px, py);
  image(flag, x, y, 40, 40);
  py = y;
  px = x;
  
//QUEUE GIANT LOVE CRYSTAL
if (keyPressed) {
  if (key == ' ') {
    image(love, 485, 150);
    
//WIVES
    image(ann, -160, height-mouseY+30);
    image(michelle, 860, height-mouseY+80);    

  }
}
 
 
//POTENITAL PRESIDENTS!!
//ERMERGERDD!! USA IS DOOMED!!
//  background (231, 235, 236);
    image(mitt, 0, 0);
    image(obama, 585, 0);
 
//OH BUT THEIR HAIR!!
//  image(img8, 0, -5, mouseX*2, 0);
//  image(img3, 585, 0, mouseX*2-4, 0-4);

//PRESS KEYS TO ACTIVATE BABIES
//SECRET: Apparently it has something to do with caps...?
if( key >= 'A' && key <= 'k') {
  int keyIndex;
    if(key <= 'K') {
      keyIndex = key-'A';
      image(mittbabe, 200, height-mouseY+100);
    } else {
      keyIndex = key-'a';
      image(obamababe, 420, height-mouseY+100);
    }
  }
 
//WRONG HAIR!! OH NO!!
  if (mousePressed) {
  background (231, 235, 236); 
  
  image(img5, 0, 0);
  image(img10, 585, 0);
  
//BIG BIRD
   if (mouseX < 500) {
  image(bigbird, -500+mouseY, mouseY/2-50);
}

//PROMPTER
if (mouseX > 500 && mouseY<400) {
  image(prompter, 500, height-mouseY+100);
  image(prompter2, 900, height-mouseY+100);
    }
  }
}
  
  //float targetX = mouseX;
  //x += (targetX - x) * easing;
  //image(bigbird, x, 40, 12, 12);
  //ellipse(x, 40, 12, 12);
  //println(targetX = " : " + x);
//}
  //}

