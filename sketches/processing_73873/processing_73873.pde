
int rcolor = color(random(255),random(255),random(255),45);

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  fill(rcolor);
}

void draw() {
  PFont hc=loadFont("Helvetica-Compressed-48.vlw");
  textFont(hc,24);
  textAlign(CENTER);
  if (mouseButton == LEFT){
    fill(rcolor);
    ellipse(random(width),random(height),30,30);
  } else if (mouseButton == RIGHT){
    fill(random(255),45);
    rect(random(width), random(height), 30, 30);
  } else {
    fill(255);
    text("CLICK TO START",width/2,height/2);
  }
}

