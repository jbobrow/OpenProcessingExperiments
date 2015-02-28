
/*
Susanna Brolhani, MAR/2014 - inspirado na obra de Vincent Van Gogh "Starry Night"
"Noite Estrelada" by Susanna Brolhani, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 140126   
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*/


float a;
float b;

float noiseScale=0.01;

color[] palette =
{ 
  #051436, #1447C2, #0C2B75, #0D3082, #00746E, #09225C
};


void setup() {
  size(700, 500);
  background(palette[0]);
}


void draw() {
  float r = random(1, 6);
  noStroke();
  fill(palette[int(r)], 14);
  rect(0, 0, width, height);
  
  for (int i=0; i < 1000; i=i+5) {
    strokeWeight(9);
    stroke(palette[int(r)]);
    point(random(700), random(500));
  }

  //ESTRELAS
  for (int i=0; i < 600; i=i+5) {
    strokeWeight(6);
    stroke(random(200, 255), random(200, 255), random(30, 70), random(255));
    pushMatrix();
    translate(80, 50);
    rotate(radians(i*3)+radians(mouseY));
    point(0, i/15);
    stroke(random(200, 255), random(200, 255), random(240, 255), random(255));
    point(i/8, 0);
    popMatrix();

    pushMatrix();
    stroke(random(200, 255), random(200, 255), random(30, 70), random(255));
    translate(600, 90);
    rotate(radians(-mouseY)+radians(i*3));
    point(i*2/17, 0);
    stroke(random(200, 255), random(200, 255), random(240, 255), random(255));
    point(i/8, 0);    
    popMatrix();

    pushMatrix();
    stroke(random(200, 255), random(200, 255), random(30, 70), random(255));
    translate(430, 150);
    rotate(radians(mouseY)+radians(i*2));
    point(0, i/16);

    popMatrix();
  }

  //NEVOA
  for (int i=0; i < 1600; i=i+20) {
    pushMatrix();
    stroke(200, 200, random(200, 255), random(255));
    translate(width/2, height*2/3);
    rotate(radians(i/30)+radians(500));
    point(random(200)+i/4, 0);
    pushMatrix();
    rotate(TWO_PI+radians(i/30)+radians(500));
    point(random(100)+i/4, 0);
    popMatrix();
    popMatrix();
  }


  cipreste(200, mouseY);

  //MONTANHA
  for (int x=0; x < width; x++) {
    float noiseVal = noise(x*noiseScale, noiseScale);

    stroke(40, 40, 30);
    line(x, a, x, b);

    if (mouseY<height/2) {
      a = 510;
      b = 510;
    }
    if (height/2 < mouseY && mouseY < height*2/3) {
      a = 700-mouseY+noiseVal*150;
      b = height;
    }
    if (height*2/3<mouseY) {
      a = 365+noiseVal*150;
      b = height;
    }
  }
}

void cipreste(int x, int y) {
  pushMatrix();

  translate(200, 1000-mouseY);
  fill(40, 40, 30);
  noStroke();

  beginShape();
  curveVertex(0, 0);
  curveVertex(0, 0); //A
  curveVertex(6, -50); //B
  curveVertex(15, -100); //C
  curveVertex(30, -140); //D
  curveVertex(23, -210); //E
  curveVertex(37, -270); //F
  curveVertex(37, -310); //G
  curveVertex(26, -350); //H
  curveVertex(30, -390); //I
  curveVertex(50, -420); //J
  curveVertex(50, -420); //J
  curveVertex(43, -380); //K
  curveVertex(50, -350); //L
  curveVertex(60, -270); //M
  curveVertex(55, -210); //N
  curveVertex(70, -160); //O
  curveVertex(80, 0); //P
  curveVertex(70, 0); //P
  endShape(CLOSE);

  beginShape();
  curveVertex(50, 0); 
  curveVertex(50, 0); //A
  curveVertex(45, -100); //B
  curveVertex(70, -200); //C
  curveVertex(80, -280); //D
  curveVertex(95, -310); //E
  curveVertex(110, -300); //F
  curveVertex(100, -290); //G
  curveVertex(110, -210); //H
  curveVertex(120, -150); //I
  curveVertex(110, -100); //J
  curveVertex(130, -50); //K
  curveVertex(145, 0); //L
  curveVertex(145, 0); //L
  endShape(CLOSE);

  popMatrix();
}
