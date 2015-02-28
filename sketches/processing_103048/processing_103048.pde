
PFont font;

int w = 500; 
int h = 500;
int rayon = 120;
int rayon_mots = 140;
float Y=0;  // pour la rotation des polygones & scroll
int pointNote = -5; // point qui montre la gamme choisie
int echelle; // map des notes en fonction de la tonique

// when true : affiche la gamme;
boolean maj = true;
boolean min = false;
boolean min_m = false;
boolean min_h = false;
boolean maj_p = false;
boolean min_p = false;
boolean jap = false;
boolean chi = false;
boolean tzi = false;

int Tons[] = { // position trigonométrique des notes sur cercle
  270, 300, 330, 0, 30, 60, 90, 120, 150, 180, 210, 240
};

String nomNotes[] = {
  "DO", "DO#", "RÉ", "RÉ#", "MI", "FA", "FA#", "SOL", "SOL#", "LA", "LA#", "SI", "DO"
};
String nomGammes[] = {
  "Gamme majeure", "Gamme mineure", "Mineure harmonique", "Mineure mélodique", 
  "Pentatonique maj.", "Pentatonique min.", "Japonaise", "Chinoise", "Tzigane"
};

color[] couleurs = {
  #00AAAA, //maj
  #00CC55, //min
  #84DB0B, //min harmonique
  #F5C70C, //min melodique
  #DB6F02, //majeur penta
  #DB0276, //mineur penta
  #80309D, //japonaise
  #2C1C98, //chinoise
  #2F5089, //tzigane
};

void setup() {
  size(600, 500);
  smooth();

  font = loadFont("Ume-Gothic-48.vlw");
  textFont(font, 16);
}

void draw() {
  background(240);

  noFill();
  stroke(50);
  strokeWeight(1);
  ellipse(w/2, h/2, rayon*2, rayon*2); // cercle
  strokeWeight(4); // points sur le cercle (notes)
  for (int i = 0; i < 360; i += 30) {
    point(w/2+rayon*(cos(radians(i))), (h/2+rayon*(sin(radians(i)))));
  }
  strokeWeight(8); // point sur le do
  point(w/2+rayon*(cos(radians(270))), (h/2+rayon*(sin(radians(270)))));

  // menu droite; affiche et sélectionne le polygone
  if (maj == true) majeur(); 
  else if (min == true) mineur();
  else if (min_h == true) mineur_harmonique();
  else if (min_m == true) mineur_melodique();
  else if (maj_p == true) penta_majeur();
  else if (min_p == true) penta_mineur();
  else if (jap == true) japonaise();
  else if (chi == true) chinoise();
  else if (tzi == true) tzigane();

  // rotation du polygone
  if (mousePressed & mouseX<50) {
    Y = map(mouseY, 25, height, 0, radians(360));
  }

  scroll();
  choice();
  NotesSurCercle();
}

