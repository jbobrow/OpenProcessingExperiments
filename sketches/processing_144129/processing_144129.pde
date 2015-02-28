
// HAPPY BIRTHDAY CLAUDIA!!!
// from your tv buddy

void setup() {
  size(800,600);
  background(255);
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  float offset = 300.0;
  float scaleVal = x;
  float angleInc = 0.111;
  float angle = 0.0;
  
  PFont f1 = loadFont("SansSerif-48.vlw");
  
  for (int a = 0; a <= width; a += 10) {
    float b = offset + (sin(angle) * scaleVal);
    float c = offset + (cos(angle) * scaleVal);
    stroke(y,0,x);
    noFill();
    rectMode(CENTER);
    rect(a,b,250,250);
    rect(a,c,250,250);
    stroke(x,0,y);
    line(width/2,height/2,b,c);
    line(width/2,height/2,c,b);
    angle+= angleInc;
  }
  
  textFont(f1);
  fill(255);
  textSize(55);
  textAlign(CENTER);
  String happybday = "HAPPY BIRTHDAY CLAUDIA!";
  text(happybday,width/2,height/2);
}


