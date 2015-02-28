
float x;
float y;
int costard;
PFont font1;


void setup() {
  size(400, 400); //MAX permis par le prof
  smooth();
  frameRate(30);
  rectMode(CENTER);
  ellipseMode(CENTER);

  x=width/2;
  y=height/5;
  costard=0;
  font1 = loadFont ("EngraversMT-Bold-48.vlw");
  textFont(font1, 40);
}

void draw() {
  background(127);


  //Bras
  noStroke();
  fill(costard);
  beginShape();
  curveVertex(x-5, y);
  curveVertex(x-20, y+30);
  curveVertex(x-35, y+50);
  curveVertex(x-85, y+60);
  curveVertex(x-110, y+100);
  curveVertex(x-120, y+165);
  curveVertex(x-120, y+250);
  curveVertex(x-100, y+250);
  curveVertex(x-90, y+150);
  curveVertex(x-80, y+100);
  curveVertex(x-70, y+85);
  curveVertex(x-30, y+100);
  curveVertex(x, y+100);
  curveVertex(x+30, y+100);
  curveVertex(x+70, y+85);
  curveVertex(x+80, y+100);
  curveVertex(x+90, y+150);
  curveVertex(x+100, y+250);
  curveVertex(x+120, y+250);
  curveVertex(x+120, y+165);
  curveVertex(x+110, y+100);
  curveVertex(x+85, y+60);
  curveVertex(x+35, y+50);
  curveVertex(x+20, y+30);
  curveVertex(x+5, y);
  endShape();

  //Costard
  fill(costard);
  rect(x, y+185, 150, 200);

  //napkins
  fill(160, 0, 0);
  stroke(0);
  triangle(x+45, y+90, x+55, y+75, x+55, y+90);
  triangle(x+50, y+90, x+65, y+70, x+65, y+100);


  //PocheCostard
  noStroke();
  fill(150);
  rect(x+55, y+100, 25, 25);
  ellipse(x+55, y+110, 25, 15);

  //Ceinture
  fill(70, 36, 0);
  rect(x, y+250, 150, 20);

  //Boucle de Ceinture
  strokeWeight(2);
  stroke(155);
  fill(150, 85);
  rect(x, y+250, 18, 18);
  line(x, y+250, x+8, y+250);

  //Chemise
  fill(255);
  strokeWeight(3);
  stroke(70, 36, 0);
  beginShape();
  curveVertex(x-30, y+20);
  curveVertex(x-42, y+52);
  curveVertex(x, y+235);
  curveVertex(x+42, y+52);
  curveVertex(x+30, y+20);
  endShape();

  //col
  fill(255);
  noStroke();
  beginShape();
  curveVertex(x-5, y);
  curveVertex(x-20, y+30);
  curveVertex(x-35, y+50);
  curveVertex(x-0, y+60);
  curveVertex(x+35, y+50);
  curveVertex(x+20, y+30);
  curveVertex(x+5, y);
  endShape();

  //Cravate
  noStroke();
  fill(0);
  beginShape();
  vertex(x-2, y+55);
  vertex(x-15, y+190);
  vertex(x, y+200);
  vertex(x+15, y+190);
  vertex(x+2, y+55);
  endShape();

  //RayuresCravate
  fill(160, 0, 0);
  beginShape();
  vertex(x-3.5, y+70);
  vertex(x-4.5, y+80);
  vertex(x+4.5, y+80);
  vertex(x+3.5, y+70);
  endShape(CLOSE);

  beginShape();
  vertex(x-5.5, y+90);
  vertex(x-6.5, y+100);
  vertex(x+6.5, y+100);
  vertex(x+5.5, y+90);
  endShape(CLOSE);

  beginShape();
  vertex(x-7, y+110);
  vertex(x-8.5, y+120);
  vertex(x+8.5, y+120);
  vertex(x+7, y+110);
  endShape(CLOSE);

  beginShape();
  vertex(x-9, y+130);
  vertex(x-10.5, y+140);
  vertex(x+10.5, y+140);
  vertex(x+9, y+130);
  endShape(CLOSE);

  beginShape();
  vertex(x-11, y+150);
  vertex(x-12.5, y+160);
  vertex(x+12.5, y+160);
  vertex(x+11, y+150);
  endShape(CLOSE);

  beginShape();
  vertex(x-13, y+170);
  vertex(x-14.5, y+180);
  vertex(x+14.5, y+180);
  vertex(x+13, y+170);
  endShape(CLOSE);

  beginShape();
  vertex(x-15, y+190);
  vertex(x, y+200);
  vertex(x+15, y+190);
  endShape(CLOSE);

  //NoeudCravate
  fill(150);
  ellipse(x, y+50, 15, 10);

  //tête
  fill(33, 177, 100);
  strokeWeight(3);
  stroke(20, 153, 75);
  rect(x, y-10, 200, 100);

  //20  
  textSize(40);
  fill(0);
  text(20, x-23, y+5);

  //$
  textSize(20);
  for (int i=3; i<=190; i+=15) {
    fill(23, 127, 90, i/2);
    text("$", (x-98)+i, y+38);
  }

  for (int i=3; i<=210; i+=15) {
    fill(23, 127, 90, i/1.2);
    text("$", (x+102)-i, y+18);
  }

  for (int i=3; i<=190; i+=15) {
    fill(23, 127, 90, i/2);
    text("$", (x-98)+i, y-2);
  }

  for (int i=3; i<=210; i+=15) {
    fill(23, 127, 90, i/1.2);
    text("$", (x+102)-i, y-22);
  }

  for (int i=3; i<=190; i+=15) {
    fill(23, 127, 90, i/2);
    text("$", (x-98)+i, y-42);
  }
}

