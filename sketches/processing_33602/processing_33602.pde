
/*
Aneta Genova
 genovaa@newschool.edu
 Parsons MFA D+T Bootcamp
 Homework 8/9/11: Simple Drawing App
 
 */

PImage hen;
PImage cat;
PFont Verdana;


void setup () {
  size (800, 800);
  background (#669999);
  hen = loadImage("hen.png");
  cat = loadImage("cat.png");


  fill (#ff0033);//Instructions
  Verdana = loadFont("Verdana-20.vlw");
  textFont(Verdana, 13);
  text ("Draw by dragging your mouse.", 50, 700);
  text ("Pick a brush shape from A, B", 50, 720);
  text ("Pick a color brush from D, E", 50, 740);

  frameRate (10);
}

void draw () {
}

void keyPressed () {
  if (key == BACKSPACE) {
    background (#ff6600);
  }
}

void mousePressed () {
  if (key == 'a') {
    image (hen, mouseX, mouseY);
  }
  if (key == 'b') {
    image (cat, mouseX, mouseY);
  }
  if (key == 'd') {
    fill (#0033CC);
    stroke (#FF0000);
    ellipse (mouseX, mouseY, 20, 20);
  }
  if (key == 'e') {
    fill (#FFFF66);
    stroke (#0033cc);
    ellipse (mouseX, mouseY, 20, 20);
  }

  else {
    fill (#0033CC);
    stroke (#FF66CC);
    ellipse (mouseX, mouseY, 20, 20);
  }
}

void mouseDragged () {
  if (key == 'a') {
    image (hen, mouseX, mouseY);
  }
  if (key == 'b') {
    image (cat, mouseX, mouseY);
  }

  if (key == 'd') {
    fill (#FF66CC);
    stroke (#0033CC);
    ellipse (mouseX, mouseY, 20, 20);
  }
 if (key == 'e') {
    fill (#FFFF66);
    stroke (0);
    ellipse (mouseX, mouseY, 20, 20);
  }

  else {
    fill (#0033CC);
    stroke (#FF66CC);
    ellipse (mouseX, mouseY, 20, 20);
  }
}


