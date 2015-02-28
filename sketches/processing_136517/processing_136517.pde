
int myState = 0;
PFont fonty ;
PImage man;
PImage mountain;
PImage m2;
PImage m3;
PImage m4;
int y = 0;
int y1 = -100;

void setup () {
  
  size ( 850, 850);
  fonty = createFont("BanglaMN.vlw",200);
  man = loadImage("happy.png");
  mountain = loadImage("Mountain.png");
  m2 = loadImage("case4.png");
    m3 = loadImage("case5.png");
      m4 = loadImage("case6.png");
  

  
}

void draw () {
 
background(0);
y1 = y1 + 2;
if (y1 > height) {
  y1 = -100;
}

y = y + 2;
if (y > 950) {
  y = 0;
}

switch(myState) {
  
  case 0:
  fill(#13E4ED);
  textFont(fonty, 120);
  text("You're off to", 50, y1);
  text("great places!", 60, y);
  fill(255);
  textFont(fonty, 30);
  text("(Press UP key to advance and vice versa)", 180,800);
  
  break;
  
  case 1:
  fill(#13E4ED);
   textFont(fonty, 50);
  text("Today is your day!", 50, 50);
  image(man, 0, 0);
  
  break;
  
  case 2:
  textFont(fonty, 50);
  text("Your mountain is waiting,", 50, 50);
  image(mountain, 0,-100);
  
  break;
  
  case 3:
  textFont(fonty, 50);
  text("So get on your way!", 50, 50);
  image(m2, 0,-100);
  break;
  
  
  case 4:
  image(m3, 0,-100);
  
  break;
  
  case 5:
   image(m4, 0, -100);
  break;
  
  
}
}

void keyPressed() {


if (key == CODED) {
    if (keyCode == UP) {
      myState = myState + 1;
    } else if (keyCode == DOWN) {
      myState = myState - 1;
    } 
  } else {
    myState = 5;
  }
  if (myState > 5) {
    myState = 0;
  }
  if (myState < 0) {
    myState = 5;
  }
}



