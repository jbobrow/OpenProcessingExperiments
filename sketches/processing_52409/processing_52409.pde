
/******************************************************
  
 * Assignment 3
 * Name: Amanda Guadalupe
 * Email: aguadalupe@brynmawr.edu
 * Course: CS110- Section 02
 * Submitted: 2/14/2012 
 *
 * Valentine's day is among us!! I'm celebrating by drawing a card that when it is open, hearts and confetti fly everywhere!! 
 * I am using a beginshape to draw the heart which I referenced from http://processing.org/discourse/yabb2/YaBB.pl?num=1246205739
 * and scaled it using int x and y. the heart and confetti's are being called by a function and are
 * looped to be placed at random coordinates! Happy Valentines Day!!
  
 *********************************************************/


void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  frameRate(6);
  
  
  drawCard(width/4, height/4);
  drawCardright(width/4, height/4);
}

void draw() {
   for (float i=0; i < 10; i++) { //this continuously draws the hearts and the confetti!
    int ry = (int)random(0, height);
    int rx = (int)random(0, width);
    confetti( rx, ry, 4, 10);
    drawHeart(rx,ry);
    
   }
   
   textSize(35);
   smooth();
   fill(255);
   text("Happy Valentine's Day!!", width/6, height/6);
   
   
}

void confetti ( int rx, int ry, int n, float radius) { //colorful confetti!
  for ( float i=0; i < n; i++) {
    noStroke();
    fill(random(255), random(255), random(255));
    ellipse( rx*i, ry*i, radius, radius);
  }
}
void drawHeart (int x, int y) { //referenced and then scaled heart!
    smooth();
    noStroke();
    fill(255, 0, 0, 150);
    beginShape();
    vertex(50+x, 15+y);
    bezierVertex(50+x, -5+y, 90+x, 5+y, 50+x, 40+y);
    vertex(50+x, 15+y);
    bezierVertex(50+x, -5+y, 10+x, 5+y, 50+x, 40+y);
    endShape();
    
}

void drawCard (int x, int y) {
  smooth();
  stroke(2);
  fill(242, 184, 96);
  beginShape();
  vertex(50+x, 100+y);
  vertex(100+x, 130+y);
  vertex(100+x, 190+y);
  vertex(50+x, 180+y);
  endShape(CLOSE);
}

void drawCardright(int x, int y) {
  smooth();
  stroke(2);
  fill(242, 184, 96);
  beginShape();
  vertex(150+x,100+y);
  vertex(100+x, 130+y);
  vertex(100+x, 190+y);
  vertex(150+x, 180+y);
  endShape(CLOSE);
}









