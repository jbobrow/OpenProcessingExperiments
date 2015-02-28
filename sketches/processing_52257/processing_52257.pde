
//Collage 3 (Guibert)
float posX0 = -10;
float posX1 = -100;
float posX2 = 1200;
float posX3 = 900;
float posX4 = -50;
float posX5 = 1500;
PFont font1;
int i;


void setup() {
  size(1000,650);
  background(164,169,219,10);
  font1 = loadFont("MS-Gothic-40.vlw");
  textFont(font1);
}

void mousePressed() {
  fill(230);
  strokeWeight(1);
  if (mouseX < 300) {
    text("Is it?",mouseX,mouseY);
  } 
  else if (mouseX > 500) {
    text("The last thing",mouseX,mouseY);
  } 
  else {
    text("A portrait",mouseX,mouseY);
  }
}

void draw() {
  background(164,169,219,10);

  noStroke(); //insert loop here
  fill(170,169,255,random(10,200));
  for (int i = 0; i < 100; i = i +2) {
    ellipse(i*20,random(0,650),10,30);
  }

  fill(200);
  stroke(200);
  strokeWeight(2);
  text("I wanted an answer",posX0,575);
  posX0 = posX0 + .75;
  if (posX0 > 1500) {
    posX0 = -200;
  }

  fill(120);
  stroke(120);
  text("took a cab to the hospital",posX1,400);
  posX1 = posX1 + 2;
  if (posX1 > 2000) {
    posX1 = -1000;
  }

  fill(100);
  stroke(100);
  text("Cryptic sentences I didn't understand",posX2,150);
  posX2 = posX2 - 2.1;
  if (posX2 < -1000) {
    posX2 = 1500;
  }

  fill(164,169,255,200);
  noStroke();
  text("Sad little boy",posX3,350);
  posX3 = posX3 - .85;
  if (posX3 < -1000) {
    posX3 = 1200;
  }

  fill(80);
  stroke(80);
  text("burst into tears",posX4,100);
  posX4 = posX4 + 1;
  if (posX4 > 1500) {
    posX4 = -200;
  }

  fill(135);
  stroke(135);
  text("A recently bereaved friend",posX5,500);
  posX5 = posX5 - 1.75;
  if (posX5 < -1000) {
    posX5 = 1500;
  }
}


