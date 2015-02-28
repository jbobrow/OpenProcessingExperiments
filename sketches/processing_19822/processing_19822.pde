
PFont font;
float x = 0;
float y = 15;
float x2 = 20;
float y2 = 10;

void setup() {
  size(250, 250);
  font = loadFont("Candara-30.vlw");
  textFont(font);
  background(0);
  smooth();
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  y+=-10;
  x2+=20;
  y2+=5;
  {

    stroke(255,200);
    textSize(60);
    text("L6C2G2", mouseX-85, mouseY-10);
    text("L6C2G2", mouseX-85, mouseY-50);
    text("L6C2G2", mouseX-85, mouseY+30);
    text("L6C2G2", mouseX-85, mouseY+70);
    noFill();
    strokeWeight(5.0);
    stroke(224,142,255);
    ellipse(pmouseX,pmouseY,x,y);
  }

  frameRate(150);
  x += 1.0;
  if (x > width) {
    x = -5;
  }
}
void mousePressed() {
  y=random(10,50);
  stroke(255,220);
  x2 = 0;
  y = 0;
  y2 = 0;
}


