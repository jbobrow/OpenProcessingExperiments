
int oldMouseX, oldMouseY;
color pen1, pen2;
int myPenWeight;
PFont bobsfont;
int bunny, bunnyY;
color c1, c2;
int aState;
int x1, y1;
int vX, vY;
int f1;
int mX, mY;
PImage foto1;
int diameter=20;
float x;
float y;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
 
void setup() {
  size(1000, 900);
  smooth();
  foto1 = loadImage("serpiente.jpg");
 smooth();
 x = width/2;
 y = height/2;
 minim = new Minim(this);
player = minim.loadFile("yann tiersen - comptine d'un autre été372.mp3", 2048);
player.play();
  oldMouseX = 0;
  oldMouseY = 0;
  pen2 = color(0, 0, 0);
  c1 = color(255, 255, 255);
  c2 = color(0, 0, 0);
  background(c1);
  myPenWeight = 1;
  bobsfont = loadFont("Times-Bold-48.vlw");
  bunny = 300;
  bunnyY = 40;
  aState = 0;
  x1 = 20;
  y1 = 80;
  vX = 5;
  vY = 1;
  f1 = int(random(255));
  mX = 20;
  mY = 80;
}
 
void draw() {
  image(foto1,0,0);
  fill(c2);
  textFont(bobsfont, 36);
  text("Pen", 0, 20);
  strokeWeight(myPenWeight);
  stroke(pen2);
  if (mousePressed && mouseY > 66) {
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line(mouseX, mouseY, oldMouseX, oldMouseY);
    }
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;
    
    //red button
    strokeWeight(1);
    stroke(0);
    fill(255, 0, 0);
    ellipse(80, 15, 20, 20);
    //black button
    fill(0);
    ellipse(55, 15, 20, 20);
    //blue button
    fill (0, 0, 255);
    ellipse (105, 15, 20, 20);
    //green button
    fill(0, 255, 0);
    ellipse(130, 15, 20, 20);
    //orange button
    fill(255, 140, 0);
    ellipse(155, 15, 20, 20);
    //yellow button
    fill (255, 255, 0);
    ellipse(180, 15, 20, 20);
    //purple button
    fill(148, 0, 211);
    ellipse(205, 15, 20, 20);
    //random button
    fill(255);
    ellipse(230, 15, 20, 20);
    fill(0);
    text("?", 226, 24);
    //current color rect
    fill(pen2);
    rect(570, 5, 20, 20);
    if (mousePressed && dist(55, 15, mouseX, mouseY) < 10) {
      pen2 = color(0, 0, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 80, 15) < 10) {
      pen2 = color(255, 0, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 105, 15) < 10) {
      pen2 = color(0, 0, 255);
    }
    else if (mousePressed && dist(mouseX, mouseY, 130, 15) < 10) {
      pen2 = color(0, 255, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 155, 15) < 10) {
      pen2 = color(255, 140, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 180, 15) < 10) {
      pen2 = color(255, 255, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 205, 15) < 10) {
      pen2 = color(148, 0, 211);
    }
    else if (mousePressed && dist(mouseX, mouseY, 230, 15) < 10) {
      pen2 = color(random(255), random(255), random(255));
    }
    //clear screen
    fill(0);
    stroke(0);
    rect(110, 32, 50, 25);
    fill(255);
    text("clear", 112, 53);
    if (mousePressed && mouseX > 110 && mouseX < 160 && mouseY > 32 && mouseY < 57) {
      background(255);
      myPenWeight = 1;
      pen2 = color(0, 0, 0);
      aState = 0;
      c2 = color(0, 0, 0);
    }
 
    //stroke weight buttons
    fill(255);
    strokeWeight(1);
    rect(60, 35, 20, 20);
    rect(85, 35, 20, 20);
    if (mousePressed && mouseX > 85 && mouseX < 105 && mouseY > 35 && mouseY < 55) {
      if (myPenWeight > 1) {
        myPenWeight --;
      }
    }
    fill(0);
    text("+", 65, 50);
    text("-", 92, 52);
    if (mousePressed && mouseX > 60 && mouseX < 80 && mouseY > 35 && mouseY < 55) {
      myPenWeight ++;
    }
 
    //eraser
    fill(255, 128, 114);
    strokeWeight(1);
    quad(20, 40, 50, 40, 40, 50, 10, 50);
    if (mousePressed && mouseX > 10 && mouseX < 50 && mouseY > 40 && mouseY < 50) {
      myPenWeight ++;
      pen2 = c1;
    }
    //bunny
    fill(255);
    ellipse(565, 40, 3, 20);
    ellipse(575, 40, 3, 20);
    ellipse(585, 53, 25, 10);
    ellipse(570, 50, 15, 15);
    ellipse(590, 60, 5, 5);
    ellipse(580, 60, 5, 5);
    if (mousePressed && mouseX > 565 && mouseX < 590 && mouseY > 35 && mouseY < 65) {
      fill(255);
      stroke(pen2);
      strokeWeight(1);
      bunny = int(random(600));
      bunnyY = int(random(173, 700));
      ellipse(bunny, bunnyY - 100, 3, 20);
      ellipse(bunny + 10, bunnyY - 100, 3, 20);
      ellipse(bunny + 20, bunnyY - 87, 25, 10);
      ellipse(bunny + 5, bunnyY - 90, 15, 15);
      ellipse(bunny + 25, bunnyY - 80, 5, 5);
      ellipse(bunny + 15, bunnyY - 80, 5, 5);
    }
    fill(c2);
    text("Background", 255, 22);
    //red background
    if (button(420, 255, 0, 0)) {
      fill(c1);
      stroke(0);
      c1 = color(255, 0, 0);
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    //blue background
    if (button(445, 0, 0, 255)) {
      fill(c1);
      stroke(0);
      c1 = color(0, 0, 255);
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    //black background
    if (button(395, 0, 0, 0)) {
      fill(c1);
      stroke(0);
      c1 = color(0, 0, 0);
      rect(0, 65, 600, 600);
      //c2 = color(255, 255, 255);
    }
    //green background
    if (button(470, 0, 255, 0)) {
      fill(c1);
      stroke(0);
      c1 = color(0, 255, 0);
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    //random background
    if (button(495, 255, 255, 255)) {
      fill(c1);
      stroke(0);
      c1 = color(random (255), random (255), random (255));
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    fill(0, 0, 0);
    text("?", 491, 24);
    //auto draw button
    fill(255);
    stroke(0);
    rect (195, 32, 50, 25);
    fill(0);
    text("auto", 198, 53);
    rect (165, 32, 30, 25);
    rect(245, 32, 30, 25);
    fill(255);
    textSize(32);
    text("on", 168, 52);
    text("off", 247, 52);
    x1+=vX;
    y1+=vY;
    if (mousePressed && mouseX > 165 && mouseX < 195 && mouseY > 32 && mouseY < 57) {
      aState = 1;
    }
    if (mousePressed && mouseX > 245 && mouseX < 275 && mouseY > 32 && mouseY < 57) {
      aState = 0;
    }
    if (aState == 1) {
      fill(pen2);
      stroke(pen2);
      ellipse(x1, y1, 10, 10);
    }
    if ( x1 > width - 5 || x1 < 5) {
      vX *=-1;
    }
    if ( y1 > height - 5 || y1 < 71) {
      vY *=-1;
    }
    stroke(205, 201, 201);
    line(0, 65, 599, 65);
  }
 
  boolean button(int buttX, int buttR, int buttG, int buttB) {
    fill(buttR, buttG, buttB);
    strokeWeight(1);
    stroke(0);
    ellipse(buttX, 15, 20, 20);
    boolean hit = false;
    if (mousePressed && dist(buttX, 15, mouseX, mouseY) < 10) hit = true;
    return (hit);
  }


