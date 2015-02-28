
PImage BG;
PImage ICON1;
PImage ICON1_2;
PImage PAGE1;
PImage ICON2;
PImage ICON2_2;
PImage PAGE2;

PFont WORD;

int BUTTONX1;
int BUTTONY1;
int BUTTONX2;
int BUTTONY2;
int xPos;
int speed;

boolean BUTTON1;
boolean BUTTON2;

void setup(){
  size(475,355);
  BG = loadImage("data/bg.png");
  background(BG);
  ICON1 = loadImage("data/icon01.png");
  ICON1_2= loadImage("data/icon01_2.png");
  PAGE1 = loadImage("data/page01.png");
  ICON2 = loadImage("data/icon02.png");
  ICON2_2= loadImage("data/icon02_2.png");
  PAGE2 = loadImage("data/page02.png");
  WORD=loadFont("Futura-CondensedMedium-13.vlw");
  BUTTONX1 = 158;
  BUTTONY1 = 100;
  BUTTONX2 = 158;
  BUTTONY2 = 180;
  BUTTON1 = false;
  BUTTON2 = false;
  xPos=475;
  speed=10;
  
}

void draw(){
  background(BG);
  
  fill(240,232,167);
  textFont(WORD);
  text("FIND YOUR LOCATION",30,330);
  
  //MOVE the page in to the screen
  if (BUTTON1 == true) {  
    image(PAGE1,xPos,0);
    xPos-=speed;
  }
  if(xPos<width/2){
  xPos=width/2;
  }
  
  if (BUTTON2 == true) {  
    image(PAGE2,xPos,0);
    xPos-=speed;
  }
  if(xPos<width/2){
  xPos=width/2;
  }
  
  
  //set hover
  if (mouseX > BUTTONX1 && mouseX < BUTTONX1+80 &&
    mouseY > BUTTONY1 && mouseY < BUTTONY1+65) {
    image(ICON1_2,158,100);
  }   
  else {
    image(ICON1,158,100);
  }
  
  if (mouseX > BUTTONX2 && mouseX < BUTTONX2+80 &&
    mouseY > BUTTONY2 && mouseY < BUTTONY2+65) {
    image(ICON2_2,158,180);
  }   
  else {
    image(ICON2,158,180);
  }

  
  
 
}


void mouseClicked() {
  if (mouseX > BUTTONX1 && mouseX < BUTTONX1+80 &&
    mouseY > BUTTONY1 && mouseY < BUTTONY1+65) {
    BUTTON1 = !BUTTON1; 
  }
  if (mouseX > BUTTONX2 && mouseX < BUTTONX2+80 &&
    mouseY > BUTTONY2 && mouseY < BUTTONY2+65) {
    BUTTON2 = !BUTTON2; 
  }
}

  



