
int card = 0;
int mov1 = 1;
int mov2 = 300;
int mov3 = 400;
int mov5 = 280;
int mov6 = 300;
int mov7 = 0;
int mov8 = 0;
int x =0;
int y =0;
int q = 0;


int knifemovX =350;
int knifemovY =390; 
int tintsize = 50;
int tintsize2 = 0;
float mov4 =200;
float mov9 =1;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

boolean playing;

PImage people,detailface,tear,knife;
PFont Text;

void setup() {
  size(600, 600);
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("die.mp3");
  playing = true;
  Text = loadFont("ArialMT-78.vlw");
  people = loadImage("people.png");
  knife = loadImage("knife.png");
  detailface= loadImage("detailface.png");
  tear= loadImage("tear.png");
  textFont(Text);
}

void draw() {

  if (card == 0) {
    background(255);
    noStroke();
    fill(67,41,64);
    ellipse(300,460,250,30);
    cardOne();
  }  
  else if (card == 1) {
    cardTwo();
  } 
  else if (card  == 2) {
    cardThree() ;
  }
  else if (card  == 3) {
    cardFour();
  }
  else if (card  == 4) {
    cardFive();
  } 
  else if (card  == 5) {
    cardSix();
  } 
  else if (card  == 6) {
    cardSeven();
  }
  else if (card  == 7) {
    cardEight();
  }
  else if (card  == 8) {
    cardNine();
  }
}

void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 7) {
    card = 8;
  }
  else if (card == 6) {
    card = 8;
  }
  else if (card == 5) {
    card = 8;
  }
  else if (card == 8) {
    card = 0;
  }
  
}

void button(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);

  if (mousePressed && insideQuad(0,25,300,25,300,50,0,50)) {
    card = 5 ;
  }
  noStroke();
  fill(0);
  quad(0,30,300,30,300,51,0,51);
  textSize(17);
  fill(255);
  text("1. Jesus! Get the hell out of here ",10,49);
  popMatrix();
}
void button2(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);

  if (mousePressed && insideQuad(0,65,300,65,300,91,0,91)) {
    card = 6 ;
  }
  noStroke();
  fill(0);
  quad(0,70,300,70,300,90,0,90);
  textSize(17);
  fill(255);
  text("2. How dare you!!! ",10,89);

  popMatrix();
}
void button3(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);

  if (mousePressed && insideQuad(0,105,300,105,300,131,0,131)) {
    card = 7 ;
  }
  noStroke();
  fill(0);
  quad(0,110,300,110,300,130,0,130);
  textSize(17);
  fill(255);
  text("3. Please don't kill me Please!!! ",10,129);

  popMatrix();
}

boolean insideQuad(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
  return insideTriangle(x0, y0, x1, y1, x2, y2) || insideTriangle(x2, y2, x3, y3, x0, y0);
}


// This method uses the Barycentric technique described here:
// http://www.blackpawn.com/texts/pointinpoly/default.html

boolean insideTriangle(float x0, float y0, float x1, float y1, float x2, float y2) {

  // Compute vectors        
  float dx0 = x1 - x0;
  float dy0 = y1 - y0;

  float dx1 = x2 - x0;
  float dy1 = y2 - y0;

  float dx2 = mouseX - x0;
  float dy2 = mouseY - y0;

  // Compute dot products
  float dot00 = dx0 * dx0 + dy0 * dy0;
  float dot01 = dx0 * dx1 + dy0 * dy1;
  float dot02 = dx0 * dx2 + dy0 * dy2;
  float dot11 = dx1 * dx1 + dy1 * dy1;
  float dot12 = dx1 * dx2 + dy1 * dy2;

  // Compute barycentric coordinates
  float invDenom = 1.0f / (dot00 * dot11 - dot01 * dot01);
  float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
  float v = (dot00 * dot12 - dot01 * dot02) * invDenom;

  // Check if point is in triangle
  return (u > 0) && (v > 0) && (u + v < 1);
}




