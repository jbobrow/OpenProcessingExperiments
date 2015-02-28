
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072
//import ddf.minim.*;

//Minim minim;
//AudioInput input;
//import ddf.minim.*;
//AudioPlayer song;

float x;
float y;

void setup() {
  size (600, 600);
  smooth();
  noCursor();
  frameRate(10);
  background(0);

  //minim = new Minim (this);
  //input = minim.getLineIn (Minim.MONO, 512);
  //song = minim.loadFile ("Untitled.wav");
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  //float a = input.mix.level() * 1000;
  //float b = song.mix.level() * 400;
  //float c = map(b, 0, 200, 250, 0);
  //x += input.mix.level() * 100;

  stroke(mouseX, mouseY, 0);
  strokeWeight(4);
  fill(#FFD200);
  if (key=='1') {
    frameRate(10);
    line(x, y, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, 10, 10);
    line(mouseX, mouseY, x, y);
  }
  if (key=='2') {
    frameRate(10);
    triangle(x, y, x-50, y-50, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, 10, 10);
    line(mouseX, mouseY, x, y);
  }
  if (key=='3') {
    frameRate(30);
    ellipse(x, y, pmouseX, pmouseX);
  }
  x=pmouseX;
  y=pmouseY;

  title();
}

void keyPressed() {
  if (key==' ')background(0);
}

void mouseMoved() {
  //song.loop();
  song.play ();
}

void   title() { 
  fill(255); 
  textAlign(RIGHT); 
  text("KIM Jieun, interactive mouse, Dynamic Media, 2014", width-50, height-20);
  fill(255);
  text("space bar=clean", width-500, height-20);
  text("key'1'=line", width-500, height-40);
  text("key'2'=triangle", width-500, height-60);
  text("key'3'=ellipse", width-500, height-80);
} 

