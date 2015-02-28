
/*
Mit dieser Programm kan man in kleine Fenstern zeichnen
mit Linkermaustaste - zeichnent man
mit Rechtermaustaste - wegradieren

mit Tasten:
W - macht man dicker den stift
E - macht man kleiner

A - rote Farbe funktioniert nur wen man drückt
S- blau Farbe funktioniert nur wen man drückt

Q - Opasity machen
R-wieder zurück

N - wegradieren und Maske weckseln
Enter - abspeichern

*/
/*MEINE VARIABLE*/
// variable die für speichern von meinen Bildern dient
int saveCounter = 0;
//für Linien Dicke
int linienDicke = 1;
//für farbe
int R=0;
int G=0;
int B=0;
//für Linien Opasity
int lOpasity = 250;

/*HAUPTFUNKTION*/
void setup(){
  //meine animation geschwiendigkeit
  frameRate(60);
  //die grösse
  size(800, 600);
  //background farbe
  background(255);
  //blau farbe (0,51,195,80);
//farbe vom strich standart ist schwarz
  stroke(R,G,B,lOpasity);
  //die dicke von meinem strich;
  strokeWeight(linienDicke);
  //mein hintergrundbild
  //moch Nummer der Variable vom Bild

}

/*MALEN*/

void draw(){

  
/*TASTEN_BEFEHLE*/
 if (keyPressed) {
    //Background weckseln und Bild
    if (key == 'n' || key == 'N') {// mit TAB
    //hintergrund weiss
       background(255);
       //variable erhöhen auf eins
       }
    }
    
  /*DICKE VOM STIFT*/
  if (key == 'w' || key == 'W') {
 //erhöhen von variable dicke für stift 
    linienDicke ++;
    if (linienDicke > 50){
       linienDicke =50;
       }
      strokeWeight(linienDicke);
   
   } 
   
   if (key == 'E' || key == 'e') {
 //kleiner machen von variable dicke für stift 
    linienDicke --;
    if (linienDicke < 1){
       linienDicke =1;
       }
      strokeWeight(linienDicke);
   } 
   
 /*FARBEN*/
   //für ROT
    if (key == 'A' || key == 'a') {
//werte von verändern
    int R=188;
    int G=1;
    int B=10;
          stroke(R,G,B,lOpasity);
   }  
    //für blau
    if (key == 's' || key == 'S') {
 //werte von verändern 
    int R=0;
    int G=5;
    int B=190;
          stroke(R,G,B,lOpasity);
   }  
   
  /*OPASITY*/ 
 
 //für Opasity klein
  if (key == 'q' || key == 'Q') {
 //kleiner machen von variable dicke für stift 
    lOpasity = lOpasity - 20;
    if (lOpasity < 50){
       lOpasity =10;
       }
          stroke(R,G,B,lOpasity);
   }

 //für Opasity groß  
    if (key == 'R' || key == 'r') {
 //kleiner machen von variable dicke für stift 
    lOpasity = lOpasity + 20;
    if (lOpasity == 250){
       lOpasity =250;
       }
          stroke(R,G,B,lOpasity);
   } 
 

 }

//so wird das Bild gespeichert
void mousePressed() {
  if(mouseButton == RIGHT) {
    stroke(255);
  } 
  if(mouseButton == LEFT) {
  stroke(R,G,B,lOpasity);
  }
}

//so wird es flüsig mit linien führung gemalt
void mouseDragged() {
     /*
     mit pmouseX und pmouseY kann man werte von den punkten
     des Obyekts vermieteln
     */
     line(pmouseX, pmouseY, mouseX, mouseY);

}
