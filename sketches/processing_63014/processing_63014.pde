

PFont f;

int num = 12;
int radiusKreis = 140;

int [] zahl = {12,1,2,3,4,5,6,7,8,9,10,11};

int s = 0;
int m = 0;
int h = 0;

void setup() {
  size(400, 400);
  rectMode(CENTER);
  
  f = loadFont("Agenda-Light-25.vlw");
  textFont(f,25);
  textAlign(CENTER,CENTER);
}

void draw() {
  strokeWeight(1);
  background(0);
  stroke(255);
  translate(width/2, height/2);
  
  for (int i = 0; i < num; i++) {
    pushMatrix();
    rotate(TWO_PI / num * i);
    translate(0, -radiusKreis);
    
    rotate(TWO_PI / num * -i);
    text(zahl[i], 0, 0);
    popMatrix();
  }

  //sekunden
  s = second();

  pushMatrix();
  rotate(TWO_PI / 60 * s);
  line(0, 0, 0, -120);
  translate(0,-120);
  ellipse(0,0,10,10);
  popMatrix();

  //minuten
  m = minute();

  strokeWeight(3);

  pushMatrix();
  rotate(TWO_PI / 60 * m);

  line(0, 0, 0, -100);
  popMatrix();

  //stunden
  h = hour();

  strokeWeight(5);

  pushMatrix();
  rotate(TWO_PI / 12 * h);
  rotate(TWO_PI / 12 / 60 * m);
  line(0, 0, 0, -50);
  popMatrix();
}


