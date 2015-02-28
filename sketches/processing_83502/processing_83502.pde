
void setup() {
    PFont maTypo = createFont("Courrier new",5,true);
  size (1500,800);
  background (256,256,256);
}

void draw() {
smooth (); {
  if (keyPressed) {
background(256,256,256);
  }

stroke (random(1, 50));
  PFont maTypo = createFont("Courrier new",5,true);
if (mousePressed && (mouseButton == LEFT)) {
  textFont (maTypo, 20); 
text("Appuyer sur une touche pour effacer", 900, 700);
 textFont (maTypo, 120); 
text("RESAUX PAHWER !!!1", 150, 400);
line (pmouseX, pmouseY, random(0, 1500), random(0, 0));
line (pmouseX, pmouseY, random(0, 0), random(0, 800));
line (pmouseX, pmouseY, random(0, 1500), random(800, 800));
line (pmouseX, pmouseY, random(1500, 1500), random(0, 800));
}
if (mousePressed && (mouseButton == RIGHT)) {
stroke (random(1, 256),random(1, 256),random(1, 256));
  PFont maTypo2 = createFont("Courrier new",5,true);

  textFont (maTypo2, 20); 
  
text("Appuyer sur une touche pour effacer", 900, 700);
 textFont (maTypo, 200); 
 stroke (random(1, 256),random(1, 256),random(1, 256));
text("RAINBOW", 200, 400);
line (pmouseX, pmouseY, random(0, 1500), random(0, 0));
line (pmouseX, pmouseY, random(0, 0), random(0, 800));
line (pmouseX, pmouseY, random(0, 1500), random(800, 800));
line (pmouseX, pmouseY, random(1500, 1500), random(0, 800));
}
}
}



