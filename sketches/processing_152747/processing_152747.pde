
//COALESCENCE LAB | RESEARCH INITIATIVE | 2014////////
//WAVING GRID LINES////////////////////////////////
//CHEERS///////////////////////////////////////////

PFont myFont;

void setup() {
  size(800, 800);
  smooth();
  myFont = loadFont("Calibri-Light-48.vlw");
  textFont(myFont, 30);
  textAlign(CENTER);
}

void draw() {
  background(0);

  for (float i =20;i<60; i +=1) {
    for (float j =20;j<60; j +=1) {
      pushMatrix();


      fill(100, 0, 0);
      rectMode(CENTER);

      stroke(random(0, 255), random(0, 255), random(0, 255));
      strokeWeight(i/50);
      // noStroke();
      fill(9, 0, 0, 50);

      ellipse(10*i, 10*j, 2, 2);
      translate(10*i, 10*j);
      rotate(PI/180*(mouseX+mouseY)/2);
      line(0, 0, i*mouseX/320, j*mouseX/320);

      popMatrix();
    }
  }
  fill(255);
  text("Coalescence Lab | Waving grid lines", width/2, height-50);
}
//COALESCENCE LAB RESEARCH INITIATIVE _2014////////
//WAVING GRID LINES////////////////////////////////
//CHEERS///////////////////////////////////////////

