
float w = 0;
float r = 0;

void setup() {
  size(400,400);
  translate(200,200);
  fill(0,0);
  smooth();
  background(0);
  stroke(255);
  colorMode(HSB);
  strokeWeight(2);
  ellipse(0,0,200,200);
  while(w < 60) {
    stroke(#002389);
    strokeWeight(4);
    point(0, -104);
    rotate(PI/30);
    w += 1;
  }
  fill(255,255);
  textSize(24);
  text("12",-10,-110);
  text("3", 110,10);
  text("6",-10,125);
  text("9",-120,10);
}

void secondHand() {
  resetMatrix();
  
  translate(200,200);
  rotate(r);
  
  stroke(0,0);
  fill(0,255);
  ellipse(0,0,195,195);
  stroke(255,255);
  line(0,0,0,-95);
  r += (PI/30)%(2*PI);
}

void minuteHand() {
  resetMatrix();
  
  translate(200,200);
  rotate(r/60);
  
  stroke(150,255);
  line(0,0,0,-75);
}

void hourHand() {
  resetMatrix();
  
  translate(200,200);
  rotate(r/720);
  
  stroke(50,255);
  line(0,0,0,-55);
}

void draw() {
  secondHand();
  minuteHand();
  hourHand();
  frameRate(1);
}

