
// Chris Hong
//Midterm Project 
//PUDT1203 Justin Bakse
// Demonstrates a story of a man commuting to work
// Click on significant objects to progress

PImage img;
PImage img2;
PImage img3;
boolean move=false;
float royWalkX=80;
float royWalkY=200;
float subwayWalk=80;
int frame = 0;
int numFrames = 18;  // The number of frames in the animation
PImage[] images = new PImage[numFrames];


String currentPage;

void setup() {
  size(800, 500);
  currentPage = "roy1";
}

/////////////////////////////////////////////////
// EVENT ROUTERS

void draw() { 
  if (currentPage == "roy1") {
    drawRoy1();
  }
  else if (currentPage == "roy2") {
    drawRoy2();
  }
  else if (currentPage == "roy3") {
    drawRoy3();
    mouseReleasedRoy3(); /*I moved this from mouseReleased to 
     void Draw, so that it occurs only when currentpage=roy3*/
  }
  else if (currentPage == "roy4") {
    drawRoy4();
  }
  else if (currentPage == "roy5") {
    drawRoy5();
    mouseReleasedRoy5();
  }
}

void mouseReleased() {
  if (currentPage == "roy1") {
    mouseReleasedRoy1();
  } 
  else if (currentPage == "roy2") {
    mouseReleasedRoy2();
  }

  else if (currentPage == "roy4") {
    mouseReleasedRoy4();
  }
}

/////////////////////////////////////////////////
// Alarm Clock scene

void drawRoy1()
{


  img = loadImage("roy1.png");
  image(img, 0, 0);

  img = loadImage("text1.png");
  image(img, 335, 450);

  if (move==false) {
    img = loadImage("royClock1.png");
    image(img, 460, 120);
    move=true;
  }
  else {
    img = loadImage("royClock2.png");
    image(img, 460, 120);
    move=false;
  }

  /*background(255, 0, 0);
   fill(255, 255, 255);
   rect(480, 120, 65, 65);*/
}

void mouseReleasedRoy1()
{
  if (mouseInRect(480, 120, 65, 65)) {
    currentPage = "roy2";
  }
}


/////////////////////////////////////////////////
// Waking Up

void drawRoy2()
{
  img = loadImage("roy2.png");
  image(img, 0, 0);

  img = loadImage("text2.png");
  image(img, 285, 450);


  /* background(0, 0, 255);
   fill(255, 255, 255);
   rect(300, 100, 120, 170);*/
}


void mouseReleasedRoy2()
{
  if (mouseInRect(300, 100, 120, 170)) {
    currentPage = "roy3";
  }
}

/////////////////////////////////////////////////
// Walking to Station


void drawRoy3()
{
  img = loadImage("royCommuteGround.png");
  image(img, 0, 0);

  img = loadImage("text3.png");
  image(img, 275, 450);

  frameRate(10);

  if (move==false) {

    royWalkX=royWalkX+10;
    img = loadImage("royWalk2.png");
    image(img, royWalkX, royWalkY);
    move=true;
  }
  else {

    royWalkX=royWalkX+10;
    img = loadImage("royWalk2-2.png");
    image(img, royWalkX, royWalkY);
    move=false;
  }



  /////////////////////////////////////////////////
  // Subway Entrance (Broken into 3 parts)

  img = loadImage("roySubwaySign.png");
  image(img, 600, 300);

  img = loadImage("roySubwayPole.png");
  image(img, 602, 200);

  img = loadImage("roySubwayBall.png");
  image(img, 582, 142);
}

void mouseReleasedRoy3()
{

  if (royWalkX>595) {
    royWalkY=royWalkY+10;
  }

  if (royWalkX>width) {
    currentPage = "roy4";
  }
}

/////////////////////////////////////////////////
// 4th Page


void drawRoy4()
{

  img = loadImage("royKid.png");
  image(img, 0, 0);

  img = loadImage("text4.png");
  image(img, 138, 450);

  frameRate(10);

  if (move==false) {

    subwayWalk=subwayWalk+10;
    img = loadImage("royWalk2-Copy.png");
    image(img, subwayWalk, 10);
    move=true;
  }
  else {

    royWalkX=royWalkX+10;
    img = loadImage("royWalk2-2-Copy.png");
    image(img, subwayWalk, 10);
    move=false;
  }
  /*fill(255, 255, 255);
   rect(330, 320, 100, 100);*/
}

void mouseReleasedRoy4()
{
  if (mouseInRect(330, 320, 100, 100) == true) {
    currentPage = "roy5";
  }
}

/////////////////////////////////////////////////
// 5th Page


void drawRoy5()
{


  PImage img4;
  boolean moveRoy=false;

  //sequential images that make the scene

    size(800, 500);
  frameRate(3);

  images[0]  = loadImage("train_scene_01.png");
  images[1]  = loadImage("train_scene_01-transition.png"); 
  images[2]  = loadImage("train_scene_02.png");
  images[3]  = loadImage("train_scene_02-transition.png"); 
  images[4]  = loadImage("train_scene_03.png");
  images[5]  = loadImage("train_scene_03-transition.png"); 
  images[6]  = loadImage("train_scene_04.png");
  images[7]  = loadImage("train_scene_05.png");
  images[8]  = loadImage("train_scene_05.png"); 
  images[9]  = loadImage("train_scene_05.png");
  images[10]  = loadImage("train_scene_05.png"); 
  images[11]  = loadImage("train_scene_05-2.png"); 
  images[12]  = loadImage("train_scene_05-3.png");
  images[13]  = loadImage("train_scene_05-4.png"); 
  images[14]  = loadImage("train_scene_05-5.png");
  images[15]  = loadImage("train_scene_05-6.png");
  images[16]  = loadImage("train_scene_05-6.png");
  images[17]  = loadImage("train_scene_05-6.png");
}

void mouseReleasedRoy5()
{

  frame = (frame+1) % numFrames;  
  image(images[frame], 0, 0);
}


/////////////////////////////////////////////////
// UTILITY

boolean mouseInRect(float _x, float _y, float _w, float _h) {
  if (mouseX > _x && mouseY > _y && mouseX < _x +_w && mouseY < _y + _h) {
    return true;
  } 
  return false;
}



