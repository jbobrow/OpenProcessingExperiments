
/* Kurzanleitung Arrays */

/**
 * 1. Schritt: Array-Variable definieren: 
 * datentyp[] arrayName = null;
 */

/**
 * 2. Schritt: Array initalisieren, d. h. Festlegung der Arraygroesse (= wie viele Inhalte kann das Array aufnehmen): 
 * arrayName = new datentyp[arraygroesse]; 
 */

/**
 * 3. Schritt: Arrayeintraege mit Inhalt fuellen
 * arrayName[index] = inhalt; 
 */
 
/**
 * 4. Schritt: Arrayeintraege auslesen
 * datentyp temp = arrayName[index]; 
 */
 
/**
 * Laenge eines Arrays abfragen:
 * int groesse = arrayName.length;
 */

/**
 * Erster Arrayeintrag:
 * datentyp erster = arrayName[0];
 * Letzter Arrayeintrag:
 * datentyp letzer = arrayName[arrayName.length - 1];
 */

/* 1. Array Variablen definieren */
float[] posX = null;
float[] posY = null;

void setup() {
  size(600, 200);
  smooth();
  /* 2. Arrays initalisieren */
  initalizeArrays();
  
  /* 3. Arrayeintraege befuellen */
  writeValuesToArray();
}

void draw() {
  background(#57385c);
  
  /* Arrayeintraege auslesen */
  drawLines();
  drawDots();
}

void drawLines() {
  stroke (255);
  strokeWeight (2); 
  int i = 0;
  while (i < posX.length-1) {
    line(posX[i], posY[i], posX[i+1], posY[i+1]);
    i = i + 1;
  }
  line(posX[posX.length - 1], posY[posY.length - 1], posX[0], posY[0]);
}

void drawDots() {
  float d = 15;
  stroke (255);
  strokeWeight (2); 
  fill (#A75265);
  int i = 0;
  while (i < posX.length) {
    ellipse(posX[i], posY[i], d, d);
    i = i + 1;
  }
}

void initalizeArrays() {
  posX = new float[10];
  posY = new float[10];
}

void writeValuesToArray() {
  int i = 0;
  while (i < posX.length) {
    posX[i] = random(0, width);
    posY[i] = random(0, height);
    i = i + 1;
  }
}

void mouseReleased() {
  writeValuesToArray();
}

