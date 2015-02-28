
// FINAL PROJECT
// division version 2

boolean overGrid1 = false;
boolean overGrid2 = false;
boolean locked1 = false;
boolean locked2 = false;

int grid1number;
int grid2number;

void setup() {
  size(900,550);
  smooth();
  
  PFont font;
  font = loadFont("SansSerif-48.vlw");
  textFont(font);
  textSize(16);
  textAlign(CENTER);
}

void draw() {
  background(255);
  
  // divide the interface
  
  float w = width;
  float w1 = width/3;
  float w2 = width*2/3;
  
  stroke(0,30);
  noFill();
  line(w1,0,w1,height);
  line(w2,0,w2,height);
  
  // add the grids
  
  grid(0,0);
  grid(w1,0);
  grid(w2,0);
  
  // mouse settings
  
  if (mouseX < w1) {
    overGrid1 = true;
    overGrid2 = false;
  } else if ((mouseX > w1) && (mouseX < w2)) {
    overGrid2 = true;
    overGrid1 = false;
  } else {
    overGrid1 = false;
    overGrid2 = false;
  }
  
  // instructions
  
  fill(255,0,255);
  text("Click and drag your mouse diagonally!",150,500);
  fill(0,0,255);
  text("Click and drag your mouse down!", 450,500);
  fill(255,0,0);
  text("Here's your dividend!",750,500);
  
  // numbers and ellipses
  
  for (int i = 0; i < grid1number; i++) {
    for (int j = 0; j < grid2number; j++) {
      if ((i < 11) && (j < 16)) {
        fill(255,0,255);
        noStroke();
        text(grid1number*grid2number,150,450);
        ellipse((i*25)+25,(j*25)+25,10,10);
  
        fill(0,0,255);
        noStroke();
        text(grid2number,450,450);
        ellipse(325,(j*25)+25,10,10);
        
        fill(255,0,0);
        noStroke();
        text(grid1number,750,450);
        ellipse((i*25)+625,25,10,10);
      }
    }
  }
}

void grid(float x, float y) {
  pushMatrix();
  translate(x,y);
  for (int a = 25; a < 300; a += 25) {
    for (int b = 25; b <= 400; b += 25) {
      stroke(0);
      strokeWeight(1);
      point(a,b);
    }
  }
  popMatrix();
}

void mousePressed() {
  if (overGrid1) {
    locked1 = true;
    locked2 = false;
  } else if (overGrid2){
    locked2 = true;
    locked1 = false;
  } else {
    locked1 = false;
    locked2 = false;
  }
}

void mouseDragged() {
  if (locked1) {
    if ((mouseX < 325) && (mouseY < 425)) {
      grid1number = round(mouseX/25);
      grid2number = round(mouseY/25);
    }
  }
  
  if (locked2) {
    if ((mouseX > 300) && (mouseX < 625) && (mouseY < 425)) {
      grid2number = round(mouseY/25);
    }
  }
}


