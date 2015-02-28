

PFont fontA;
float y = 50.0;
float speed = 1.0;
float radius = 15.0;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  colorMode(HSB, 100);
  fontA = loadFont("Klavika-Light-48.vlw");
  textFont(fontA, 48);
}

void draw() {
  float s = map(second(), 0, 60, 0, 20);
  float s2 = map(second(), 0, 60, 0, 100);
  float m = map(minute(), 0, 60, 0, 100);
  println( hour() + ":" + minute() + ":" + second());
  fill(100, 0, 0);
  strokeWeight(3);  
  pushMatrix();
  fill(31,0,100);
  text("P", 100, 240-s);
  line (130, 250-s, 170, 250);
  text("O", 180, 240);
  line (210, 250, 250, 250-s);
  text("S", 260, 240-s);
  line (290, 250-s, 330, 250);
  text("T", 340, 240);

  text("A", 100, 300+s);
  line (130, 310+s, 170, 310);
  text("N", 180, 300);
  line (210, 310, 250, 310+s);
  text("A", 260, 300+s); 
  line (290, 310+s, 330, 310);
  text("L", 340, 300);
  line (370, 310, 410, 310+s);
  text("O", 420, 300+s);
  line (450, 310+s, 490, 310);
  text("G", 500, 300);
  stroke(50+s2, 60, 80);
  popMatrix();
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  translate(0, y);
  //  rotate(radius);

  rect(20, 0, radius, radius);
  ellipse (90, -50, radius, radius);
  rect (90, -350, radius, radius);
  ellipse(120, -20, radius, radius);
  ellipse(120, -120, radius, radius);
  ellipse(150, -80, radius, radius);
  rect(150, -280, radius, radius);
  ellipse(190, 10, radius, radius);
  ellipse(190, -70, radius, radius);
  ellipse(250, 20, radius, radius);
  rect(330, -70, radius, radius);
  ellipse(330, -170, radius, radius);
  ellipse(380, -20, radius, radius);
  rect(380, -120, radius, radius);
  ellipse(420, -150, radius, radius);
  rect(480, -10, radius, radius);
  ellipse(500, -400, radius, radius);
  ellipse(500, -700, radius, radius);
  ellipse(520, -600, radius, radius);
  ellipse(550, -900, radius, radius);
  ellipse(580, -200, radius, radius);
  ellipse(600, -20, radius, radius);
  ellipse(600, -350, radius, radius);
  ellipse(300, -420, radius, radius);

  y += speed;
  if (y > height+radius) {
    y = -radius;
  }
}


