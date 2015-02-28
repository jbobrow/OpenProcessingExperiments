
PImage []grey = new PImage [12];
PImage []brown = new PImage [12];
PImage []black = new PImage [12];

//Variables for animation loop
int greyA = -1;
int brownA = -1; 
int blackA = -1;
//Image location on Y coordinate
float brownX = -200;
float greyX = -200;
float blackX = -200;
//Image location on Y coordinate
int brownY = 0;
int greyY = 100;
int blackY = 200;

int horse = 0;

void setup(){
  size(800,300);
  frameRate(24);
  background(255,255,255);
  grey[0] = loadImage("grey01.jpg");
  grey[1] = loadImage("grey02.jpg");
  grey[2] = loadImage("grey03.jpg");
  grey[3] = loadImage("grey04.jpg");
  grey[4] = loadImage("grey05.jpg");
  grey[5] = loadImage("grey06.jpg");
  grey[6] = loadImage("grey07.jpg");
  grey[7] = loadImage("grey08.jpg");
  grey[8] = loadImage("grey09.jpg");
  grey[9] = loadImage("grey10.jpg");
  grey[10] = loadImage("grey11.jpg");
  grey[11] = loadImage("grey12.jpg");

  brown[0] = loadImage("brown01.jpg");
  brown[1] = loadImage("brown02.jpg");
  brown[2] = loadImage("brown03.jpg");
  brown[3] = loadImage("brown04.jpg");
  brown[4] = loadImage("brown05.jpg");
  brown[5] = loadImage("brown06.jpg");
  brown[6] = loadImage("brown07.jpg");
  brown[7] = loadImage("brown08.jpg");
  brown[8] = loadImage("brown09.jpg");
  brown[9] = loadImage("brown10.jpg");
  brown[10] = loadImage("brown11.jpg");
  brown[11] = loadImage("brown12.jpg");
  
  black[0] = loadImage("black01.jpg");
  black[1] = loadImage("black02.jpg");
  black[2] = loadImage("black03.jpg");
  black[3] = loadImage("black04.jpg");
  black[4] = loadImage("black05.jpg");
  black[5] = loadImage("black06.jpg");
  black[6] = loadImage("black07.jpg");
  black[7] = loadImage("black08.jpg");
  black[8] = loadImage("black09.jpg");
  black[9] = loadImage("black10.jpg");
  black[10] = loadImage("black11.jpg");
  black[11] = loadImage("black12.jpg");
  
  
}

void draw(){
  animation();
  finishline();
  winner();
}



void animation(){
  greyA++;
  brownA++;
  blackA++;
  if (greyA == 11){
    greyA = 0;
  }
  if (brownA == 11){
    brownA = 0;
  }
  if (blackA == 11){
    blackA = 0;
  }
  image(grey[greyA],greyX,greyY);
  image(brown[greyA],brownX,brownY);
  image(black[greyA],blackX,blackY);
  greyX = greyX + random(.4,3);
  brownX = brownX +random(.4,3);
  blackX = blackX +random(.4,3);}
  
  void finishline(){
    fill(0,0,0);
  rect(700,0,100,300);
  fill(255,255,255);
  rect(700,0,25,25);
  rect(750,0,25,25);
  rect(700,50,25,25);
  rect(750,50,25,25);
  rect(700,100,25,25);
  rect(750,100,25,25);
  rect(700,150,25,25);
  rect(750,150,25,25);
  rect(700,200,25,25);
  rect(750,200,25,25);
  rect(700,250,25,25);
  rect(750,250,25,25);
  rect(700,300,25,25);
  rect(750,300,25,25);
  rect(725,25,25,25);
  rect(775,25,25,25);
  rect(725,75,25,25);
  rect(775,75,25,25);
  rect(725,125,25,25);
  rect(775,125,25,25);
  rect(725,175,25,25);
  rect(775,175,25,25);
  rect(725,225,25,25);
  rect(775,225,25,25);
  rect(725,275,25,25);
  rect(775,275,25,25);
  }

void winner(){
  if (brownX > 540){
    textSize(32);
    fill(0,0,0);
    text("Brown Horse is the Winner",100,150);
    noLoop();
  }
  if (greyX > 540){
    textSize(32);
     fill(0,0,0);
    text("Grey Horse is the Winner",100,150);
    noLoop();
  }
  if (blackX > 540){
    textSize(32);
     fill(0,0,0);
    text("Black Horse is the Winner",100,150);
    noLoop();
  }
}


