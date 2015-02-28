
float angle;
float jitter;
PFont thefont;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  thefont = loadFont("NewsGothicMT-Bold-35.vlw");
 
}

void draw() {
  background(0);
  
  rect(200, 200, 200, 200);
  fill(255,255,255);

  if (second() % 2 == 0) {  
    jitter = random(-02, 02);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  textFont(thefont);
  textAlign(CENTER);
  text("STOP", 0, 0);
  fill(255,0,0);
  
  
 
}