void japonaise() {
  int gamme[] = {
    //
    1, 4, 2, 1, 4
  };

  // dessine le polygone
  noFill();
  strokeWeight(5);
  stroke(c_jap);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

/*------------------------------*/

void chinoise() {
  int gamme[] = {
    2, 2, 3, 2, 3
  };

  // dessine le polygone
  noFill();
  strokeWeight(5);
  stroke(c_chi);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

/*------------------------------*/

void tzigane() {
  int gamme[] = {
    //
    2, 1, 3, 1, 1, 3, 1
  };

  // dessine le polygone
  noFill();
  strokeWeight(5);
  stroke(c_tzi);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

void majeur() {
  int gamme[] = {
    // 1 ton - 1 ton - 1/2 ton - 1 ton - 1 ton - 1 ton - 1/2 ton.
    2, 2, 1, 2, 2, 2, 1
  };

  // dessine le polygone
  noFill();
  strokeWeight(5);
  stroke(c_maj);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

/*------------------------------*/

void mineur() {
  int gamme[] = {
    // 1 ton - 1/2 ton - 1 ton - 1 ton - 1/2 ton - 1 ton - 1 ton
    2, 1, 2, 2, 1, 2, 2
  };

  // gamme
  noFill();
  strokeWeight(5);
  stroke(c_min);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

/*------------------------------*/

void mineur_harmonique() {
  int gamme[] = {
    //1 ton - 1/2 ton - 1 ton - 1 ton - 1/2 ton - 1 ton et demi - 1/2 ton.
    //1, 1/2, 1, 1, 1/2, 3/2, 1/2
    2, 1, 2, 2, 1, 3, 1
  };

  // gamme
  noFill();
  strokeWeight(5);
  stroke(c_min_h);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

/*------------------------------*/

void mineur_melodique() {
  int gamme[] = {
    //1 ton - 1/2 ton - 1 ton - 1 ton - 1 ton - 1 ton - 1/2 ton
    2, 1, 2, 2, 2, 2, 1
  };

  // gamme
  noFill();
  strokeWeight(5);
  stroke(c_min_m);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

void penta_majeur() {
  int gamme[] = {
    // 1ton, 1ton, 1etdemi, 1, 1etdemi
    2, 2, 3, 2, 3
  };

  // dessine le polygone
  noFill();
  strokeWeight(5);
  stroke(c_maj_p);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
}

/*------------------------------*/

void penta_mineur() {
  int gamme[] = {
    // 1etdemi, 1, 1/2, 1etdemi, 1
    3, 2, 2, 3, 2
  };

  // dessine le polygone
  noFill();
  strokeWeight(5);
  stroke(c_min_p);
  beginShape();

  int ig = 0;
  int i = 0;
  while (i < Tons.length) { // pour tous les tons
    vertex(w/2+rayon*(cos(radians(Tons[i])+Y)), 
    (h/2+rayon*(sin(radians(Tons[i])+Y))));
    i += gamme[ig]; // progresser de 'ig' demi-tons, selon gamme
    ig++;
  }
  endShape(CLOSE);
  strokeWeight(12); // point sur le DO
  point(w/2+rayon*(cos(radians(Tons[0])+Y)), (h/2+rayon*(sin(radians(Tons[0])+Y))));
}

// menu de droite pour afficher les différentes gammes

color c_maj = #00AAAA;
color c_min = #00CC55;
color c_min_h = #84DB0B;
color c_min_m = #F5C70C;
color c_maj_p = #DB6F02;
color c_min_p = #DB0276;
color c_jap = #80309D;
color c_chi = #2C1C98;
color c_tzi = #2F5089;

void choice() {

  // noms des gammes
  textAlign(RIGHT);
  int d = 40;
  noStroke();
  int ii=40;
  for (int i = 0; i < 9 ; i++) {
    fill(couleurs[i]);
    text(nomGammes[i], width-50, ii);
    rect(width-40, ii-20, d, d);
    ii+=40;
  }

  if (mousePressed & mouseX > height-50) {
    //println(" -- y: "+mouseY);

    if (mouseY>20 & mouseY< 60) { // MAJEUR
      maj = true;
      // min=false; min_m=false; min_h=false; maj_p=false;min_p=false;
      min = min_m = min_h = maj_p = min_p = jap = chi = tzi = false;
    } 
    else if (mouseY>60 & mouseY< 100) { //MINEUR
      min = true;
      maj = min_m = min_h = maj_p = min_p = jap = chi = tzi = false;
    } 
    else if (mouseY>100 & mouseY< 140) { //MINEUR HARMONIQUE
      min_h = true;
      maj = min = min_m = maj_p = min_p = jap = chi = tzi = false;
    } 
    else if (mouseY>140 & mouseY< 180) {//MINEUR MELODIQUE
      min_m = true;
      maj = min = min_h = maj_p = min_p = jap = chi = tzi = false;
    }
    else if (mouseY>180 & mouseY< 220) {//PENTATONIQUE MAJEUR
      maj_p = true;
      maj = min = min_h = min_m = min_p = jap = chi = tzi = false;
    }
    else if (mouseY>220 & mouseY< 260) {//PENTATONIQUE MINEUR
      min_p = true;
      maj = min = min_h = maj_p = min_h = jap = chi = tzi = false;
    }
    else if (mouseY>260 & mouseY< 300) {//JAPONAISE
      jap = true;
      maj = min = min_h = maj_p = min_h = min_p = chi = tzi = false;
    }
    else if (mouseY>300 & mouseY< 340) {//CHINOISE
      chi = true;
      maj = min = min_h = maj_p = min_h = min_p = jap = tzi = false;
    }
    else if (mouseY>340 & mouseY< 380) {//TZIGANE
      tzi = true;
      maj = min = min_h = maj_p = min_h = min_p = jap = chi = false;
    }
  }
}

void scroll() {
  stroke(100);
  strokeWeight(2);
  line(20, 0, 20, height);

  for (float i=25; i<height-10; i += (height-20)/12) {
    stroke(100); // ici les 12 points pr chaque tonique
    strokeWeight(6);
    point(20, i);
  }

  // le point qui nous quelle tonique a été choisie
  if (mousePressed && mouseX<50) pointNote = mouseY;
  strokeWeight(12);
  stroke(50);
  point(20, pointNote);

  int posX = 25; // nom des notes sur la gauche
  float posY = ((height-20)/12);
  int decal = 10;
  fill(150);
  textAlign(LEFT);
  for (int i = 0; i < Tons.length ; i++){
    text(nomNotes[i], posX, posY*(i+1)-decal);
  }
}

void NotesSurCercle() { // nom des notes sur le cercle
  fill(150);
  textAlign(CENTER, CENTER);
  
  for (int i = 0; i < Tons.length ; i++){
    text(nomNotes[i], 
  w/2+rayon_mots*(cos(radians(Tons[i]))), (h/2+rayon_mots*(sin(radians(Tons[i])))));
  }
}



