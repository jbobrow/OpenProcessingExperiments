
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/147233*@* */

int frames=12;
PImage []grey = new PImage [frames];
PImage []brown = new PImage [frames];
PImage []black = new PImage [frames];

//Variables for animation loop
int greyA,brownA,blackA = 0;

//X coordinate for horses
float brownX,greyX ,blackX = 0;

//Y coordinate for horses
int brownY = 0;
int greyY = 100;
int blackY = 200;

void setup(){
  size(800,300);
  frameRate(20);
   background(255);
  
  //nested loops for finish line
    for (int y = 0; y < width; y += 20) { 
for (int x = 700; x < 740; x += 20) { 
  fill(0);
rect(x, y,10,10);
 }}
for (int y = 10; y < width; y += 20) { 
for (int x = 710; x < 740; x += 20) { 
  fill(0);
rect(x, y,10,10);
 }}
 
//calls function to load pictures
  LoadPics(); 
}

void draw(){
  
  //calls function to animate and check which horse won
  animation();
  winner();
}


void animation(){
  //animation cycle
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
  
  //controls horses speed
  greyX = greyX + random(2,6);
  brownX = brownX +random(2,6);
  blackX = blackX +random(2,6);}
  

void LoadPics(){
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
void winner(){
  if (brownX > 540){
    textSize(32);
    fill(67,40,14);
    text("Brown Horse is the Winner",100,50);
    noLoop();
  }
  if (greyX > 540){
    textSize(32);
     fill(100);
    text("Grey Horse is the Winner",150,100);
    noLoop();
  }
  if (blackX > 540){
    textSize(32);
     fill(0);
    text("Black Horse is the Winner",100,250);
    noLoop();
  }
}



