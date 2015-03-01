
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
  float d = 15;
  stroke (255);
  strokeWeight (2); 
  fill (#A75265);
  
  /* Arrayeintraege auslesen */

  line(posX[0], posY[0], posX[1], posY[1]);
  line(posX[1], posY[1], posX[2], posY[2]);
  line(posX[2], posY[2], posX[0], posY[0]);

  ellipse(posX[0], posY[0], d, d);
  ellipse(posX[1], posY[1], d, d);
  ellipse(posX[2], posY[2], d, d);
}

void initalizeArrays() {
  posX = new float[3];
  posY = new float[3];
}

void writeValuesToArray() {
  posX[0] = random(0, width);
  posX[1] = random(0, width);
  posX[2] = random(0, width);

  posY[0] = random(0, height);
  posY[1] = random(0, height);
  posY[2] = random(0, height);
}

void mouseReleased() {
  writeValuesToArray();
}

