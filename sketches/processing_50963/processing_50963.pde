
//dynamic surface, draft 01
//paragraph from  Learning Processing
//Chapter 2, pg 22, paragraph 2

//declare colors
color rd;
color blu;
color grn;
color blk;

PFont font1;
PFont font2;
PFont font3;

void setup() {
  size(600,600);
  //define colors
  rd = color(255,0,0);
  grn = color(0,255,0);
  blu = color(0,0,255);
  blk = color(0,0,0);
  //load fonts
  font1 = loadFont ("Aharoni-Bold-48.vlw");
  font2 = loadFont ("Calibri-BoldItalic-48.vlw");
  font3 = loadFont ("DejaVuSansMono-48.vlw");
  //environment
  background(255);
  smooth(); 
}

void mousePressed() {
  fill(rd);
  textFont(font1);
  text("about comments",mouseX,mouseY);
}

void mouseDragged() {
  fill(random(blu));
  textFont(font2);
  text("comments force you", random(width),random(height));
}

void mouseMoved() {
  fill(grn);
  textFont(font3);
  text("look", pmouseX, pmouseY);
  fill(blu);
  text("at the book", random(width),random(height));
}


void keyPressed() {
  fill(blk);
  textFont(font2);
  text("write comments!", width/2-100,width/2);
}

//call draw so that events 
//are listened for
void draw() {
}


