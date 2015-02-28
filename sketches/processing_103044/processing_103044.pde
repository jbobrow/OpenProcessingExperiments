
PFont font;

int notes[] = {
  262, 277, 294, 311, 330, 349, 370, 392, 415, 440, 466, 494, 
  523, 554, 587, 622, 659, 698, 740, 784, 830, 880, 932, 988
};

int GAMME[] = {   
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
};
int majeur[] = {  
  2, 2, 1, 2, 2, 2, 1, 0
};
int mineur[] = {  
  2, 1, 2, 2, 1, 2, 2, 0
};
int test1[] = {  
  4, 4, 4, 0
};
int test2[] = {  
  3, 3, 3, 3, 0
};
int test3[] = {  
  2, 2, 2, 2, 2, 2, 0
};
int test4[] = {  
  1, 2, 1, 2, 1, 2, 1, 2, 0
};
int test5[] = {  
  5, 3, -7, 3, 5, 3, 0
};
int test6[] = {  
  7, 2, -5, 2, -5, 2, 7, 2, 0
};
int test7[] = {  
  5, 4, -7, 4, 5, -8, 5, 4, -7, 4, 5, -8, 6, 0
};
int test8[] = {  
  5, 5, -7, 5, -7, 5, 5, -7, 5, -7, 5, 5, 0
};
int test9[] = {  
  2, 3, 3, 2, -9, 3, 2, 3, 3, 0
};
int test10[] = {  
  2, 3, 4, 2, -9, 4, 2, 3, -8, 2, 3, 4, 0
};
int test11[] = {  
  1, 4, 4, 1, -8, 4, 1, 4, -8, 1, 4, 4, 0
};
int test12[] = {  
  2, 2, 5, 2, -10, 5, 2, 2, -7, 2, 2, 5, 0
};
int test13[] = {  
  2, 6, 2, -6, 2, 6, 0
};

int bool_gammes[][] = {  
  majeur, mineur, test1, test2, test3, test4, test5, 
  test6, test7, test8, test9, test10, test11, 
  test12, test13
};

String nomGammes[] = {
  "majeur", "mineur", "1.triangle", "2.square", "3.hexagone", "4.octatonique", 
  "5.tri-triangle", "6.croix", "7.star1", "8.star2", "9. ?", "10. ?", 
  "11. ?", "12. ?", "13. 3 triangles",
};

String nomNotes[] = {
  "do", "do#", "re", "re#", "mi", "fa", "fa#", "sol", "sol#", "la", "la#", "si", "do", "do#", "re", "re#",
};

int playx = 350;
int playy = 40;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  font = loadFont("Ume-Gothic-48.vlw");
}
void draw() {
  background(240);
  polygone();

  // bouttons + noms des gammes
  textAlign(LEFT, TOP);
  textFont(font, 14);
  int largeur = 20;
  strokeWeight(1);
  stroke(240);
  fill(100);
  int ii=0;
  for (int i = 0; i < nomGammes.length ; i++) {
    text(nomGammes[i], 35, ii+7);
    rect(10, ii, largeur, largeur);
    ii+=20;
  }

  afficherNotes();
}
void mouseReleased() {
  if (mouseX < 50 & mouseY< bool_gammes.length*20) {
    GAMME = bool_gammes[int(mouseY/20)];
  }

}

void afficherNotes() {
  int ig = 0;
  int i = 0;
  String[] notesGamme = new String[GAMME.length];
  while (ig < GAMME.length) {
    notesGamme[ig] = (nomNotes[i]);
    i += GAMME[ig]; // progresser de 'ig' demi-tons
    ig++;
  }
  String joinNotesGamme = join(notesGamme, " ");
  //println(joinNotesGamme);
  textAlign(RIGHT, TOP);
  textFont(font, 12);
  fill(150);
  text(joinNotesGamme, width-10, 7);
}


void polygone() {
  int rayon = 60;
  int Tons[] = { 
    270, 300, 330, 0, 30, 60, 90, 120, 150, 180, 210, 240
  };
  fill(255);
  stroke(50);
  strokeWeight(5);

  beginShape();
  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(200 + rayon*(cos(radians(Tons[i]))), 
    (200 + rayon*(sin(radians(Tons[i])))));
    i += GAMME[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);

  strokeWeight(1);
  noFill();
  ellipseMode(RADIUS);
  ellipse(200, 200, rayon, rayon);
}
