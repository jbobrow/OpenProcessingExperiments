
shapeness shape1;
PFont fuente;
int ftx=0;
int fty=0;
int ftz=0;
int frx=0;
int fry=0;
int frz=0;
float tx, ty, tz, rx, ry, rz;
int detail =3;
float linea=1;
int dis = 100;
int scl = 100;
color carrot= color(255, 100, 41);
color colibri= color(34, 245, 177);
float a = 0;
void setup() {
  fuente = loadFont("Infinity-10.vlw");
  size(700, 600, P3D);
  smooth();
  lights();
  background(0);
}
void draw() {

  pushMatrix();
  a+=0.05;
  shape1 = new shapeness(tx, ty, tz, rx, ry, rz, detail, linea, colibri, dis, scl);
  shape1.drawShape(width, height);
  popMatrix();
  /////////////////////////////////////funciones//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
  pushMatrix();
  fill(0, 10);
  noStroke();
  rect(0, 0, 60, height);
  fill(colibri);
  rect(0,110,30,10);
  rect(0,121,30,9);
  textFont(fuente);
  text("t x", 31, 9);text("t y", 31, 19);text("t z", 31, 29);text("r x", 31, 39);text("r y", 31, 49);text("r z", 31, 59);text("d e t", 31, 69);text("s t r", 31, 79);text("c l r", 31, 89);text("l o n g", 31, 99);text("s c l", 31, 109);text("n e w", 31, 119);text("s a v e", 31, 129);
  if (ftx == 0) { 
    tx=sin(a);
    rect(0, 0, 10, 10);
  }
  if (ftx == 1) {
    tx=cos(a);
    rect(10, 0, 10, 10);
  }
  if (ftx == 2) {
    tx=tan(a);
    rect(20, 0, 10, 10);
  }
  if (fty == 0) {
    ty=sin(a);
    rect(0, 10, 10, 10);
  }
  if (fty == 1) {
    ty=cos(a);
    rect(10, 10, 10, 10);
  }
  if (fty == 2) {
    ty=tan(a);
    rect(20, 10, 10, 10);
  }
  if (ftz == 0) {
    tz=sin(a);
    rect(0, 20, 10, 10);
  }
  if (ftz == 1) {
    tz=cos(a);
    rect(10, 20, 10, 10);
  }
  if (ftz == 2) {
    tz=tan(a);
    rect(20, 20, 10, 10);
  }
  if (frx == 0) {
    rx=sin(a);
    rect(0, 30, 10, 10);
  }
  if (frx == 1) {
    rx=cos(a);
    rect(10, 30, 10, 10);
  }
  if (frx == 2) {
    rx=tan(a);
    rect(20, 30, 10, 10);
  }
  if (fry == 0) {
    ry=sin(a);
    rect(0, 40, 10, 10);
  }
  if (fry == 1) {
    ry=cos(a);
    rect(10, 40, 10, 10);
  }
  if (fry == 2) {
    ry=tan(a);
    rect(20, 40, 10, 10);
  }
  if (frz == 0) {
    rz=sin(a);
    rect(0, 50, 10, 10);
  }
  if (frz == 1) {
    rz=cos(a);
    rect(10, 50, 10, 10);
  }
  if (frz == 2) {
    rz=tan(a);
    rect(20, 50, 10, 10);
  }
  popMatrix();
}
void mousePressed() {
 
  if (mouseX>=0&&mouseX<=10&&mouseY>=0&&mouseY<=10) {
    ftx=0;
  }
  if (mouseX>=10&&mouseX<=20&&mouseY>=0&&mouseY<=10) {
    ftx=1;
  }
  if (mouseX>=20&&mouseX<=30&&mouseY>=0&&mouseY<=10) {
    ftx=2;
  }
  if (mouseX>=0&&mouseX<=10&&mouseY>=10&&mouseY<=20) {
    fty=0;
  }
  if (mouseX>=10&&mouseX<=20&&mouseY>=10&&mouseY<=20) {
    fty=1;
  }
  if (mouseX>=20&&mouseX<=30&&mouseY>=10&&mouseY<=20) {
    fty=2;
  }
    if (mouseX>=0&&mouseX<=10&&mouseY>=20&&mouseY<=30) {
    ftz=0;
  }
  if (mouseX>=10&&mouseX<=20&&mouseY>=20&&mouseY<=30) {
    ftz=1;
  }
  if (mouseX>=20&&mouseX<=30&&mouseY>=20&&mouseY<=30) {
    ftz=2;
  }
    if (mouseX>=0&&mouseX<=10&&mouseY>=30&&mouseY<=40) {
    frx=0;
  }
  if (mouseX>=10&&mouseX<=20&&mouseY>=30&&mouseY<=40) {
    frx=1;
  }
  if (mouseX>=20&&mouseX<=30&&mouseY>=30&&mouseY<=40) {
    frx=2;
  }
    if (mouseX>=0&&mouseX<=10&&mouseY>=40&&mouseY<=50) {
    fry=0;
  }
  if (mouseX>=10&&mouseX<=20&&mouseY>=40&&mouseY<=50) {
    fry=1;
  }
  if (mouseX>=20&&mouseX<=30&&mouseY>=40&&mouseY<=50) {
    fry=2;
  }
    if (mouseX>=0&&mouseX<=10&&mouseY>=50&&mouseY<=60) {
    frz=0;
  }
  if (mouseX>=10&&mouseX<=20&&mouseY>=50&&mouseY<=60) {
    frz=1;
  }
  if (mouseX>=20&&mouseX<=30&&mouseY>=50&&mouseY<=60) {
    frz=2;
  }
  if (mouseX>=0&&mouseX<=30&&mouseY>=110&&mouseY<=120) {
   fill(0);
   rect(0,0,width,height);
  }
  if (mouseX>=0&&mouseX<=30&&mouseY>=120&&mouseY<=130) {
  saveFrame("web-######.jpg");
}
  
}

