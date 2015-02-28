
PFont font ;

int x = 60;
int y = 100;
int w = 900;
int h =80;

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
PShape u_mask;
PShape cc;
PShape tt;



void setup () {
  size (1000, 300);
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
  u_mask = loadShape("u_mask.svg");
  cc = loadShape("cc.svg");
  tt = loadShape("tt.svg");
}

void draw () {
  background (255);

  if ((mouseX> x) && (mouseX < x+w) &&
    (mouseY> y) && (mouseY <y+h)) {
    shape(d, 60, 100);
    shape(e, 125, 100);
    shape(c, 180, 100);
    shape(o, 240, 100);
    shape(n, 305, 100);
    shape(s, 370+10, 100);
    shape(t, 370+80, 100);
    shape(r, 370+180, 100);
    shape(u, 370+300, 100);
    shape(cc, 370+430, 100);
    shape(tt, 370+570, 100);
  } 
  else {
  shape(fd, 60, 100);
    shape(fe, 125, 100);
    shape(fc, 180, 100);
    shape(fo, 240, 100);
    shape(fn, 305, 100);
    shape(fs, 370, 100);
    shape(ft, 430, 100);
    shape(fr, 495, 100);
    shape(fu, 560, 100);
    shape(fc, 630, 100);
    shape(ft, 695, 100);
    }
    noStroke();
  }


//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(e, 125, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(e, 125, 100);
//    }
//    noStroke();
//  }
//
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(c, 180, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(c, 180, 100);
//    }
//    noStroke();
//  }
//
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(o, 240, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(o, 240, 100);
//    }
//    noStroke();
//  }
//
//
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(n, 305, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(n, 305, 100);
//    }
//    noStroke();
//  }
//
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(s, 370+10, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(s, 370+10, 100);
//    }
//    noStroke();
//  }
//
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(t, 370+80, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(t, 370+80, 100);
//    }
//    noStroke();
//  }
//  
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(r, 370+180, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(r, 370+180, 100);
//    }
//    noStroke();
//  }
//  
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(u, 370+300, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(u, 370+300, 100);
//    }
//    noStroke();
//  }
//
//if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(cc, 370+430, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(cc, 370+430, 100);
//    }
//    noStroke();
//  }
//  
//  if ((mouseX> x) && (mouseX < x+w) &&
//    (mouseY> y) && (mouseY <y+h)) {
//    shape(tt, 370+570, 100);
//  } 
//  else {
//    if ((mouseX<=x) && (mouseX <= x+w) &&
//      (mouseY<=y) && (mouseY >=y+h)) {
//      shape(tt, 370+570, 100);
//    }
//    noStroke();
//  }
//
//
//
//}
;

