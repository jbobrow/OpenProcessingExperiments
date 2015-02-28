
// Wahrscheinlich super kompliziert, ABER ZUM ÜBEN WIRDS SCHON PASSEN
/**
 *    SVGs laden mit PShape
 *
 *    http://processing.org/reference/loadShape_.html
 *    http://processing.org/reference/shape_.html
 *
 *    http://en.wikipedia.org/wiki/Scalable_Vector_Graphics
 *
 *    fjenett 20081101
 */
PShape al, aln, ar, arn, fl, fr, face, facen, faceaggro; // datentyp deklarationen alle grafiken

void setup() {
  size(450,600);
  background(255); 
  smooth();
  fl = loadShape( "fl.svg" ); // fuß links
  fr = loadShape( "fl.svg" ); // fuß rechts
  al = loadShape( "al.svg" ); // arm links
  ar = loadShape( "ar.svg" ); // arm rechts    
  face = loadShape( "face.svg" ); // gesicht
  aln = loadShape( "aln.svg" ); // arm links
  arn = loadShape( "arn.svg" ); // arm rechts    
  facen = loadShape( "facen.svg" ); // gesicht
  faceaggro = loadShape( "faceaggro.svg" ); // gesicht
}

float ypos = 100; // y start-position für armbewergung
float speed = 3.0; // geschwindigkeit der bewegung
int yposdown = 120; // maximaler wert wie hoch die arme gehen sollen (y)
boolean checkup = true; // kontrollvariable wenn arme oben, wird auf false gesetzt, arme bewegen sich nach unten
int cred = 1; // color red = cred = farbe für den kopf, blendet ein

void draw() {
  background(255);
  // fängt immer hier zuerst an, bewergt die arme nach oben bis die marke ypos erreicht wurde
  // setzt varibale checkup auf false = arme sollen runter
  if (ypos > 80 && checkup == true) {
    ypos = ypos - speed;
    if (ypos < 80) { 
      ypos = 80; 
      checkup = false;
    } 
  }
  // bewergt arme nach unten, bis der wert ypsdown erreicht wurde, 
  // setzt checkup auf true, arme gehen wieder hoch
  if (ypos < yposdown && checkup == false ) {
    ypos = ypos + speed;
    if (ypos > yposdown) { 
      ypos = 120; 
      checkup = true;
    }  
  } 

  float posy = ypos; // gebe posy wert von ypos, damit die arme sich bewegen
  
  if (mousePressed) { // wenn maus gedrückt führe das aus...
  
    cred = cred+2; // erhöhe farbe rot immer um 1 bis 255 erreicht wurde
    speed = 6.0; // setze geschwindigkeit auf 6
    pushStyle();  // stile erhalten für das element gesicht
    fill(cred,0,0); // füllt vektor mit roter farbe, welche sich immer um 1 erhöht von schwarz auf rot
    noStroke(); 
    face.disableStyle(); // deaktiviert stile von der svg datei
    faceaggro.disableStyle(); // dekativiert stille von der svg datei für das zweite gesicht
    
    if (cred > 254) { // wenn die farbe rot 255 hat, ersetze das gesicht durch ein anderes
      shape(faceaggro, 110, 190); // -- s. o
    } else {
      shape(face, 110, 190); // solang rot keine 255 hat, dieses gesicht anzeigen
    } 
    
    popStyle();
    shape(al, 20, posy); // ersetzte linekn arm durch einen anderen
    shape(ar, 250, posy); // ersetze rechten arm durch einen anderen
    
  } else { // wenn maustaste nicht gedrückt dann führe das aus ...
  
    cred = 1; // farbe rot auf 0 
    shape(facen, 110, 190); // gesicht
    speed = 3.0; // wisst ja...
    noFill();
    shape(aln, 20, posy); // arm links zeichnen
    shape(arn, 250, posy); // das gleich mit arm rechts
    
  }
  
  shape(fl, 120, 330); // beine bleiben wie sie sind
  shape(fr, 170, 330); // .... gleiche 

}











