
/*
Reveal. Sliding panel
Oct 6, 2009
*/
PFont myFont;

void setup() {
  size(500,500);
  background(245,205,0);
  smooth();  
  myFont=createFont("Helvetica Bold", 22);
}

void draw() {
  translate(width/2, height/2);//translate the origin
  background(245,205,0);
  rect(-width/2+mouseX/2,0,10,10);
  fill(255,10+mouseX/1.5);
  noStroke();
  rect(-width/2,-200, 1.2*mouseX, 400);
  fill(245,205,0);
  textFont(myFont);
  textSize(16);
  text( "NATIONAL", 100, 100);
  text( "GEOGRAPHIC", 100, 120);
  text( "CHANNEL", 100, 140);
}

