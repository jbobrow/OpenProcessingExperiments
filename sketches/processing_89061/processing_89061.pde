
PFont f;

void setup() {
  size(890,530);
  f = loadFont("gi.vlw");
}

void draw() {
background(0);
ellipse(800,60,220,220);
rectMode(CENTER);
rect(300,300,100,200);
rect(205,215,90,10);
fill(255);
rect(395,215,90,10);
fill(255);
ellipse(300,140,90,90);
fill(0);
ellipse(281,140,24,24);
fill(0);
ellipse(321,140,24,24);
fill(0);
rect(300,170,20,2);
rect(300,450,80,260);
textFont(f,32);
loadFont("gi.vlw");
fill(255);
text("The funeral moon glows strongly now, for I am nearly there.",10,500);
}


