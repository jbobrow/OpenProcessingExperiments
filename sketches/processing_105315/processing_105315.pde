
boolean mouseOnTop;
boolean mouseOnLeft;
PImage standingMario;
PImage jumpingMario;
PImage lakitu;
PImage lakituFlip;
PImage brick;
PImage cloud;
PFont poplarStd48;
PFont lucidaBright48;
PFont comicSansMsBold48;
int x;
int y;
int xSpeed;
int ySpeed;

void setup() {
  size(800, 600);
  standingMario = loadImage("standingMario.gif");
  jumpingMario = loadImage("jumpingMario.gif");
  lakitu = loadImage("lakitu.gif");
  lakituFlip = loadImage("lakitu-flip.gif");
  brick = loadImage("brick.jpg");
  cloud = loadImage("cloud.gif");
  poplarStd48 = loadFont("PoplarStd-48.vlw");
  lucidaBright48 = loadFont("LucidaBright-48.vlw");
  comicSansMsBold48 = loadFont("ComicSansMS-Bold-48.vlw");
  
  // start lakitu in top left
  x = 0;
  y = 0;
  
  // set initial speed
  xSpeed = 6;
  ySpeed = 7;

  mouseOnTop = false;
  mouseOnLeft = false;
}

void draw() {
  background(32, 206, 247);
  
  x = x + xSpeed;
  y = y + ySpeed;
  
    // right boundary
  if (x >= width) {
    xSpeed = xSpeed * -1;
    // OR xSpeed = -xSpeed;
    // xSpeed *= -1;
    // circleX = circleX + 100
    // circleX += 100
  }
  // left boundary
  if (x <= 0) {
    xSpeed = xSpeed * -1;
  }
  // bottom boundary
  if (y >= height) {
    ySpeed = ySpeed * -1;
  }
  // top boundary
  if (y <= 0 ) {
    ySpeed = ySpeed * -1;
  } 
  if (x <= width/2) {
    image(lakitu,x,y, 100, 100); // lakitu
  } 
  else {
    // otherwise do this
    image(lakituFlip,x,y, 100, 100); // flipped lakitu
  }
  
  // compare mouse position
  if (mouseX >= width/2) {
    mouseOnLeft = true;
  } 
  else {
    mouseOnLeft = false;
  }
  if (mouseY >= height/2) {
    mouseOnTop = true;
  } 
  else {
    mouseOnTop = false;
  }

  print("Mouse on left? ");
  println(mouseOnLeft);
  print("Mouse on top? ");
  println(mouseOnTop);  

  if (mouseOnTop == true) {
    // mouse is on top
    image(standingMario, mouseX+40, mouseY-60, 100, 100); // standingMario
    if (mouseOnLeft == true) {
      // mouse is on top AND mouse is on left
      fill(245, 195, 20);
      strokeCap(ROUND);
      rect(mouseX-20, mouseY-43, 50, 50);
      fill(235, 235, 0);
      noStroke();
      rect(mouseX-16, mouseY-39, 42, 42);
      textFont(poplarStd48);
      fill(255, 255, 255);
      text("!", mouseX, mouseY);
      image(brick, mouseX-500, mouseY+40, 1200, 200);
    } 
    else {
      // mouse is on top BUT mouse is on right
      fill(190, 170, 20);
      ellipse(mouseX, mouseY, 60, 78);
      fill(255, 255, 51);
      ellipse(mouseX, mouseY, 40, 58);
      fill(190, 170, 20);
      strokeCap(ROUND);
      rect(mouseX-5, mouseY-18, 8, 40);
      image(brick, mouseX-500, mouseY+40, 1200, 200);
    }
  } 
  else {
    // mouse on bottom
    image(jumpingMario, mouseX-113, mouseY+15, 150, 150); // jumpingMario
    if (mouseOnLeft == true) {
      // mouse is on bottom AND left
      fill(5, 255, 225);
      strokeCap(ROUND);
      rect(mouseX-4, mouseY-63, 80, 70);
      fill(0, 0, 225);
      strokeCap(ROUND);
      rect(mouseX-4, mouseY-58, 80, 60);
      fill(0);
      rect(mouseX-4, mouseY-53, 80, 50);
      textFont(poplarStd48);
      fill(255, 255, 255);
      text("POW", mouseX, mouseY-10);
      image(cloud, mouseX-300, mouseY-40, 102, 60);
    } 
    else {
      // mouse is on bottom AND right
      fill(255, 176, 5);
      strokeCap(ROUND);
      rect(mouseX-12, mouseY-41, 45, 45);
      fill(0);
      strokeCap(ROUND);
      rect(mouseX-9, mouseY-38, 4, 4);
      fill(0);
      strokeCap(ROUND);
      rect(mouseX+26, mouseY-38, 4, 4);
      strokeCap(ROUND);
      rect(mouseX+26, mouseY-2, 4, 4);
      strokeCap(ROUND);
      rect(mouseX-9, mouseY-2, 4, 4);
      fill(0);
      textFont(lucidaBright48);
      fill(255, 255, 255);
      text("?", mouseX, mouseY);
      image(cloud, mouseX+200, mouseY-40, 102, 60);
    }
  }
}

