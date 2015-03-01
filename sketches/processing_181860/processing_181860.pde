
float caracercle = 70;
float ulls= 10;
float boca= 20;
String comida ="ÑAM-ÑAM!";


void setup() {
  size(255, 255);
}

void cara() {
  stroke(0);
  strokeWeight(1);
  fill(#253FBF);
  ellipse(mouseX, mouseY, caracercle*1.20, caracercle);
}

void ullz() {
fill(255);
  ellipse(mouseX-25, mouseY-25, mouseX*0.25, mouseX*0.25);
  ellipse(mouseX+25, mouseY-25, mouseX*0.25, mouseX*0.25);
  fill(mouseY);
  ellipse(mouseX-25, mouseY-25, mouseX*0.10, mouseX*0.10);
  ellipse(mouseX+25, mouseY-25, mouseX*0.10, mouseX*0.10);
}

void boka() {
  fill(0);
  arc(mouseX, mouseY+5, 50, 50, 0, PI);
}

void galeta() {
  stroke(#6F4A25);
  fill(#AF865C);
  strokeWeight(4);
  ellipse(mouseY, mouseX, 55, 40);
  stroke(#6F4A25);
  fill(#6F4A25);
  strokeWeight(4);
  point(mouseY+10, mouseX+10);
  point(mouseY-4, mouseX-7);
  point(mouseY-10, mouseX-8);
}


void draw() {
  background(#9FE8B9);
  cara();
  galeta();
   ullz();
  boka();

  if (mouseY>120) {
    background(0);
    text(comida, 120, 120);
  }

  if (mouseY>145) {
    background(#9FE8B9);
    cara();
    ullz();
    boka();
    galeta();
  }

  if (mouseX>120) {
    background(0);
    text(comida, 120, 120);
  }

  if (mouseX>145) {
    background(#9FE8B9);
    cara();
    ullz();
    boka();
    galeta();
  }
}
