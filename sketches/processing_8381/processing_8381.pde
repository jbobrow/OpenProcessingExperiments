
// Five grams of bichromatic turtle
//
// length : 1'20''
//
// 'r' to re-seed & re-set
// ( press 'r' two times to get rid of visual artefacts)
//
// emoc / mar. 2010 

int etapes;
float angle;
float anglemod;
float anglestart;
float x, y, x0, y0;
float ax, ay, ax0, ay0;
float bx, by, bx0, by0;
float longueur;
float largeur;
int f; // framecount

void setup() {
  size(700,700);
  drawBackground();
  smooth();
  frameRate(50);
  reSeed(true);
}

void draw() {
  strokeWeight(largeur);
  
  if (etapes == 0) {
    etapes = 10;
    float r = random(1);
    if ((r > .3) && (r < .5)) anglemod = 9;
    if ((r > .5) && (r < .7)) anglemod = -9;
    else if ((r > .5) && (r <= 1)) anglemod = 18;
    else anglemod = 0;
    if (anglemod != 0) longueur =  5 * PI / 4;
    else longueur = 5;    
  }
  
  angle = angle + anglemod;
  x0 = x;
  y0 = y;
  ax0 = ax;
  ay0 = ay;
  bx0 = bx;
  by0 = by;
  x = x + (longueur * cos(radians(angle)));
  y = y + (longueur * sin(radians(angle)));
  ax = x + (largeur * cos(radians(angle+90)));
  ay = y + (largeur * sin(radians(angle+90)));
  bx = x + (largeur * cos(radians(angle+270)));
  by = y + (largeur * sin(radians(angle+270)));
  
  stroke(255);
  line(x0, y0, x, y);
  stroke(0);
  line(ax0, ay0, ax, ay);
  line(bx0, by0, bx, by);

  if ((x < -50) || (x > width + 50)) reSeed(false);
  if ((y < -50) || (x > height + 50)) reSeed(false);
  
  etapes --;
  f++;
  if ((f%50 == 0) && (largeur > 2.5)) largeur = largeur * .95;
  if (f%500 == 0) println(f);
  if (f%4000 == 0) {
    println("fin!");
    noLoop(); 
  }
}


void keyPressed() {
  switch(key) {
    case 'r' :
      loop();
      reSeed(true);
      break;
    case 's' : 
      saveFrame("fgbt-" + year() + month() + day() + hour() + minute() + second() + millis() + ".tif");
  }
}


void reSeed(boolean reset) {

  if (reset) {
    background(0);
    drawBackground();
    largeur = 60;
    f = 0;
  }
  angle = round(random(9)) * 40;
  anglestart = angle;
  anglemod = 0;
  etapes = 10;
  x = 250;
  y = 250;
  ax = x + largeur * cos(radians(90+anglestart));
  ay = y + largeur * sin(radians(90+anglestart));
  bx = x + largeur * cos(radians(270+anglestart));
  by = y + largeur * sin(radians(270+anglestart));
  longueur = 5;
}

void drawBackground() {
  colorMode(HSB, 1);
  float cSeed = random(1);
  for (int i=0; i <= width; i++) {
    stroke((cSeed + ((1 / (float)width) * i))%1, 1, 1);
    line(i, 0, i, height);
  }
  colorMode(RGB,255);
}

