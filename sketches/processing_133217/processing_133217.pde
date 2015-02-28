
//Created By Dalton Varney 2014

int x;
int y;
int picx;
int picy;
float s;
PImage img;
import processing.pdf.*;
boolean start = false;
boolean restart = false;
int i = 0;
PFont font;


void setup() {


  background(0);
    // Put Image into Folder containg .pde and Replace Name here
  img = loadImage("Enter File Full Name Here");
  if (img.width > 1000) {
    picx = img.width/2 +100;
  }
  else {
    picx = img.width +100;
  }
  if (img.height > 1000) {
    picy = img.height/2 +100;
  }
  else {
    picy = img.height +100;
  }
  size(picx, picy);
  loadPixels();
  x = 100;
  y = 100;
  s = 3;
  font = loadFont("SansSerif-16.vlw");
  textFont(font);
  beginRecord(PDF, "CircleDotPhoto.pdf");
}


void draw() {
  layout(picx);
  fill(255);


  buttons();
  if (restart == true) {
    start = false;
    restart = false;
    y = 100;
    x = 100;
  }
  if (start ==true) {
    makeCircles();
  }

  if (key == 'p' || key == 'P') {

    endRecord();
  }
}

void makeCircles() {
  if (y < img.height) {
    for (i = 0; i < img.width/1.3*1/s; i++) {
      color col = img.pixels[int(x+y*img.width)];
      int greyscale = round(red(col)*0.222 + green(col)*0.707 + blue(col)*0.071);
      fill(greyscale);
      noStroke();
      ellipse(x, y, s, s);
      x += s;
    }


    x = 100;
    y += s;
  }
}

void layout(int picx) {
  fill(100, 100, 200);
  rect(picx - (picx*.111), 0, (picx*.111), picy);
}

void buttons () {
  text("Select", picx*.92, 35);
  text("Pixel", picx*.922, 55);
  text("Size:", picx*.925, 75);
  //button 2
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx/2) < mouseY && mouseY < (picx*.52778) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx/2), 50, 25);
    fill(255);
    text("2", (picx-(picx*0.061)), (picx*.52));
    s = 2;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), picx/2, 50, 25);
    fill(0);
    text("2", (picx-(picx*0.061)), (picx*.52) );
  }
  //button 3
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.4444) < mouseY && mouseY < (picx*.47222) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.4444), 50, 25);
    fill(255);
    text("3", (picx-(picx*0.061)), (picx*.465));
    s = 3;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.4444), 50, 25);
    fill(0);
    text("3", (picx-(picx*0.061)), (picx*.465) );
  }
  //button 4
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.3888) < mouseY && mouseY < (picx*.4166) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.3888), 50, 25);
    fill(255);
    text("4", (picx-(picx*0.061)), (picx*.41) );
    s = 4;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.3888), 50, 25);
    fill(0);
    text("4", (picx-(picx*0.061)), (picx*.41) );
  }
  //button 5
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.333) < mouseY && mouseY < (picx*.355) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.333), 50, 25);
    fill(255);
    text("5", (picx-(picx*0.061)), (picx*.355) );
    s = 5;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.333), 50, 25);
    fill(0);
    text("5", (picx-(picx*0.061)), (picx*.355) );
  }

  //button 6
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.2777) < mouseY && mouseY < (picx*.305) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.2777), 50, 25);
    fill(255);
    text("6", (picx-(picx*0.061)), (picx*.3) );
    s = 6;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.2777), 50, 25);
    fill(0);
    text("6", (picx-(picx*0.061)), (picx*.3) );
  }

  //button 7
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.222) < mouseY && mouseY < (picx*.25) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.222), 50, 25);
    fill(255);
    text("7", (picx-(picx*0.061)), (picx*.244) );
    s = 7;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.222), 50, 25);
    fill(0);
    text("7", (picx-(picx*0.061)), (picx*.244) );
  }
  //button 8
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.1666) < mouseY && mouseY < (picx*.19444) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.1666), 50, 25);
    fill(255);
    text("8", (picx-(picx*0.061)), (picx*.1888) );
    s = 8;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.1666), 50, 25);
    fill(0);
    text("8", (picx-(picx*0.061)), (picx*.1888) );
  }
  //button 9
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.1111) < mouseY && mouseY < (picx*.13888) && mousePressed) {

    fill(0);
    rect((picx - (picx*.083)), (picx*.1111), 50, 25);
    fill(255);
    text("9", (picx-(picx*0.061)), (picx*.1333) );
    s = 9;
    start = true;
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.1111), 50, 25);
    fill(0);
    text("9", (picx-(picx*0.061)), (picx*.1333) );
  }
  //button restart
  if ( mouseX < (picx -(picx*.027)) && mouseX > (picx - (picx*.083)) && (picx*.5555) < mouseY && mouseY < (picx*.5833) && mousePressed) {
    background(0);
    fill(0);
    rect((picx - (picx*.083)), (picx*.5555), 50, 25);
    fill(255);
    text("R", (picx-(picx*0.061)), (picx*.5777) );
    restart = true;
   
  }
  else {

    fill (255);
    rect((picx - (picx*.083)), (picx*.5555), 50, 25);
    fill(0);
    text("RST", (picx-(picx*0.07)), (picx*.5777) );
  }
}

