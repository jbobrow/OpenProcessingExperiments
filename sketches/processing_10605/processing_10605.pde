
/* 
  das shapomon monster 
  vom steffen  
*/

PShape form;
int zahl = 0;
int farbe = 255;

void setup() {
  size( 600, 600 );
  frameRate(20);
  form = loadShape("kopf.svg");
  smooth();
  noStroke();
}

void draw() {
  fill( farbe );
  rect( 0, 0, width, height );
  shape(form, width/2+random( -0.5*zahl*zahl, 0.5*zahl*zahl ), height-100+random( -0.2*zahl*zahl, 0.2*zahl*zahl ), 200, 200);
  
  if(zahl >= 10) {
    form = loadShape("boom2.svg");
    zahl++;
  }
  if(zahl >= 25) {
    form = loadShape("boom3.svg");
    zahl++;
  }
  if(zahl >= 40) {
    form = loadShape("boom4.svg");
    zahl++;
  }
  if(zahl >= 55) {
    form = loadShape("boom5.svg");
    zahl++;
  }
  if(zahl >= 70) {
    rect( 0, 0, width, height );
  }
  
}

void mouseClicked() {
  
  farbe-=20;
  zahl++;
  println(zahl);

  if(zahl == 1) {
    form = loadShape("kopf2.svg");
  }
  if(zahl == 2) {
    form = loadShape("kopf3.svg");
  }
  if(zahl == 3) {
    form = loadShape("kopf4.svg");
  }
  if(zahl == 4) {
    form = loadShape("kopf5.svg");
  }
  if(zahl == 5) {
    form = loadShape("kopf6.svg");
  }
  if(zahl == 6) {
    form = loadShape("kopf7.svg");
  }
  if(zahl == 7) {
    form = loadShape("kopf8.svg");
  }
  if(zahl == 8) {
    form = loadShape("kopf9.svg");
  }
  if(zahl == 9) {
    form = loadShape("boom.svg");
    zahl++;
  }
}

