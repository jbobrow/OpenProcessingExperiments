
PShape s;
float r = 300;


void setup() {
  size(1000, 1000);
  background(0);
  s = loadShape("Human-brain.SVG");
}

void draw() {
  background(0);
  shapeMode(CENTER);
  shape(s, width/2, height/2, r, r);
  
 PFont testicles;
 testicles = loadFont("Serif-48.vlw");
 textFont(testicles, 48);
 textMode(CENTER);
 text("click to get more smart!", width/4, height/4);
}

 void mouseClicked() {
  r*=1.1 ;
  }


