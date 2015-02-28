
PFont font ;

PShape fd;
PShape fe;
PShape fc;
PShape fn;
PShape fs;
PShape ft;
PShape fr;
PShape fu;
PShape fo;

PShape d;
PShape e;
PShape c;
PShape o;
PShape n;
PShape s;
PShape t;
PShape r;
PShape u;
PShape cc;
PShape tt;



void setup () {
  size (850, 300);
  smooth();


//full letters
  fd = loadShape("fd.svg");
  fe = loadShape("fe.svg");
  fc = loadShape("fc.svg");
  fo = loadShape("fo.svg");
  fn = loadShape("fn.svg");
  fs = loadShape("fs.svg");
  ft = loadShape("ft.svg");
  fr = loadShape("fr.svg");
  fu = loadShape("fu.svg");
  
 //cut letters
  d = loadShape("d.svg");
  e = loadShape("e.svg");
  c = loadShape("c.svg");
  o = loadShape("o.svg");
  n = loadShape("n.svg");
  s = loadShape("s.svg");
  t = loadShape("t.svg");
  r = loadShape("r.svg");
  u = loadShape("u.svg");
  cc = loadShape("cc.svg");
  tt = loadShape("tt.svg");
}

void draw () {
  background (255);

  //D
  if (mousePressed == true) {
    pushMatrix ();
    translate (60, 100);
    fill(0);
    shape (d, 0, 0);
    popMatrix();
    fill(0);
    shape(d, 60, 100);
  }

  else {
    fill(0);
    shape(fd, 60, 100);
  }



  //E
  if (mousePressed == true) {
    pushMatrix ();
    translate (125, 100);
    fill(0);
    shape (e, 0, 0);
    popMatrix();
    fill(0);
    shape(e, 125, 100);
  }

  else {
    fill(0);
    shape(fe, 125, 100);
  }

  //C
  if (mousePressed == true) {
    pushMatrix ();
    translate (180, 100);
    fill(0);
    shape (c, 0, 0);
    popMatrix();
    fill(0);
    shape(c, 180, 100);
  }

  else {
    fill(0);
    shape(fc, 180, 100);
  }
  
  //O
  if (mousePressed == true) {
    pushMatrix ();
    translate (240, 100);
    fill(0);
    shape (o, 0, 0);
    popMatrix();
    fill(0);
    shape(o, 240, 100);
  }

  else {
    fill(0);
    shape(fo, 240, 100);
  }
  
  
  //N
  if (mousePressed == true) {
    pushMatrix ();
    translate (305, 100);
    fill(0);
    shape (n, 0, 0);
    popMatrix();
    fill(0);
    shape(n, 305, 100);
  }

  else {
    fill(0);
    shape(fn, 305, 100);
  }
  
  //S
  if (mousePressed == true) {
    pushMatrix ();
    translate (370, 100);
    fill(0);
    shape (s, 0, 0);
    popMatrix();
    fill(0);
    shape(s, 370, 100);
  }

  else {
    fill(0);
    shape(fs, 370, 100);
  }
  
  //T
  if (mousePressed == true) {
    pushMatrix ();
    translate (430, 100);
    fill(0);
    shape (t, 0, 0);
    popMatrix();
    fill(0);
    shape(t, 430, 100);
  }

  else {
    fill(0);
    shape(ft, 430, 100);
  }
  
  //R
  if (mousePressed == true) {
    pushMatrix ();
    translate (495, 100);
    fill(0);
    shape (r, 0, 0);
    popMatrix();
    fill(0);
    shape(r, 495, 100);
  }

  else {
    fill(0);
    shape(fr, 495, 100);
  }
  
  //U
  if (mousePressed == true) {
    pushMatrix ();
    translate (560, 100);
    fill(0);
    shape (u, 0, 0);
    popMatrix();
    fill(0);
    shape(u, 560, 100);
  }

  else {
    fill(0);
    shape(fu, 560, 100);
  }
  
  //C
  if (mousePressed == true) {
    pushMatrix ();
    translate (630, 100);
    fill(0);
    shape (cc, 0, 0);
    popMatrix();
    fill(0);
    shape(cc, 630, 100);
  }

  else {
    fill(0);
    shape(fc, 630, 100);
  }
  
  //T
  if (mousePressed == true) {
    pushMatrix ();
    translate (695, 100);
    fill(0);
    shape (tt, 0, 0);
    popMatrix();
    fill(0);
    shape(tt, 695, 100);
  }

  else {
    fill(0);
    shape(ft, 695, 100);
  }
}





