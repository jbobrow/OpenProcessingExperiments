
float posY;
float velYU;
float velYD;

float posX;


void setup() {
  size(400,400);
  background(255);
  frameRate(1000);
  smooth();
  noStroke();

  posY= pmouseY;
  velYU = -1;
  velYD = 1;

  posX = pmouseX;
}

void draw () { 
  fons();
  
  if (posY < height/2) { // del centre cap a dalt rodones roses
    posY = posY + velYU;
    background(255);
    fons();
    rond (posX, posY, 30);
  }
  if (posY <= 0) {
    posX = pmouseX;
    posY = pmouseY;
    rond (posX, posY, 30);
  }
  if (posY >= height/2) { // del centre cap a baix quadrats lilas
    posY = posY + velYD;
    background(255);
    fons();
    care (posX, posY,30);
  }
  if (posY >= height) {
    posX = pmouseX;
    posY = pmouseY;
    care (posX, posY,30);
  }
} 

void rond (float x, float y, float r1) {
  noStroke();
  fill(227,5,90);
  ellipse (x, y,r1,r1);
}

void care (float x, float y, float r1) {
  noStroke();
  fill(100,0,240);
  rect (x, y,r1,r1);
}

void fons () {
  strokeWeight(5);
  stroke(0);
  line(0,height/2,width,height/2);
}








