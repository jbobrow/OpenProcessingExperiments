
/*Mondrian pier algorithm. A series of randomly placed lines of varying 
 lengths to be generated horizontaly and vertically and confined within an 
 elliptical shape in the center of the image. Lines are longer at bottom 
 with a noticable vertical column at the bottom center of the ellipse. Lines 
 appear shorter in the top third of image. A new configuration to be generated 
 on mousepressed*/

PImage circ_mask;

void setup(){
  size(500, 500);
  smooth();
  background(240);
  noLoop();
}

void draw(){
  circ_mask = loadImage("circ_mask.png");
  int lnAmnt = (int)random(100, 700);
  rndLinHoz(lnAmnt, circ_mask);
  rndLinVet(lnAmnt, circ_mask);
}

//horizontal lines =========================================

void rndLinHoz(int nbrParts, PImage m) {
  int x, y;
  m.loadPixels();
  stroke(0,0,0);
  do {
    x = (int) random(0, m.width-20);
    y = (int) random(0, m.height-20);
    int lnX = x + (int)random(2, 25);
    if (y < m.height/3){
      lnX = x + (int)random(2, 15);
    }//draw shorter lines for top third
    float lnWobx = random(-0.6, 0.6);//add a random length to the lines
    if(red(m.get(x,y)) < 128) { //circle detection if black
      line(x,y,lnX,y+lnWobx);
      strokeWeight((float)random(0.2, 1.00));
      nbrParts--;
    }
  }
  while(nbrParts > 0);
}

//vertical lines ==========================================

void rndLinVet(int nbrParts, PImage m) {
  int x, y;
  m.loadPixels();
  stroke(0,0,0);
  do {
    x = (int) random(0, m.width);
    y = (int) random(0, m.height);
    int lnY = y + (int)random(2, 25);
    if ((y > m.height/2+50) && (x < m.width/2 + 15 && x > m.width/2 -15)){
      lnY = y + (int)random(60, 85);
      strokeWeight(0.7);
    }//draw longer lines for the pier
    else if (y < m.height/3){
      lnY = y + (int)random(2, 17);
    }//draw shorter lines for top third
    if(red(m.get(x,y)) < 128) { //circle detection if black
      line(x,y,x,lnY);
      strokeWeight((float)random(0.2, 1.00));
      nbrParts--;
    }
  }
  while(nbrParts > 0);
}

//mouse click for new configuration =======================

void mousePressed(){
  setup();
  redraw();
}


