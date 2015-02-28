
PFont font ;

int x = 60;
int y = 100;
int w = 900;
int h =80;

PShape full;
PShape cut_one;
PShape cut_two;
PShape cut_three;
PShape cut_five;
PShape cut_six;

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


cut_one = loadShape("one.svg");
cut_two = loadShape("two.svg");
cut_three = loadShape("three.svg");

cut_five= loadShape("five.svg");
full= loadShape("full.svg");


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
    shape(cut_five, 60,100);
  } 
  else {
  shape(full, 60, 100);
    }
    noStroke();
  }


;

