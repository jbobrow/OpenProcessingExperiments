
color c1 = #33FF00; //Green
color c2 = #000000; //Black
color c3 = #FF0000; //Red
PImage y;
PImage r;
PImage b;
PImage g;
PImage q;
PImage u;
PImage s;
PImage w;
PImage e;
PImage t;
PImage a;
PImage z;
PFont Synchro;


void setup() {
  size(800, 600);
  background (c2);
  y = loadImage("yellow.png");
  r = loadImage("red.png");
  b = loadImage("blue.png");
  g = loadImage("green.png");
  q = loadImage("q.png");
  u = loadImage("u.png");
  s = loadImage("s.png");
  w = loadImage("w.png");
  e = loadImage("e.png");
  t = loadImage("t.png");
  a = loadImage("a.png");
  z = loadImage("z.png");
  int h = hour();
  Synchro = loadFont("Synchro.vlw");
  textFont(Synchro, 48);
}

void draw() {
  image(y, 0, 0);
  int y = month();  // Values from 1 - 12
  int d = day();    // Values from 1 - 31
  int h = hour() - 12 ;  // Values from 1 - 23
  int m = minute();   // Values from 1 - 60
  int c = second(); // Values form 1 - 60
  fill(c2);   //Filled the Numbers with Black

  text(h+":"+nf(m, 2)+" ", 357, 317);

  text("", 50, 100);
  if (keyPressed) {
    if (key == 'r' || key == 'R') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(r, 0, 0);
      noFill();
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }
  if (keyPressed) {
    if (key == 'q' || key == 'Q') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(q, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }

  if (keyPressed) {
    if (key == 'z' || key == 'Z') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(z, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }   
  if (keyPressed) {
    if (key == 'a' || key == 'A') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(a, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }
  if (keyPressed) {
    if (key == 't' || key == 'T') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(t, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }
  if (keyPressed) {
    if (key == 'e' || key == 'e') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(e, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }
  if (keyPressed) {
    if (key == 's' || key == 's') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(s, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }  
  if (keyPressed) {
    if (key == 'u' || key == 'u') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(u, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }
  if (keyPressed) {
    if (key == 'w' || key == 'w') {

      int correctHour = h + 2;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(w, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }

  if (keyPressed) {
    if (key == 'g' || key == 'G') {

      int correctHour = h + 7;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(g, 0, 0);
      text((correctHour)+":"+nf(m, 2)+" ", 357, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }

  if (keyPressed) {
    if (key == 'b' || key == 'B') {

      int correctHour = h - 4;
      if (correctHour == 0) {
        correctHour = 12;
      }

      image(b, 0, 0);
      text(correctHour+":"+nf(m, 2)+" ", 350, 317);
      text("", 50, 100);
      fill(c1);
    }
  } 
  else {
    fill(255);
  }

  int val = 1;
  String newVal = nf(val, 2);

  println(newVal);
}


