
int num = 12;
int radiusKreis = 140;

int s = 0;
int h = 0;
int m = 0;

PFont f;
int[] zahl = {12,1,2,3,4,5,6,7,8,9,10,11};

void setup() {
  size(600, 400);
  rectMode(CENTER);
  f = loadFont("AgroSans-Bold-25.vlw");
  textFont(f, 25);
  textAlign(CENTER,CENTER);
}

void draw() {
  noStroke();
  background(150);
  translate(width/2, height/2);
  for (int i = 0; i < num; i++) {
    pushMatrix();
    rotate(TWO_PI / num * i);
    translate(0, -radiusKreis);
    rect(0, 0, 10, 10);
    
    translate(0, -27);
    rotate(TWO_PI / num * -i);
    text(zahl[i], 0, 0);
    
    popMatrix();
  }

  stroke(255);
  strokeWeight(3);

  //sekunde
  s = second();
  pushMatrix();
  rotate(TWO_PI / 60 * s);
  line(0, 0, 0, -120);
  popMatrix();

  //sekunde
  m = minute();
  pushMatrix();
  rotate(TWO_PI / 60 * m);
  line(0, 0, 0, -120);
  popMatrix();

  //stunde
  h = hour();
  pushMatrix();
  rotate(TWO_PI / 12 * h);
  rotate(TWO_PI / 12 / 60 * m);
  line(0, 0, 0, -60);
  popMatrix();
}


