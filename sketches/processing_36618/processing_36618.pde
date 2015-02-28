
void setup() {
  setupAudio();
  size(500, 500);
  smooth();
}

void draw() {
  background(255, 0, 0);
  getVolume(); 
  float shouldersize = map(volume, 0, 100, 400, 630);
  float facesize = map(volume, 0, 100, 300, 500);
  float chinsize = map(volume, 0, 100, 70, 300);
  float lipsz = map(volume, 0, 100, 30, 60);
  float lipwd = map(volume, 0, 100, 150, 300);
  float lipln1 = map(volume, 0, 100, 176, 97);
  float lipln2 = map(volume, 0, 100, 325, 398);
  float noscurve = map( volume, 0, 100, 25, 100);
  float nostrils = map(volume, 0, 100, 20, 90);
  float brow = map(volume, 0, 100, 240, 40);
  float brwdth = map(volume, 0, 100, 5, 20);
  float eyeball = map(volume, 0, 100, 250, 325);
  float hair = map(volume, 0, 100, 0, 80);
  float strk = map(volume, 0, 100, 2, 15);
  float alph = map(volume, 0, 100, 50, 255);

  fill(0, 0, 255);
  noStroke();

  //shoulders
  ellipse(150, 400, 400, shouldersize);
  ellipse(350, 400, 400, shouldersize);

  //face
  fill(255, 255, 0);
  ellipse(250, 230, facesize, 400);
  ellipse(230, 425, chinsize, chinsize);
  ellipse(265, 425, chinsize, chinsize);
  strokeWeight(2);
  stroke(0, 0, 0);

  //lips
  fill(255, 0, 255);
  arc(250, 358, lipwd, lipsz, PI, 2*PI);
  arc(250, 360, lipwd, lipsz, 0, PI);
  line(lipln1, 359, lipln2, 359);

  //nostril curves
  fill(255, 255, 0);
  arc(220, 300, noscurve, noscurve, PI/2, 3*PI/2);
  arc(280, 300, noscurve, noscurve, 0, PI/2);
  arc(280, 300, noscurve, noscurve, TWO_PI-PI/2, TWO_PI);

  //nostril holes
  fill(0, 0, 0);
  ellipse(230, 300, nostrils, nostrils);
  ellipse(270, 300, nostrils, nostrils);

  //white eyeballs
  fill(255, 255, 255);
  arc(150, eyeball, 90, 100, 0, PI);
  arc(350, eyeball, 90, 100, 0, PI);
  line(105, eyeball, 195, eyeball);
  line(305, eyeball, 395, eyeball);

  //pupils
  fill(0, 0, 0);
  rect(140, eyeball, 20, 45);
  rect(340, eyeball, 20, 45);
  ellipse(150, eyeball+41, 20, 20);
  ellipse(350, eyeball+41, 20, 20);

  //shine in eyes
  fill (255, 255, 255);
  noStroke();
  ellipse(148, eyeball + 10, 10, 10);
  ellipse(348, eyeball + 10, 10, 10);
  fill (255, 255, 255, alph);
  ellipse (155, eyeball + 17, 5, 5);
  ellipse (355, eyeball + 17, 5, 5);

  //eyebrow
  strokeWeight(2);
  fill (0, 0, 0);
  rect(105, brow, 290, brwdth);

  //hair
  strokeWeight(strk);
  line(300, 35 - hair, 300, 45);
  line(247, 32, 247, 22 - hair);
  line(260, 50 - hair, 260, 60);
  line(274, 32 - hair, 274, 42);
  line(230, 40 - hair, 230, 50);
  line(209, 46, 209, 36 - hair);
  line(200, 44, 200, 34 - hair);
  line(280, 40 - hair, 280, 50);
}

