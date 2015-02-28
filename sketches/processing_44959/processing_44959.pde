
//import processing.video.*;
//
//MovieMaker mm;

PImage b;
float y = 0;
float angle;
float k;
PImage l;
float wind;
PFont font;
String letter;
int letter2;

void setup() {
  size(500, 500);
  smooth();
  b = loadImage("clouds.png");
  l = loadImage("korean.png");
  font = loadFont("font.vlw");
  textFont(font);
  letter = "Choose City";
  textAlign(CENTER);
//  mm = new MovieMaker (this,width,height,"loop.mov",60,MovieMaker.ANIMATION,MovieMaker.HIGH);
}

void draw() {

  background(b);

  angle += 0.05;
  float theta = 30 + 30 * sin(angle*wind);
  logo(theta);
  
  //type
  translate(150, 360);
  image(l, 0, 0, 200, 37);

  translate(100,80);
  scale(0.6);
  fill(20);
  text(letter,0,0);
  
//  mm.addFrame();

}
//logo

void logo(float y) {
  strokeWeight(30);
  noFill();
  strokeCap(ROUND);

  color c1 = color(126, 198, 231);
  color c2 = color(82, 149, 194);
  drawLine(0, y, c1);
  drawLine(105, y, c2);
}

//logo line

void drawLine(int yoff, float y, color c) {
  pushMatrix();
  translate(73, 203+yoff);
  stroke(c);
  beginShape();
  vertex(0, -y);
  bezierVertex(0, -y, 45, y-69, 97, y-69);
  bezierVertex(171, y-69, 194, 2-y, 262, -y);
  bezierVertex(317, -y, 356, y-68, 356, y-68);
  endShape();
  popMatrix();
}


//list of cities

void keyPressed() {
  
  //Los Angeles
  if ( key == 'q' ) {
    wind = 0.3;
    letter = "Los Angeles\n3mph";
  }
  
  //Seattle
  if ( key == 'w' ) {
    wind=0.6;
    letter = "Seattle\n6mph";
  }
  
  //New York
  if (key == 'e'){
    wind=0.3;
    letter = "New York\n3mph";
  }
  
  //Chicago
  if (key == 'r'){
    wind=3.0;
    letter = "Chicago\n21mph";
  }
  
  //Miami
  if (key == 't'){
    wind=0.3;
    letter = "Miami\n3mph";
  }
  
  //San Francisco
  if (key == 'y'){
    wind=0.5; 
    letter = "San Francisco\n5mph";
  }
  
  //Seoul
  if (key == 'a'){
    wind=0.3;
    letter = "Seoul\n3mph";
  }
  
  //Tokyo
  if (key == 's'){
    wind=0.2;
    letter = "Tokyo\n2mph";
  }
  
  //Paris
  if (key == 'd'){
    wind=0.5;
    letter = "Paris\n5mph";
  }
  
  //London
  if (key == 'f'){
    wind=1.0;
    letter = "London\n10mph";
  }
  
  //Berlin
  if (key == 'g'){
    wind=1.1;
    letter = "Berlin\n11mph";
  }
  
  //Moscow
  if (key == 'h'){
    wind=0.9;
    letter = "Moscow\n9mph";
  }
  
  //Rome
  if (key == 'z'){
    wind=0.2;
    letter = "Rome\n2mph";
  }
  
  //Beijing
  if (key == 'x'){
    wind=0.2;
    letter = "Beijing\n2mph";
  }
  
  //Taipei
  if (key == 'c'){
    wind=1.5;
    letter = "Taipei\n15mph";
  }
}

//void mousePressed() {
//  if ( mouseButton == LEFT) {
//    mm.finish();
//  }
//}

