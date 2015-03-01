
float difX, difY, midaCasa, midaFinestres, midaPorta;
float posX_sol, posY_sol, mov, vel;
color b1, b2, b3, b4, b5;
PImage cat;

int totalFlors = 59;
float[] florsX = new float[totalFlors];
float[] florsY = new float[totalFlors];
float [] midaFlors = new float[totalFlors];
color [] colorFlors = new color [totalFlors];

int s = second();
int m = minute();
int h = hour();
////////////////////////////////////////////////////
void setup() {
  size(400, 400);
  b1 = color (#BDECFC);
  b2 = color (#265F71);
  b3 = color (#265F71);
  b4 = color (#F769A4);
  b5 = color (#BDECFC);
  //*Flors
  for (int i = 0; i< totalFlors; i++) {
    florsX[i] = int(random(width));
    florsY[i] = int(random(height/1.6, height)); 
    midaFlors[i] = int(4);
    colorFlors[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
  //*Sol
  vel = 0.4;
  mov=0;
  cat = loadImage("cat_sun5.png");
}
////////////////////////////////////////////////////
void draw() {
  //background(189, 236, 252);
  float sMapped = map(hour(), 0, 24, 255, 0);
  float m = map(minute(), 0, 60, 0, 1);
  setGradient(sMapped);

  //*Sol
  pushMatrix();
  translate(200, 200);
  posX_sol = cos(radians(mov)) * 270;
  posY_sol = sin(radians(mov)) * 160;

  fill(254, 255, 214);
  noStroke();
  imageMode(CENTER);
  image (cat, posX_sol, posY_sol);
  //ellipse(posX_sol, posY_sol, 20, 20);
  mov+=vel;
  popMatrix();

  caseta();
  llumFinestres(m);
  finestres();

  //*Flors
  float s= second();
  for (int i = 0; i< s; i++) {
    fill(colorFlors[i]);
    ellipse(florsX[i], florsY[i], midaFlors[i], midaFlors[i]);
  }
}
////////////////////////////////////////////////////
void caseta() {
  difX = 60;
  difY = 50;
  midaCasa = 120;
  midaFinestres = 20;
  midaPorta = 40;
  fill(178, 38, 38);
  noStroke();
  triangle(width/2-(difX+20), height/2-difY, width/2, height/2-(difY+40), width/2+(difX+20), height/2-difY);
  fill(206);
  noStroke();
  rect(width/2-difX, height/2-difY, midaCasa, midaCasa-10);
  fill(130, 173, 91);
  rect(0, height/2+difY, width, height);
  fill(80);
  rect(width/2-midaFinestres, height/2+10, midaPorta, midaPorta);
} 
void llumFinestres(float canviColor) {
  color from = color(#1C206C);
  color to = color(#FCAA3D);
  color interA = lerpColor(from, to, canviColor);
  fill(interA);
}
void finestres() {
  midaFinestres = 20;
  difX = 40;
  difY = 30;
  rect(width/2-difX, height/2-difY, midaFinestres, midaFinestres);
  rect(width/2+(difX/2), height/2-difY, midaFinestres, midaFinestres);
}
void setGradient(float transicion) {
  for (int i = 0; i <= height; i = i+1) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(b3, b4, inter);
    stroke(c);
    line(0, i, width, i);
  }
   for (int i = 0; i <= height; i = i+1) {
    float inter = map(i, 0, height, 0, 1);
    color c2 = lerpColor(b1, b5, inter);
    stroke(c2, transicion);
    line(0, i, width, i);
  }
   for (int i = 0; i <= height; i = i+1) {
    float inter = map(i, 0, height, 0, 1);
    color c3 = lerpColor(b1, b2, inter);
    stroke(c3, transicion);
    line(0, i, width, i);
  }
}



