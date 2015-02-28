
float x, x1;  // Position
float y, y1;  // Position
float r = 100; // Radius
float r1 = 100;

//float x;
//float y;
float n = 0;
float moveX = random(1, 10);
float moveY = random(1, 10);


float anzahlKreise = 0;
int mode=1;
//===================================
void setup() {
  setup1();
}
void draw() {
  if (mode==1) draw1();
  else if (mode==2) draw2();
  else if (mode==3) draw3();
  else if (mode==4) draw4();
}
void mouseReleased() {
  mode = mode+1;
  if (mode==5)  mode=1; 
  background(240,240,240);
  colorMode(RGB,255);
  if (mode==1) setup1();
  else if (mode==2) setup2();
  else if (mode==3) setup3();
  else if (mode==4) setup4();
}


//======================================
void setup1 () {
  size(800, 500);
  noStroke ();

  x = (200);
  x1 = (600);
  y = (250);
  y1 = (250);
}

void setup2 () {
  size (800, 500);
  x = width/2;
  y = height/2;
}

void setup3 () {
  size (800, 500) ;
  stroke(0);
}

void setup4 () {
  size (800, 500) ;
  colorMode(HSB, 100);
  stroke(0);
  //frameRate(25);
}

//=======================================

void draw1 () {
  background (255);
  if (dist (mouseX, mouseY, x, y) < r) {
    fill (255);
  }
  else {
    fill (0);
  }
  ellipse (x, y, r*2, r*2);


  if (dist (mouseX, mouseY, x1, y1) < r1) {
    fill (255);
  }
  else {
    fill (0);
  }
  ellipse (x1, y1, r1*2, r1*2);
}

void draw2 () {
  x=x+moveX;
  y=y+moveY;
  n=n+0.05;
  float r=noise(n)*67;
  fill(random(220, 255), random(200, 255), 0, random(255));
  ellipse (random(800), random(500), r, r);
}

void draw3 () {
  fill (random(200, 240), random(30, 130), 0, random(255));
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
}

void draw4 () {
  fill(anzahlKreise, 100, 100, random(255));
  ellipse(mouseX, mouseY, 100, 100);
  anzahlKreise = anzahlKreise+1;
  if (anzahlKreise>100) {
    anzahlKreise = 0;
  }
}



