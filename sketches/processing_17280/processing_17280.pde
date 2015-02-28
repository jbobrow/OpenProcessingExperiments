

float hue1, sat1, bri1, xposition, hue2, sat2, bri2, radius, sradius;
int cant = 3;
color tint1, figure1;
PVector [] c = new PVector [cant];

void setup () {
  size (924,450);
  colorMode(HSB,360,100,100);
  hue1 = random (0,360);
  sat1 = random (5,15);
  bri1 = random (15,50);
  xposition = random ((width/3),((2*width)/3));
  hue2 = int (360 - hue1);
  sat2 = sat1+25;
  bri2 = bri1+75;
  radius = 50;
  sradius = 10;
  smooth ();
  frameRate (1024);
  tint1 = color (hue1,sat1,bri1);
  background (tint1);
  for (int i = 0; i < 48; i++) {
    fill (0,0,100,(i/5));
    noStroke ();
    ellipse (xposition, height/2, 960-(40*i), 960-(40*i));
  }
  for (int i = 0; i < cant; i++) {
    c[i] = new PVector (width/2, height/2);
  }
}

void draw () {
  for (int i = 0; i < cant; i++) {
    color figure1 = color (hue2,sat2,bri2);
    fill (figure1,10);
    noStroke ();
    ellipse (c[i].x, c[i].y, radius, radius);
  }
  for (int i = 0; i < (cant-2); i++) {
    //color tint1 = color (hue1,sat2,bri2);
    noFill ();
    stroke (hue1,sat2,bri2);
    ellipse (c[i].x, c[i].y, sradius, sradius);
  }
  for (int i = 0; i < cant; i++) {
    c[i].x = c[i].x + random(-10,10);
    c[i].y = c[i].y + random(-10,10);
  }
  radius = radius - 0.02;
  if (radius < -50) {
    radius = 0; 
  }
  sradius = sradius - 0.02;
  if (sradius < -10) {
    sradius = 0;  
  }
  sat2 = sat2 - 2;
  if (sat2 < 1) {
    sat2 = sat1 + 25;
  }
  bri2 = bri2 + 2;
  if (bri2 > 99) {
    bri2 = bri1 + 75;
  }
}

void mouseClicked () {
  setup ();
}


