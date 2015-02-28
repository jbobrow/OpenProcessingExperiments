
float fltA;
float fltB;
float fltC;
float fltD;

void setup() {
  size(500, 500);
  frameRate(30);
}

void draw() {
  fadeToWhite();
//  background(255);
    
  fltA = random(1,500);
  fltB = random(1,500);
  fltC = random(10,100);
  fltD = fltD + 0.1;

  stroke(0);
  strokeWeight(fltC/3);
  strokeCap(SQUARE);
  noFill();
  translate(width/2, height/2);
  rotate(fltD);
  arc(width/500, height/500, 100, 100, 0, PI*1.8); 

  stroke(random(0,255), random(0,255), random(0,255));
  rotate(PI*random(0,2));
  arc(fltA, fltB, fltC, fltC, 0, PI*1.9);
}


void fadeToWhite() {
  stroke(0);
  fill(255, 255, 255, 100);
  rectMode(CORNER);
  rect(0, 0, width, height);
}



