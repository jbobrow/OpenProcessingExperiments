
String[] lines = {"It", "was", "a", "dark", "and", "rainy", "night", "in", "the", "bottle."};
int tr = 0;
int ts = 0;

int linex[] = new int[10];
int liney[] = new int[10];

int i = 0;
int j = 0;
int posxs = 0;
int posys = 0;
int posxe = 0;
int posye = 0;
boolean flgx = true;
boolean flgy = true;

void setup(){
  frameRate(20);
  size(500,500);
  background(0);
  stroke(0);
  fill(0);
}


void draw(){

  funkfunc();

  fade();

}

void funkfunc(){
  
  posxs = int(random(1,width));
  posys = int(random(1,1));
  posxe = int(posxs + random(-50,50));
  posye = int(random(1,height));

  fill(0);
  strokeWeight(2);
  stroke(0,100,255,150);
  line(posxs, posys, posxe, posye);
  ripple();
  
}

void ripple() {
  for (int i = 0; i < 255; i = i+5) {
    strokeWeight(1);
    stroke(100-i, 100-i, 200-i/1.5, 200+i/5);
    fill(i, i, i, 1);
    ellipse(posxe, posye, i, i);
  }
}

void fade() {
  noStroke();
  fill(0,0,0, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void mouseClicked() {
  for (int i = 0; i < 255; i = i+1) {
    strokeWeight(1);
    stroke(200-i/1.8, 100-i, 200-i/1.5, 200+i/5);
    fill(i, i, i, 1);
    ellipse(mouseX, mouseY, i, i);
  }
}

void mouseMoved() {
  stroke(0);
  fill(255);
  ts = int(random(1,100));
  tr = int(random(0,10));
  
  textSize(ts);
  text(lines[tr], mouseX, mouseY);

}



