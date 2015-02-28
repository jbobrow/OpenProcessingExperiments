
//Tia Vu
//Big creature, small creature
//click mouse to make it go to a small creature

void setup() {
  size(600, 600);
  smooth();
}

//==================================================
void draw() {
  if (mousePressed) {
    draw2();
  } else {
    draw3();
  }
}


void draw3 () {
  background(0);
  fill(220, 220, 0);
  //head and body
  strokeWeight(10);
  ellipse(300+mouseX, 300+mouseY, 300, 300);

  //rightarm
  fill(255, 200, 0);
  strokeWeight(8);
  ellipse(450+mouseX, 300+mouseY, 50, 100);

  //Leftarm
  strokeWeight(8);
  ellipse(150+mouseX, 300+mouseY, 50, 100);

  //mouth
  fill(220, 220, 0);
  arc(300+mouseX, 350+mouseY, 100, 60, 0, HALF_PI);
  noFill();

  //eyes
  strokeWeight(9);
  ellipse(350+mouseX, 250+mouseY, 50, 50);

  //eyes
  strokeWeight(9);
  ellipse(250+mouseX, 250+mouseY, 50, 50);
}

//==============================================

//small creature

void draw2 () {
  background(0);
  fill(220, 220, 0);
  //head and body
  strokeWeight(10);
  ellipse(300+mouseX, 300+mouseY, 150, 150);

  //rightarm
  fill(255, 200, 0);
  strokeWeight(8);
  ellipse(378+mouseX, 300+mouseY, 25, 50);

  //Leftarm
  strokeWeight(8);
  ellipse(220+mouseX, 300+mouseY, 25, 50);

  //mouth
  fill(220, 220, 0);
  arc(300+mouseX, 330+mouseY, 50, 30, 0, HALF_PI);
  noFill();

  //eyes
  strokeWeight(9);
  ellipse(340+mouseX, 300+mouseY, 25, 25);

  //eyes
  strokeWeight(9);
  ellipse(260+mouseX, 300+mouseY, 25, 25);
}


//==============================================

