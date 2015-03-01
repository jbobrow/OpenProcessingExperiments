
int x, y;


void setup() {
  size(1024, 768);
  background(0);
  smooth();
  PFont f = createFont("Lucida Console", 50);
  textFont(f);
  textAlign(CENTER, CENTER);
}

void draw() {
  rect(0, 0, width, height);
  float p1   = 0.35;         
  float p2 = 0.35 + p1;     
  float num = random(1); 
  if (num < p1) {
    fill(0, 255, 0);
    text("el magenta es el no verde", width/2, height/3);
  } else if (num < p2) {
    fill(255, 0, 255);    
    text("pero el verde", width/2, height/2);
  } else {
    fill(0, 255, 0);
    text("no es el no magenta", width/2, height/1.5);
  }
}



