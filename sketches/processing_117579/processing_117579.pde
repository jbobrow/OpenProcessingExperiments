
/* @pjs font = "Fenix-Regular.ttf"; */

int myState = 0;
PFont myFont;
PImage Library;
PImage Dance;
PImage Ethno;
PImage History;
PImage MarchOfTime;
PImage Music;
PImage Nursing;
PImage Sports;
PImage Theatre;

void setup() {
Library = loadImage("Milner.jpg.");
Dance = loadImage("Dance.png.");
Ethno = loadImage("Ethno.png.");
History = loadImage("History.jpg.");
MarchOfTime = loadImage("MarchOfTime.jpg.");
Music = loadImage("Music.jpg.");
Nursing = loadImage("Nursing.jpg.");
Sports = loadImage("Sports.jpg.");
Theatre = loadImage("Theatre.jpg.");
  myFont = loadFont("Fenix-Regular.ttf");
  size(800, 600);
  textFont(myFont, 30);
  noStroke();
}

void draw() {
  background(#CC2D32);
  
  switch(myState) {
   
   case 0:
   text("The library has streaming video!", 60, 100);
   text("Click to learn more.", 380, 450);
   image(Library, 200, 200, 400, 123);
   break;
   
      case 1:
   text("Theatre in Video", 200, 115);
   image(Theatre, 200, 200, 500, 257);
   break;
   
      case 2:
   text("Classical Music in Video", 140, 100);
   image(Music, 250, 150, 416, 403);
   break;
   
   case 3:
   text("Dance in Video", 530, 320);
   image(Dance, 80, 120, 420, 405);
   break;
   
   case 4:
   text("American History in Video", 320, 60);
   image(History, 200, 90, 409, 478);
break;

case 5:
      text("Ethnographic Video Online", 40, 560);
      image(Ethno, 170, 30, 395, 475);
break;

case 6:
   text("March of Time", 30, 320);
   image(MarchOfTime, 300, 50, 417, 481);
break;

case 7:
   text("Nursing Education in Video", 280, 55);
   image(Nursing, 80, 90, 418, 471);
   break;

case 8:
   text("Sports Medicine and Exercise Science in Video", 70, 500);
   image(Sports, 200, 50, 415, 401);
   break;
   
   case 9:
   text("Learn more at library.illinoisstate.edu", 100, 150);
   break;
  }
}

void mousePressed() {

  myState = myState + 1;
if (myState > 9) {
 myState = 0;
}
}



