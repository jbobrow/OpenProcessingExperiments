
void setup() {
  size(1152,720);
  smooth();
  background(0);
  strokeWeight(3);
  colorMode(HSB);
  rectMode(CENTER);
  stroke(255);
  textAlign(CENTER,CENTER);
  fill(random(255),255,255);
  textSize(48);
  text("Welcome to", width/2,height/2 - 200);
  text("Mr. Lord Death Archanoth of Whales Legacy", width/2,height/2 - 150);
  text("Drawing Center",width/2,height/2 - 100);
  textSize(24);
  text("Left click = Draw LAWL",width/2,height/2);
  text("Right click = Draw Rectangle", width/2,height/2 + 30);
  text("Press 'c' to start or start over",width/2,height/2 + 60);
}

void drawLAWL() {
  fill(random(255),255,255);
  text("Mr. Lord Death Archanoth of Whales Legacy", mouseX, mouseY);
}

void drawRect() {
  fill(0);
  rect(mouseX,mouseY,550,40);
}

void draw() {
  if(mousePressed && (mouseButton == LEFT)) {
    drawLAWL();
  }
  if(mousePressed && (mouseButton == RIGHT)) {
    drawRect();
  }
}

void keyPressed() {
  if(key == 'c') {
    background(0);
  }
}

