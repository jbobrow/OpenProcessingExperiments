
//Nathan Trevino  
//Homework 6
//Processing Thursday, September 15, 2011
//Copyright September 15th 2011
//Carnegie Mellon University. Pittsburgh PA

float x = 200;
float y = 200;
float wd = 200;
float ht = 200;


void setup() {
  size(400, 400);
  background( 100+(mouseX/2), 255, 246, mouseY/2 );
}

void draw() {
  background( 100+(mouseX/2), 255-(mouseX/2), 246, mouseY/2 );

  randomSeed(0);
  int i = -60;
  int j = -60;
  while ( i <= width) {
    i += 30;
    initials(i, 0, 0, .1);
  }

  for ( i = -60; i <= height; i += 30) {
    for (j = -120; j <= width; j += 30) {
      int alphcol = 0;
      alphcol = alphcol + mouseY;
      initials(i+(mouseX/10), j+(mouseY/5), alphcol, .1);
    }
  }
}


void initials(int i, int j, float alph, float s) {
  pushMatrix();
  translate(i, j); //move it!
  scale(s); //scale to the size

  smooth();

  noStroke();
  fill(153, 153, 153, alph);
  ellipse(x, y, wd+150, ht+150);

  fill(140, 140, 140, alph);
  ellipse(x, y, wd+130, ht+130);

  fill(120, 120, 120, alph);
  ellipse(x, y, wd+100, ht+100);

  fill(60, 60, 60, alph);
  ellipse(x, y, wd+70, ht+70);

  fill(20, 20, 20, alph);
  ellipse(x, y, wd+50, ht+50);

  fill(134, 124, 142, alph);
  ellipse(x, y, wd+30, ht+30);

  stroke(197, 140, 247, alph);//beautiful lavender
  strokeWeight(4);
  fill(197, 140, 247, alph);
  ellipse(x, y, wd, ht);


  //N
  strokeWeight(12);
  stroke(173, 255, 139, alph);
  arc(x+5, y+5, wd-10, ht-10, PI*.5, (6*PI)/5);
  beginShape();
  curveVertex(x-89, y-68);
  curveVertex(x-70, y-55);
  curveVertex(x-60, y-25);
  curveVertex(x-50, y+10);
  curveVertex(x-25, y+35);
  curveVertex(x-20, y+40);
  curveVertex(x-10, y+45);
  curveVertex(x-5, y+40);
  curveVertex(x-15, y-90);
  curveVertex(x-15, y-100);
  endShape();



  //L
  stroke(142, 252, 255, alph);
  arc(x, y, wd, ht, 0, PI*.4);
  line(x, y-75, x+26, y+96);

  //T

  stroke(255, 255, 255, alph);
  line(x+40, y-83, x+55, y+58);
  noFill();
  arc(x+5, y+5, wd, ht, (3*PI)/2, TWO_PI);
  popMatrix();
}


