
//masked decon -- to make it look like its being drawn in
//need to make mask for all letters that deconstruct and saved as .png 
//make sure that you aren't covering the letter with other images
//carly stevens
//sring 2012 ACCD

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
PImage c;
PImage c_mask;
PShape o;
PShape n;
PImage s;
PImage s_mask;
PImage t;
PImage t_mask;
PImage r;
PImage r_mask;
PImage u;
PImage u_mask;
PShape cc;
PImage tt;
PImage tt_mask;

int xpos = 0;
int rpos = 0;
int tpos = 0;
int spos = 0;
int cpos = 0;
int ttpos = 0;



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
  c = loadImage("c.png");
  c_mask = loadImage("c_mask.png");
  o = loadShape("o.svg");
  n = loadShape("n.svg");
  s = loadImage("s.png");
  s_mask = loadImage("s_mask.png");
  t = loadImage("t.png");
  t_mask = loadImage("t_mask.png");
  r = loadImage("r.png");
  r_mask = loadImage("r_mask.png");
  u = loadImage("u.png");
  u_mask = loadImage("u_mask.png");
  cc = loadShape("cc.svg");
  tt = loadImage("tt.png");
  tt_mask = loadImage("tt_mask.png");
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
    image (c, 0, 0);
    popMatrix();
    
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
    
  }

  else {
    fill(0);
    shape(fn, 305, 100);
  }
  
  //S
  if (mousePressed == true) {
    
    spos += 1;
    pushMatrix ();
    translate (370, 100);
    fill(255);
    noStroke();
    image (s, 0, 0);
    rect (spos, 0, 100,100);
    popMatrix();
    
  }

  else {
    
    shape(fs, 370, 100);
    spos = 0;
  }
  
  //T
  if (mousePressed == true) {
    
    tpos += 1;
    pushMatrix ();
    translate (430, 100);
    fill(255);
    noStroke();
    image (t, 0, 0);
    rect (tpos, 0, 100, 100);
    popMatrix();
    
  }

  else {
    shape(ft, 430, 100);
    tpos = 0;
  }
  
  //R
  if (mousePressed == true) {
    pushMatrix ();
    
    rpos += 1;
    translate (495, 100);
    fill(255);
    noStroke();
    image (r, 0, 0);
    rect (rpos,0,100,100);
    
    popMatrix();
    
  }

  else {
    shape(fr, 495, 100);
    rpos = 0;
  }
  
  //U
  if (mousePressed == true) {
    pushMatrix ();
    
    xpos += 1;
    translate (560, 100);
    fill(255);
    noStroke();
    image (u, 0, 0);
    rect(xpos,0,100,100);
    popMatrix();
  }

  else {
    shape(fu, 560, 100);
    xpos = 0;
  }
  
  //C
  if (mousePressed == true) {
    pushMatrix ();
    
    cpos += 1;
    translate (630, 100);
    fill(255);
    noStroke();
    image (c, 0, 0);
    rect (cpos, 0, 100, 100);
    popMatrix();
    
    
  }

  else {
    
    shape(fc, 630, 100);
    cpos = 0;
  }
  
  //T
  if (mousePressed == true) {
    pushMatrix ();
    
    ttpos += 1;
    translate (695, 100);
    fill(255);
    noStroke();
    image (tt, 0, 0);
    rect (ttpos, 0, 100, 100);
    popMatrix();

  }

  else {
    shape(ft, 695, 100);
    ttpos = 0;
  }
}





